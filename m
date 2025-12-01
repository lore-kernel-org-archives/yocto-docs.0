Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A81D116FC
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:55:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18192.1764582934673538442
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 01:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0TrF6gwW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1575DC17B49
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 09:55:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AE4C606BB
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 09:55:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1C7F119125A4;
	Mon,  1 Dec 2025 10:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764582932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d9+rpycRom0mmpEPLO7IEp/pU3iEO/PPqbWmvZukos4=;
	b=0TrF6gwWTLatm1p/hgChJyDlUXYVHeOs9BzN+kVeXf9Dm0tHJwDQGFIenmbhWBRWeUc9Lr
	iDudnuUfMFWHqQbNeM8o2onQHnaaClUbeAYb4o9Jf17thb8Hl+AcniMb2D9hs4+eiRFTpv
	DRZsHggGVEjRvWZtvgcPONZ1O5/4S4DkpR2RuOmetUOT4UqqNrr/v/EU7+PeLP6HSP741V
	l5QLKOb9Bqa5PP2HmQrpjN5oyAOMsIsdcCWiJ73pwwxsQmE0XfJUJ2t1cBGjPqc++IebD2
	sb+KZtRG5oyvtC6OjWUEju5XOahF8Z7Ab5/mxYGBEYiJ+dVCQ9rfWIYfWT3kcQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 01 Dec 2025 10:55:20 +0100
Subject: [PATCH 2/4] dev-manual/temporary-source-code.rst: fix definition
 of WORKDIR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-fixes-v1-2-1cf15a5a4cbe@bootlin.com>
References: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
In-Reply-To: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5LStQH3f6/cNeUJdocj4NYOqju+6vF8f2sTDCxst37U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLWYSHdWjeeomQvg2lorBthFOd44wrKne0Yw3v
 NSnXhVesN6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS1mEgAKCRDRgEFAKaOo
 NuOhEACtJNNo4suMxRZlONp8t15RlYgtTJsSAwWFq0AC+ILNTgbJnvCp/B50/Fwo5eIVacEwMj7
 vm7csyut1QBSt+9AGFDcx0wQWo1nMYLK4wEe0glYj9DlaAaRlRivxWk8sBdNpokKyg3q+8YSvGD
 IcGa1oTTSQFun0+LskEzIDU9Sf1CDeCQnaf9oxvpixBCr1lkmKOq2SF8W6Ewh6EuS7PAOcOFsBW
 gIxz6u5iyfG7FmGv3NKftKUARCPXb4NU1MseKM6NbD9jzc3F57T3FkcF02/IL4tuHyhGdAAYURM
 nW02NfaBm6XWf5a+IG61cW/Tc6e68DGQELaZREmbVSQxgS8iXdlwOIokDJrM17FgSHrLUypxxTP
 Jp+buAV8po6MWh9592JasKpf/x+vFdYuRYkNnfBb32QxXeUWGVnguL+gkf6ezOK0Uuqkqx6Olag
 Ch5dQCcGdbhVXUWdkOSdEPbZEYx2bUqAQyXaNDPyQc65YqQ7TLhnGE5yumEPyHUfncsuxXpyal8
 HZl1bu9SwLbEBVDNDmG6ObVULeucN9Oht7a592rHGZZO0r/wsErCl64ufmjXsr7wlCp+3IVbNQg
 rpIHN9ofmUXRdl5dJwHkTLFFAiz/4N3s/B2c2m75/zYdPU7ayTNq8Jf3DOdj8686kjdUW0tlXSE
 WPxw0IWE+xYIXsA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 09:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8183

Fix the definition of WORKDIR to match OE-Core.
Rename the Source Directory to "project" as part of the transition to
bitbake-setup and the removal of Poky as in "the Poky repository".

Reported-by: "Robert P. J. Day" <rpjday@crashcourse.ca>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/temporary-source-code.rst | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/temporary-source-code.rst b/documentation/dev-manual/temporary-source-code.rst
index 9a7cd0f77..977edbc3f 100644
--- a/documentation/dev-manual/temporary-source-code.rst
+++ b/documentation/dev-manual/temporary-source-code.rst
@@ -43,11 +43,11 @@ In turn, the path to the work directory for the recipe
 (:term:`WORKDIR`) is defined as
 follows::
 
-   ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}
+   ${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}
 
 The actual directory depends on several things:
 
--  :term:`TMPDIR`: The top-level build
+-  :term:`BASE_WORKDIR`: The top-level build
    output directory.
 
 -  :term:`MULTIMACH_TARGET_SYS`:
@@ -55,19 +55,13 @@ The actual directory depends on several things:
 
 -  :term:`PN`: The recipe name.
 
--  :term:`EXTENDPE`: The epoch --- if
-   :term:`PE` is not specified, which is
-   usually the case for most recipes, then :term:`EXTENDPE` is blank.
-
 -  :term:`PV`: The recipe version.
 
--  :term:`PR`: The recipe revision.
-
 As an example, assume a Source Directory top-level folder named
-``poky``, a default :term:`Build Directory` at ``poky/build``, and a
+``project``, a default :term:`Build Directory` at ``project/build``, and a
 ``qemux86-poky-linux`` machine target system. Furthermore, suppose your
 recipe is named ``foo_1.3.0.bb``. In this case, the work directory the
 build system uses to build the package would be as follows::
 
-   poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
+   project/build/tmp/work/qemux86-poky-linux/foo/1.3.0
 

-- 
2.51.0


