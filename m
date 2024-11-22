Return-Path: <guenael.muller@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAF1E65D3A
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 09:22:54 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.20396.1732267370488337664
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Nov 2024 01:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YJlpojIw;
 spf=pass (domain: smile.fr, ip: 209.85.208.179, mailfrom: guenael.muller@smile.fr)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb561f273eso21295771fa.2
        for <docs@lists.yoctoproject.org>; Fri, 22 Nov 2024 01:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732267369; x=1732872169; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+n0i+1T9OUOBQM1wzGU8zI+/DeBL9DIw3uR80Bfnzs=;
        b=YJlpojIwnk2WY6YjYUeRZnC2aTJpvsDUbeMKsy1OPAXgPRrGRBU/AORpfv8MJ/FjfL
         etbvqZ8q7LC5HbjCHHrLD3NP04gz59MLqosSesMm3Rsm2xeggUq2g2WuHgzNwKUA4C/F
         XD00/f/JyHjx+PMcM6OshFCgNJlLvKTWszvQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732267369; x=1732872169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+n0i+1T9OUOBQM1wzGU8zI+/DeBL9DIw3uR80Bfnzs=;
        b=IM8s1I5+ptWg5i2E5iqsut0Zibo7EFyBwTxZr3RcVEpc3HwBitJdlLwOCMGZPFsLnw
         Qy3FFX/HiXw1sBpsTK/v7Y6tRoZFRNLYxd6ahNO27i9HtXSAfbd5gFXq12Qz0fDm6C/m
         KupgPzNksJ2x1i+0YEY4U+cksRNBdvDaxtQKz+2EEpNTyfKYrz4ayDCVUow196glJJ0X
         LicT+ocluqxG0SzD1BLy0lJ3D/TXOPNP3367x78ek3QZ0okIhIkHc0ZQx3RWRweFcvGr
         fs63NC7etRwvW46oj8C++a3TRZkD+EkCLCKvJIb7AuUHkDXXHnG4u1wD1FbFbOY68u7H
         xiaA==
X-Forwarded-Encrypted: i=1; AJvYcCViFa/s1vR4r84YBz+2PRz0jLzONiiVXeyam7EA6+omNwuZLhYQFuyTCM4+saMtDBNv8SrP@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy2eess98KJ7+xRp3TmaQdQwl8MgayY3u86g+JvPU08mJncI9G0
	nX86qta00zUSnTE9owAiCBdsbgyXkiqZkNRNcAS5M1hJ3eSo3YvhjrX4Ykh9gov3RgUfvZOAvDm
	bEJNGmbMuaAShNdJrOn7EoKcc2zs8j4uE2T2X3A==
X-Gm-Gg: ASbGncs3XQyMW6cRdRMdFUtmVi6/ZtTEyFKMBzcxOMdT4EbPP6bBNvQFVMLnW9vcQ8A
	bH2LPrdnyvi/BW7cLbnIk/J4gvWPNGsdVTlGgy6AXqw/T11sHIJTrXJGSdQwjjHbi
X-Google-Smtp-Source: AGHT+IGEQXTFDnd3z1hvaonZyNK139jXLgcNFvl0CRlx4B8CfVN+apG0t/Db1TqhGfCUs9AiiqjGBcZ+Jyx1zhFe1rA=
X-Received: by 2002:a05:651c:2118:b0:2fb:4a63:92c0 with SMTP id
 38308e7fff4ca-2ffa71068bemr10122151fa.14.1732267368456; Fri, 22 Nov 2024
 01:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20241118104524.25392-1-guenael.muller@smile.fr>
 <D5P93P1O12UG.NQJAUDP1T6Z8@bootlin.com> <299a188d-c7a9-4604-a491-9efb3888e7ba@cherry.de>
 <D5R5N6X7BUEX.2BBRC9BZR37GE@bootlin.com>
