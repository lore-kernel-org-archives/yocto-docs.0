Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E30E776CC
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123206.1766593932047556297
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qlkGFi6i;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 75A281A23E1
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D5E66073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FFA410AB1389;
	Wed, 24 Dec 2025 17:32:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593929; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xNY//6xemVq01iKazb6TN9+rWF1GeTGpg00fSb1H7Us=;
	b=qlkGFi6ibkpgmSjFJ9BW07mjHXYUoKscy/AGsxoDaQr5oklN1cdXim3z0J112q5mNxTta9
	Cq5TylviNxahV9eVanueVogenL/jXUOHhSpf0Z7kv97FqUQT8z98qJ7DxsTIx2+JlXtPFw
	Q5D2lb1Ec0Ru7Cb7NgJetkwHqBNjsfMhChc+qARAKaDmXDG9yRN16c+a85Hmlzj1p4Ye5/
	KabPGnBPDvWCUOG2dxTevTlPV9Bvg2M8A9ipSpfcgLpzE6aMc/P2Rb9aB7BVjH9dHV1a5M
	AbiEf8rnS1KfY/Cw/0uOg3dN7gxAz5DJQZcPwMy3TkkkscduPjcsL7XJwcOnBA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:59 +0100
Subject: [PATCH 33/53] README: remove obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-33-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3024;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=WtWoQKg3SyODHtu/nyL4Xk4pYOVrsHpZDGLmSD53WKE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVst/bv1iO+ybMP/lq+3dVtqPbpDQqw6CgZx
 EGtmz6g14eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbAAKCRDRgEFAKaOo
 Nj8VEAC9NKp7lwZ4wPaHy6nMoeOa9zI7ZWcviYy2CcMgb2oPIkCdywWHljXbgyFjsAuXFruvA6o
 DKYijPJfxVgy8ceiF/doodcO/QOjHcBcdOiEQ0nEbzwLz1pzfmeA/5SFp66L4jet3fuHahVvcMF
 FQNHXPVIz4iQffVQIzzuq8ueDT6vIT4ie3F4LUJ6HT8xe3/E5QDM08MFVBdNvvWceCOzTy1zAa9
 DEIufasdwvmqFUWVPmzSghw8KKNoowKpvIR24OH+LEP72ILT3T6v2RqUu6Mk1ncz1yIFqnGVFlA
 eA6ak8KMntT8mJWJRHspUS6NsRFuCyGuH7AwwJetuB/qKwRJkcmf+ciETomZ0O8oI2oFHguFNxl
 yYyUq7eApqg5CDwIpFYFdfT0EYW3N3FGBonvuapAx3G3gZCk1X9g2vOdVWiGTXqgJMMVZj3Mw7v
 LD/NZbhr8waplnE2Y5cEyT4IQh3VEXGBjuPJOK/vjbBcajp/HxF250aRAXn6NFiHPcVuse9wZVX
 SHIJ6ta0oGUw/Je+4SvjekGEmnZWKhRcnfjpY+m9dtaOahWa8i6fiVDi+64dA5drdJamMGYfTsh
 ufWgg+UjeOR9PxYgMGFecnC23YXJQhCFccfxuZPhZswl6xmrQ/IQ1hddtJJgLisxreoKDDCRFRe
 HHSE4i6zQmn7H+w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8362

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/README | 39 ++++++++++-----------------------------
 1 file changed, 10 insertions(+), 29 deletions(-)

diff --git a/documentation/README b/documentation/README
index 56eac7ca1..58b00ff5c 100644
--- a/documentation/README
+++ b/documentation/README
@@ -1,33 +1,14 @@
 documentation
 =============
 
-This is the directory that contains the Yocto Project documentation.  The Yocto
-Project source repositories at https://git.yoctoproject.org/cgit.cgi have two
-instances of the "documentation" directory.  You should understand each of
-these instances.
-
-  poky/documentation - The directory within the poky Git repository containing
-                       the set of Yocto Project manuals.  When you clone the
-                       poky Git repository, the documentation directory
-                       contains the manuals.  The state of the manuals in this
-                       directory is guaranteed to reflect the latest Yocto
-                       Project release.  The manuals at the tip of this
-                       directory will also likely contain most manual
-                       development changes.
-
-  yocto-docs/documentation - The Git repository for the Yocto Project manuals.
-                             This repository is where manual development
-                             occurs.  If you plan on contributing back to the
-                             Yocto Project documentation, you should set up
-                             a local Git repository based on this upstream
-                             repository as follows:
-
-                               git clone git://git.yoctoproject.org/yocto-docs
-
-                             Changes and patches are first pushed to the
-                             yocto-docs Git repository.  Later, they make it
-                             into the poky Git repository found at
-                             git://git.yoctoproject.org/poky.
+This is the directory that contains the Yocto Project documentation. The Yocto
+Project documentation is hosted at https://git.yoctoproject.org/yocto-docs:
+
+This repository is where manual development occurs. If you plan on contributing
+back to the Yocto Project documentation, you should set up a local Git
+repository based on this upstream repository as follows:
+
+  git clone git://git.yoctoproject.org/yocto-docs
 
 Manual Organization
 ===================
@@ -261,9 +242,9 @@ For example, the following .rst content will produce the 'expected'
 content:
 
   .. code-block::
-      $ mkdir poky-&DISTRO;
+      $ mkdir project-&DISTRO;
       or
-      $ git clone &YOCTO_GIT_URL;/git/poky -b &DISTRO_NAME_NO_CAP;
+      $ git clone &YOCTO_GIT_URL;/git/yocto-docs -b &DISTRO_NAME_NO_CAP;
 
 Variables can be nested, like it was the case for DocBook:
 

-- 
2.51.0


