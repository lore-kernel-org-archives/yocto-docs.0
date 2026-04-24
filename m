Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE2FFC0379
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:44:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16521.1777020240758904687
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=LA3rS6uM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 262841A33E2
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:43:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBA08604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:43:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5AA791072073E;
	Fri, 24 Apr 2026 10:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777020238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cO15m/D7nuR6k5EnOGS16Mko9oSSceZEcQlzzB/0FoY=;
	b=LA3rS6uMo3wfogeEXgdj5K+ZApHBDsRHOEFFB0i+MjGNlmyLMMC/eF1kvsFOvdhl6GwSeJ
	NFuvRPr8VbTADKk4tcXqmiBaTPGVTHXCA62WIk+Zc360akiVuA4Bcdp/e9WQExxH4/zmaH
	DlWUcseAW28445bcFbaGGqkDtO4h0iDkTzBTFHjtyCs26fRPEyaolCOZLxlHbgREUJVjKq
	zu1lFT+zOkj1kWP4EupUvvuoY/uZSMqYexgaWcyf/6dfAumpQHqLJ451lUqyjXWngcxyEU
	vBbwg5Bg9alYrXBC/hrSfQ+Q5hTdb7KsHptJ8bnCXbmWolgde+X6b/1UdZlhEg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] dev-manual/new-recipe.rst: rework Unpacking Code section
Date: Fri, 24 Apr 2026 10:42:35 +0200
Message-ID: <177702011526.92831.3330502511677891922.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416-unpacking-code-v1-1-19bc7d4fd7ee@bootlin.com>
References: <20260416-unpacking-code-v1-1-19bc7d4fd7ee@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9358

Applied, thanks!

[1/1] dev-manual/new-recipe.rst: rework Unpacking Code section
      commit: 7a95f8900a46d5179f1e1d1b754c0852076df3b5

