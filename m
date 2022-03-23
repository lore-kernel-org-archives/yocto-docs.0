Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7F8C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 00:47:48 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.3505.1647996466893615632
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 17:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jfhf03vn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.41,
 mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f41.google.com with SMTP id w27so185740lfa.5
        for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 17:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jE14UGyiNPGPa00GSddOzeLaLNg+0AzzO8Xi9I9Rz3Q=;
        b=Jfhf03vnbNjg4+W4aF6NGBrS5SoV2xGyzlLfg3b828ULpHbuWtW+lkOAA8vXHK/dYX
         0MTpn88HW66T+g67QTMrhe1r43459Z2QQaJBBbIqG8uAtGPUNRYtzKv1aHjqM0AAptDd
         6cQGy4O5+xvIO36pOdrVGtIckSLAGBoRKJaCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jE14UGyiNPGPa00GSddOzeLaLNg+0AzzO8Xi9I9Rz3Q=;
        b=U4d/AXC3Fo4TtsX4+1uyBgxKDjdJON02tnCatYlOPSPxoC7JGH4yps8DyIxq8R9AF1
         lYginpDvDO48VSUEghtMZoyCmBxkGBOY1kJXNhjX3LD0aSH9dERm5Dn/w9RRtcTTqE+K
         qJxG7Qw0bEIwCIHcv/KgkmQFOOsWzDZKBDcldZKgqj4xxMW3Y6m4utjJhGatcy+ora9H
         O5dN+Mi/8Jnb/fHGAuOqWnYP5dhZBYLmhKxyYmWRwzsJ8Ptrr8gQIrNYOqXRoBXk2gK4
         Qc4Lx1PEBtlKLHI+beODegdnH//oOA2jwWz4FJ1V33xeJZPt3Z1/jUkNrmQkHqydJteO
         d4tg==
X-Gm-Message-State: AOAM532dMVsWtkHKvN8OiWBK8Ryyj5SHy9XDgutuYYHm2A4gjtnQG9iw
	w3fYHaq3XZ0bs8MUVPWKBK2Edi5hiln+fbVXudndXw==
X-Google-Smtp-Source: 
 ABdhPJytUm6BACC1Ux8x+gKxgiOE33iL7UrB0OEYI4haVnMbdOQdaa2pu6oU/F4tw4wJuAcGxGudCnwKaY5nubWHZTs=
X-Received: by 2002:a05:6512:3f1b:b0:448:92d7:8952 with SMTP id
 y27-20020a0565123f1b00b0044892d78952mr19649527lfa.183.1647996465057; Tue, 22
 Mar 2022 17:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220321174455.1189669-1-richard.purdie@linuxfoundation.org>
 <CAP71WjxAtVJO2YvM3p4UM1TEYuqmM7TLpDo5kRytp+G=kQhSgA@mail.gmail.com>
 <ea41470f551f80509c947bf074eee5b29777953e.camel@linuxfoundation.org>
 <bc6e6ce9-2287-cfd8-a3c7-6d9f54ecc1f9@theobroma-systems.com>
 <9a19dcfedb95816a40a967bc87fa54f3da62fef3.camel@linuxfoundation.org>
 <a7308598-4d69-ec6a-4edf-df198055ee93@theobroma-systems.com>
 <16DEBBB55476AD52.11857@lists.yoctoproject.org>
 <7b263ab8905bc5fe6d2fe6c8cf65bf2583f9ac49.camel@linuxfoundation.org>
In-Reply-To: 
 <7b263ab8905bc5fe6d2fe6c8cf65bf2583f9ac49.camel@linuxfoundation.org>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 22 Mar 2022 17:47:34 -0700
Message-ID: 
 <CADfgfoYfeR8D+PzJhefNZRhnD6tJZZd0c6WOkSLNgRwso16Brw@mail.gmail.com>
Subject: Re: [docs] [PATCH 0/5 v2] Proposed docs version changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e4271205dad8131b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Mar 2022 00:47:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2691

--000000000000e4271205dad8131b
Content-Type: text/plain; charset="UTF-8"

These tags are in place. I back-dated them to the release day but I put
them in my name since I've added these without a release engineer involved.



