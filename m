Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C41D29FB1
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:48:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.40794.1730879325380401546
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 23:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fkou3Avv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BDC2FF805;
	Wed,  6 Nov 2024 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730879323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lqx39oGGj96lrf/l1G9vxDpfCr/Lorricv0rhMt0qYI=;
	b=fkou3AvvNNuA0Vkku+wSlehJNXWQ6woZBR7VjCdTVW1Y4hWZwExLxece46TSBtGfadKc88
	U3KfAN3gM5viU7huttG/Owt28uYNkMTdApyG2mnlBj0AyxYZIoEZDDDGhomR9AXGiS5emG
	Frwf5Ht+cN1j98RYqNrId9GwMD8a+19GJHqjuQBdjtzm3QsU4PM/NxttEg/zvJ087e9Jph
	HgwlmMm/xrS+7tXs9KTXkx5GQLTB865UVE5Jw9MCB5sslqntwCE2pWhBeEg08V1C9Ywi/S
	ouZtjtdYqKll1oZStwB7W0qPuMBBF7wZRLfi1wEqT4BYGbV3WhRILzQqPvcrIQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 06 Nov 2024 08:48:23 +0100
Subject: [PATCH 1/5] doc: Makefile: remove inkscape, replace by
 rsvg-convert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-pdf-xetex-v1-1-044eab7e77d3@bootlin.com>
References: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
In-Reply-To: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Pqv6ryg0XyhhzfHm7j3qPI/tbK8xVykjngpk2jhkMls=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnKx9afLaHoS60+DLx2Qk13CfVpZP0rf6WLgVLQ
 gF3IrDI38uJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZysfWgAKCRDRgEFAKaOo
 Ni6sD/9ON/jiFwfQaERORcL/Ob2OjaOqskIUNgEo+apGq3H9XckGxYfUdPpOQVgjTOFTLQ/mHzT
 DniQYZRb7gmv7T+8ebKj61hwZlp3Z0LBv8Xhm64IMY5HRhmN8E/UtPfQAp7KihNDvhfcb/7IozM
 XVsk6njonTc+XqWoFcs+SXSSk3AYHcz9T5oEeZg+CRb6Y17rQCezb45mYepmDnwIMTIFpyARFpR
 CLGdBEIbW9rybSHxkVe6mfC/lavLNQaE0PWdTOqasHSW2B7wSAUsxCj6RVzTe/CVksB7e6mSai3
 iBwPPHkGUNVNMiyEqdWhhNZXFUqMrwBCgxrB7FCeQ3WB/9jimJSSYXGFxNAEMudlxQ+4G1Y/iom
 dwWevHhqnAOfoKH0D4ZCkeSTW0Wd142Yo6FwhkF8TvVJ9T/44DMHLxeBWWuK2EnDCSwvfuAuXx1
 avWlU/VJIROMIIC2nf4/H1vdTjoIAd3A+jeLg00/Pn6UCjplKqa16OMIr5NFNVlq9cmT1xKRxv9
 vSiTLD1zxS11fpZUvHBSEzhKIKfSC7/KW7yt6ez7nAxric9W2kXetu2Og9sJgYP6wFvNB/8yvta
 5XWWNK2UUZKWVzuQC7npsfFgqzHm/hTZR/+rElgsZGGRThVutLJOsMw4/OcC+BXs7LdxNxlxJ53
 p1sm0dgmAfPnruQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 07:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5687

Remove inkscape as it is not part of meta/, and use librsvg so we can
ship it in a buildtools tarball for the autobuilder workers.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 189bd1dfac69d3b3185aa3a2ff7c212084ae280b..d0333de2cb84ba648a64e51fd3711113788d6714 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -12,8 +12,8 @@ SOURCEDIR     = .
 IMAGEDIRS     = */svg
 BUILDDIR      = _build
 DESTDIR       = final
-SVG2PNG       = inkscape
-SVG2PDF       = inkscape
+SVG2PNG       = rsvg-convert
+SVG2PDF       = rsvg-convert
 
 ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi),0)
 $(error "The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed")
@@ -40,11 +40,11 @@ PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCED
 
 # Pattern rule for converting SVG to PDF
 %.pdf : %.svg
-	$(SVG2PDF) --export-filename=$@ $<
+	$(SVG2PDF) --format=Pdf --output=$@ $<
 
 # Pattern rule for converting SVG to PNG
 %.png : %.svg
-	$(SVG2PNG) --export-filename=$@ $<
+	$(SVG2PNG) --format=Png --output=$@ $<
 
 clean:
 	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js releases.rst

-- 
2.46.1


