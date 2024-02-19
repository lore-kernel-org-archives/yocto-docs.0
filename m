Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6456EC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 15:55:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.44684.1708358118100795452
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Feb 2024 07:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZYmauZKS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBDFDFF802;
	Mon, 19 Feb 2024 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708358116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CeeTCDiDidLwqk/Bh/Xaar8xrkO506KMZtwYecEvXTE=;
	b=ZYmauZKSLeO7Q8a/TjqiTX/CU71sBc+qr9naRiJ7JAlEsfpJPFr/zB4luL/ZCHPemheyLB
	K71w/2o6WummWdntSRvt3btk4crl6pD3eRDFbStmazoMWKp+slZVNDV//FH6kWnx+WsNvF
	ux+1hFWN8hJ2/q1UlhP0rcz5W1HEl2MBKKfjMHb+mcrglbReauJVI8yTGH5guytjBQDeOY
	AxfQsP6Jql87yBVg3RXiBpr2zsAa/KE9PQlcCIkapB+Ylo5fv+k4b7cmSRAozU4z6MGM2S
	0Qfp6GetM5TJPqC052NNFlxkK21w3l5Yb2qDDSLxsD7KkU7u22r64JXXdimfpQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] ref-manual: tasks: do_cleanall: mention it is not allowed with a shared DL_DIR
Date: Mon, 19 Feb 2024 16:55:13 +0100
Message-Id: <20240219155513.76738-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 300
X-GND-Status: SPAM
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Feb 2024 15:55:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4844

do_cleanall can produce failures if using a shared download directory. This
is why it is forbidden when writing tests that will run on the autobuilders
(https://docs.yoctoproject.org/test-manual/intro.html?highlight=cleanall#considerations-when-writing-tests).

Reported-by: Sam Liddicott
Link: https://bootlin.com/blog/yocto-sharing-the-sstate-cache-and-download-directories/#comment-2650335
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 0db960b22f80..c754eb15514b 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -474,6 +474,19 @@ Typically, you would not normally use the :ref:`ref-tasks-cleanall` task. Do so
 if you want to start fresh with the :ref:`ref-tasks-fetch`
 task.
 
+.. note::
+
+   Never run the :ref:`ref-tasks-cleanall` task if your :term:`DL_DIR` is
+   shared. This would break in this scenario::
+
+      dir1$ bitbake <recipe> -c fetch
+      dir2$ bitbake <recipe> -c cleanall
+      dir1$ bitbake <recipe> -c unpack
+
+   because before step 3 in dir1 there is a stamp file for the
+   :ref:`ref-tasks-fetch` task, so the unpack task will try to extract the
+   downloaded archive and fail as it has been deleted in step 2.
+
 .. _ref-tasks-cleansstate:
 
 ``do_cleansstate``
-- 
2.34.1


