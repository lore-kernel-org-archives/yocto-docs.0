Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C60D44166
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:23:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9863.1765534977861848258
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 02:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JMwehZAV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F3091A212A
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36CA7606DF
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC74F103C8E03;
	Fri, 12 Dec 2025 11:22:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765534975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/U+c4Bc7B/Gs75lOAjZHEhNZPhA7z7oOEFniHtsQjhc=;
	b=JMwehZAVomRxuTkc1NczFVZ7W0GL0g84YTw0f3NTn56N4uz6qR1VAdquFRCVOHvr8A+G+V
	jmF9Qz0CVQFMJZj4TPbgC7SWFezixEptcIVYuRUaelPYuJ2H/kU9hHpF4XFLb7O5bLf2L1
	33D2Cg4XUv9kDfNW13OnKgQAlcNckCgVCYvylLh7uPoKDOj1ag4qiZIjN8alR+RqXN1qNH
	whk7F3OZ53yo0vsxa0Jjqfy1mwNbD7D3keD4+q57ZlNNi+xiOgZZaXoxtYrvFvKtrx9G7X
	GVelQ44eEP3Mljohy63cAQ7aID8qMhDc9hT57RfN2dxTLBVWpVXHGIpMH4m0JA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 12 Dec 2025 11:22:48 +0100
Subject: [PATCH 1/2] ref-manual/variables.rst: document the
 IMAGE_CONTAINER_NO_DUMMY variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-image-container-v1-1-fb6586d06813@bootlin.com>
References: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
In-Reply-To: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=jVerQihSd3HQB1Ip2KtNP/cuFE4aRzH3c6iGvuUZHdY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpO+z+zO1WsydxkEtD6fhlUItAsfPjNJGzSJLhk
 3zw2a0LMrqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTvs/gAKCRDRgEFAKaOo
 NgdkD/9MMfEnY+Ur6Mn5eTp0ijKtKplBVIvSsfzDOY+CYBtzrPr06mzAnEco4EmnGInU9S9MzVr
 Oo3w+uXtyEqe1fur1ndq1alZfavoWZuhCazLBMVy/HnhKReB7sIz9+pOaq7oFSRZ4YEHKcVRLBO
 T3e6euN+av77qZulcZyU7Tt3HCzvZsjEYOAohAI6UVGEU2vQYpbzaPCowxpg7Gm4HvNHjkr0Dpq
 FSlrEfAu58pC96A2dqhJ1l/j5qnR04ps0URq/i+w7zB71556Yct2aQZw+ff1ZgQfgDPEo4c4pr6
 3tct0k+Ha1Vw4hqYPazDg+Th85NR0+2YqYvn5obcwFVOQdKNWn/tLbEB/lFEs5t3ndqjr+ijv7/
 TkuVO1omHYKwbxNvlTUA8yBEHoRisdXt7yXeBVPoNs4/6L5LCowULW5ecEus0Hr8RHyZQSOYIG3
 EZ1Je3wKRYIiLcHeJMj6d2nkAM5P8HbDKhwOKtiEVhA6IwO/dtU1egZx03Z1qIncDHPrnhMs24o
 v11TfJySsmx7M4dg2Cj0sT+ZMwutfC1vpWVQcpY49V5+U1iGBDWor42VLxeDxrxS91+gxppRMC4
 VeZIntxsL7G+fYuWv5Zo+7dN+TkfMJd8Yhk7SqxG9yb+OyAE+yUHlk4PfyyBV4xFQ2SgyUn0m/H
 b1Vru1YI8tTVmoQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8265

Added in OE-Core with commit f0645e172bb8 ("image-container.bbclass:
Error if not using linux-dummy").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71fe11b83..ac7b85992 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3955,6 +3955,13 @@ system and gives an overview of their function and contents.
       variable, see the :ref:`ref-classes-image_types`
       class file, which is ``meta/classes-recipe/image_types.bbclass``.
 
+   :term:`IMAGE_CONTAINER_NO_DUMMY`
+      When inheriting the :ref:`ref-classes-image-container` class, this variable
+      can be set to "1" to allow a :term:`PREFERRED_PROVIDER` for the Linux kernel
+      (``virtual/kernel``) different than ``linux-dummy``.
+
+      This variable should be set from a :term:`Configuration File`.
+
    :term:`IMAGE_DEVICE_TABLES`
       Specifies one or more files that contain custom device tables that
       are passed to the ``makedevs`` command as part of creating an image.

-- 
2.51.0


