Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEC8E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 12:23:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.12809.1733315022841064919
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 04:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TIm9ybXk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 648EA1BF20B;
	Wed,  4 Dec 2024 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733315021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fiirBHE976kPrJWytAKAKwI+YZK5yDE/x5/x2fvqP2c=;
	b=TIm9ybXki2Y0FEMqDwYW9MI7iSzzoSNIPLCZfPqyFwd5RaF1Z1HdzFKRf4UOQHHkOanMnb
	BUedr9NmKEvVgzBIGJGaTOuWhxiEkanRFRQ3TzPyLvZOqC1Kam1iYXgQTbb38Hme4TXJy7
	VBumwh9Xd7ZIZZL72fuQTG4vvdZBiDOTcKp8bQZbtIIexcHqJx6t2XApyozHt9MDdQ5IZ7
	LwUBnupzFXbFjHJipxlNtsLxi/Hul3WpV4nhHCsDaLKsduwlBUotGiX09JVQOxhbf25ASd
	KGqgqFdDtOvYfL/UohYgvdsc18LPeZtO2r5zHN3sgD/H2XNN5esm9hDHJqXbLA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 04 Dec 2024 13:23:12 +0100
Subject: [yocto-docs PATCH v2 4/6] system-requirements: update list of
 supported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-update-doc-deps-v2-4-1d9b4063476f@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
In-Reply-To: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7UsRjGMkvpS/tbPOAhfNFKzdbnlEACzzxBF/WaVSkOs=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnUEnLSuw2nu/PwSskg9ZjjQn5BIGoOskSdQdEg
 SrwRc1AcKiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1BJywAKCRDRgEFAKaOo
 NuAYD/92UI5FKaxxk6Lly8dvazlMr+CxHApp9f1ASBR1ETod1CZy4toRfDEwx9gqmMA2P4RHom8
 gtliyQYpyHxh9o71chWRwBSClSBWTEZ38g/l7yHXHtb9XvUg5Ye6vpgsI+/qPtpW2OidGtLY1Wk
 wXKaUTvXnSX9PHWUqZLJk0DxPySfI3kWW6EbWEy4s+md2mTyhWSuze4/iB7XM54citQNkykQ8cs
 RgoELtPiMAdCWQA0xlEzU97qDb3fSmjMbk/vwxspKmYVZQhFZFIEr/2H/LQ1GHao9X1/SVMHFAr
 +l/8xoPFp/MohpA4k2W8stBg1O4sGTEbLTCqFOT3/zWdGC+v1DgMsJY6b3rwihV41OVQDbk+c+c
 LgH/jYDmURLVzRLp/pVUfld0OfCS1F4gnwHxLimRX3Kca9CxTHCFwHZ6cwICkHebcCN1XkZuffn
 9rq2C+kRKyKhEgN+ukbHC7YsEGe33VKsljXUF2XL+deHjgEJYgTgwg6f/fDLUm4cKB2lOczcoPJ
 rlSSb8QqezBDoME6vIe4FUuNQmzGbs8n4opYhSxZXQoe4XkCIGItMw8XTWdtUQHlGF4TqO7tEjy
 nzPSmxP8K4ln0iV4pU+ShrA0WuPpUSF2jx/Ue0anirvZN1khtZ7qH/OnaZOcWsBWigZDGoReoQR
 0S6Dt1iYrXCvAbg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 12:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5885

To match the list in meta-poky/conf/distro/poky.conf.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 17ad1b741a0b92f218860d22bbc4b0927b73b865..7c7f518d9fe1f68e5b014cf31e59dc9bbe322e4c 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -62,10 +62,14 @@ supported on the following distributions:
 
 -  Ubuntu 22.04 (LTS)
 
+-  Ubuntu 24.04 (LTS)
+
 -  Fedora 38
 
 -  Fedora 39
 
+-  Fedora 40
+
 -  CentOS Stream 8
 
 -  Debian GNU/Linux 11 (Bullseye)
@@ -74,6 +78,10 @@ supported on the following distributions:
 
 -  OpenSUSE Leap 15.4
 
+-  OpenSUSE Leap 15.5
+
+-  OpenSUSE Leap 15.6
+
 -  AlmaLinux 8
 
 -  AlmaLinux 9

-- 
2.46.1


