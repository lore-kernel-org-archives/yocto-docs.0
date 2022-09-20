Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A582C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 21:05:07 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.2540.1663707897913330150
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 14:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NecmdciC;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id b24so4573654ljk.6
        for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=fSUs5RwXO4eNcSDLosixXPBLbiAzUlc9JlTpr/5JxuA=;
        b=NecmdciCzxQd5uhR/GXSTCWzYo9sAv2vv+3DT/UdmRs/LXY3sBzH0lv7TRtC16xJpK
         Het7gVAOeb13JANpQ8Ofr4ICWpl60szcjcBEM//vymZ+JrP6GKxV7C24List3BI7kbOJ
         66rAWLrS6t2em8NQuWDxmJJ63la9fM1X0CEQ7TOGqN/64BTxfcJ4wacj2crmOn++kmEC
         oFWEOJ738MzBmxaFeVygldlQvS5Yf3MJbk5DjEM9opNT8sxYQohEHQGNOBtNqR4AdRPm
         Trjo4Yz5sXQufDSCPMCTl0Bf5vfdh57A7ntECK2bqGQWKhrCQjbgKCFiD22V/qe/qe/o
         bvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fSUs5RwXO4eNcSDLosixXPBLbiAzUlc9JlTpr/5JxuA=;
        b=8Lx9BB09meI9ZMGE3LaPO/Gd4rEiPg83kl0df5z1w3FmP6eNmiq5gixZo67fRgE5k7
         BRymxBhInKcNkTMqbwHKTBAkhAKlIefK9PR5/TNMqONSXOutt61lvqRaNAa2UP+XAbug
         MqZhRc8YKcTSmReRvFKXtuxpdIDReZcQi3M/8jMdpljreEWYHyluVom48/6WQpWw9SIV
         9vrJvvqTRqH/Yjy7zbG/LppJbjYdLpUygjyE27nxYeldLE6bFfR78pGBhhLHzb5uxnMy
         Y2nXSt6mmZRF6/4J4EyAUkmj6643k8Ejy+5oepEn+Zy68X7GWmLvt4DW95hdAu6I7O4C
         MD1Q==
X-Gm-Message-State: ACrzQf3jmx76DvIKe2mS27LcsYkWDfODhGuMwsNpEUt4+19HnHiMog9h
	f2XRIyULw8GqD1CrymY7L44wbUBm/S7xQzEtMEg=
X-Google-Smtp-Source: 
 AMsMyM4k7ooh65IGhss+ohNJmt0cFgVEop56TN/i70IDvaRtQVU6kRq413dXfc7zUv7XZMRpqowTy3P8IGBYLiumf3g=
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id
 bn7-20020a05651c178700b00261c1ff4407mr7488781ljb.257.1663707895920; Tue, 20
 Sep 2022 14:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-5-alex@linutronix.de>
 <f20e7ca0158e49329b2ed2d7685ef945@axis.com>
 <CANNYZj_mTijA18UCxpTVa9V0k7pPakqvAGBLWBS39UDBCHS8RA@mail.gmail.com>
 <0c6e4dbbf24d4221ba58543cfc48a498@axis.com>
 <CANNYZj-L_TKTv6tniiRw5-d+Nd9LqpKRcHxcbjN4_f3tgN3ahg@mail.gmail.com>
 <eaad5849-ff56-f3d6-9db7-113f4d7ae489@bootlin.com>
 <1716ACEC6B725C1D.5502@lists.yoctoproject.org>
In-Reply-To: <1716ACEC6B725C1D.5502@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Sep 2022 23:04:44 +0200
Message-ID: 
 <CANNYZj-VCcog_w7HTBuwh3zeaVNvDC_MpUMwEVhPp+Md++71zA@mail.gmail.com>
Subject: Re: [docs] [PATCH 5/5] common-tasks.rst: rewrite the section about
 configuration templates
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Alexander Kanavin <alex@linutronix.de>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 21:05:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3192

To clarify, the .templateconf stuff can be brought back, but it must
come with specific explanation about how to use it if it comes from
anything else than poky or oe-core. Which is not possible with current
tooling in core. But Peter is welcome to write that section.

Alex

On Tue, 20 Sept 2022 at 22:54, Alexander Kanavin via
lists.yoctoproject.org <alex.kanavin=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> It=E2=80=99s not a need-for-consensus situation. It=E2=80=99s correcting =
something that should have never been added in the first place.
>
> Alex
>
> On Tue 20. Sep 2022 at 21.46, Michael Opdenacker <michael.opdenacker@boot=
lin.com> wrote:
>>
>> Greetings,
>>
>> On 14.09.22 06:50, Alexander Kanavin wrote:
>> > On Wed, 14 Sept 2022 at 01:59, Peter Kjellerstedt
>> > <peter.kjellerstedt@axis.com> wrote:
>> >> And I think he documented it exactly as it was intended to be used. S=
ee
>> >> Paul Eggleton's comment:
>> >>
>> >>    One way to do it is to set TEMPLATECONF (an environment variable, =
not a
>> >>    bitbake variable) to point to a directory where the custom conf-no=
tes.txt
>> >>    can be found. In a repository this can be set within a .templateco=
nf file -
>> >>    hopefully we document that somewhere as well."
>> > Paul didn't think it through either when he wrote this. Specifically,
>> > .templateconf must be directly next to oe-init-build-env, which means
>> > it cannot simply be 'in a repository'.
>> >
>> > You can't have it both ways: demand that this is kept in the docs, but
>> > without explaining how to actually make it work (using standard
>> > tooling). Also, your setup
>> > is unnecessarily complicated to begin with: just skip the template
>> > assembly altogether, and write directly to build/conf. Eventually
>> > you'll be able to do it in a structured, supported
>> > way with fragments, which is what we should *actually* be talking abou=
t.
>>
>>
>> It's obvious we don't have a consensus yet here.
>> Can anyone else jump in and contribute to this discussion?
>>
>> The other patches in this series have been merged into master-next.
>>
>> Thanks in advance
>> Michael.
>>
>> --
>> Michael Opdenacker, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3191): https://lists.yoctoproject.org/g/docs/message/=
3191
> Mute This Topic: https://lists.yoctoproject.org/mt/93615912/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gm=
ail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

