Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9427BCD5BC4
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 11:03:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21094.1763031834990981948
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 03:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ygD8Av9G;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A1E6BC10F45
	for <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 11:03:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 596436068C;
	Thu, 13 Nov 2025 11:03:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 046CC102F22CB;
	Thu, 13 Nov 2025 12:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763031832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=NJ6FPrRbzTiVl9J08QOIzXnN64CMBUWCx/N6/wZ71kQ=;
	b=ygD8Av9GxH45D9tIURcw9LhEh3bagFFrZ3YUw2XoYUJYMyu1DTHGJaDdMpkqadLJni19+Z
	IKQo+XIG8b+LJLpvyTW/5whgBEo7F30Anw6Xd9gbYf2S77mpoD32BGS0zkNX5lDZi+J4dB
	xgXcsyILEJjYsK32xl4+DiLg36A0icNVQm9LBWTe0rE787cu3/MBIK/NLy78r2ssC5UL3V
	d+MCzRBRBrISzHD4CS0D7yAdnucm2RVG5y3wCnwBPu2BEYFygSkCD0zZcKkCnUgixPe2If
	gjLTTwXodS0m9MvzIjd0uvXudOBeREfzQ5P/fsl+IdaKfqV1R4t8M648neVRRQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Nov 2025 12:03:36 +0100
Subject: [PATCH] ref-manual/faq.rst: add Q&A on third-party vuln scanning
 tools
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-faq-spdx-v1-1-f5a2f54730c0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAe7FWkC/yXMQQ5AMBCF4as0s9ZEK6JxFbEopoxFVQeRiLsrl
 l/yv3cBYyRkqMUFEQ9iWnyCygT0k/UjShqSQee6VEoV0tlVchhOWaCp0OWVMbqElIeIjs7vqml
 /897N2G/vHu77AetW3jtsAAAA
X-Change-ID: 20251113-faq-spdx-3e87ef078825
To: docs@lists.yoctoproject.org
Cc: Ross Burton <Ross.Burton@arm.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=AL9KFiHma9FLgLjNt9VtMmFYRJLRIYwqDTBVqFL+i+w=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpFbsWCnlMZ1y0ZhTDbJyTgnvcfgV4+SCC4ppEN
 4Ikh9pi9yWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaRW7FgAKCRDRgEFAKaOo
 NkuEEACLczOpJuNofsnwKhXsy1I8PLn0AevdQiWPjZIsHAVqNmZF2BJc4vSEwuWKudmDR6Q+8XA
 NKpZ2KkytxsvbZTUhRpjaVQ75mFQVoXoY70cneXGxCvSuvtdh/CjihTmUEMq/o2HF2wuxBvOihR
 geOPvY4h8swWZYxFrOGAIUequQSU/nMf9X22opXMmQONmf/xi7dSmWnWjP7XzCB5sbWPxHjaJPw
 dUK5OCI9dHnTcTdt6QKBpNrtesRA+e3Aymf2bkZNJeoGBCkBFy88M/3XYSLjfGC5qCnL4G1IGEl
 7etnRt+d4iWHS7CSqY8thLF95+8PS6JwkdUro+PjVgdKjnKWF1yVhoiFHiZFBMAlIAnWvSmAmAO
 gP0eDUQpfbn6+E2lWzh5Y2pLwnuUk05a6LwCSkMtzkyveyxsjLRNLmL95po8N27Dxmiw8a6PkUH
 DyJCXcZb1pFd3VHDpnekFiD9jLR2FrHD98052LRDvG1a0l8OtspR2KEhKzjkcCFJkDq8XwHsW04
 k0/gsNbIrR12uZoUD4b4PCtozE3mH0VOtT5hw5ZUQLRoycKfy74+PJL3I4qiQi/w10gMxxzdQhu
 OU8I0O0rP8vxLYDBurxbZ09vGOHwhTLoVGYf9/qD0i+R47Rt9Pymq+y9oMIJyO8x+7OBiBVrrki
 8J9R4WA4pEZqQ8w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 11:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8032

Add the "How do I integrate a third-party vulnerability scanning tool?"
Q&A to the FAQ document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/faq.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 7dd37c7a5..406b2c388 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -300,6 +300,29 @@ There are also technical considerations like which recipes a class append would
 apply to and how that would fit within the layer model. These are complications
 we think we can live without!
 
+How do I integrate a third-party vulnerability scanning tool?
+-------------------------------------------------------------
+
+The :term:`OpenEmbedded Build System` produces SPDX files that contain the
+Software Bill Of Materials (SBOM) for any recipe that is built. For this it
+uses the :ref:`ref-classes-create-spdx` class. This class also creates a final
+SPDX document for an image recipe, found in the deployment directory
+(:term:`DEPLOY_DIR_IMAGE`). See the :doc:`/dev-manual/sbom` section of the
+Yocto Project Development Tasks Manual for more information of SBOMs generated
+by the :term:`OpenEmbedded Build System`.
+
+Some third-party vulnerability scanning tools have existing integration with the
+SPDX documents generated by the :term:`OpenEmbedded Build System`. One example
+is `Blackduck`, which offers the `bd_scan_yocto_via_sbom
+<https://github.com/blackducksoftware/bd_scan_yocto_via_sbom>`__ utility to scan
+the vulnerabilities using the SPDX document as input.
+
+These third-party tools have the responsibility of providing support for
+integrating with the Yocto Project SBOMs.
+
+Also see the :doc:`/dev-manual/vulnerabilities` section of the Yocto Project
+Development Tasks Manual for more information on dealing with vulnerabilities.
+
 Customizing generated images
 ============================
 

---
base-commit: c6f5de9fdbab3f29336ac3bf30150de8777bcad7
change-id: 20251113-faq-spdx-3e87ef078825