In-Reply-To: <D5R5N6X7BUEX.2BBRC9BZR37GE@bootlin.com>
From: =?UTF-8?B?R3XDqW5hw6tsIE1VTExFUg==?= <guenael.muller@smile.fr>
Date: Fri, 22 Nov 2024 10:25:27 +0100
Message-ID: <CAEbF956c=1Bk_GnSc7hxg6btAjXUVxHDbyL=pZykaRQsANV1kA@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] ref-manual: use standardized method accross
 both ubuntu and debian for locale install
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: quentin.schulz@cherry.de, docs@lists.yoctoproject.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="0000000000002746e706277ced8c"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Nov 2024 09:22:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5793

--0000000000002746e706277ced8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin, Antonin,

On Tue, Nov 19, 2024 at 10:28=E2=80=AFAM Quentin Schulz <quentin.schulz@che=
rry.de>
wrote:

> Hi Anotnin, Gu=C3=A9na=C3=ABl,
>
> On 11/18/24 12:00 PM, Antonin Godard via lists.yoctoproject.org wrote:
> > Hi Gu=C3=A9na=C3=ABl,
> >
> > On Mon Nov 18, 2024 at 11:45 AM CET, Gu=C3=A9na=C3=ABl Muller wrote:
> >> Modify locale installation method to be standard accross all
> debian-based distributions.
> >> Pre-existing method is available only on Ubuntu, locale-gen tool has n=
o
> parameter in Debian.
> >>
> >> Signed-off-by: Gu=C3=A9na=C3=ABl Muller <guenael.muller@smile.fr>
> >> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> >> Tested-by: Antonin Godard <antonin.godard@bootlin.com>
> >> ---
> >>   documentation/poky.yaml.in                       | 3 +--
> >>   documentation/ref-manual/system-requirements.rst | 8 ++++++++
> >>   2 files changed, 9 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> >> index c770318f2..66f758fe8 100644
> >> --- a/documentation/poky.yaml.in
> >> +++ b/documentation/poky.yaml.in
> >> @@ -13,8 +13,7 @@ YOCTO_RELEASE_DL_URL :
> "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> >>   UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip
> texinfo gcc \
> >>        build-essential chrpath socat cpio python3 python3-pip
> python3-pexpect \
> >>        xz-utils debianutils iputils-ping python3-git python3-jinja2 \
> >> -     python3-subunit zstd liblz4-tool file locales libacl1
> >> -     \n\   $ sudo locale-gen en_US.UTF-8"
> >> +     python3-subunit zstd liblz4-tool file locales libacl1"
> >>   FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip
> python3 unzip perl patch \
> >>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo
> chrpath \
> >>        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue
> perl-bignum socat \
> >> diff --git a/documentation/ref-manual/system-requirements.rst
> b/documentation/ref-manual/system-requirements.rst
> >> index 0fc92550a..b33518c7f 100644
> >> --- a/documentation/ref-manual/system-requirements.rst
> >> +++ b/documentation/ref-manual/system-requirements.rst
> >> @@ -152,6 +152,14 @@ with a supported Ubuntu or Debian Linux
> distribution::
> >>
> >>      $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
> >>
> >> +You also need to ensure you have the locale ``en_US.UTF-8`` enabled::
> >> +
>
> I believe "the ``en_US.UTF-8`` locale" is more proper here.
>

You're Right.


>
> On a side note, what's the actual cost of reconfiguring the locales
> regardless of the presence of en_US.UTF-8?
>

