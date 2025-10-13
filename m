Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B51CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 07:08:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.37345.1760339311376476366
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 00:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lNevOEaV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 606954E4104F
	for <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:08:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26A78606C6;
	Mon, 13 Oct 2025 07:08:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B13F102F2232;
	Mon, 13 Oct 2025 09:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760339308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9XYp5oHYM2CNW24KFg7DHvsNyNaAycfoYE++KzPXYA4=;
	b=lNevOEaVuuveaMEMm0fAkgguVvA9q8pJsOxDC+JOGtpjm+8ycSsAR9nwPc/e4JNMFISnls
	T8vMCrMwRFhSMMHu3uTql55wgpSTziNttWcdSqwvyJ6n5O/V42QvE+ipfwizFcad9wl3uQ
	l1UU40sAQ1Kl96PuUDKUXQ+NiL8SjNLfuyGjQ7a5cnkptRClDKsgBGFdru05Mfv3hzgy0Z
	GNKGGI6GztlKEYZ+pHsbukTRrlXr67PBb/usCS0vHTEOJ9zsJNAtTLyLY84GYKoEJ3SOlq
	PQ3NbE45/5XGtgKymifa4Vu3ycYVH8rnjZuGwWqudPvmXTkozSOXObqCtGgP0Q==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 09:08:26 +0200
Message-Id: <DDH07DARB8NA.N8W9T8G416WW@bootlin.com>
Subject: Re: [docs] [PATCH] tools/build-docs-container: use CONTAINERCMD to
 append args
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20251009-fix-build-docs-container-args-v1-1-169ce4248462@bootlin.com> <df5d5e00-f950-4e52-a6fd-b7d1cd3822b6@cherry.de>
In-Reply-To: <df5d5e00-f950-4e52-a6fd-b7d1cd3822b6@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:08:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7687

On Thu Oct 9, 2025 at 2:32 PM CEST, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
> On 10/9/25 12:05 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> What we have is OCI =3D $(which $CONTAINERCMD) =3D /usr/bin/{docker,podm=
an}.
>> So we never pass these if conditions. Compare against CONTAINERCMD inste=
ad.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> Nope, this won't work if you call the script with docker but run with=20
> podman. This would be the case if you have podman-docker package=20
> installed on fedora for example, c.f.=20
> https://packages.fedoraproject.org/pkgs/podman/podman-docker/.

Oh I see... I did not guess that.

I'll send a v2.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


