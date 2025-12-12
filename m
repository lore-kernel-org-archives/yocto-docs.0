Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09A4D44171
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:22:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9855.1765534959705770087
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 02:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vT2vjBxm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 253DC1A212B;
	Fri, 12 Dec 2025 10:22:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA790606DF;
	Fri, 12 Dec 2025 10:22:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F6D4103C8E13;
	Fri, 12 Dec 2025 11:22:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765534957; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pgZ//VgKABFoOrGhUQ/z9ibuo8YaK9sWTp3NfzTjocA=;
	b=vT2vjBxmL/e4g9ocXmw7+E8AMrKsioPHt1tAg2VQO5Pn1nIlNBRIYgCFWk76VURHYVM7I6
	Sr+ZF6+oyLHxWtBSr8ukDiX78T2JK+dTeJmUh6VxAAdc+vhF5yc4THVtbqC7IMA1RwCOAW
	o661rTd7niLxexuMjLr1ZTQUJb5t1SttS7IziPI00B/utsOQVvceJyI2Z7C9z7uzSQOGM0
	oEQWoYOMV/taZcX7MOPn9ItiJBHzXQudOdjVemuVvEA0sEHP2hTJ1H94gpYfWrGOrdZsaG
	LAQ6GSpbkuf3RqsDU21Ekpx7+UO7lYDEflCbhZgmsAFwpnpFomjWXbjLjAJilQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 12 Dec 2025 11:22:24 +0100
Subject: [PATCH v3 2/5] Makefile: fix rsvg-convert --format capitalization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-build-docs-container-tlmgr-v3-2-a45c1ce6d8f7@bootlin.com>
References: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
In-Reply-To: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JEYNcK1+gu8hMQWZEstTN+z7+kAjeTb0Lvb2+P6mBvc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpO+zqkjg0R+YVOZKIC2u6O2qJwgJx8Q/T4dXrW
 Hq0ijgQ++eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTvs6gAKCRDRgEFAKaOo
 NquYEAC/Ydaf8FioDJr+1yqbfJ34iZh0+Bh6qmhSkXfI9QtLCkjnOvop4S7Sx1EBYrhoEll1Glw
 /9O20cnLqCJkuiSLTDHKEPFOVWgTguGsoUGpBffytFKS86C8XVHAaIANdv8LX2YVlHI9/auTRC0
 MVFwmDMRfajjiPjQQYO2KoJzaFIvC0gl8fW7a1sUeZVDob8PxXyXHcM0Y5WcenbYIXGa6qheHql
 MVxhcXIYSEIMGj87XL/8IcAUyM2DVKl+nXXliZNLo9tt47iCnUMVmiknER61r0V3mv6xfu2gHzs
 2AmKK6Kd6pd5H0nawSxsR0t7sbrUdGe+z6v63g0bQN2rN7zvAQojpDx//wbitou+vUiZMdpH5EF
 VGHr6Y9oAcsTUfOoVkegrEvdkKwLUsHm6RqLwOqMBHHWUHaaigDYm7q4MYRUWgcEM3Ltz9yuHXd
 O3YNoYRfb9O0zs4pWCAhSUTkBpVie8S3WHAuaGRJP26unJrx9VcDFDG3xERie3Qi70lOa5vM2+N
 xGvY/lblP5CDTDOgQMFk2JJcDyeWm5xzGfshi4wKsMmgG28SBPcAictwulIcT6JIhgrDWk5maqk
 624bauT/hxyJSR6T1xRmr/92IT6Ka8liYiq14RxXa1yB/bzdxjnWOCTsKjq+hXryjJWfTfZ6k0S
 yv93gZkOYpBt9gw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8260

On some versions of rsvg-convert, capitalized formats are unknown.

For example on CentOS Stream 9:

  $ rsvg-convert --format=Png --output=ref-manual/svg/releases.png ref-manual/svg/releases.svg
  Unknown output format.

While the same command with "png" runs fine.

On Ubuntu 22.04, both are accepted.

Switch to the un-capitalized options, compatible with all versions.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index bade78fe8..e144a50b4 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -43,11 +43,11 @@ PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCED
 
 # Pattern rule for converting SVG to PDF
 %.pdf : %.svg
-	$(SVG2PDF) --format=Pdf --output=$@ $<
+	$(SVG2PDF) --format=pdf --output=$@ $<
 
 # Pattern rule for converting SVG to PNG
 %.png : %.svg
-	$(SVG2PNG) --format=Png --output=$@ $<
+	$(SVG2PNG) --format=png --output=$@ $<
 
 clean:
 	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js releases.rst

-- 
2.51.0


