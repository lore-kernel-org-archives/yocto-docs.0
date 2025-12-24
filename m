Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDA9E776F4
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123200.1766593926411396934
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VHA/P7HE;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CFFDB1A23E2
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A81746073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B51B10AB1381;
	Wed, 24 Dec 2025 17:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iJMse+PMZ0ZvdJjvEtjln5vrldS7UvpTMDTMuKpMFEY=;
	b=VHA/P7HEs39whNX6gYHLOUuuPupIXenV3DTkMpRMq0RdFDUJQXc3V3CxYjBESa/XMWrcOs
	2C/mmTY477ZGKacij2ZnGP7oSSsp7a/jJH4DMVxccb8zlgQf32IsDyhIPHwXlPyEdd3n7O
	O82f4j9J6jf4EIfOsKtXxRXKNOPG6snTJnf+bVLVGKVmqIUjCInTu1qHs16UGmoPlUeO8x
	nbPHNtSMSPFw3U3ZZajFkFS1uqKt1ANQ6OjU2jlWvjqk3j0Yr43HS/GOCA6p3PN84iIZc/
	S8HvhOQFkEwyMC/9Sd8p4DbFSobO3aN/SH2RuHxz8dx7mtkl/S5s1w2GLmk9RQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:51 +0100
Subject: [PATCH 25/53] ref-manual/images.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-25-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=981;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LkpDi8B5kDGnHrRMfCQ2dMIRYGVyaKI4i8q+mC6QV+o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVrtIE3zsVRdL5Wv3ovKdoEa1sYyit555lV1
 vkQNlN0g3+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVawAKCRDRgEFAKaOo
 NqjBD/wJAD5U2r2RUwq2RThkGnwyY6cEIfiY/cRh8ejpXpsaNr4CVS3fSVeTr/finnp0Ij9VkyX
 obWq1neoA+FraJzbDPpAT2AUmA5MBTL64K6TjHLrTvGG1nG0A3oaM8+o9uukDodxHGVrOwv7QeL
 icnxd1vIvS70fdgUe0qNrG+ciMHjnxIsjzbdheLIBcR+sZ/NphvhtUMW1L9J/ms0m3h0LTMP2Cd
 /c2ZJexIU0qHrGeCjCe/g5ggmEr3SR74AKjy48KM504KOCNCGNxiATh7G07Y5EpuXh6YeOKrYhM
 PwbqKPyp3iEjuQnoN07QgKpQG64Tx4E+GbDnEhXR+iK3OxV7siVYUjoVUlPjMTF43s5dPcRmnjt
 jajzcOuLnSGlVE/v3LZSttt2yGaurwGFphin1W3qcahS17yxZieWr1gar2OxrPx4RbwnK5k9x4p
 ko8BHSHlcZJDOuQZzol95Q7lEf74rwzl1UX/mXfdgL4zVQRLsUNoWBvROMzP1swrc+XE5P8Yizr
 6khTkWkhWRFx1O3FfNtdjqEPFVo8PhPnGUC+X4Qc/3DUPcriIsRH2aZiJ6XMEDHYJ1MLnLiP3SP
 L0mznIRfm3RRIZuRjGLH0JDbpvo8YJvVqOf99IWf+mVcQUBzHtTAMM8XmQ481uDUIYlBIiY83zn
 Ta7zU45ox7MWMKA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8354

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/images.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index c9d898926..94e412de3 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -26,9 +26,8 @@ image you want.
 
        INCOMPATIBLE_LICENSE:pn-your-image-name = "GPL-3.0* LGPL-3.0*"
 
-From within the ``poky`` Git repository, you can use the following
-command to display the list of directories within the :term:`Source Directory`
-that contain image recipe files::
+From within the :term:`OpenEmbedded-Core (OE-Core)` Git repository, you can use the following
+command to display the list of directories that contain image recipe files::
 
    $ ls meta*/recipes*/images/*.bb
 

-- 
2.51.0


