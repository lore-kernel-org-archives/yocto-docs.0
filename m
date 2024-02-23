Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4EAC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:22:47 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.9298.1708690959799899738
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Feb 2024 04:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=akFDDIDf;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d180d6bd32so10927461fa.1
        for <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 04:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708690958; x=1709295758; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELQfsfrhP/FXon6b0QekXBcUqBVuoyndsoePVZd0ezM=;
        b=akFDDIDfvSyZm9o4ALLHIuuMDkF//IK+hJ6tqHBG4liAsuu2NcLvu+aY65l/TwCSLo
         sScVGXh1lzl72B5GrOqwUXImzCo66Lg7zc60rsXP5rbllJ81OWKhdaKuT6QOj31S5/EB
         jxJWSQu2y5jmieEslRse0cUJmfUPaEtWD2b9E/Kg70kGrDu+7DEqKN4qkssrxH1YuP/b
         H9HDC9QdmEd4P3EfFZY6ZfO9qy2tIT6wEB9sU/BMvOXaMFR6xXZsO2SD+GrH2cFmFA7O
         a4wZS8cHJgJm0uixmm/4Fd0HHHSYoQ2CPa5213BMxWmsC0kvFt6Lq+SVHnf0qHBOvaUz
         rA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708690958; x=1709295758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELQfsfrhP/FXon6b0QekXBcUqBVuoyndsoePVZd0ezM=;
        b=H/U4jIBbRSL991iROrwxZaE755yzuhjoDbWVqUE8Wq76oL/8pvi2ihVvAAwycOnhQI
         FlhnqTCxpcGq6R5YP5SVCm99V852ImtPSvt7A6R4zxqmGp5VmfzD4Pn50XL1dP/sdJYL
         YBIkwXYbtIMwjQUrQdT9c/RVsryoKiVDm00kxw6a7G/j/4s25I1tOqbQQ76NJT13afP0
         45C7NZWjhdx3prdpIClZjQEqGuX9m9kHifQxJODeDgpC2LLTow8kdueYBc1bzCMyk6iI
         nNJdsFi6ZBaInRJMyNBSm/tYCRV5czrEQM63fOmw8C8ElAqH3Rcdx/qROaazCcZCHkRZ
         y6GA==
X-Gm-Message-State: AOJu0Yyhlu+gF6K5r4d/TG4YAs+JFcG6t0nFMyCfO4k6YrxEy7UK9D1z
	rHHsWM+aBeyB0ybkw3FtZblHOOOYKynA0YWvc3luleOmI77DTHWn1+9mpmvFXKSXBj4s6DSppq/
	8R/lyJF51d9MEix4sQMofrzQo/0A=
X-Google-Smtp-Source: AGHT+IEskNP1pvuyCwuZxgryyRnkWhDJbmhT7OftQAqHQMvEzrGcQ32KOl8e7HWK3yMPtkTXNhyYBVq5KdiZgw0SKeg=
X-Received: by 2002:a2e:9e50:0:b0:2d2:3451:52de with SMTP id
 g16-20020a2e9e50000000b002d2345152demr1224526ljk.12.1708690957685; Fri, 23
 Feb 2024 04:22:37 -0800 (PST)
MIME-Version: 1.0
References: <CAE=EZ9y6s=x3X7nbp-QCysJZ0Uc=RjpdrwKzCAAWih_toySf4Q@mail.gmail.com>
In-Reply-To: <CAE=EZ9y6s=x3X7nbp-QCysJZ0Uc=RjpdrwKzCAAWih_toySf4Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Feb 2024 13:22:24 +0100
Message-ID: <CANNYZj-yE8y7Lnx8sLX4tMK=Ws0-QtEgHe8j0uubmKRDBn2zuw@mail.gmail.com>
Subject: Re: [docs] Wrong documentation about BBLAYERS?
To: erik.burghardt@kiwigrid.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 12:22:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4864

Hello Erik,

this doesn't answer your question directly, but there's been a recent
thread on oe-architecture list where these matters were clarified, and
I suggest you read all 23 mails in it:
https://lists.openembedded.org/g/openembedded-architecture/topic/crazy_prop=
osal_drop/104180197

Perhaps this will make it clearer for you if the documentation needs
to be adjusted so it reflects what the code is doing better. Going
forward, we'd still like to remove layer priorities, and make it all
simpler.

Alex
On Fri, 23 Feb 2024 at 13:12, Erik Burghardt via
lists.yoctoproject.org
<erik.burghardt=3Dkiwigrid.com@lists.yoctoproject.org> wrote:
> I'm a beginner in terms of working with the Yocto Project.
> As far as I see it, one huge feature of the Yocto Project is how layers o=
verride each other. Even though I think everyone will agree with that, how =
this works is not prominently featured in the documentation and not obvious=
. That is why I wanted to provide a patch for https://docs.yoctoproject.org=
/ref-manual/variables.html#term-BBLAYERS, clarifying that layers that are o=
n the top in the BBLAYERS override layers that are beyond them (when BBFILE=
_PRIORITY is the same).
> Before I wrote the patch, I searched the entire documentation for mention=
s of BBLAYERS and found the following in https://docs.yoctoproject.org/bsp-=
guide/bsp.html#bsp-layers:
> "NOTE: Ordering and BBFILE_PRIORITY for the layers listed in BBLAYERS mat=
ter. For example, if multiple layers define a machine configuration, the Op=
enEmbedded build system uses the last layer searched given similar layer pr=
iorities. The build system works from the top-down through the layers liste=
d in BBLAYERS."
>
> That was confusing for me, because as far as I read this note, BBLAYERS w=
orks like this:
> BBLAYERS ?=3D " \
>   ${TOPDIR}/../sources/poky/meta \
>   ${TOPDIR}/../sources/poky/meta-poky \"
> A distro.conf in "meta-poky" will override a distro.conf in "meta". What =
I experience in my project though, is that it is the other way around. Now =
I don't know if the documentation needs a change, if I'm reading the docume=
ntation wrong or if there is some kind of bug in my build.
>
> I would love to hear your thoughts, thank you

