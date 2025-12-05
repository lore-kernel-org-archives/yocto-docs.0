Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0EAD32D98
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 14:51:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7371.1764946298906411445
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 06:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kJ+df2u0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A6F9DC1964B
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 236B0606AC
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 856F7102F0A9C;
	Fri,  5 Dec 2025 15:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764946296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/XXhgfMdf9AUqWtBK4xRnZ3CpJrpWVy4G2vMMkilvFk=;
	b=kJ+df2u0AmOoFgvPLxN0yAG0cRTqFOmMQRlDUqIvFghqpcs/IyZFkgYZ7VSvRsb31DMpGa
	NY5xuXXqNI8r9beH8FNJ8tnqj0pWMYNfZdOsUGvdkQ9Y5vBAetVXZ50FhNErPF33m5BBq/
	BL/xPVezx1F4lpSu17YiSxq65tBbcNdooi+xRCGoAefAFZ1H84TJfOTXmuXSBr2RbX5reo
	tFxcwAutKdx9s9gH5V+4sxnoWxqncOazk1qJYL4lbn+D+rBOW1R9LQb73B8/48eXcnyYx5
	+aaslKitTmKC/s71RoQ8+uDIMVV6ihR+qr5vjVEOSpbs52kKdRli5inLnrkm3w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Dec 2025 15:51:25 +0100
Subject: [PATCH 2/5] Makefile: fix rsvg-convert --format capitalization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-build-docs-container-tlmgr-v1-2-de30623e664d@bootlin.com>
References: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
In-Reply-To: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=d55uiSyS1TQ3i6uhiJla/F4j6h9L9rcgAYwW9aK5wcg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMvF09iDn05eDMn4w+L1YulHwDUKv4T9MY22gl
 aK1xJsiMxeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTLxdAAKCRDRgEFAKaOo
 NpT7EACNDUfRe7ABqRZLWmTyax1ye1/1SMokho+YkrAzLSbbBSFbNd052RxxMDZtPX41zCHht3K
 oDfGU1oQ7nLvBgSF71zZH7tCh6hqShgL4GFY3i7/ASgfrh+e3WWzY90/om/MdFpEUvSzv3JFp1q
 n0bDjfdvHOBvkkpBqMLHnETtR4EelHflxk/dDVgUaw/ShjNbp19+zSR0ngskTFzzGJ9Ehr4WCwg
 7BzkboGfQslQ0MYjphkU2hiri7c0aTmogl/MakiubX2Tbm+NcP4GvGYDg+xZAN5IuwvK6UbfP0h
 4qHhkZ4H2LgclWXfC8Vj1Kre+YrEXhCi6le+lwit+TN0uaOp0SlLhFqaw/8Fv2ETFfvbalZhiCO
 0D2t8ax1XI4jH1N5puO33cLBXfepgAXAC87/o9s7llhxhCJaGK7mCINMisMyTx1NhU9mDxmUw4F
 W/uBsapiOaU7xUcxNItMoGxhTeoQb3JAuTqFYxwWa3yNQo1zb25NJvbrLi83xfT/FtqtQQNBEDK
 gjEsK2hNPEYhRm8D29JHeR0Jc5DfiEmE2JqI8fIVYWCzVIP/dFD1OIzqoZYdxdMPJylRPySabfb
 YCyeYCP8ngFP8INtxzjg4yAQKOfG017sf3H/DAVFGQCOcSQAtz+Tod9iPn1aljE5Mrd+BJUTomv
 wWz/wbScEYtZdig==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Dec 2025 14:51:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8229

On some versions of rsvg-convert, capitalized formats are unknown.

For example on CentOS Stream 9:

  $ rsvg-convert --format=Png --output=ref-manual/svg/releases.png ref-manual/svg/releases.svg
  Unknown output format.

While the same command with "png" runs fine.

On Ubuntu 22.04, both are accepted.

Switch to the un-capitalized options, compatible with all versions.

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


