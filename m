Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97308C27C5F
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 16:07:53 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.18720.1717690066061792108
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 09:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6EhoCNl;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e73359b900so12751111fa.2
        for <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 09:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717690064; x=1718294864; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hEdb5dKnbCg3R3931JFCKsdC8WSRKlhRit/iuJDb2bM=;
        b=O6EhoCNlxx+yay7fvaSEMvcailOMd1KhPXoxihh/xU9H9pKw79ObsgICi5RygzEfko
         617q6lGwQLy8UsvHvseUn5gkd00VIsSxFyAMULuugROJxAK4JZ/kuJBaSvSzANgdIr5H
         /LAGDMfyfVE1vBw7QpeEhOWaaxqnAuxE1hDVBuLu5Eg7OUYf+4y5pdamerjixYZc4ANz
         uYiWB1Jte7oSBVCgqmWudtUs79QBT3dftTW3fkkaB6/1t8fUEbrqKV38N0D+HR8zT55r
         Xyiiptz02LH1DXC0aZUhydP3FVjl3mzoYhz0ewKy4C6shI5wXICapjiTj6JL7RTDYiJC
         AcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717690064; x=1718294864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEdb5dKnbCg3R3931JFCKsdC8WSRKlhRit/iuJDb2bM=;
        b=fUuP1Zrv3uv304QNSgt6T93EGMhnwLuulPwW+dmbHRP/HQ/863LuSVqQ8TbKek3sYe
         sP1Sc+X0V8GQM073Z/MiXYPcuFtwxMpiJJDvTAkLne8wCuhp8XSdNK2FRRARkbTvXXPs
         /15dzcQytLS5airtUlEOq8EdGl+B2j13MNPaZWcAVAwEiiNnEzu9ADbPaO2ilL6HiCMr
         vMmZ6NomTvT3h17kZHSMW3qybsyZaVJHWEmR6i+YbyTUYhI7/WlBURd7fJy0d1Jd5F2+
         4R2EnhiyZyS2oN8Ida54zn6NUD1iziiVZxJCai7eSW7FUNBkB0WSyJx3tPHuKYJmaCR2
         JpXg==
X-Forwarded-Encrypted: i=1; AJvYcCWW18BFvogqxxGNj/8hmEQ3eL854MPKMQamhmVuKpgF9EvVKEpfLD80ED3kUkreFS89XvEZE69sVQVPgYTxhGuoo+djDl4k03tE6t0=
X-Gm-Message-State: AOJu0YxzY33doXgRHBJbduf8xrnoVyF+vkV6DKPTYdad6ujKmKu5Czy/
	2cqz0/+xs6sbNrTQAR501f4BegZxHqg7O/ztWdNgOYwC2XNwq7/gz+t6Zzh/bXIxeBO4ql5xyP4
	kw63EVJlWIdFAPUAoghLQDNkmLkE=
X-Google-Smtp-Source: AGHT+IGApOrbNGByLkCA8tkUWsZ4TeoEWaxCML9XR4htem6a0zmBrxKsQa54iaeqE0XpnDqJNLlGLanYmeDWA49wGWg=
X-Received: by 2002:a05:651c:1a23:b0:2ea:b908:d840 with SMTP id
 38308e7fff4ca-2eadce3828bmr1136731fa.29.1717690063735; Thu, 06 Jun 2024
 09:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240606150410.69388-1-jasper@fancydomain.eu> <6484f5a1-50fb-42f1-871c-f2d6dfd4a38b@opdenacker.org>
In-Reply-To: <6484f5a1-50fb-42f1-871c-f2d6dfd4a38b@opdenacker.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Jun 2024 18:07:32 +0200
Message-ID: <CANNYZj8H-+OLyQ8_5ocDd9JHpGL5zSF94v9m4Sh5ENa7uR5VCQ@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] dev-manual: Add info on build env initialization
To: michael@opdenacker.org
Cc: jasper@fancydomain.eu, aoife.power@iris-sensing.com, 
	quentin.schulz@cherry.de, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 16:07:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5281

I think we should actually rewrite every mention of oe-init-build-env
to suggest oe-setup-build instead and effectively deprecate using
oe-init-build-env directly. I'm okay with this patch though, as such a
rewrite is a bigger effort.

Alex

On Thu, 6 Jun 2024 at 17:45, Michael Opdenacker via
lists.yoctoproject.org <michael=opdenacker.org@lists.yoctoproject.org>
wrote:
>
> Hi Jasper
>
> On 6/6/24 17:04, Jasper Orschulko via lists.yoctoproject.org wrote:
> > From: Jasper Orschulko <jasper@fancydomain.eu>
> >
> > Going through the docs we a new trainee, we noticed that the build
> > initialization is only mentioned in the quick build
> > (https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html) but not
> > in the in-depth getting started documentation.
> >
> > While this is repeatedly mentioned later on, e.g. in the "building" section,
> > you might easily end up somewhere where this has not been mentioned yet.
> >
> > E.g. in our case this was:
> >
> > https://docs.yoctoproject.org/dev-manual/layers.html# (which comes right
> > after the "setup" chapter)
> > ->
> > https://docs.yoctoproject.org/dev-manual/layers.html#creating-a-general-layer-using-the-bitbake-layers-script
> > (which is linked right at the top)
> >
> > To avoid any confusion I think it best to mention this required step
> > directly in the "start" document.
> >
> > Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
> > ---
> >   documentation/dev-manual/start.rst | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> > index 386e5f5d2..66e70cf21 100644
> > --- a/documentation/dev-manual/start.rst
> > +++ b/documentation/dev-manual/start.rst
> > @@ -853,3 +853,14 @@ similar to checking out by branch name except you use tag names.
> >      ``checkout`` command are a snapshot of the "&DISTRO_NAME_NO_CAP;"
> >      development branch at the point where Yocto Project &DISTRO; was
> >      released.
> > +
> > +Initializing the Build Environment
> > +==================================
> > +
> > +Before you can use Yocto you need to setup the build environment.
> > +From within the `poky` directory, source the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
>
> One last nitpick...
> If poky is a directory name, you should use ``poky``. If you refer to
> the project name, it should be `Poky`.
>
> I think the first solution is what you want here.
> Cheers
> Michael.
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5280): https://lists.yoctoproject.org/g/docs/message/5280
> Mute This Topic: https://lists.yoctoproject.org/mt/106524927/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

