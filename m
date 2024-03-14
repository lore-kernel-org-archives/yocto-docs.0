Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B8AC54E72
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:14:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.8344.1710407651049495240
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YVh5fTLX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23B8040009;
	Thu, 14 Mar 2024 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hBty80gegaeMZMyQM8TmrgX9WxDjVVtv483OVKUb4kQ=;
	b=YVh5fTLXS2vXqrCXJ7pbqSsgsCk2ryooSpX9gjJiIQGn4MHx7oQ8uB+FsJm5cigUN9sVE1
	ciP5F25yWiLp3Bg81z/ln8yJm/cnhplowrojHxWzhyasIQKPnzB6lxm+bMsECoHh7v+jdz
	c/VnlgX0HLVlgUwYDB5f2mfbk3d0KH3jnZWR2MxvZdmAExHJ8h1Lq4fwsVrPxlXPszmk1X
	/XUkNwlI7FJNzM+r6NZW8GPQLCkY8TnKybD+0BeoRn3+dj5YRbmBzs4L9leK9qrVsKUrZy
	FCQcou326R6+sjSms3vMopjI+m28zX0t1W9K9grs5NIu8jkzx11u9oMLUiicEA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [kirkstone][PATCH 1/8] ref-manual: tasks: do_cleanall: recommend using '-f' instead
Date: Thu, 14 Mar 2024 10:13:51 +0100
Message-Id: <20240314091358.84025-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
References: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:14:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4961

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
index e61f6659eb..a3258fda55 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -481,9 +481,29 @@ You can run this task using BitBake as follows::
 
    $ bitbake -c cleanall recipe
 
-Typically, you would not normally use the ``cleanall`` task. Do so only
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


