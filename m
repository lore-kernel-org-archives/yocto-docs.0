Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E32E78486
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123210.1766593936555394552
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TB27LqAW;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 183E51A23E2
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4B416073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A0C910AB1372;
	Wed, 24 Dec 2025 17:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wm5yK5G9iaR47BYXuZoiirQ5zbqRNKBaMmEtu4wLyuo=;
	b=TB27LqAWimNu+hmZxhwHGAQq/EVrC27qbnrOZUlugcbTD15hmKHX7VC+aM/fHyAUS1I6mz
	24Q822VGepTiOkz7Wk8fGdWE+ZSlu3Jvo3GTRhFoOtMuarNOfmwuFzKuIH32FzCIJTTj++
	I2OClwNbNwBN9GKuDdpmeX6gxAMm2yz+yd5j4Iq1W8JQlcaBw/z5AqwIjc7TD7Mwe7X232
	t8znJNFTmys2ImqDOQdX3y4a/TTBQXgTi8LOkRQJeWsEzh6DAOT3F91UgRxzaiHjJq32v/
	t6xNQePQqVH2Hg3DTcoDJM/IIFVRqCAa502Kdn/yw4J3BWCEzTIKiGnP0CRYNA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:04 +0100
Subject: [PATCH 38/53] dev-manual/init-manager.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-38-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kbovHoN1yoqGn9WkEW4GZKvw0fJ0boTr1zQv/a41PNM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVtk7MSoH29hgSwGeyiQIkzmxPbEdKZ26sJO
 +Lbv8fphTiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbQAKCRDRgEFAKaOo
 NljeD/0QYHaccrXBnM0GudMdRVenauiQ1djXKnIXJyrJn+L69BZ7YVJDHv4/eYfxpxssBRGetHi
 VJFLRisuxvQYqClyUVKO5lUwvQo/ucw0snxFu2Q6yTJXZrugfvbdMxdrnnoXZrIYZ9Gq8O4EcKW
 pGMfOBV6/fq6+JHpPd9+b4p9+XfgWCMEUwpXxXcpngvHoU/hz4Tl9rbmuetW5ufwj3czrDKERP+
 4SURSBSWQIKkLzaS3RCdNlJoZNdzuucdg6luErFQTJjkGu1Gb1/eVqH9XV1WlLhpirlQcRxIBbB
 t4w14PF7tsrfhK4eOEK/QFziPCbpsNCwMtz2bj05rxqUUwn1iy6R+fNL7A/8fh+PwOFD0QNPxLZ
 D3PvrNnHbbmXMtLOvOn3jWFGIxls4Ww4SmyoCiL+ZUiTovQ/UxjnxdYyFcRaTnehT4/RP6Q/8k3
 M+/yYMpI5Yr5eTnaHzFhDQ2+bHKv2E7WINslk7oAsVol4pJwHJH/bGoRSy90PvIzmb79iryROsX
 cI/058G4yryLXrLgwDjSr9NRLdPh6N9mWoImtIuSPkmnQ6e0vt7LtuPQzMTquAvXvf7X/wVjrs3
 Ko0x1AaSl1l/vXq90Dm0FZvVmscI0Q9ZRsd+cSnSRCdoEdbxIGE6u4vYfId8W2uwCDZcnhYb3We
 NOculXm8uEAzTCw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8367

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/init-manager.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index d0fdfdf77..670810310 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -54,7 +54,7 @@ Using SysVinit with udev
 =========================
 
 SysVinit with the udev device manager corresponds to the
-default setting in Poky. This corresponds to setting::
+default setting in :term:`Poky`. This corresponds to setting::
 
    INIT_MANAGER = "sysvinit"
 
@@ -77,8 +77,8 @@ for more complex systems::
    INIT_MANAGER = "systemd"
 
 This will enable systemd and remove sysvinit components from the image.
-See :yocto_git:`meta/conf/distro/include/init-manager-systemd.inc
-</poky/tree/meta/conf/distro/include/init-manager-systemd.inc>` for exact
+See :oe_git:`meta/conf/distro/include/init-manager-systemd.inc
+</openembedded-core/tree/meta/conf/distro/include/init-manager-systemd.inc>` for exact
 details on what this does.
 
 Controling systemd from the target command line

-- 
2.51.0


