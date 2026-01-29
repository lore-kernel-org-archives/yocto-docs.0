Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA8BD61030
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17096.1769700256073533549
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2NNBkcsY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 86EF14E42322
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EF7A606FD;
	Thu, 29 Jan 2026 15:24:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44E2E119A868E;
	Thu, 29 Jan 2026 16:24:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vfZ6kt6PjOUV28bdGPrbsqb6isRtnWlvlpyulIP/F1M=;
	b=2NNBkcsYwzOKnxdjo8+xUlYgsOPnhd7Iz4io7riz4LBSBePkIGwBQbtcHcncFfmYkzV++W
	BlL1IZNp/OJumgccsqWe8AZVreZ/+AOdEjvFiKiluUBWUocpOaXS5wb2fiY7CPQ1EpCg12
	OXIB3sFyKClXvyNWBjylGKTgAYyvHcVnbmUuIUGIweRvLpYealIQfIxvj6B3w1pRroRv3M
	E4zlONx22WZbvW4ffawgnRB62bV17bHFukh6sq44yLPTCq5aGZN2CGayRl+4tykxik13D8
	VfiyMbl46RU0xfmDyQAOWpfnLvM0AdRGEdHPQOJaKBANTRzSJ5nisk9ZACZ6wg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:06 +0100
Subject: [PATCH v3 15/57] dev-manual/securing-images.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-15-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dBRpBR2bZ8XAK6uuktW+HPfnjpxC9B0XfaYxfPzkRSc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uLtoSyxBuG0k4PoWX85QxyNLUBeeYklJ2MW
 RMDC/EmvJ2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iwAKCRDRgEFAKaOo
 Nq8ID/0Wz2f8lYy8UEPLIDEZz62oF1AbFdVtdt0SuuorDvTRGvvfQyivMTJ9uW6k85+DBDx3kcy
 pdLUOd3s3I5q80Zb/hIpqqJYyLyqYfxJPIJoQLdyAeJlONguhdHpEqjYWhhgSGVosKzugMC8LHq
 8+bBCH4nYV8YsqPed5C2g5d82p+z7bN2bPPJxZ0eOFkpxYNxRMN9vYgbQdYNS7E9jn+gxNCQ3Gt
 QFlgKQTEcbXOwrbSfTDFIRiw8EcR9jSikJmJutIAIyQTeXeIoG+UJ8zfRIjQOqzj0XCAq7VEyWw
 1maWRLjQBzCN+/PgKby1CJW4TMEj+xd7kit93zANFr7IkKrfoDU/zt3fIo+m6OtwPrEKiXfHSjz
 PkB1O3tRJMUwI0X0eH5IddSv2BZb8StFtWF1xz1UQKHY3cciMQws+MUy9VB5y1z7OZezoN4F/Bg
 G1hmNBGe3HxS25CbTFHtlREBRw87OvG4xrSv8C3TnjTFmPNqvKhMURWwZliAtL7OILk8xfpWsdL
 2yoJgitdEyRUEw1Mepgf00EdyHe+YTOccewfKcWIaskJvzpS5qV+95XuIt76cWoql9nQEama12l
 cLaEwp/7Ha8mzvWD9rF69h0gEFHULaTiPEIzYexLsAmJTfVda/AGUby7GcMFDn01VOHA+d/gzXd
 HMO0+2gnH1EvqUQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8801

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/security-manual/securing-images.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
index cc6f95003..952808f3b 100644
--- a/documentation/security-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -50,9 +50,10 @@ more secure:
 -  Regularly scan and apply fixes for CVE security issues affecting
    all software components in the product, see ":ref:`security-manual/vulnerabilities:checking for vulnerabilities`".
 
--  Regularly update your version of Poky and OE-Core from their upstream
-   developers, e.g. to apply updates and security fixes from stable
-   and :term:`LTS` branches.
+-  Regularly update your version of :term:`BitBake` and your layers (e.g.
+   :term:`OpenEmbedded-Core (OE-Core)`, :yocto_git:`meta-yocto </meta-yocto/>`,
+   ...), e.g. to apply updates and security fixes from stable and :term:`LTS`
+   branches.
 
 -  Ensure you remove or disable debugging functionality before producing
    the final image. For information on how to do this, see the
@@ -72,7 +73,7 @@ Security Flags
 The Yocto Project has security flags that you can enable that help make
 your build output more secure. The security flags are in the
 ``meta/conf/distro/include/security_flags.inc`` file in your
-:term:`Source Directory` (e.g. ``poky``).
+:term:`OpenEmbedded-Core (OE-Core)`.
 
 .. note::
 

-- 
2.52.0


