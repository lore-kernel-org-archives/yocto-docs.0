Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEBAC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 18:03:37 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.703.1654711414783860487
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 11:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZVaCpt6E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.177,
 mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lj1-f177.google.com with SMTP id b12so12610615ljq.3
        for <docs@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 11:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XXU1zigC2nGlXLmdZiXDVLZ16HHW1lfBdqJ6MozJ2og=;
        b=ZVaCpt6EMpXIa3bUGtv1Df+279gsujePoEDMex22MPXDlJc+M3MV+287xatCcYCaWD
         OfKKxKADnUpaUAETA/JC+bkP4rOKXIr1fq5MBj2OtmSXbqQzReOJ9mVGF6jPT6ugnDat
         PJ3lmu6gOsu3KM17m85E7t54JbbVwKNZNVLHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXU1zigC2nGlXLmdZiXDVLZ16HHW1lfBdqJ6MozJ2og=;
        b=akMdmGIMOuSlxoHDgPuEEeZsMBuPpoKc1uXtAaKMQOQlvmPlF6F2Iu73Y9D0JkA2m3
         l7mcbk5cMv3qqxdF/NBGLM3qSVjAhy51e8VQ0sTC8TlmnqUQE2zSlAIpJfByRphoXne6
         aaifcWoSLewE9VcrHateyRqw2+QzcrFHpbhs5uNL9sBO5qaKCfj2jjUk3ZRqPtDh61uU
         DnU8FxGcR0JnK/9p01GWM0V1Hs2JB9TJgx0ibDol1BQiWCEz+KSxJrQCfWcywQaILz8/
         OSPTBkckDtEmO0rtSl3QtnZ9Hf/9Xn+kiXAf6XtWZ9aZZ0pA29wYqAmoyfWvsFj3Um7I
         DhnA==
X-Gm-Message-State: AOAM531NL1sqtn/DOdxrtbuBUPvqKCGp7wrTDWACN5KcJLhisH4/xSaj
	WIdQcLTRxWr4xwOAzmNYBUwWTdmAYNzYmsbf+0RT6A==
X-Google-Smtp-Source: 
 ABdhPJyqqyEo8sbkKu2zycqVwPY856i8/7S9K7NURieuLn96aNC6BWqIHTf7PRqmM+/PkpI/FmxsDuqKAYh7xg3ACUw=
X-Received: by 2002:a2e:70a:0:b0:255:52d4:1a62 with SMTP id
 10-20020a2e070a000000b0025552d41a62mr26230101ljh.145.1654711412926; Wed, 08
 Jun 2022 11:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220603133353.506482-1-foss+yocto@0leil.net>
 <a67c00b5-20a9-fd64-66ed-fc0e040f2999@theobroma-systems.com>
 <a0058bb37f8f05cc7b9775c40c44dceee3bcb15a.camel@linuxfoundation.org>
 <23a1213a-0753-6b13-e0af-360bf695eb57@bootlin.com>
 <188ce60d87bc5adc5bbadd53aee44f306b7da45c.camel@linuxfoundation.org>
In-Reply-To: 
 <188ce60d87bc5adc5bbadd53aee44f306b7da45c.camel@linuxfoundation.org>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 8 Jun 2022 11:03:21 -0700
Message-ID: 
 <CADfgfoZ5uP_mCCdXFscxnE16Ozrs+aVmvrK_87v-5nToX8LcQQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] docs: releases: move hardknott and honister to
 outdated section
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000f9463105e0f38527"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jun 2022 18:03:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2973

--000000000000f9463105e0f38527
Content-Type: text/plain; charset="UTF-8"

With this guide I can track these down. Some are easy like with 2.5.3 it is
just 26c5549580e108c40aa7c95860d12c675596820c (origin/sumo). Others take a
little reading.

Almost all of the tags from this era were made by the docs maintainer
without any signing by release engineering. Should we backdate these when
we create them? Should they be created in the name of the person who would
have made them at the time? If not, whose name is the most appropriate?

