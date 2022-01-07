Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F1BC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 18:57:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.11129.1641581832894188160
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Jan 2022 10:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CC7B820002;
	Fri,  7 Jan 2022 18:57:10 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH V2] overview-manual: document hash equivalence
Date: Fri,  7 Jan 2022 19:57:03 +0100
Message-Id: <20220107185703.783866-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16C811E821D97886.9212@lists.yoctoproject.org>
References: <16C811E821D97886.9212@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Jan 2022 18:57:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2357

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 122 +++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 6f8a3def69..e148731a57 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1938,6 +1938,128 @@ another reason why a task-based approach is preferred over a
 recipe-based approach, which would have to install the output from every
 task.
 
+Hash Equivalence
+----------------
+
+The above section explained how BitBake skips the execution of tasks
+which output can already be found in the Shared State cache.
+
+During a build, it may often be the case that the output / result of a task might
+be unchanged despite changes in the task's input values. An example might be
+whitespace changes in some input C code. In project terms, this is what we define
+as "equivalence".
+
+To keep track of such equivalence, BitBake has to manage three hashes
+for each task:
+
+- The *task hash* explained earlier: computed from the recipe metadata,
+  the task code and the task hash values from its dependencies.
+  When changes are made, these task hashes are therefore modified,
+  causing the task to re-execute. The task hashes of tasks depending on this
+  task are therefore modified too, causing the whole dependency
+  chain to re-execute.
+
+- The *output hash*, a new hash computed from the output of Shared State tasks,
+  tasks that save their resulting output to a Shared State tarball.
+  The mapping between the task hash and its output hash is reported
+  to a new *Hash Equivalence* server. This mapping is stored in a database
+  by the server for future reference.
+
+- The *unihash*, a new hash, initially set to the task hash for the task.
+  This is used to track the *unicity* of task output, and we will explain
+  how its value is maintained.
+
+When Hash Equivalence is enabled, BitBake computes the task hash
+for each task by using the unihash of its dependencies, instead
+of their task hash.
+
+Now, imagine that a Shared State task is modified because of a change in
+its code or metadata, or because of a change in its dependencies.
+Since this modifies its task hash, this task will need re-executing.
+Its output hash will therefore be computed again.
+
+Then, the new mapping between the new task hash and its output hash
+will be reported to the Hash Equivalence server. The server will
+let BitBake know whether this output hash is the same as a previously
+reported output hash, for a different task hash.
+
+If the output hash is reported to be different, BitBake will update
+the task's unihash, causing the task hash of depending tasks to be
+modified too, and making such tasks re-execute. This change is
+propagating to the depending tasks.
+
+On the contrary, if the output hash is reported to be identical
+to the previously recorded output hash, BitBake will keep the
+task's unihash unmodified. Thanks to this, the depending tasks
+will keep the same task hash, and won't need re-executing. The
+change is not propagating to the depending tasks.
+
+To summarize, when Hash Equivalence is enabled,
+a change in one of the tasks in BitBake's run queue
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
+   library dependency, but thanks to their output being identical, Hash
+   Equivalence will stop the propagation down the dependency chain.
+
+-  Native tool updates. Though the depending tasks should be rebuilt,
+   it's likely that they will generate the same output and be marked
+   as equivalent.
+
+This mechanism is enabled by default in Poky, and is controlled by three
+variables:
+
+-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote Hash
+   Equivalence server to use.
+
+-  :term:`BB_HASHSERVE_UPSTREAM`, when ``BB_HASHSERVE = "auto"``,
+   allowing to connect the local server to an upstream one.
+
+-  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set  to ``OEEquivHash``.
+
+Therefore, the default configuration in Poky corresponds to the
+below settings::
+
+   BB_HASHSERVE = "auto"
+   BB_SIGNATURE_HANDLER = "OEEquivHash"
+
+Rather than starting a local server, another possibility is to rely
+on a Hash Equivalence server on a network, by setting::
+
+   BB_HASHSERVE = "<HOSTNAME>:<PORT>"
+
+.. note::
+
+   The shared Hash Equivalence server needs to be maintained together with the
+   Share State cache. Otherwise, the server could report Shared State hashes
+   that only exist on specific clients.
+
+   We therefore recommend that one Hash Equivalence server be set up to
+   correspond with a given Shared State cache, and to start this server
+   in *read-only mode*, so that it doesn't store equivalences for
+   Shared State caches that are local to clients.
+
+   See the :term:`BB_HASHSERVE` reference for details about starting
+   a Hash Equivalence server.
+
+See the `video <https://www.youtube.com/watch?v=zXEdqGS62Wc>`__
+of Joshua Watt's `Hash Equivalence and Reproducible Builds
+<https://elinux.org/images/3/37/Hash_Equivalence_and_Reproducible_Builds.pdf>`__
+presentation at ELC 2020 for a very synthetic introduction to the
+Hash Equivalence implementation in the Yocto Project.
+
 Automatically Added Runtime Dependencies
 ========================================
 
-- 
2.25.1


