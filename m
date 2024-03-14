Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4DEC54E71
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:15:25 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.8371.1710407717158970267
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X+Wyc1Zd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2BBA2000E;
	Thu, 14 Mar 2024 09:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Srbuco45aQDv6r/pp0UG++w8mqRh2iHcJoA4DGUYB74=;
	b=X+Wyc1ZdQGmKknQqEQLfBslhHQ9OYrZ6m4ICOJ+Mt5W3pAbc0cOHwlPppOqESV2OnJVnZb
	NDoNZdKivjI4dg+2gNO0xe28i3lNluYztavudDaq1SZppI3mms98os+i5kROZ1SNswPDNl
	dZQvCJBU77UTS5JZqoOYsXsKQTG0ro5qHJhAN+NBI8SypnC500EvjQL2lZiau9rK2qI6qo
	KnZ0Ty3R8xWyPM3YIBxqK2IGjUdKgVDnfxgpZVtdvjEYj1KB8C6OmvS4ZzOQd/eSApNz2o
	vu8k0XrdZDPoqsAANoR0jRB+HfYY7wiPHKn/1L0wg/fsqdMcT/VEgFIl312iDA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [nanbield][PATCH 1/7] ref-manual: tasks: do_cleanall: recommend using '-f' instead
Date: Thu, 14 Mar 2024 10:15:02 +0100
Message-Id: <20240314091508.84166-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
References: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4969

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

do_cleanall can produce failures when used in legitimate cases, such as
with recipe variants (foo and foo-native) or a shared DL_DIR. This is why
it is forbidden when writing tests that will run on the autobuilders
(https://docs.yoctoproject.org/test-manual/intro.html?highlight=cleanall#considerations-when-writing-tests).

Reword the documentation to clearly discourage, provide a safe alternative
(bitbake -f -c fetch), and the rationale with an example.

Reported-by: Sam Liddicott
Link: https://bootlin.com/blog/yocto-sharing-the-sstate-cache-and-download-directories/#comment-2650335
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/tasks.rst | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 0db960b22f..16b48ca0bc 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -470,9 +470,29 @@ You can run this task using BitBake as follows::
 
    $ bitbake -c cleanall recipe
 
-Typically, you would not normally use the :ref:`ref-tasks-cleanall` task. Do so only
-if you want to start fresh with the :ref:`ref-tasks-fetch`
-task.
+You should never use the :ref:`ref-tasks-cleanall` task in a normal
+scenario. If you want to start fresh with the :ref:`ref-tasks-fetch` task,
+use instead::
+
+  $ bitbake -f -c fetch recipe
+
+.. note::
+
+   The reason to prefer ``bitbake -f -c fetch`` is that the
+   :ref:`ref-tasks-cleanall` task would break in some cases, such as::
+
+      $ bitbake -c fetch    recipe
+      $ bitbake -c cleanall recipe-native
+      $ bitbake -c unpack   recipe
+
+   because after step 1 there is a stamp file for the
+   :ref:`ref-tasks-fetch` task of ``recipe``, and it won't be removed at
+   step 2 because step 2 uses a different work directory. So the unpack task
+   at step 3 will try to extract the downloaded archive and fail as it has
+   been deleted in step 2.
+
+   Note that this also applies to BitBake from concurrent processes when a
+   shared download directory (:term:`DL_DIR`) is setup.
 
 .. _ref-tasks-cleansstate:
 
-- 
2.34.1


