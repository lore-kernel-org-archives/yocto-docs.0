Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6F2C5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17473.1786622561056283500
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 05:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=lY6WHAfK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E7B24E411F1
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0812A602B8
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C44011C4DE4B;
	Thu, 13 Aug 2026 14:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9ll4AKAy7Ior0xPl4GhlGpUxtVqntnmnWctTVWGZScY=;
	b=lY6WHAfKB7ZJBq0uM2D3voVxqho9i69yX8wbbcydKRxVEEWCRwQZqf+2jIo9d+aL6YOB0v
	rAUKddwOCsubb1lfs8rVC03QM2Jg2qkGPsPiVb7IhsCOg/JK1cynFlUA+wrtOjzgtadRms
	S64H7AI9J04DMvEIHaA87jL3JWochNrJhF/P2L3Duensg7bbRRpNci0+C25RAF8UIklKE8
	X8dVTm1i1cSIUuwPBWHYW3JidjUIcyvT8hyrrWmTo0STJ5KwUO2Ail4xXm/Z3AenHAnVfu
	KdxFzxicy8X/HXwI6vEuwuOrFfhr86eDALUCe+++4gWbWEt7T7he1JuaTvT1NQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/5] Make the SDK section not specific to the eSDK
Date: Thu, 13 Aug 2026 14:01:39 +0200
Message-ID: <178662237136.775933.12283625553373716089.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
References: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10280

Applied, thanks!

[1/5] sdk-manual/appendix-customizing-standard.rst: use code block for bi=
tbake assignment
      commit: 99768ead76777c12d48f5b00e9d21808c3d2642a
[2/5] sdk-manual/intro.rst: remove a confusing sentence
      commit: 21c43225d6775887ea4b85531afb7c08a550e7b6
[3/5] sdk-manual/intro.rst: link to sysroot term
      commit: 084f1f14cdbb04c5cbb520b29d2aea78c309a624
[4/5] sdk-manual: rename the section to remove "extensible"
      commit: 537f079c14744216cea8cad615df2ea469ef0182
[5/5] sdk-manual/intro.rst: detail differences between standard and exten=
sible sysroots
      commit: 17454b7565f15325b2805717167451a9a13427a7

