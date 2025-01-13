Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548DAC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 19:17:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.26443.1736795873081264700
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 11:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gaq5gSkQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.41, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3c47434eso4389954e87.3
        for <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 11:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736795871; x=1737400671; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NIqnqTz6DBBBCEg+wj7EgvC+sNawhgibPoBgS3CzvQ4=;
        b=Gaq5gSkQF4rQ6l46xzWcRbhpVqMSgUnLTi/X5hNVKYVAolyLGfWnVWUzw32yMulzc/
         HfsRuhmCkP0UUWRljVFVVqiyP7zFGMwjgRZ+OMvsL0w97J4TTbxPdAD/hFAwwaidQh1F
         Axr978K4neUzjzy1wGQO1jegG5WOX+PSLcvro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736795871; x=1737400671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NIqnqTz6DBBBCEg+wj7EgvC+sNawhgibPoBgS3CzvQ4=;
        b=VhOkMZlDvbyu47SUu3w3TfwzeuWjJ02pktJqYLHlYoTT+9H1cmX+ina4SjJ3qVEaY4
         xXjC8E96Aku8+/4OZRVGeS1icQmIgILEQhZ3cGD7SJoG0m3r7t5OmzrcVByL4VjCxK/7
         TZJH31ZC4BkbiNY1ObypJGMHemwu5W/QU0mdS0KPHORzFsT3Q5lneLTkqZFjmzGmb0rY
         TEeJ7Zs/YFPADHPehRBoxa3JUi6L4AFW36JQMD3UTve8OOIzyHHcc65J/DacvIRP8zIy
         XrZdh7EsiuLsPWN86znpkZ56i9SpwcAXrRcWrOwv6KsH8PqIoHnC1SnOp3Ov2TFqIrsp
         m26w==
X-Forwarded-Encrypted: i=1; AJvYcCWclDIvh6q6zcHVur27Ar7bnSPsgacSXlfhwXAQab9xtKbCY5eGKUyqmiBaZ+sS4eqefB5T@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxScLGGnivoTKWx36sZdV8+VD3Kqo1CI9pOYSWjR1+Weh5Ov/2N
	GDvGwLhccZCb/Up69bNQkwp4CjzgDXOsnRBklfznF7XFnfQ/xjHMyc2OTkPUeF4mQJ4o6CsnImt
	96UJTG/cmwDQFnXl32OsQ8cdghnGTstIrdkUnRw==
X-Gm-Gg: ASbGncs9MJgEXW4800qVM/H/UwtBxIg1U33YYYgPASkASy1LUDYU4bJOrn4ZfxexGnY
	Nbl86IfwIHz0b+llpWRAJ+q2bTciUyog7IYL3XjthAF75D0MoBXLTKrOXeaKSbLSr/3ur/6Y7
X-Google-Smtp-Source: AGHT+IEoHopZQJZeTlsTjD8wlJm3mjBj/n4/V7zs51xVoFzEKdhqUWCSYejLUNf9QMMhPt+6eRhdjN1xCc36aUZjwpA=
X-Received: by 2002:a05:6512:3d16:b0:53e:3a9d:e4a with SMTP id
 2adb3069b0e04-542845af718mr6694773e87.10.1736795871072; Mon, 13 Jan 2025
 11:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20241227-update-autobuilder-link-v1-1-6c1ec14a32fd@bootlin.com>
 <CADfgfobhK_b+kyi2QDFbMR1=CkKziGTFdMCX1SGxkJ7VmR+i_A@mail.gmail.com> <3fee6045-ef55-42ac-9dfd-e3b6a07e02de@cherry.de>
In-Reply-To: <3fee6045-ef55-42ac-9dfd-e3b6a07e02de@cherry.de>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Mon, 13 Jan 2025 09:17:39 -1000
X-Gm-Features: AbW1kvZazau2BB5ipcctwrb-FOrRFpkICexwGng9Z8riimbHf2ivTyoIc3dC-G8
Message-ID: <CADfgfoY11VSzUDCAzzDtb7Xs_ktHE=S2_gc1DENF5gxpf2gYTA@mail.gmail.com>
Subject: Re: [docs] [PATCH] Update autobuilder URLs to valkyrie
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: antonin.godard@bootlin.com, docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000f17127062b9b4c32"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 19:17:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6092

--000000000000f17127062b9b4c32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is a reproducible on a debian worker at
https://valkyrie.yoctoproject.org/#/builders/37/builds/823.

The distro specific reproducible builds haven't run in awhile. Even on the
typhoon AB they stopped running 3 years before the switch to valkyrie as
far as I can tell.


On Mon, Jan 13, 2025 at 7:05=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de>
wrote:

