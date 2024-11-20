Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697FAD711B5
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:11:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.15838.1732115456621720889
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 07:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cHg5cQ9H;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18D5224000E;
	Wed, 20 Nov 2024 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732115455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CklBazQP5A5pZuk1y+z1sBgv58p1T7UzkOjyvbfe2/8=;
	b=cHg5cQ9HVXb/DWJS980Um5gHccYReRNFQJY+yVOuGnVODzYylzFV76TdfB+p6aZUU8TgYW
	MIR7u2eC5TmemibmXwpspNKQVyzW/4DNCYKaonJXzaPaXKqwAANQIQkKKnLisCxIBalVIJ
	UDk9n1Wl5ndKXmDzRg/Mm6LMvOKqEeJ+/voDur5FadWn5yKX9rysyLxUC3JwmE675BUpO2
	kMEExLgMM0ES4S6HWNHshbl3KDIW+++MTGnUzkIlt4avLDT7iq7geLsJ7L2dSN30qBZ/y8
	2oHwpKBUEX0zrDZTwiwJLddd/JG6EUy3k6m1xTJosO/pHnCHQRnIneXMNj1w+w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 20 Nov 2024 16:10:35 +0100
Subject: [yocto-docs PATCH 2/5] poky.yaml.in: replace inkscape dependency
 by librsvg2-bin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-update-doc-deps-v1-2-50e267ae4123@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
In-Reply-To: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=GDsNX2DQIPl3W4OpLJwxAtPAKWc6DrD8Kja0vc8NuWU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnPfv+TD2TrghXmo7MAlMRfESU6j7jl/BJ9fCIo
 STYdqaA8weJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZz37/gAKCRDRgEFAKaOo
 Nn1rD/sHs2nXAJUERYdRd/juT8uiFayhqQLNjlyzGOm9ssKGfCtwzWdFyLocOV2T5Tyud1tnOLT
 gjmNVWHEbpFDEG1wSGfoijKI0fcthH0GADpZnOsZZ2StHaBDdyhh/jwmI2xUzPOHP5YW3OMl16M
 qK0HHbzFDr+QOMV9ZFIMMvPer//5aa7hsYZl16fmWKNK8OGuCTaY/tVh+a3RkVuUW9GaCEctg6s
 00CvXmdJLk2qMeE+S6rAFAm01W6kmDMVPvo8X88n9OgmTeLijokB2WyIQej5mBJWY+apMrfekX2
 vjWuzslnb7pAYGjdN4mQo+1MP0GtIozBQNHdehrn/wD1ZG+okCc18IB/DEFmTLlkIpbTD5qw2tR
 MxPxplvpTVgAHfyA6/DgL3XQ+oTS23zZCE4idu5Jt/gQ/Aa/K+/vQojB8I/3muiuMa9cotKs2vQ
 tLSDn9e6EK7etC4bMEv44k9govipBoSgGfYwCg6u1NYNWo5Z3+yHGqWQPJrt+byK0l+SdVEzFcu
 iL0/tnoFnUvpEkOn90LmF1upao9G01bVHhEL2SN2Xpb+ZHJud8ySzwunH+tbdbASxl0K8SQyCay
 CzCe8ofxy8kOlofDiYt0jqd3vbYjy17u1iRTwC/BV82tDa8MHGUTrukUUEbRhGDyiMNsWU2mirB
 xxBENAIYYStbSOA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Nov 2024 15:11:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5775

inkscape used to be a requirement to convert SVG images to PNGs/PDFs,
but we replaced it recently by rsvg-convert.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index b840320a89bfadb259d5d9d0e11f951c55e13389..d0c8973db27340838f78f560c01d44fb67771b25 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -62,7 +62,7 @@ UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
 
 UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
   git
-  inkscape
+  librsvg2-bin
   make
   python3-saneyaml
   python3-sphinx-rtd-theme
@@ -120,7 +120,7 @@ FEDORA_HOST_PACKAGES_ESSENTIAL: >-
 FEDORA_HOST_PACKAGES_DOC: >-
   git
   make
-  inkscape
+  librsvg2-tools
   texlive-latex-extra
   sphinx
   python3-saneyaml
@@ -165,7 +165,7 @@ OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
 
 OPENSUSE_HOST_PACKAGES_DOC: >-
   git
-  inkscape
+  rsvg-convert
   make
   python3-pip
   texlive-fncychap
@@ -219,7 +219,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL_CMDS: |-
 
 ALMALINUX_HOST_PACKAGES_DOC: >-
   git
-  inkscape
+  librsvg2-tools
   make
   python3-pip
   texlive-fncychap

-- 
2.46.1


