Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066F6CAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:14:30 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.12504.1758874465155953639
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 01:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uhb05Sok;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-85b94fe19e2so162808685a.3
        for <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758874464; x=1759479264; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8tblGVr9JI8M9uUTy2VzFFoXwjXBDtJe69bCG67ptUk=;
        b=Uhb05SokeEz0fsMccgj01f48QpCDaNIlmQWwGRFqV2oNd1mecWWQmYcQB2VXONaBmA
         b09L+LtCtIzUlf6q+d9wto/iBk0eJCm8duI4ohf5A8drufHk+Q8ETg5sF4WsBAcYUfxz
         iOjJOzDFyoNt6yF0MP4gXxcwsyf74BTngqv0QzSLfVgj4U42TlJeE6ahT+QWqsBbyYnL
         nO1d5kvHa7OHXwvNC2y44+KoDZawOPlNsr2F7ffJMEpVJ0LJpIZBbFGFUN0REaKuIwAw
         lecVxf1DEZhKoFEbMGrmtMtjDQMyCxVPfWRTLJIKkcbnVseLT/2JmCpsvp6GEY0L1Zio
         GzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758874464; x=1759479264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tblGVr9JI8M9uUTy2VzFFoXwjXBDtJe69bCG67ptUk=;
        b=t6gW4sCzzeLqyfstbql3ESOV2ssIl+oynGP3XQyUzEBuPuM3vMxqsg73Aq3wjSU4of
         +v7wNeE9VAIrwZolZqzZu63+lZ+DSVZD8rcp2w+qDqGqj9RwltZBUON7sTwNmwVyHFUe
         1KokT2PEf9ZmeIcMchJ65wMuplF6iGXSZq2723/wkcEATpw2X3eJpyF9u1kl6RHcfca2
         SzmH2rIOOsJxudMNekb4dYxHaA87A4ceUoceRTf8f5jr/agDwG0wpdhZV2CyP6sIanyy
         Mtj/nil0HM0HXDdMjhOO7up42iUId3i5/6LtsNUG+gqUCWsEjFTwPKgiN/P78v1/Rh5H
         9WMg==
X-Gm-Message-State: AOJu0YwfaITN2yx9uwBMDGxIrvfNx293yRAQTGcF7x/toTYZ2SyyYXL7
	shuRC15qve4RjS4OEWwVB7nR1URlQo9HpRiPdT1BU6OGtiQ5BSRsWVjStSuBTen5FQ2tWP+Ingc
	iFC2kCb0l5zbckjHGItxbKuD8x5H4WKY=
X-Gm-Gg: ASbGncuX41DWM4m1iYxJB6yLyiOdmub0IxkPFOnRkCxC3FPjIVTzELXGPe1tkCpda7c
	8f9vgTTRySx9CBm4AlGRyswp9xbPrMRsZ3vNnf7Mv4nLuGLoZY4OE6pVRPWLZr6wnkGwQ8zl0i8
	n50qGJYDdGc2Wj/o8X9wRLrzQ3PrA2+eSx4bqr45C0JeWXnbkgj85CkhItYuQMyHPR2pcJ/nzVR
	mEVdVrDMv16ymnlH0U/J3a4EARU/Ox4hme5qCR5MKIKVuXcZAGzjVrYFSW66wzPNSDtKf997QKu
	DPOXur/+zszBlMM=
X-Google-Smtp-Source: AGHT+IFDAAdqCrtlgA0rVQKc/qTWlcGYG84kKftOZGAaZKHaQQrqzGx+Un3+sgyhfS/GGMolhOz2vu3+/nVQlw30zWM=
X-Received: by 2002:a05:6214:2389:b0:7f6:fcff:923b with SMTP id
 6a1803df08f44-7fc3bf7db90mr89484556d6.43.1758874463999; Fri, 26 Sep 2025
 01:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-fragments-v1-0-c9f747361fb2@bootlin.com>
 <20250925-fragments-v1-2-c9f747361fb2@bootlin.com> <CANNYZj8jYz3vCRpyCqL5MFqGuMmWhdiw8kn7ozrinyRDgE9pNw@mail.gmail.com>
 <DD1X469V0SJH.6I9PBV2QL3WJ@bootlin.com>
In-Reply-To: <DD1X469V0SJH.6I9PBV2QL3WJ@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Sep 2025 10:14:12 +0200
X-Gm-Features: AS18NWAMj4EShkPxIDkt28-Jn22Mk-XlpPGBZjPHmu1ukz3aHutHwW7Ov7qKBuE
Message-ID: <CANNYZj_PjTKWL+vEEJnxu2B09mVc6+GV6JB2nMOiYAHxFgrV=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add documentation on fragments
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 08:14:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7610

On Thu, 25 Sept 2025 at 15:33, Antonin Godard
<antonin.godard@bootlin.com> wrote:
> > I would try to describe adding built-in fragments as well.
>
> I tried but failed to have something consistent yesterday.
>
> Setting it from a distro configuration file, or any configuration file that
> comes after the addfragments call in bitbake.conf does not work in my
> experience. Moving the addfragments call after the distro file include is not
> possible as the the distro/ builtin fragment sets the DISTRO (chicken and egg
> problem :)).
>
> There are multiple solutions:
>
> - Telling users to define their custom builtin fragments in local.conf,
>   auto.conf, site.conf, or any file that comes before the addfragments call.
>   This is not desirable because this means we don't encourage to share
>   configurations.
>
> - Telling users to defines their builtin fragments in layer.conf. This works,
>   but this means layers can "pollute" the existing builtin fragments by
>   overriding them when added to bblayers.conf. Other built-in fragments that have
>   different names (not machine/ or distro/) is fine I guess, because
>   just declaring a fragment as available does not affect the build.
>
>   Maybe this could be reasonable, but we enforce layer maintainers to _not_
>   override core built-in fragments (yocto-check-layer test, maybe?)
>
> - One idea I had was to introduce an `addbuiltinfragments FRAGMENTS_BUILTIN`
>   directive. This way we handle standard and built-in fragments separately.
>   This turns out to be difficult as well, as standard and built-in fragments
>   are mixed in together in OE_FRAGMENTS.
>
> I feel like our best option is option 2 here. What do you think? Other ideas
> maybe?

Right, yes, thanks for thinking it through and writing it down, and I
agree with this. There indeed doesn't seem to be an easy solution. On
the other hand, built-in fragments are intended for setting something
really common and well known, there's currently DISTRO/MACHINE, but I
can also imagine things like TCLIBC / TOOLCHAIN / INIT_MANAGER and so
on. Those are not particularly controversial to just add to the
existing builtin list in oecore's meta/conf/bitbake.conf. Perhaps you
could somehow express this, without overwhelming the reader with the
above technicalities.

> > These are again defined through a parameter to addfragments, so it
> > would be good to reference that.
>
> My initial approach was to document this as if a user did not need to have
> custom addfragments calls and all that was required was to place fragment files
> in the good spot in their layer, and modify OE_FRAGMENTS_BUILTIN as needed
> (turns the second use case is not that easy in the end).
>
> For example, we don't make the location of machine configurations configurable
> AFAIK - why would changing the location of fragments be needed for users of OE?
>
> But I can add references to this command, I just don't think we should emphasize
> too much on it.

Yes, I don't have a strong opinion here. If you feel that this would
overwhelm the reader with unnecessary implementation details, that's
fine. There's a balance to be struck here, so that people that want to
know how things really work get a hint on where to look for it.

Alex

