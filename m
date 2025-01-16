Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BA4E77188
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 07:24:58 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.43291.1737012295211876220
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 23:24:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eOxf0X9j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.50, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e3778bffdso726546e87.0
        for <docs@lists.yoctoproject.org>; Wed, 15 Jan 2025 23:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737012293; x=1737617093; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iI0nBXAWlORzNmTGUy2yorD7SqPr9SeF/r8fWWuenzQ=;
        b=eOxf0X9jnf/c9MPYNFqpgj8r0PJPBmTPZpoMyQ1KlRZbOaFgnJ/I4K+fmsTx5OBMMz
         QTkqdfDf+bE2lLB9EukbyFbQYzrTUZLAbOF6/Rw82eWa+xhogNzpoQHNhcq06i6ancSU
         3kQTlbXbB2Pgn3ubRfvV+TsDPCa4dQKP5Z2RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012293; x=1737617093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iI0nBXAWlORzNmTGUy2yorD7SqPr9SeF/r8fWWuenzQ=;
        b=dfaTdsZZnDM0CF3lS0cRNDXjM9iuLvoDFSZDlTFbqhTCtIkw2rJuaHGoXl6bBuATsT
         lFtj+oeL3bdXt40Y6PqgjM7EL5TtAESUMKwWLDsaplfIO00pcyB5Cdpgtf5eA/Bg3lJ9
         /EmgF5iGqqLBpZMXSjJxTCU/Jg8MEkJt49wRxJBwrmt7olS5jGlQYdOSXtVCG4xS1SE+
         pXFIiTwwpND0L3p6y9WGRCrewhyNCcvX0DFxUuQWu5Zq2d/OIxS1wVeqOZx4MXP0iaXm
         7Pbh4JqBLx0H6iLCajzTno7dMZPQtDnrWMFJnOs9yeqldnrL1TT6w2Q6SQT2gBtpeffU
         WAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnkCqLZYH30fh3N6clq8GcoeHEAdGmpkDOa31Fv2EcvXw0IjF4RpvYZG61Wg6CXPNiakhx@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxXQPLfMsm+Z7PXTaU3q4BvLW9BaOZQrn404Ly9zKeRyHFoBAH6
	3V3n3XAZQZoymvG7aJ+bFleVwdASL+LSawTtgzwZts2O7AI7PlDsblTqDayDQieDTzh5topfXRK
	Rt62aiUwkNi66b5rXKOvCW/hybts9HH+D5EGCjw==
X-Gm-Gg: ASbGncuY7//F+G6lvrRomWxGfjQxlyS6v2IY+f7U/bu1fbrFqfWhMbS/4moLkUbuEfI
	MD+/mWSd8D89Mc42ywOyV8uaA/oHa2zTRbRAtwIeqArXGVdJW+lHcX/bCYQAdXSG7uPmHbxGA
X-Google-Smtp-Source: AGHT+IGhQ+gctIGiDHn79pC23W4mFQsNESow+bw0rb9ycxjGBXIgg+4TMnzvrKNfhJqCBZutfAhopRxI5xjoqiXjBBg=
X-Received: by 2002:a05:6512:159e:b0:542:98bb:5674 with SMTP id
 2adb3069b0e04-54298bb57famr6141492e87.33.1737012293030; Wed, 15 Jan 2025
 23:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20241227-update-autobuilder-link-v1-1-6c1ec14a32fd@bootlin.com>
 <CADfgfobhK_b+kyi2QDFbMR1=CkKziGTFdMCX1SGxkJ7VmR+i_A@mail.gmail.com>
 <3fee6045-ef55-42ac-9dfd-e3b6a07e02de@cherry.de> <76df28efd27f93840ce4e7a8c9e8f8af8acf8c72.camel@linuxfoundation.org>
 <7ccefc90-b4c1-462c-a542-1b56e1a82580@cherry.de>
In-Reply-To: <7ccefc90-b4c1-462c-a542-1b56e1a82580@cherry.de>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 15 Jan 2025 21:24:41 -1000
X-Gm-Features: AbW1kvY2zi_MJRcX23ee3D_iDggM0vWoWNeRPC2JrrDdR4e-tC3UfShHQ9VNEYQ
Message-ID: <CADfgfoacojrmdjz_akb-JNjtkAeEuW7=q36_vNCv94Zeec+new@mail.gmail.com>
Subject: Re: [docs] [PATCH] Update autobuilder URLs to valkyrie
To: antonin.godard@bootlin.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000b26c0e062bcdb089"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jan 2025 07:24:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6119

--000000000000b26c0e062bcdb089
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The changes are complete. https://autobuilder.yoctoproject.org/valkyrie/#/
and https://autobuilder.yoctoproject.org/typhoon/#/ are both running now.

On Tue, Jan 14, 2025 at 12:13=E2=80=AFAM Quentin Schulz <quentin.schulz@che=
rry.de>
wrote:

