Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB25C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 09:17:04 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.38420.1639559816168226494
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 01:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8EC1A100015;
	Wed, 15 Dec 2021 09:16:51 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/1] overview-manual: initial documentation for hash
 equivalence
Date: Wed, 15 Dec 2021 10:16:31 +0100
Message-Id: <20211215091631.1989314-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215091631.1989314-1-michael.opdenacker@bootlin.com>
References: <20211215091631.1989314-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Dec 2021 09:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2265

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index bfd54208af..873f43a66e 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1938,6 +1938,73 @@ another reason why a task-based approach is preferred over a
 recipe-based approach, which would have to install the output from every
 task.
 
+Hash Equivalence
+----------------
+
+The above section explained how BitBake skips the execution of tasks
+which output can already be found in the Shared State Cache.
+
+During a build, it may often be the case that the output / result of a task might
+be unchanged despite changes in the task's input values. An example might be
+whitespace changes in some input C code. In project terms, this is what we define
+as "equivalence". We can create a hash / checksum which represents a task and two
+input task hashes are said to be equivalent if the hash of the generated output
+(as stored / restored by sstate) is the same.
+
+Once bitbake knows that two input hashes for a task have equivalent output,
+this has important and useful implications for all tasks depending on this task.
+
+Thanks to this equivalence, a change in one of the tasks in BitBake's run queue
+doesn't have to propagate to all the downstream tasks that depend on the output
+of this task, causing a full rebuild of such tasks, and so on with the next
+depending tasks. Instead, BitBake can safely retrieve all the downstream
+task output from the Shared State Cache.
+
+This applies to multiple scenarios:
+
+-  A "trivial" change to a recipe that doesn't impact its generated output,
+   such as whitespace changes, modifications to unused code paths or
+   in the ordering of variables.
+
+-  Shared library updates, for example to fix a security vulnerability.
+   For sure, the programs using such a library should be rebuilt, but
+   their new binaries should remain identical. The corresponding tasks should
+   have a different output hash because of the change in the hash of their
+   library dependency, but thanks to their output being identical, hash
+   equivalence will stop the propagation down the dependency chain.
+
+-  Native tool updates. Though the depending tasks should be rebuilt,
+   it's likely that they will generate the same output and be marked
+   as equivalent.
+
+This mechanism is enabled by default in Poky, and is controlled by two
+variables:
+
+-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote hash
+   equivalence server to use.
+
+-  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set  to ``OEEquivHash``.
+
+Therefore, the default configuration in Poky corresponds to the
+below settings::
+
+   BB_HASHSERVE = "auto"
+   BB_SIGNATURE_HANDLER = "OEEquivHash"
+
+Another possibility is to share a hash equivalence server on a network,
+by setting::
+
+   BB_HASHSERVE = "<HOSTNAME>:<PORT>"
+
+.. note::
+
+   The hash equivalence server needs to be maintained together with the
+   share state cache. Otherwise, the server could report shared state hashes
+   that do not exist.
+
+   We therefore recommend that one hash equivalence server be set up to
+   correspond with a given shared state cache.
+
 Automatically Added Runtime Dependencies
 ========================================
 
-- 
2.25.1