On Wed, Jun 8, 2022 at 10:02 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2022-06-08 at 18:46 +0200, Michael Opdenacker wrote:
> > Richard, Quentin,
> >
> > On 6/7/22 12:22, Richard Purdie wrote:
> > > On Tue, 2022-06-07 at 11:02 +0200, Quentin Schulz wrote:
> > > > Richard, Michael(s),
> > > >
> > > > I have been working on automating this release page so we don't have
> to
> > > > maintain it (I stumbled upon it by chance).
> > > >
> > > > The issue I'm having right now is that we are missing a handful of
> tags
> > > > in yocto-docs which makes it non-straightforward to order the
> releases.
> > > >
> > > > +# list missing tags in yocto-docs
> > > > +missing_tags = [
> > > > +        'yocto-0.9',
> > > > +        'yocto-1.0', 'yocto-1.0.1',
> > > > +        'yocto-1.1', 'yocto-1.1.1',
> > > > +        'yocto-1.2',
> > > > +        'yocto-1.4.4', 'yocto-1.4.5',
> > > > +        'yocto-1.5', 'yocto-1.5.2', 'yocto-1.5.3', 'yocto-1.5.4',
> > > > +        'yocto-1.6', 'yocto-1.6.1', 'yocto-1.6.2',
> > > > +        'yocto-1.7', 'yocto-1.7.1',
> > > > +        'yocto-1.9',
> > > > +        'yocto-2.5.3',
> > > > +        'yocto-3.1', 'yocto-3.1.1', 'yocto-3.1.2', 'yocto-3.1.3',
> > > > +        ]
> > > >
> > > > Those seems to be the only missing tags (didn't check really
> carefully
> > > > though, so might be missing one or two).
> > > If someone can work out the commit for each of the tags we can
> > > definitely tag them. We should be able to work that information out, it
> > > is just a bit of a pain to do.
> >
> > I could pickup a commit whose date matches the date for each release, as
> > found on http://downloads.yoctoproject.org/releases/yocto/.
> > I wouldn't be 100% sure to pick up exactly the right commit, but would
> > we care, since we are not going to use the tags to regenerate the old
> docs?
> >
> > Then, I could create the tags and push them.
> >
> > Any better way? As far as I've seen the old release notes didn't mention
> > the documentation sources.
>
> There is a better way. Taking yocto 1.2 which denzil, you can see the
> release tag here:
>
>
> https://git.yoctoproject.org/poky/commit/?h=denzil&id=d20a24310eb43fed9a3f3e75752c9ad45a18cbe4
>
> I appreciate it says denzil-7.0 which is a poky version but poky 7.0 is
> yocto 1.2.
>
> The last commit to docs before that commit is this one:
>
>
> https://git.yoctoproject.org/poky/commit/?h=denzil&id=7e56770a6024e51e0a23ce0139b349a843200404
>
> and that says in the commit message the corresponding docs revision is:
>
> b3fc2ec7c5aedb8ea0a2d502bdcd7e8f4092ed96
>
> so yocto-1.2 was:
>
> poky d20a24310eb43fed9a3f3e75752c9ad45a18cbe4
> oe-core fd989e1bceef6df36619ba8944c8141abefd282e
> yocto-docs b3fc2ec7c5aedb8ea0a2d502bdcd7e8f4092ed96
>
> A bit of a pain but we can reverse engineer these.
>
> Cheers,
>
> Richard
>
>
>
>

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000f9463105e0f38527
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>With this guide I can track these down. Some are easy=
 like with 2.5.3 it is just=C2=A026c5549580e108c40aa7c95860d12c675596820c (=
origin/sumo). Others take a little reading.</div><div><br></div>Almost all =
of the tags from this era were made by the docs maintainer without any sign=
ing by release engineering. Should we backdate these when we create them? S=
hould they be created in the name of the person who would have made them at=
 the time? If not, whose name is the most appropriate?=C2=A0</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 8, =
