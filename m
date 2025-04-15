Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CF7C369B4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 12:07:43 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.18334.1744718862607843183
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 05:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLkW9BSp;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-310447fe59aso47236751fa.0
        for <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 05:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744718860; x=1745323660; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cM9+9zg6WDU+B1m1x2KvL+94pqENdSwl2GbO58kj7ek=;
        b=HLkW9BSphgK+uaM9O9t+oTnTh28yL1pB6VtYDbWtbMrid6GfjGk9Q6FvDMeMojnCNh
         J2phkt7o0PjQIctO9+BA/OI/ZpxPvXQwHfjNp1wQz8NmFUzA5+dPCM3O9sDp9wZrino7
         7jfyOeJvwyJQSfVML2HRarQLpSIMGzYL7lg9xkjK8bwDiOxydFSav9Tozk6/lCC4549V
         2JRi1M0Fw6C0TlvOTsZqM81Ma2rTdxKDPhEwOLIOi0ylxTED0salnvCkSRyoGXoTGD0E
         tKBpOJfhu/liNDVLXM3eggEGxX/mlDkTNLbRDijKHiM/A/xdh/oI4Do9euH9K2TbEJot
         clRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718860; x=1745323660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cM9+9zg6WDU+B1m1x2KvL+94pqENdSwl2GbO58kj7ek=;
        b=WAit9jvrZtbJoIk7EiY3UrSKaB8zr5cLnzwjiDeCs4PbAd1IOUJ6EeR7sOStofGWnC
         uJi+tOGtZvlIj0MtfrR+Hk4vW/S1MCpDKxuVa04P8mo7BuU98WQZEaHnZjvzQyT2ixiv
         FvOgA3dDLZO8p/D9VjjuCQ4APYUMy1Ae9kEWj0LsWJZ6TvWmz6ZdvKeHZLMLRq1q/g5Q
         wtxD+sa8AMMv2Ghjw79rUqriBg+tOz+YbUZI07ILetkXnMjAuywo/Zo0yn5A7iFKs3LP
         U5WGsYLocXKuP7f+WfCnL3DB0O4lomYwrs9fzLfagFTTBmpfE/g6+dXoy1wluwfAIC01
         r9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUqRS5upUqlRnlkiOZPtVKdJJYkbE3gHsTPEq163J6vmc1KK+bhtgiIv/ZRkzY3r08e1ND7@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yypj7AMEQn7ofy0Uo5qyEsclts8AoFGxp3oLU8KQAA91IV2K3f6
	A3u09gsE8ar6CQefPoakKq6QEy3/ytIn095AT1llFRGiyvIvJnFKdrVi12TwtEXYHR6bf0uwHC/
	hxy6niXmLVTOGWVKAEiX/y3XxG84=
X-Gm-Gg: ASbGncta+LQQRd6KCcdt+EYVnigEUf/K6hwR3eFvNuFnSQNc0pv5XCeuhHreD3Qcb/i
	e+ksuQ9odQp2/4bbU7QKjlofmKOHEnzs+8IXh0kI43Ua+LIQOLL+DOfqt7/0GZnneVT+C0Y73iY
	QVDUMPLUhAZNHA3OuJN+BQecWrGg38CHOYNps=
X-Google-Smtp-Source: AGHT+IGHNkhGG1SuDxKvLc4/FCb5aZOMQEYjymWnVIllKPJVOfDg9WLhM90VQ5ZwPZx1f53rhDK1WzAnsEIgl13AIY8=
X-Received: by 2002:a05:6512:1318:b0:545:285f:cd7f with SMTP id
 2adb3069b0e04-54d45295932mr4858966e87.14.1744718860118; Tue, 15 Apr 2025
 05:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-bb-pressure-improvements-v1-0-7d9e3593167f@bootlin.com>
 <20250411-bb-pressure-improvements-v1-1-7d9e3593167f@bootlin.com>
 <CA+chaQeXK2pbaNWaYvDVzMhu=eZLpFLB9zeeaGDA7oLDJnaG3A@mail.gmail.com> <D976VXV65RT6.1ZHT2MCAP4QL1@bootlin.com>
In-Reply-To: <D976VXV65RT6.1ZHT2MCAP4QL1@bootlin.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 15 Apr 2025 14:07:28 +0200
X-Gm-Features: ATxdqUFuB9JlFCWtMT1Zag2sivcSrbzktXs1arS5j_fxFNxEIPq3s_0M0XdaNRs
Message-ID: <CA+chaQdNvTosunsyh1=_sQ0E1-u4FwPJ2=FtNsFTLyic1pvc9A@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] runqueue: decrease the verbosity of pressure messages
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 12:07:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6744

On Tue, Apr 15, 2025 at 1:52=E2=80=AFPM Antonin Godard
<antonin.godard@bootlin.com> wrote:
>
> Hi Martin,
>
> On Fri Apr 11, 2025 at 9:09 PM CEST, Martin Jansa wrote:
> > On Fri, Apr 11, 2025 at 4:46=E2=80=AFPM Antonin Godard via
> > lists.yoctoproject.org
> > <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
> >>
> >> By default all the pressure changes are printed on the console and
> >> generate a lot of spam to users using the BB_PRESSURE_* variables.
> >> Decrease the default verbosity to bb.debug (level 1, so can be seen wi=
th
> >> -D).
> >
> > Isn't "a lot of these messages" a proof that the BB_PRESSURE_*
> > variables aren't set correctly?
> >
> > I find them quite useful and using -D by default in my builds would
> > bring even "more spam". But in worse case I'll just revert this for my
> > builds.
>
> I see how these messages can be useful.
>
> To my understanding, having a low value for BB_PRESSURE_* variables will
> generate a lot of these messages. To me, it does not necessarily mean tha=
t the
> value isn't properly set, it just means that you want to limit the pressu=
re a
> lot.
>
> Maybe the default behavior of printing everything is good for adjustments=
, I
> just think it'd be convenient for user to have a way to disable those onc=
e they
> are happy with their pressure configuration.
>
> I thought first of a BB_PRESSURE_VERBOSE or BB_PRESSURE_QUIET variable. I=
t
> would just allow enabling/disabling these messages. But on second thought=
, I'm
> not sure an extra variable is necessary when we could just move these mes=
sages
> to debug messages. Other variables that limit the load do not generate su=
ch
> "spam" (take BB_LOADFACTOR_MAX for example).

I guess you're using the default knotty where I agree that these
messages from pressure are more annoying, because there isn't much
else printed by default.

Most of my builds are on jenkins or run with tee, so I get a lot of
messages about e.g. starting and stopping tasks and almost never
notice the few pressure messages between them (unless it's IMHO badly
configured and changes regulation after almost every task).

> What do you think?

Do what you want (and others agree with) and I'll deal with it for my
builds if needed (I might just disable pressure regulation as I don't
find it that useful as it cannot prevent OOMK anyway and the task
granularity doesn't prevent it from triggering multiple heavy and log
do_compile tasks at the same time while the pressure was still low and
it gets overloaded shortly after - still hoping that
https://github.com/ninja-build/ninja/pull/2506 will be merged one
day).

