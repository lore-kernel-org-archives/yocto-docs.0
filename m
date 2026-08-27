Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C080C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:47:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31341.1787816858134202641
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 00:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HU60o6f4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7D2E71A185C
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51711602B8
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B53B111C7815F;
	Thu, 27 Aug 2026 09:47:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787816852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dsz8IRl4sVfjeI7F3eAX8GLkO1JMYVleLUVE0MDwx+M=;
	b=HU60o6f423hx2AF3XD4fxdLtAmKvvjI6xpoqMLKinVBXM+xM+79rtyC+iBEOmSEym38jAr
	CtoIjEczzlxdPT9bsdvzHv8scUHN6NFVuxMPprEifABXvOiR+AFsZV7fS/odyMbxAXKESW
	kmrif1edy4dKugmDz5FC97PQz1aDBZ8fHVcuLS0K51r0acPdC/J5/Dpkmv+MlpbDVmgKQL
	NOMs5Mm/Z/n0nRzUXlzXajTAB1YaL77uiBuM2DzvX/gJ1NIZ842c//Ji0HjhDk9HSkL9wh
	kXdq9l7Vw9e2EOw5SkywgLYRPJMkS90hvCgqI3qoqkZiTKAG1nitfobrnsr2lQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Aug 2026 09:47:00 +0200
Subject: [PATCH 4/4] ref-manual/variables.rst: drop documentation for
 FIT_KERNEL_COMP_ALG_EXTENSION
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-missing-variables-v1-4-7ec8b525b23b@bootlin.com>
References: <20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com>
In-Reply-To: <20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=a50y9a4BaI9OWfMcG5o4fbyzdQhOe/cB44OOgXQ7WRw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqj+uA5AKCBrjtrrwVU+3GOitkMw9hgmtZmOgPH
 xMTnwfEe7qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCao/rgAAKCRDRgEFAKaOo
 NiOiD/93MAIhzjnDSSFpU1ouG7NxF4fxIlxQv4/bknNJN9IoiHeD3w3H/pgKR2AJIYpKZAx7lKD
 2j0sU+KJaRhOlHhrqLwDfVu0E5CVWyPXPm9FE24Dnz+9kkmvVRZvofQEXEkYKX1FAbUkt61VuPT
 eGs19WyBgShpIGAT3rO3O997+54IxLD3W722d2C61zCdJSj+z0GJXCQPdZD3dc94pF2L5BvP/Ng
 y/dwImKMQ8bUdIqfYgb+vz3VU3q1UbFXfNIF6QPPEa8GbVva2UxCXLkLN3MGrq8OrqbyokkedHi
 A97mORLXfrWjOfQ6XgDzdJy9MhNKMhshswv4gB5YSOY09CoVNkQG45wXap+YPXUO+/yHWUg+A1C
 G58ejkxBEVE1ikgfP3ty25l3gU0CXLXedCo5/z5A3SevEgeVcxRSNge4q0VeQCz2ZHtAy/Wg7xK
 uabxSjRj3ggHZjt1NZXPQ0AT7GWZfcv3h4dYsNN4nYvzVaKGCHIevjJ9FmQvBTFubEIs9TVPYh5
 vbhh/0U8RS77w+viVsmZRZk7R1rzE7zK53njio5pXarEzwSLECvla3/jPzYgij0wu+YHrfxpd4e
 OMWbcPt20dW7cykCMXvkZkdKMcsqz9rBgDxF2hKTgN8qSEBadFtf6YM95ysDIBkKOk2j55unRRb
 f3FjKp3C4v7E7Ew==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10376

Variable was dropped from OE-Core with 46bb48b42be3 ("kernel-uboot: drop
FIT_KERNEL_COMP_ALG_EXTENSION"). Remove the documentation for this
obsolete variable.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d1bbc437f..b7846585e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3454,17 +3454,9 @@ system and gives an overview of their function and contents.
    :term:`FIT_KERNEL_COMP_ALG`
       The compression algorithm to use for the kernel image inside the FIT Image.
       At present, the only supported values are "gzip" (default), "lzo" or "none".
-      If you set this variable to anything other than "none" you may also need
-      to set :term:`FIT_KERNEL_COMP_ALG_EXTENSION`.
 
       This variable is used in the :ref:`ref-classes-kernel-uboot` class.
 
-   :term:`FIT_KERNEL_COMP_ALG_EXTENSION`
-      File extension corresponding to :term:`FIT_KERNEL_COMP_ALG`. The default
-      value is set ".gz" by the :ref:`ref-classes-kernel-uboot` class. If you
-      set :term:`FIT_KERNEL_COMP_ALG` to "lzo", you may want to set this
-      variable to ".lzo".
-
    :term:`FIT_KERNEL_SIGN_ENABLE`
       This variable is used by the :ref:`ref-classes-kernel-fit-image` class
       to enable or disable signing of the FIT image.

-- 
2.55.0