2022 at 10:02 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2022-06-08 at 18:4=
6 +0200, Michael Opdenacker wrote:<br>
&gt; Richard, Quentin,<br>
&gt; <br>
&gt; On 6/7/22 12:22, Richard Purdie wrote:<br>
&gt; &gt; On Tue, 2022-06-07 at 11:02 +0200, Quentin Schulz wrote:<br>
&gt; &gt; &gt; Richard, Michael(s),<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I have been working on automating this release page so we do=
n&#39;t have to<br>
&gt; &gt; &gt; maintain it (I stumbled upon it by chance).<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The issue I&#39;m having right now is that we are missing a =
handful of tags<br>
&gt; &gt; &gt; in yocto-docs which makes it non-straightforward to order th=
e releases.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +# list missing tags in yocto-docs<br>
&gt; &gt; &gt; +missing_tags =3D [<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-0.9&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-1.0&#39;, &#39;yocto=
-1.0.1&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-1.1&#39;, &#39;yocto=
-1.1.1&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-1.2&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-1.4.4&#39;, &#39;yoc=
to-1.4.5&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-1.5&#39;, &#39;yocto=
-1.5.2&#39;, &#39;yocto-1.5.3&#39;, &#39;yocto-1.5.4&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-1.6&#39;, &#39;yocto=
-1.6.1&#39;, &#39;yocto-1.6.2&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-1.7&#39;, &#39;yocto=
-1.7.1&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-1.9&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-2.5.3&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;yocto-3.1&#39;, &#39;yocto=
-3.1.1&#39;, &#39;yocto-3.1.2&#39;, &#39;yocto-3.1.3&#39;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Those seems to be the only missing tags (didn&#39;t check re=
ally carefully<br>
&gt; &gt; &gt; though, so might be missing one or two).<br>
&gt; &gt; If someone can work out the commit for each of the tags we can<br=
>
&gt; &gt; definitely tag them. We should be able to work that information o=
ut, it<br>
&gt; &gt; is just a bit of a pain to do.<br>
&gt; <br>
&gt; I could pickup a commit whose date matches the date for each release, =
as <br>
&gt; found on <a href=3D"http://downloads.yoctoproject.org/releases/yocto/"=
 rel=3D"noreferrer" target=3D"_blank">http://downloads.yoctoproject.org/rel=
eases/yocto/</a>.<br>
&gt; I wouldn&#39;t be 100% sure to pick up exactly the right commit, but w=
ould <br>
&gt; we care, since we are not going to use the tags to regenerate the old =
docs?<br>
&gt; <br>
&gt; Then, I could create the tags and push them.<br>
&gt; <br>
&gt; Any better way? As far as I&#39;ve seen the old release notes didn&#39=
;t mention <br>
&gt; the documentation sources.<br>
<br>
There is a better way. Taking yocto 1.2 which denzil, you can see the<br>
release tag here:<br>
<br>
<a href=3D"https://git.yoctoproject.org/poky/commit/?h=3Ddenzil&amp;id=3Dd2=
0a24310eb43fed9a3f3e75752c9ad45a18cbe4" rel=3D"noreferrer" target=3D"_blank=
">https://git.yoctoproject.org/poky/commit/?h=3Ddenzil&amp;id=3Dd20a24310eb=
43fed9a3f3e75752c9ad45a18cbe4</a><br>
<br>
I appreciate it says denzil-7.0 which is a poky version but poky 7.0 is<br>
yocto 1.2.<br>
<br>
The last commit to docs before that commit is this one:<br>
<br>
<a href=3D"https://git.yoctoproject.org/poky/commit/?h=3Ddenzil&amp;id=3D7e=
56770a6024e51e0a23ce0139b349a843200404" rel=3D"noreferrer" target=3D"_blank=
">https://git.yoctoproject.org/poky/commit/?h=3Ddenzil&amp;id=3D7e56770a602=
4e51e0a23ce0139b349a843200404</a><br>
<br>
and that says in the commit message the corresponding docs revision is:<br>
<br>
b3fc2ec7c5aedb8ea0a2d502bdcd7e8f4092ed96<br>
<br>
so yocto-1.2 was:<br>
<br>
poky d20a24310eb43fed9a3f3e75752c9ad45a18cbe4<br>
oe-core fd989e1bceef6df36619ba8944c8141abefd282e<br>
yocto-docs b3fc2ec7c5aedb8ea0a2d502bdcd7e8f4092ed96<br>
<br>
A bit of a pain but we can reverse engineer these.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<div>Linux Foun=
dation / Yocto Project</div><div>Systems Operations Engineer</div></div></d=
iv>

--000000000000f9463105e0f38527--

