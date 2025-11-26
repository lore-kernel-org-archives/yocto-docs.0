Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476FAD10F4F
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12192.1764162022110023945
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Nj047MUT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A311F1A1D73
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A49A60721;
	Wed, 26 Nov 2025 13:00:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C3F1102F08EA;
	Wed, 26 Nov 2025 14:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162020; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0P8Dmx3nyEOT6w+q1GQYC6fFTLWQWAAoVekRsuMrBHE=;
	b=Nj047MUTlSxJntnj3caNqmdvBkMuMb3TBMF3KGbIstkoRJZdHeAwjERDxEv4iUUE02jTDq
	FtEc7NQEMZmoAgCfGpevzhZVApCKcFmw4mXc9eLWgaOQkiGmJDJG4xhW8x2T2mHinSnmm3
	RNVM/FYDO0TtnmOKCt/pVHzfFVC1XMrNGFADRNvSZ8OxfEj9A7k7xSmVFAthBGZjiwdLK1
	JUr3Eebh3U3TYl5G6VAvVVXX0iAVDhJvpeFZ8C6wxkh52wRyTaVztHNo7EStL6cp+rWuyy
	6MEftG5e1yg/lq1JCXVVvAzPVlXWRwzRya0glkScQxKsjsIkR4u8/Y64wTRYlw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual/new-recipe.rst: update code snippet from sed recipe
Date: Wed, 26 Nov 2025 13:51:34 +0100
Message-ID: <176416145934.617433.6595201659029149386.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <6766a20a-e028-7803-2ffe-645f669fd2bc@crashcourse.ca>
References: <6766a20a-e028-7803-2ffe-645f669fd2bc@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8140


On Fri, 31 Oct 2025 09:29:35 -0400, Robert P. J. Day wrote:
> Update the snippet from OE-Core's sed recipe; might as well
> keep up to date.
>=20
>=20

Applied, thanks!

[1/1] dev-manual/new-recipe.rst: update code snippet from sed recipe
      commit: 5fd18b4c49a297b429c14daca4038b6ad438037b

Best regards,
--=20