> Hi Richard, Antonin,
>
> On 1/13/25 11:09 PM, Richard Purdie wrote:
> > On Mon, 2025-01-13 at 18:05 +0100, Quentin Schulz via
> lists.yoctoproject.org wrote:
> >>>> --  CentOS: :yocto_ab:`/typhoon/#/builders/reproducible-centos`
> >>>> --  Debian: :yocto_ab:`/typhoon/#/builders/reproducible-debian`
> >>>> --  Fedora: :yocto_ab:`/typhoon/#/builders/reproducible-fedora`
> >>>> --  Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducible-ubuntu`
> >>>> +-  CentOS: :yocto_ab:`/#/builders/reproducible-centos`
> >>>> +-  Debian: :yocto_ab:`/#/builders/reproducible-debian`
> >>>> +-  Fedora: :yocto_ab:`/#/builders/reproducible-fedora`
> >>>> +-  Ubuntu: :yocto_ab:`/#/builders/reproducible-ubuntu`
> >>>>
> >>
> >> Am I supposed to see anything at
> >> https://valkyrie.yoctoproject.org/#/builders/reproducible-debian? I
> only
> >> have None in all Build requests, Build times, Success Rate... Same for
> >> all other builders.
> >
> > Initially when we implemented reproducible builds, we ran then on
> > multiple distros explicitly. Over time the errors subsided and we
> > eventually decided it was good enough to test this on a distro at
> > random. We therefore just do that now and no longer use the distro
> > specific targets. They were left around just in case we needed them.
> > You therefore want the plain "reproducible" target rather than the
> > distro specific ones.
> >
>
> Thanks for the info, we need to update the docs to reflect that change
> then, otherwise it looks like we're not doing reproducible builds at all
> anymore :)
>
> Cheers,
> Quentin
>


--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000b26c0e062bcdb089
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The changes are complete. <a href=3D"https://autobuilder.y=
octoproject.org/valkyrie/#/">https://autobuilder.yoctoproject.org/valkyrie/=
#/</a> and <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/">http=
s://autobuilder.yoctoproject.org/typhoon/#/</a> are both running now.=C2=A0=
</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Jan 14, 2025 at 12:13=E2=80=AFAM Quentin Schu=
lz &lt;<a href=3D"mailto:quentin.schulz@cherry.de">quentin.schulz@cherry.de=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi Richard, Antonin,<br>
<br>
On 1/13/25 11:09 PM, Richard Purdie wrote:<br>
&gt; On Mon, 2025-01-13 at 18:05 +0100, Quentin Schulz via <a href=3D"http:=
//lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctop=
roject.org</a> wrote:<br>
&gt;&gt;&gt;&gt; --=C2=A0 CentOS: :yocto_ab:`/typhoon/#/builders/reproducib=
le-centos`<br>
&gt;&gt;&gt;&gt; --=C2=A0 Debian: :yocto_ab:`/typhoon/#/builders/reproducib=
le-debian`<br>
&gt;&gt;&gt;&gt; --=C2=A0 Fedora: :yocto_ab:`/typhoon/#/builders/reproducib=
le-fedora`<br>
&gt;&gt;&gt;&gt; --=C2=A0 Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducib=
le-ubuntu`<br>
&gt;&gt;&gt;&gt; +-=C2=A0 CentOS: :yocto_ab:`/#/builders/reproducible-cento=
s`<br>
&gt;&gt;&gt;&gt; +-=C2=A0 Debian: :yocto_ab:`/#/builders/reproducible-debia=
n`<br>
&gt;&gt;&gt;&gt; +-=C2=A0 Fedora: :yocto_ab:`/#/builders/reproducible-fedor=
a`<br>
&gt;&gt;&gt;&gt; +-=C2=A0 Ubuntu: :yocto_ab:`/#/builders/reproducible-ubunt=
u`<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Am I supposed to see anything at<br>
&gt;&gt; <a href=3D"https://valkyrie.yoctoproject.org/#/builders/reproducib=
le-debian" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctoproje=
ct.org/#/builders/reproducible-debian</a>? I only<br>
&gt;&gt; have None in all Build requests, Build times, Success Rate... Same=
 for<br>
&gt;&gt; all other builders.<br>
&gt; <br>
&gt; Initially when we implemented reproducible builds, we ran then on<br>
&gt; multiple distros explicitly. Over time the errors subsided and we<br>
&gt; eventually decided it was good enough to test this on a distro at<br>
&gt; random. We therefore just do that now and no longer use the distro<br>
&gt; specific targets. They were left around just in case we needed them.<b=
r>
&gt; You therefore want the plain &quot;reproducible&quot; target rather th=
an the<br>
&gt; distro specific ones.<br>
&gt; <br>
<br>
Thanks for the info, we need to update the docs to reflect that change <br>
then, otherwise it looks like we&#39;re not doing reproducible builds at al=
l <br>
anymore :)<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Pr=
oject</div><div>Systems Operations Engineer</div></div></div>

--000000000000b26c0e062bcdb089--