On Tue, Mar 22, 2022 at 8:00 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2022-03-22 at 14:54 +0000, Richard Purdie via
> lists.yoctoproject.org
> wrote:
> > On Tue, 2022-03-22 at 15:33 +0100, Quentin Schulz wrote:
> > > On 3/22/22 15:25, Richard Purdie wrote:
> > > > On Tue, 2022-03-22 at 14:58 +0100, Quentin Schulz wrote:
> > > > > Hi all,
> > > > >
> > > > > On 3/21/22 23:06, Richard Purdie wrote:
> > > > > > On Mon, 2022-03-21 at 22:56 +0100, Nicolas Dechesne wrote:
> > > > > > >
> > > > > > > Would it make sense to implement what you have in
> set_versions.py directly in
> > > > > > > Sphinx 'native' code ? e.g. directly in conf.py, or in a
> module loaded from
> > > > > > > conf.py (see how kernel does it at [1]) or yocto-vars
> extension, or as its own
> > > > > > > Sphinx extension?
> > > > > > >
> > > > > > > poky.yaml only purpose is to be loaded by yocto-vars.py which
> is a local
> > > > > > > Sphinx extension we created.
> > > > > >   > Possibly, yes. I've done it like this as it was easier to
> validate it
> > > > > was doing
> > > > > > the right things and also easier to apply in retrospect to
> previous docs
> > > > > > releases. What we want to do going forward is an open question
> and it does feel
> > > > > > like that script would be better off as a module that at least
> for master, the
> > > > > > docs code called into.
> > > > > >
> > > > > > I think that would make most sense as a follow on to this series
> if/as/when
> > > > > > people have the time to work on it and test it accordingly. As
> it stands the
> > > > > > series was already quite painful to develop (I got hooked on
> Friday and had to
> > > > > > fix it on Saturday whilst I still had the pieces all in cache).
> > > > > >
> > > > >
> > > > > Agreed. I don't think this patch series makes the doc building
> situation
> > > > > worse than it currently is so there's no reason to hold it off.
> Makes it
> > > > > even easier on stable release maintainers so it's good :)
> > > > >
> > > > > I just would like the behavior to be unchanged wrt versions listed
> in
> > > > > the switchers.js, the rest is fine and can be modified later on.
> > > >
> > > > Just to be clear, you mean adding gatesgarth and zeus back?
> > >
> > > Keeping the current behavior which is the latest dot version of all
> > > releases up to Warrior.
> > >
> > > dev
> > > 3.4.2
> > > 3.3.5
> > > 3.2.4
> > > 3.1.14
> > > 3.0.4
> > > 2.7.4
> > >
> > > is what I currently have.
> >
> > Sadly I can't make this work easily since there are no tags for 2.7.2,
> 2.7.3
> > ,2.7.4, 3.0.2, 3.0.3 or 3.0.4. There are a bunch of older releases
> missing
> > too :(
>
> Michael(H), would you be able to add some tags:
>
> yocto-2.7.4 3fd1432890f04fd659952c0f20f5750fb8c3a909
> yocto-2.7.3 a06e6bdf1d8f133dfaf6dad9c49be24f688799c4
> yocto-2.7.2 ee29f61b92c5ca7dd56393cef5fcd3ff3fe243aa
> yocto-3.0.2 ac75b463b23ae6258c1e6f3bbdefc398f3a03d43
> yocto-3.0.3 9d522e747d2715aa0b2fe4c81cacc34bfad3e1a3
> yocto-3.0.4 9f51be3a11b7422aba3617a90a98336c3c75f71e
>
> please?
>
> Cheers,
>
> Richard
>
>

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000e4271205dad8131b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">These tags are in place. I back-dated them to the release =
day but I put them in my name since I&#39;ve added these without a release =
engineer involved.<div><br></div><div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 22, 2022 at 8:0=
0 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Tue, 2022-03-22 at 14:54 +0000, Ric=
hard Purdie via <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer=
" target=3D"_blank">lists.yoctoproject.org</a><br>
wrote:<br>
&gt; On Tue, 2022-03-22 at 15:33 +0100, Quentin Schulz wrote:<br>
&gt; &gt; On 3/22/22 15:25, Richard Purdie wrote:<br>
&gt; &gt; &gt; On Tue, 2022-03-22 at 14:58 +0100, Quentin Schulz wrote:<br>
&gt; &gt; &gt; &gt; Hi all,<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On 3/21/22 23:06, Richard Purdie wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Mon, 2022-03-21 at 22:56 +0100, Nicolas Dechesn=
e wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Would it make sense to implement what you hav=
e in set_versions.py directly in<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sphinx &#39;native&#39; code ? e.g. directly =
in conf.py, or in a module loaded from<br>
&gt; &gt; &gt; &gt; &gt; &gt; conf.py (see how kernel does it at [1]) or yo=
cto-vars extension, or as its own<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sphinx extension?<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; poky.yaml only purpose is to be loaded by yoc=
to-vars.py which is a local<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sphinx extension we created.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0&gt; Possibly, yes. I&#39;ve done it l=
ike this as it was easier to validate it<br>
&gt; &gt; &gt; &gt; was doing<br>
&gt; &gt; &gt; &gt; &gt; the right things and also easier to apply in retro=
spect to previous docs<br>
&gt; &gt; &gt; &gt; &gt; releases. What we want to do going forward is an o=
pen question and it does feel<br>
&gt; &gt; &gt; &gt; &gt; like that script would be better off as a module t=
hat at least for master, the<br>
&gt; &gt; &gt; &gt; &gt; docs code called into.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; I think that would make most sense as a follow on =
to this series if/as/when<br>
&gt; &gt; &gt; &gt; &gt; people have the time to work on it and test it acc=
ordingly. As it stands the<br>
&gt; &gt; &gt; &gt; &gt; series was already quite painful to develop (I got=
 hooked on Friday and had to<br>
&gt; &gt; &gt; &gt; &gt; fix it on Saturday whilst I still had the pieces a=
ll in cache).<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Agreed. I don&#39;t think this patch series makes the d=
oc building situation<br>
&gt; &gt; &gt; &gt; worse than it currently is so there&#39;s no reason to =
hold it off. Makes it<br>
&gt; &gt; &gt; &gt; even easier on stable release maintainers so it&#39;s g=
ood :)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I just would like the behavior to be unchanged wrt vers=
ions listed in<br>
&gt; &gt; &gt; &gt; the switchers.js, the rest is fine and can be modified =
later on.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Just to be clear, you mean adding gatesgarth and zeus back?<=
br>
&gt; &gt; <br>
&gt; &gt; Keeping the current behavior which is the latest dot version of a=
ll <br>
&gt; &gt; releases up to Warrior.<br>
&gt; &gt; <br>
&gt; &gt; dev<br>
&gt; &gt; 3.4.2<br>
&gt; &gt; 3.3.5<br>
&gt; &gt; 3.2.4<br>
&gt; &gt; 3.1.14<br>
&gt; &gt; 3.0.4<br>
&gt; &gt; 2.7.4<br>
&gt; &gt; <br>
&gt; &gt; is what I currently have.<br>
&gt; <br>
&gt; Sadly I can&#39;t make this work easily since there are no tags for 2.=
7.2, 2.7.3<br>
&gt; ,2.7.4, 3.0.2, 3.0.3 or 3.0.4. There are a bunch of older releases mis=
sing=C2=A0<br>
&gt; too :(<br>
<br>
Michael(H), would you be able to add some tags:<br>
<br>
yocto-2.7.4 3fd1432890f04fd659952c0f20f5750fb8c3a909<br>
yocto-2.7.3 a06e6bdf1d8f133dfaf6dad9c49be24f688799c4<br>
yocto-2.7.2 ee29f61b92c5ca7dd56393cef5fcd3ff3fe243aa<br>
yocto-3.0.2 ac75b463b23ae6258c1e6f3bbdefc398f3a03d43<br>
yocto-3.0.3 9d522e747d2715aa0b2fe4c81cacc34bfad3e1a3<br>
yocto-3.0.4 9f51be3a11b7422aba3617a90a98336c3c75f71e<br>
<br>
please?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<div>Linux Foun=
dation / Yocto Project</div><div>Systems Operations Engineer</div></div></d=
iv>

--000000000000e4271205dad8131b--

