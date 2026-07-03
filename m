Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73ECCC44509
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90620.1783079107283872512
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=YVHNb7/4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 92D2E4E40C66
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61F8F60300;
	Fri,  3 Jul 2026 11:45:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A236104C94A8;
	Fri,  3 Jul 2026 13:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qYDBDWMbHkh8CuOdW5wERUgxSdssANGjvLHplkLS9d8=;
	b=YVHNb7/4LspfEELJToFfUiT2sCIJfuUjE1f4ASBS4EfrfQd5+z9un2JTIJGUAlM7q6huWg
	nacFakEbbj56VA6MYemSh4gYSDFWIjoXc/AILCQkh/OmpD6AE4X8te8z2O5ySLYAlhRAaJ
	W0f154aAtleCQe33cjYrOfrnwAewxlETh4bBUGAjGynLlS/yAev6lyLndCxQydjS8B2u3E
	uS2KOiNumX8C01XTC59a4cfQKFB/9iVleeZ3MJwkRoRkqZP0+5hcMGbO0LBOqlfVl2T3VT
	Y2HBsbphel68AeVFmXO7iyXYR9zUTBzxb6OweSFJ7HfgmiCvltTxWc3CE+ryqQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: render first mention of DEPLOY_DIR as a :term:
Date: Fri,  3 Jul 2026 13:43:41 +0200
Message-ID: <178307887424.248663.1394630674213162204.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <5c64d001-3798-8c3e-447a-2d3a3615dbcc@crashcourse.ca>
References: <5c64d001-3798-8c3e-447a-2d3a3615dbcc@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10028

Applied, thanks!

[1/1] ref-manual: render first mention of DEPLOY_DIR as a :term:
      commit: 0992b8a25f582edb9053df0560274d908526de7b