> Hi Michael, Antonin,
>
> On 12/28/24 9:45 PM, Michael Halstead via lists.yoctoproject.org wrote:
> > Looking over this patch I think it would be better to move the typhoon
> > archive and valkyrie onto the same server.
> >
> >
> >     - https://autobuilder.yoctoproject.org/typhoon/#/
> >     - https://autobuilder.yoctoproject.org/valkryie/#/
> >
> >
> > I will redirect from valkyrie.yoctoproject.org to
> > https://autobuilder.yoctoproject.org/valkryie/#/
> >
>
> This redirects to https://autobuilder.yoctoproject.org/typhoon/valkryie/#=
/
>
> [...]
>
> >> --  CentOS: :yocto_ab:`/typhoon/#/builders/reproducible-centos`
> >> --  Debian: :yocto_ab:`/typhoon/#/builders/reproducible-debian`
> >> --  Fedora: :yocto_ab:`/typhoon/#/builders/reproducible-fedora`
> >> --  Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducible-ubuntu`
> >> +-  CentOS: :yocto_ab:`/#/builders/reproducible-centos`
> >> +-  Debian: :yocto_ab:`/#/builders/reproducible-debian`
> >> +-  Fedora: :yocto_ab:`/#/builders/reproducible-fedora`
> >> +-  Ubuntu: :yocto_ab:`/#/builders/reproducible-ubuntu`
> >>
>
> Am I supposed to see anything at
> https://valkyrie.yoctoproject.org/#/builders/reproducible-debian? I only
> have None in all Build requests, Build times, Success Rate... Same for
> all other builders.
>
> Cheers,
> Quentin
>


--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000f17127062b9b4c32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is a reproducible on a debian worker at <a href=3D"h=
ttps://valkyrie.yoctoproject.org/#/builders/37/builds/823">https://valkyrie=
.yoctoproject.org/#/builders/37/builds/823</a>.<div><br></div><div>The dist=
ro specific reproducible=C2=A0builds haven&#39;t run in awhile. Even on the=
 typhoon AB they stopped running 3 years before the switch to valkyrie as f=
ar as I can tell.<br><div><br></div></div></div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan=
 13, 2025 at 7:05=E2=80=AFAM Quentin Schulz &lt;<a href=3D"mailto:quentin.s=
chulz@cherry.de">quentin.schulz@cherry.de</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi Michael, Antonin,<br>
<br>
On 12/28/24 9:45 PM, Michael Halstead via <a href=3D"http://lists.yoctoproj=
ect.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wr=
ote:<br>
&gt; Looking over this patch I think it would be better to move the typhoon=
<br>
&gt; archive and valkyrie onto the same server.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- <a href=3D"https://autobuilder.yoctoproject.org/t=
yphoon/#/" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopr=
oject.org/typhoon/#/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0- <a href=3D"https://autobuilder.yoctoproject.org/v=
alkryie/#/" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctop=
roject.org/valkryie/#/</a><br>
&gt; <br>
&gt; <br>
&gt; I will redirect from <a href=3D"http://valkyrie.yoctoproject.org" rel=
=3D"noreferrer" target=3D"_blank">valkyrie.yoctoproject.org</a> to<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkryie/#/" rel=3D"no=
referrer" target=3D"_blank">https://autobuilder.yoctoproject.org/valkryie/#=
/</a><br>
&gt; <br>
<br>
This redirects to <a href=3D"https://autobuilder.yoctoproject.org/typhoon/v=
alkryie/#/" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctop=
roject.org/typhoon/valkryie/#/</a><br>
<br>
[...]<br>
<br>
&gt;&gt; --=C2=A0 CentOS: :yocto_ab:`/typhoon/#/builders/reproducible-cento=
s`<br>
&gt;&gt; --=C2=A0 Debian: :yocto_ab:`/typhoon/#/builders/reproducible-debia=
n`<br>
&gt;&gt; --=C2=A0 Fedora: :yocto_ab:`/typhoon/#/builders/reproducible-fedor=
a`<br>
&gt;&gt; --=C2=A0 Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducible-ubunt=
u`<br>
&gt;&gt; +-=C2=A0 CentOS: :yocto_ab:`/#/builders/reproducible-centos`<br>
&gt;&gt; +-=C2=A0 Debian: :yocto_ab:`/#/builders/reproducible-debian`<br>
&gt;&gt; +-=C2=A0 Fedora: :yocto_ab:`/#/builders/reproducible-fedora`<br>
&gt;&gt; +-=C2=A0 Ubuntu: :yocto_ab:`/#/builders/reproducible-ubuntu`<br>
&gt;&gt;<br>
<br>
Am I supposed to see anything at <br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/reproducible-debian=
" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctoproject.org/#/=
builders/reproducible-debian</a>? I only <br>
have None in all Build requests, Build times, Success Rate... Same for <br>
all other builders.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Pr=
oject</div><div>Systems Operations Engineer</div></div></div>

--000000000000f17127062b9b4c32--

