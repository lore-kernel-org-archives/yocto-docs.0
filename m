Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8481DE776FC
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123747.1766593946276331175
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JwTfU/P/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BC9E54E41D90
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EA306073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE8E110AB1389;
	Wed, 24 Dec 2025 17:32:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5vVF4lOlo5ICcanc+93TdXkJ/j3ha346h3xp7eMxqBo=;
	b=JwTfU/P/LdNYB0O7zWZEzaW/oj9VZGeMGt5mlFZQsUZejbzxVNOvvt10lmnjgQWKUTg4FD
	W+dbyxgzhmJsVv3n2Hu3QQTlKWG+mi3ntPmb/8hOHgPGHG7ElL1d70pnPiMpJBsv4TqOrd
	Tx+SyyfBjodgj9om8jiTcQ9m2PffSxw5AMsQzHJItosNIGhXo5ry/FDYP8cHmvu2ai+EQr
	amEDLWo8FFbHJM/ONhVcdVyF6gopdKz4yaBu50wd/ELSYQnDWyItFMMCC6q/VkHKvzscJ+
	qvjDARI1OZLeIS4xWXhUrFxgAx/IvUxm0p91UIpZD7jjqr+Rp1OjMCQCzNQGeg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:19 +0100
Subject: [PATCH 53/53] what-i-wish-id-known.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-53-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=W2xD2wRzNvKwgrNv4n5Z59wHZ/UyqL/07ymnSiHpqJg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVwg7IReKl9VTIhAWhJh9C+jG7w7YP90p1x+
 azxApeYqNOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVcAAKCRDRgEFAKaOo
 NuzkEADJ6UH97NdhiAnGG2pNw3N4JXf+6MdzWhoBC5Tsn2i0BEFvURpNgkz/Kgr5AUruNdEyDPe
 JOaC/sAe3RcZMl8X8iF7ov8/000XQMRsEMF6xnObpgRudIJgY4VEv2m+ypJ3jsFlG9VHCjxk+N7
 rnZV2dsm0G+VfKsSTBYXXZPGacG6HtxfiI1qOTNY62TWR8LKZoAsRZ2DSC1S6ozaGzd/yC6Vllt
 vgrOvQBbZC721UTbZj5wM2GBx8qR26XZtcSSHpAEWHvLjaYBZdVccxXD0p7qA9wwCAR8qwIAqCt
 oQvlUlCuotqTuXsVxKXzAosipEcQrL0eNE7UmSpN3MsOrtb6q8ZrVwjQCPWtfoJRuxw3tDVcqt9
 OyhDGh9fAgP4tQjRJGTXYd+c923a1MHSiyPebrVjomqvH4TUyLAltVVbkCJYRTmMFfzWpPNpwCU
 uEIIorHROgMsPqE0z5po0FrUQi/2z4QFXAxs3GMQkwJ5vRovcOGll04oJb/5Pl3Hki/aDDx06Rj
 UbeqKJRzD+TR/0thUl9/h47ylnJ5L7jeJYMxRAcqPziFVR0INxzr3oE1NvlO4jGsu8bMf8dTzt2
 6OTElWTIXsCVKJ6YjdpQDAV7EPzePpKNv65wK1hDkZIsocIB5NwKlvnY+OL9KKkOiU29qLAx7ly
 pdTj/fV3Mf+473w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8382

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/what-i-wish-id-known.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index ddee6ad74..a381a6fdf 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -60,8 +60,9 @@ contact us with other suggestions.
    layers, on the other hand, helps keep simplify future customizations and
    reuse.
 
-#. **Never modify the POKY layer. Never. Ever. When you update to the next
-   release, you'll lose all of your work. ALL OF IT.**
+#. **Never modify the core layers (:term:`OpenEmbedded-Core (OE-Core)` and
+   possibly :yocto_git:`meta-yocto </meta-yocto>`. Never. Ever. When you update
+   to the next release, you'll lose all of your work. ALL OF IT.**
 
 #. **Don't be fooled by documentation searching results:**
    Yocto Project documentation is always being updated. Unfortunately, when you

-- 
2.51.0