It may take some time depending on how many locales are enabled. The
command is build to generate all enabled locales, it should be technically
possible to generate only one (it's a bash script) but as far I know there
is no such thing in the Debian package from Debian 12.


> My point being we could probably have this command in poky.yaml.in like
> it used to be?
>

> >> +   $ locale --all-locales | grep en_US.utf8
> >> +
> >> +If this is not the case, you can reconfigure the ``locales`` package
> to add it::
> >> +
> >> +   $ sudo dpkg-reconfigure locales
> >> +
>
> How does this actually generate en_US.utf8 locale if we don't explicitly
> add it somewhere? Are you sure it's not because your system has LANG or
> LC_ALL set to that locale and then calling reconfigure it regenerate it?
>
> This runs an interactive program where you have to select explicitly that
you want to add this locale, there is no magic.
The other solution to do similar thing is modifying `/etc/locale.gen` which
seems not more straightforward for me.
I tried it on both podman (container) and classic environnement and it
works correctly.

Also on a side note we tell people to check if "en_US.UTF-8" locale is
> enabled by grepping for "en_US.utf8", is that expected? Why aren't they
> the same?
>
> Cheers,
> Quentin
>


On Wed, Nov 20, 2024 at 5:43=E2=80=AFPM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> Hi Gu=C3=A9na=C3=ABl, Quentin,
>
> On Tue Nov 19, 2024 at 10:28 AM CET, Quentin Schulz via
> lists.yoctoproject.org wrote:
> [...]
> >>> +You also need to ensure you have the locale ``en_US.UTF-8`` enabled:=
:
> >>> +
> >
> > I believe "the ``en_US.UTF-8`` locale" is more proper here.
> >
> > On a side note, what's the actual cost of reconfiguring the locales
> > regardless of the presence of en_US.UTF-8?
> >
> > My point being we could probably have this command in poky.yaml.in like
> > it used to be?
> >
> >>> +   $ locale --all-locales | grep en_US.utf8
> >>> +
> >>> +If this is not the case, you can reconfigure the ``locales`` package
> to add it::
> >>> +
> >>> +   $ sudo dpkg-reconfigure locales
> >>> +
> >
> > How does this actually generate en_US.utf8 locale if we don't explicitl=
y
> > add it somewhere? Are you sure it's not because your system has LANG or
> > LC_ALL set to that locale and then calling reconfigure it regenerate it=
?
> >
> > Also on a side note we tell people to check if "en_US.UTF-8" locale is
> > enabled by grepping for "en_US.utf8", is that expected? Why aren't they
> > the same?
>
> Yes, "locale --all-locales" does return "en_US.utf8" while we install the
> "en_US.UTF-8" locale (different string, not sure why).
>
> I seem to be able to build with both Debian/Ubuntu with this command:
>
>   LANG=3D"en_US.UTF-8" locale-gen
>
> Maybe this is a more straightforward approach, closer to what we had
> before.
> What do you think? Gu=C3=A9na=C3=ABl would you be able to update your pat=
ch with this
> command if this works for you too?
>
>
How do you achieve this ? I tried this with podman container (should be the
same with docker) and it clearly doesn't work at all:

podman run -it --rm debian:12 /bin/bash
apt update && apt install locales -y
LANG=3D"en_US.UTF-8" locale-gen

This generates zero locale whereas "dpkg-reconfigure locales" work as
expected.



>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



Gu=C3=A9na=C3=ABl

--0000000000002746e706277ced8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Quentin, Antonin,<br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov =
19, 2024 at 10:28=E2=80=AFAM Quentin Schulz &lt;<a href=3D"mailto:quentin.s=
chulz@cherry.de" target=3D"_blank">quentin.schulz@cherry.de</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Anotnin, Gu=
=C3=A9na=C3=ABl,<br>
<br>
On 11/18/24 12:00 PM, Antonin Godard via <a href=3D"http://lists.yoctoproje=
ct.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wro=
te:<br>
&gt; Hi Gu=C3=A9na=C3=ABl,<br>
&gt; <br>
&gt; On Mon Nov 18, 2024 at 11:45 AM CET, Gu=C3=A9na=C3=ABl Muller wrote:<b=
r>
&gt;&gt; Modify locale installation method to be standard accross all debia=
n-based distributions.<br>
&gt;&gt; Pre-existing method is available only on Ubuntu, locale-gen tool h=
as no parameter in Debian.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Gu=C3=A9na=C3=ABl Muller &lt;<a href=3D"mailto:guen=
ael.muller@smile.fr" target=3D"_blank">guenael.muller@smile.fr</a>&gt;<br>
&gt;&gt; Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile=
.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;&gt; Tested-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@boo=
tlin.com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0documentation/<a href=3D"http://poky.yaml.in" rel=3D"n=
oreferrer" target=3D"_blank">poky.yaml.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +--<br>
&gt;&gt;=C2=A0 =C2=A0documentation/ref-manual/system-requirements.rst | 8 +=
+++++++<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 9 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/documentation/<a href=3D"http://poky.yaml.in" rel=3D"=
noreferrer" target=3D"_blank">poky.yaml.in</a> b/documentation/<a href=3D"h=
ttp://poky.yaml.in" rel=3D"noreferrer" target=3D"_blank">poky.yaml.in</a><b=
r>
&gt;&gt; index c770318f2..66f758fe8 100644<br>
&gt;&gt; --- a/documentation/<a href=3D"http://poky.yaml.in" rel=3D"norefer=
rer" target=3D"_blank">poky.yaml.in</a><br>
&gt;&gt; +++ b/documentation/<a href=3D"http://poky.yaml.in" rel=3D"norefer=
rer" target=3D"_blank">poky.yaml.in</a><br>
&gt;&gt; @@ -13,8 +13,7 @@ YOCTO_RELEASE_DL_URL : &quot;&amp;YOCTO_DL_URL;/=
releases/yocto/yocto-&amp;DISTRO;&quot;<br>
&gt;&gt;=C2=A0 =C2=A0UBUNTU_HOST_PACKAGES_ESSENTIAL : &quot;gawk wget git d=
iffstat unzip texinfo gcc \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 build-essential chrpath socat cpio pyth=
on3 python3-pip python3-pexpect \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 xz-utils debianutils iputils-ping pytho=
n3-git python3-jinja2 \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0python3-subunit zstd liblz4-tool file locales=
 libacl1<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0\n\=C2=A0 =C2=A0$ sudo locale-gen en_US.UTF-8=
&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0python3-subunit zstd liblz4-tool file locales=
 libacl1&quot;<br>
&gt;&gt;=C2=A0 =C2=A0FEDORA_HOST_PACKAGES_ESSENTIAL : &quot;gawk make wget =
tar bzip2 gzip python3 unzip perl patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 diffutils diffstat git cpp gcc gcc-c++ =
glibc-devel texinfo chrpath \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ccache perl-Data-Dumper perl-Text-Parse=
Words perl-Thread-Queue perl-bignum socat \<br>
&gt;&gt; diff --git a/documentation/ref-manual/system-requirements.rst b/do=
cumentation/ref-manual/system-requirements.rst<br>
&gt;&gt; index 0fc92550a..b33518c7f 100644<br>
&gt;&gt; --- a/documentation/ref-manual/system-requirements.rst<br>
&gt;&gt; +++ b/documentation/ref-manual/system-requirements.rst<br>
&gt;&gt; @@ -152,6 +152,14 @@ with a supported Ubuntu or Debian Linux distr=
ibution::<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 $ sudo apt install &amp;UBUNTU_HOST_PACKAGES_E=
SSENTIAL;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; +You also need to ensure you have the locale ``en_US.UTF-8`` enabl=
ed::<br>
&gt;&gt; +<br>
<br>
I believe &quot;the ``en_US.UTF-8`` locale&quot; is more proper here.<br></=
blockquote><div><br></div><div>You&#39;re Right.<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On a side note, what&#39;s the actual cost of reconfiguring the locales <br=
>
regardless of the presence of en_US.UTF-8?<br></blockquote><div><br></div><=
div>It
 may take some time depending on how many locales are enabled. The=20
command is build to generate all enabled locales, it should be technically =
possible to generate only one (it&#39;s a bash script) but as far I know th=
ere is no such thing in the Debian package from Debian 12.<br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
My point being we could probably have this command in <a href=3D"http://pok=
y.yaml.in" rel=3D"noreferrer" target=3D"_blank">poky.yaml.in</a> like <br>
it used to be?<br></blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt;&gt; +=C2=A0 =C2=A0$ locale --all-locales | grep en_US.utf8<br>
&gt;&gt; +<br>
&gt;&gt; +If this is not the case, you can reconfigure the ``locales`` pack=
age to add it::<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0$ sudo dpkg-reconfigure locales<br>
&gt;&gt; +<br>
<br>
How does this actually generate en_US.utf8 locale if we don&#39;t explicitl=
y <br>
add it somewhere? Are you sure it&#39;s not because your system has LANG or=
 <br>
LC_ALL set to that locale and then calling reconfigure it regenerate it?<br=
>
<br></blockquote><div>This runs an interactive program where you have to se=
lect explicitly that you want to add this locale, there is no magic.</div><=
div>The other solution to do similar thing is modifying `/etc/locale.gen` w=
hich seems not more straightforward for me.</div><div>I tried it on both po=
dman (container) and classic environnement and it works correctly.</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Also on a side note we tell people to check if &quot;en_US.UTF-8&quot; loca=
le is <br>
enabled by grepping for &quot;en_US.utf8&quot;, is that expected? Why aren&=
#39;t they <br>
the same?<br>
<br>
Cheers,<br>
Quentin<br></blockquote><div><br></div><div><br></div><div><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 20, 2024 at 5:=
43=E2=80=AFPM Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.c=
om" target=3D"_blank">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi Gu=C3=A9na=C3=ABl, Quent=
in,<br>
<br>
On Tue Nov 19, 2024 at 10:28 AM CET, Quentin Schulz via <a href=3D"http://l=
ists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproj=
ect.org</a> wrote:<br>
[...]<br>
&gt;&gt;&gt; +You also need to ensure you have the locale ``en_US.UTF-8`` e=
nabled::<br>
&gt;&gt;&gt; +<br>
&gt;<br>
&gt; I believe &quot;the ``en_US.UTF-8`` locale&quot; is more proper here.<=
br>
&gt;<br>
&gt; On a side note, what&#39;s the actual cost of reconfiguring the locale=
s <br>
&gt; regardless of the presence of en_US.UTF-8?<br>
&gt;<br>
&gt; My point being we could probably have this command in <a href=3D"http:=
//poky.yaml.in" rel=3D"noreferrer" target=3D"_blank">poky.yaml.in</a> like =
<br>
&gt; it used to be?<br>
&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0$ locale --all-locales | grep en_US.utf8<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +If this is not the case, you can reconfigure the ``locales`` =
package to add it::<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0$ sudo dpkg-reconfigure locales<br>
&gt;&gt;&gt; +<br>
&gt;<br>
&gt; How does this actually generate en_US.utf8 locale if we don&#39;t expl=
icitly <br>
&gt; add it somewhere? Are you sure it&#39;s not because your system has LA=
NG or <br>
&gt; LC_ALL set to that locale and then calling reconfigure it regenerate i=
t?<br>
&gt;<br>
&gt; Also on a side note we tell people to check if &quot;en_US.UTF-8&quot;=
 locale is <br>
&gt; enabled by grepping for &quot;en_US.utf8&quot;, is that expected? Why =
aren&#39;t they <br>
&gt; the same?<br>
<br>
Yes, &quot;locale --all-locales&quot; does return &quot;en_US.utf8&quot; wh=
ile we install the<br>
&quot;en_US.UTF-8&quot; locale (different string, not sure why).<br>
<br>
I seem to be able to build with both Debian/Ubuntu with this command:<br>
<br>
=C2=A0 LANG=3D&quot;en_US.UTF-8&quot; locale-gen<br>
<br>
Maybe this is a more straightforward approach, closer to what we had before=
.<br>
What do you think? Gu=C3=A9na=C3=ABl would you be able to update your patch=
 with this<br>
command if this works for you too?<br>
<br></blockquote><div><br></div><div>How do you achieve this ? I tried this=
 with podman container (should be the same with docker) and it clearly does=
n&#39;t work at all:</div><div><br></div><div style=3D"margin-left:40px">po=
dman run -it --rm debian:12 /bin/bash</div><div style=3D"margin-left:40px">=
apt update &amp;&amp; apt install locales -y</div><div style=3D"margin-left=
:40px">LANG=3D&quot;en_US.UTF-8&quot; locale-gen</div><div><br></div><div>T=
his generates zero locale whereas &quot;dpkg-reconfigure locales&quot; work=
 as expected.<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote></div>=C2=A0</div></div></div><div><br></div>=
<div>Gu=C3=A9na=C3=ABl<br></div>
</div>

--0000000000002746e706277ced8c--

