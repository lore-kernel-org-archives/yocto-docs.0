Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F5ECD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 07:54:52 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3673.1779090875362837700
 for <docs@lists.yoctoproject.org>;
 Mon, 18 May 2026 00:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=En5DsoTu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1C973C2B9E3
	for <docs@lists.yoctoproject.org>; Mon, 18 May 2026 07:55:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FBC9602B8;
	Mon, 18 May 2026 07:54:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F2CC11AF8EDE;
	Mon, 18 May 2026 09:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779090872; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UIsSi+UnTDkPFPm7J7GEie2pMMuJtywq6TotswKAe8w=;
	b=En5DsoTuKxm76kFtmRAuSdDQbeNufZFbE6hw3fa4enfOPJA6shGJSwbetwcc03nkbjjeog
	ayKyd6Bctd2h+Ti8TNoGfthvOWedDygBao1QXtY35qMXbQD/iAzkUf0nuy81KSwJHEAYhF
	Obmbk/b3AUMS/Ce0bPaHOwzEVHjS8c5kgSu0GA+5BYcQ9CcAVi/ch7ZBdSsegY4rlG3sn8
	e4/L096Fd1V+Z26YVY6SPy5qYnmR3DuoglfKbi05iifsEtWZB5Dovy9LO0jVlOk1dhxP5Y
	fxDpSMowSOZCIzgLTkT1aQ8Ggdm//aBAh9B3bLad3vhNfJxpa02KGHv66KH+ZA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 09:54:31 +0200
Message-Id: <DILN2V6TUL4O.ZILK4R1L1STG@bootlin.com>
Subject: Re: [docs] [PATCH 00/11] fix typos, grammar, consistency, missing
 word, and broken links
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <foss@0leil.net>, <docs@lists.yoctoproject.org>
References: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
In-Reply-To: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 May 2026 07:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9474

Hi,

On Fri May 8, 2026 at 6:59 PM CEST, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Fix a few mistakes/oversight I stumbled upon while reviewing patches too
> late :)
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Quentin Schulz (11):
>       migration-guides: fix https:// prefix missing in anonymous referenc=
e
>       ref-manual: classes: fix https:// prefix missing in anonymous refer=
ence
>       migration-guides: migration-6.0: reword meta-poky templates removal
>       migration-guides: migration-6.0: fix grammar and missing word
>       migration-guide: migration-6.0: fix typos in cve-check removal
>       migration-guides: release-notes-6.0: fix typo in documentation chan=
ges
>       ref-manual: classes: add missing "task" after create_recipe_sbom
>       ref-manual: fix "include to" grammar for UKI_DEVICETREE
>       ref-manual: fragments: fix style inconsistencies
>       ref-manual: variables: add hyphen to "space separated"
>       ref-manual: variables: add hyphen to "space separated" and "auto ge=
nerated"
>
>  documentation/migration-guides/migration-6.0.rst     | 13 +++++--------
>  documentation/migration-guides/release-notes-6.0.rst |  4 ++--
>  documentation/ref-manual/classes.rst                 |  8 ++++----
>  documentation/ref-manual/fragments.rst               |  6 +++---
>  documentation/ref-manual/variables.rst               |  8 ++++----
>  5 files changed, 18 insertions(+), 21 deletions(-)
> ---
> base-commit: 6b78593bed7174245fd7f6861263c69a3c439a74
> change-id: 20260508-misc-typo-20260508-9612c7595951
>
> Best regards,
> -- =20
> Quentin Schulz <quentin.schulz@cherry.de>

Thanks, this helps a lot!

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Antonin

