Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB35CCFA04
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 08:24:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4879.1762331054643633658
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 00:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Z0YkXscu;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 410864E41529
	for <docs@lists.yoctoproject.org>; Wed,  5 Nov 2025 08:24:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16DCA60693;
	Wed,  5 Nov 2025 08:24:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA08310B51983;
	Wed,  5 Nov 2025 09:24:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762331051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rkKb8Z4SINkMCFKQzjviPkR9So2K1Jz1+9KIN3mg4sI=;
	b=Z0YkXscuMi7RrFDWfxV3E6b/kN3KFrltIYDkJ3lbTJUSqlt/WlcCNTeV49lWEpQbh+O5Bw
	mPU3f3S//NiyWKyKQWqJ2/uj2rKx5J2HN7aE2CSdVi1KbWvt5U5IN1zfuKu1RwT/uHbkBW
	ZnDVS85BiuUmZa0ejUf7OmNZ854mqhNqkQULeUdZlguKOsMbLxZqbP+XbLZVBx6ajbDEzT
	qmDZ/3mC4LQDpKH77pNavCA1cy9kw+YzwKI83tyH4C31w7bF8+02t/7SB9O8rcDb+MKiuq
	Xe3LqRZqihbrdqAm3I3wTmFCm7dfhhkABtydLUhw8e4YBhTs6DAYcVZXijuWKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 09:24:10 +0100
Message-Id: <DE0M7VPJ5Z4N.1U2VY09T8LI04@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH v2 4/6] brief-yoctoprojectqs: switch to
 bitbake-setup
References: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
 <20251103-bitbake-setup-v2-4-89fbb14cfbbd@bootlin.com>
 <CANNYZj9T_QkU4YJJncEm6DXgaK6nh0ry-We=8fMTcyzQ_FVq1w@mail.gmail.com>
In-Reply-To: <CANNYZj9T_QkU4YJJncEm6DXgaK6nh0ry-We=8fMTcyzQ_FVq1w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Nov 2025 08:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7987

Hi,

On Tue Nov 4, 2025 at 2:09 PM CET, Alexander Kanavin via lists.yoctoproject=
.org wrote:
> On Mon, 3 Nov 2025 at 17:33, Antonin Godard via lists.yoctoproject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>> +    The current configuration does not allow the ``root`` user to login=
. As this
>> +    can be useful for development, you can enable ``root`` login by ope=
ning the
>> +    :ref:`local.conf <structure-build-conf-local.conf>` file in ``conf/=
`` and
>> +    adding the following statement::
>> +
>> +       EXTRA_IMAGE_FEATURES =3D "allow-empty-password empty-root-passwo=
rd allow-root-login"
>
> The fragment that does this has now landed:
> https://git.openembedded.org/openembedded-core/commit/?id=3De135458415dea=
5bbc4651e05dafe0b6903b65751
> so this can be rewritten in fragment terms. Also you can add a note
> that rephrases the cautions and appropriate use from the fragment
> description/commit.

Perfect! Will update that.

>> +#.  **Find a Layer:** Many hardware layers, or :ref:`BSP layers
>> +    <overview-manual/concepts:bsp layer>` are available. The
>> +    :oe_layerindex:`layer index <>` can be used to find such layers. Th=
is example
>> +    adds the :yocto_git:`meta-yocto-bsp </meta-yocto/tree/meta-yocto-bs=
p>` BSP
>> +    layer.
>
> See a separate email about using raspberry pi instead:
> https://lists.yoctoproject.org/g/docs/message/7984

That convinced me, I will switch to meta-raspberrypi.

> Also this was not addressed?
> https://lists.yoctoproject.org/g/docs/message/7955
> You can add to that that the missing websockets dependency can be
> fulfilled by installing buildtools, with 'bitbake-setup
> install-buildtools'.

Ha, I added the note in the poky-manual-setup document but not in the brief=
.
Well spotted thanks.

> Other than these three issues, the patchset is good!
>
> Alex

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


