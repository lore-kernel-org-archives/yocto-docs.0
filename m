Return-Path: <guenael.muller@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1274CD58D54
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:36:35 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.20094.1732545384336853352
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 06:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KK2MVhbd;
 spf=pass (domain: smile.fr, ip: 209.85.208.170, mailfrom: guenael.muller@smile.fr)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffa8092e34so36363251fa.1
        for <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 06:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732545382; x=1733150182; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nX2RqRfHeh6BoEgAKk6sMTcmfDoLxaOIFz9Xi54utmk=;
        b=KK2MVhbd8pstu2x9/ycrWaLxkCcSmBzSa89k2KXidygdTAinCPVShbdonn3TJ4GYQw
         fUqKPGW0vpCOPFtxPX7kzm8XlsVjPxa/QP4hHFxlv6NtMSnV8c3vrce1OrBDX3qps7iO
         yFoFTwVIgLoAhKJ5DVcCqCpco+PzoslIPYK1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545382; x=1733150182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nX2RqRfHeh6BoEgAKk6sMTcmfDoLxaOIFz9Xi54utmk=;
        b=wH0HPh2xAa6jc0h1kLQay0yZQVGg+5wOOlXkECkh4Ht3PWiUsMWGS2YexJc5sIgYoD
         jigoY2izU/Auqy22L/FWVYi8jnAeg11ToznGz63OLgRAheaKDdqJRYT/eLgiMmISZ353
         +/4hBIuvJZIDutZEfUrTIPhA7JVm6Jyzb9ptpOWID4813Xz0nmA+E6V5gzAfviQaxvGh
         BYVNXZRqYzKoy+b1jfInHBKjtX1bRFnAETh7vnR6pEjgqRIhbD1/XTH2AXfO26NCeO1F
         sFkOW91abk+OznrpLaDI62fer7RwybAwlCgnHCMMLFr5rYmBGowJ93B4NDl5CPlJuiwM
         hJcg==
X-Forwarded-Encrypted: i=1; AJvYcCVgRU/o7tHxABbNMmF1fcgw5KBz383QN63D2itObNV9C4+LWfRZX0mhoPwbSSV+NNyw3w6W@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwKw3T/SMbJJdI2uHh5IGZeWO5kp17JRSspJe+5oxEQuRaeyO6Y
	jdXyI/iCl25/Cr4inqXYR2Eyhj/1vK16jdUNQWFM2na87RZ2EImw9b7O4Xs/GYUAslkb+qw7m+f
	ycUA3i2V4zEwx4z5z8m3uE3lht2f37Fqc7ujHpA==
X-Gm-Gg: ASbGncuCPy9hkpuj3qw7+TzSadS6gJHS/T1mTa6puT5m198LeV9Uqlrgy4Fw46twnL9
	w7lKF+p54mq2NYKo8IytDNLRAxl36
X-Google-Smtp-Source: AGHT+IHJgxaOIQsEMbeC03Gq6o3w6uzUSc6t3psEDqW5Kix3hjvbgJ2C1hIV1shC8lJ3BFhK7GDGIGzR5ZBRhgqXKJU=
X-Received: by 2002:a2e:a551:0:b0:2fc:a347:6d87 with SMTP id
 38308e7fff4ca-2ffa7117adfmr58271491fa.13.1732545382414; Mon, 25 Nov 2024
 06:36:22 -0800 (PST)
MIME-Version: 1.0
References: <20241118104524.25392-1-guenael.muller@smile.fr>
 <D5P93P1O12UG.NQJAUDP1T6Z8@bootlin.com> <299a188d-c7a9-4604-a491-9efb3888e7ba@cherry.de>
 <D5R5N6X7BUEX.2BBRC9BZR37GE@bootlin.com> <CAEbF956c=1Bk_GnSc7hxg6btAjXUVxHDbyL=pZykaRQsANV1kA@mail.gmail.com>
 <853f05e1-68a7-410c-97dc-1380e64c7721@cherry.de>
In-Reply-To: <853f05e1-68a7-410c-97dc-1380e64c7721@cherry.de>
From: =?UTF-8?B?R3XDqW5hw6tsIE1VTExFUg==?= <guenael.muller@smile.fr>
Date: Mon, 25 Nov 2024 15:39:09 +0100
Message-ID: <CAEbF956MhH+YVmng85XageBFwb9yA8w4KOo_2K7Kcawy1j5Qnw@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] ref-manual: use standardized method accross
 both ubuntu and debian for locale install
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="0000000000001399d70627bda860"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 14:36:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5799

--0000000000001399d70627bda860
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin, Hi Quentin.

On Mon, Nov 25, 2024 at 11:19=E2=80=AFAM Quentin Schulz <quentin.schulz@che=
rry.de>
wrote:

> Hi Gu=C3=A9na=C3=ABl,
>
> On 11/22/24 10:25 AM, Gu=C3=A9na=C3=ABl MULLER wrote:
> > Hi Quentin, Antonin,
> >
> > On Tue, Nov 19, 2024 at 10:28=E2=80=AFAM Quentin Schulz <
> quentin.schulz@cherry.de>
> > wrote:
> >
> >> Hi Anotnin, Gu=C3=A9na=C3=ABl,
> >>
> >> On 11/18/24 12:00 PM, Antonin Godard via lists.yoctoproject.org wrote:
> >>> Hi Gu=C3=A9na=C3=ABl,
> >>>
> >>> On Mon Nov 18, 2024 at 11:45 AM CET, Gu=C3=A9na=C3=ABl Muller wrote:
> >>>> Modify locale installation method to be standard accross all
> >> debian-based distributions.
> >>>> Pre-existing method is available only on Ubuntu, locale-gen tool has
> no
> >> parameter in Debian.
> >>>>
> >>>> Signed-off-by: Gu=C3=A9na=C3=ABl Muller <guenael.muller@smile.fr>
> >>>> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> >>>> Tested-by: Antonin Godard <antonin.godard@bootlin.com>
> >>>> ---
> >>>>    documentation/poky.yaml.in                       | 3 +--
> >>>>    documentation/ref-manual/system-requirements.rst | 8 ++++++++
> >>>>    2 files changed, 9 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> >>>> index c770318f2..66f758fe8 100644
> >>>> --- a/documentation/poky.yaml.in
> >>>> +++ b/documentation/poky.yaml.in
> >>>> @@ -13,8 +13,7 @@ YOCTO_RELEASE_DL_URL :
> >> "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> >>>>    UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip
> >> texinfo gcc \
> >>>>         build-essential chrpath socat cpio python3 python3-pip
> >> python3-pexpect \
> >>>>         xz-utils debianutils iputils-ping python3-git python3-jinja2=
 \
> >>>> -     python3-subunit zstd liblz4-tool file locales libacl1
> >>>> -     \n\   $ sudo locale-gen en_US.UTF-8"
> >>>> +     python3-subunit zstd liblz4-tool file locales libacl1"
> >>>>    FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip
> >> python3 unzip perl patch \
> >>>>         diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo
> >> chrpath \
> >>>>         ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Que=
ue
> >> perl-bignum socat \
> >>>> diff --git a/documentation/ref-manual/system-requirements.rst
> >> b/documentation/ref-manual/system-requirements.rst
> >>>> index 0fc92550a..b33518c7f 100644
> >>>> --- a/documentation/ref-manual/system-requirements.rst
> >>>> +++ b/documentation/ref-manual/system-requirements.rst
> >>>> @@ -152,6 +152,14 @@ with a supported Ubuntu or Debian Linux
> >> distribution::
> >>>>
> >>>>       $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
> >>>>
> >>>> +You also need to ensure you have the locale ``en_US.UTF-8`` enabled=
::
> >>>> +
> >>
> >> I believe "the ``en_US.UTF-8`` locale" is more proper here.
> >>
> >
> > You're Right.
> >
> >
> >>
> >> On a side note, what's the actual cost of reconfiguring the locales
> >> regardless of the presence of en_US.UTF-8?
> >>
> >
> > It may take some time depending on how many locales are enabled. The
> > command is build to generate all enabled locales, it should be
> technically
> > possible to generate only one (it's a bash script) but as far I know
> there
> > is no such thing in the Debian package from Debian 12.
> >
> >
> >> My point being we could probably have this command in poky.yaml.in lik=
e
> >> it used to be?
> >>
> >
> >>>> +   $ locale --all-locales | grep en_US.utf8
> >>>> +
> >>>> +If this is not the case, you can reconfigure the ``locales`` packag=
e
> >> to add it::
> >>>> +
> >>>> +   $ sudo dpkg-reconfigure locales
> >>>> +
> >>
> >> How does this actually generate en_US.utf8 locale if we don't explicit=
ly
> >> add it somewhere? Are you sure it's not because your system has LANG o=
r
> >> LC_ALL set to that locale and then calling reconfigure it regenerate i=
t?
> >>
> >> This runs an interactive program where you have to select explicitly
> that
> > you want to add this locale, there is no magic.
> > The other solution to do similar thing is modifying `/etc/locale.gen`
> which
> > seems not more straightforward for me.
> > I tried it on both podman (container) and classic environnement and it
> > works correctly.
> >
>
> I assume this works correctly if one uses an interactive container. E.g.
> I'm expecting this won't work with these instructions in a
> Containerfile/Dockerfile for example.
>
> podman run --userns=3Dkeep-id --user root debian:bookworm sh -c 'apt-get
> update && apt-get install -y locales; locale --all-locales | grep
> en_US.utf8; dpkg-reconfigure locales; locale --all-locales | grep
> en_US.utf8;'
>
> it'll fail when running dpkg-reconfigure. If you add --frontend
> noninteractive, then it just does nothing.
>
> I'm not sure if we really need noninteractive instructions, but I would
> at least mention that we know it doesn't work for noninteractive
> terminals in a note below the instructions? I understand we may not want
> to instruct users to modify their locales with a simple sed command
> which is apparently the appropriate way?
>

I see 2 solutions to solve this issue there:

   - just add "(interactive mode only)"  to the line before the command
   line.
   - add a complete note that explain all the stuff, something like:

 - If your are not using the interactive mode, ``dpkg-reconfigure`` will
not work as expected. To add the locale
you will need to edit ``/etc/locale.gen`` file. A naive way to do this as
root is::

$ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
$ locale-gen

As soon as we agree on this, I can send a v3.
Antonin, What's your opinion on this ?

>
> Cheers,
> Quentin
>

Gu=C3=A9na=C3=ABl

--0000000000001399d70627bda860
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Antonin, Hi Quentin.<br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Nov 25, 2024 at 11:19=E2=80=AFAM Quentin Schulz &lt;<a href=3D"mailto:q=
uentin.schulz@cherry.de" target=3D"_blank">quentin.schulz@cherry.de</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Gu=C3=
=A9na=C3=ABl,<br>
<br>
On 11/22/24 10:25 AM, Gu=C3=A9na=C3=ABl MULLER wrote:<br>
&gt; Hi Quentin, Antonin,<br>
&gt; <br>
&gt; On Tue, Nov 19, 2024 at 10:28=E2=80=AFAM Quentin Schulz &lt;<a href=3D=
"mailto:quentin.schulz@cherry.de" target=3D"_blank">quentin.schulz@cherry.d=
e</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi Anotnin, Gu=C3=A9na=C3=ABl,<br>
&gt;&gt;<br>
&gt;&gt; On 11/18/24 12:00 PM, Antonin Godard via <a href=3D"http://lists.y=
octoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.or=
g</a> wrote:<br>
&gt;&gt;&gt; Hi Gu=C3=A9na=C3=ABl,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Mon Nov 18, 2024 at 11:45 AM CET, Gu=C3=A9na=C3=ABl Muller =
wrote:<br>
&gt;&gt;&gt;&gt; Modify locale installation method to be standard accross a=
ll<br>
&gt;&gt; debian-based distributions.<br>
&gt;&gt;&gt;&gt; Pre-existing method is available only on Ubuntu, locale-ge=
n tool has no<br>
&gt;&gt; parameter in Debian.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Gu=C3=A9na=C3=ABl Muller &lt;<a href=3D"mai=
lto:guenael.muller@smile.fr" target=3D"_blank">guenael.muller@smile.fr</a>&=
gt;<br>
&gt;&gt;&gt;&gt; Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.cong=
al@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;&gt;&gt;&gt; Tested-by: Antonin Godard &lt;<a href=3D"mailto:antonin.go=
dard@bootlin.com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 documentation/<a href=3D"http://poky.yaml.in"=
 rel=3D"noreferrer" target=3D"_blank">poky.yaml.in</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +--<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 documentation/ref-manual/system-requirements.=
rst | 8 ++++++++<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 9 insertions(+), 2 deletions=
(-)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/documentation/<a href=3D"http://poky.yaml.in"=
 rel=3D"noreferrer" target=3D"_blank">poky.yaml.in</a> b/documentation/<a h=
ref=3D"http://poky.yaml.in" rel=3D"noreferrer" target=3D"_blank">poky.yaml.=
in</a><br>
&gt;&gt;&gt;&gt; index c770318f2..66f758fe8 100644<br>
&gt;&gt;&gt;&gt; --- a/documentation/<a href=3D"http://poky.yaml.in" rel=3D=
"noreferrer" target=3D"_blank">poky.yaml.in</a><br>
&gt;&gt;&gt;&gt; +++ b/documentation/<a href=3D"http://poky.yaml.in" rel=3D=
"noreferrer" target=3D"_blank">poky.yaml.in</a><br>
&gt;&gt;&gt;&gt; @@ -13,8 +13,7 @@ YOCTO_RELEASE_DL_URL :<br>
&gt;&gt; &quot;&amp;YOCTO_DL_URL;/releases/yocto/yocto-&amp;DISTRO;&quot;<b=
r>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 UBUNTU_HOST_PACKAGES_ESSENTIAL : &quot;gawk w=
get git diffstat unzip<br>
&gt;&gt; texinfo gcc \<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build-essential chrpath s=
ocat cpio python3 python3-pip<br>
&gt;&gt; python3-pexpect \<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xz-utils debianutils iput=
ils-ping python3-git python3-jinja2 \<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0python3-subunit zstd liblz4-tool file=
 locales libacl1<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0\n\=C2=A0 =C2=A0$ sudo locale-gen en_=
US.UTF-8&quot;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0python3-subunit zstd liblz4-tool file=
 locales libacl1&quot;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 FEDORA_HOST_PACKAGES_ESSENTIAL : &quot;gawk m=
ake wget tar bzip2 gzip<br>
&gt;&gt; python3 unzip perl patch \<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diffutils diffstat git cp=
p gcc gcc-c++ glibc-devel texinfo<br>
&gt;&gt; chrpath \<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ccache perl-Data-Dumper p=
erl-Text-ParseWords perl-Thread-Queue<br>
&gt;&gt; perl-bignum socat \<br>
&gt;&gt;&gt;&gt; diff --git a/documentation/ref-manual/system-requirements.=
rst<br>
&gt;&gt; b/documentation/ref-manual/system-requirements.rst<br>
&gt;&gt;&gt;&gt; index 0fc92550a..b33518c7f 100644<br>
&gt;&gt;&gt;&gt; --- a/documentation/ref-manual/system-requirements.rst<br>
&gt;&gt;&gt;&gt; +++ b/documentation/ref-manual/system-requirements.rst<br>
&gt;&gt;&gt;&gt; @@ -152,6 +152,14 @@ with a supported Ubuntu or Debian Lin=
ux<br>
&gt;&gt; distribution::<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ sudo apt install &amp;UBUNTU_H=
OST_PACKAGES_ESSENTIAL;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +You also need to ensure you have the locale ``en_US.UTF-8=
`` enabled::<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;<br>
&gt;&gt; I believe &quot;the ``en_US.UTF-8`` locale&quot; is more proper he=
re.<br>
&gt;&gt;<br>
&gt; <br>
&gt; You&#39;re Right.<br>
&gt; <br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; On a side note, what&#39;s the actual cost of reconfiguring the lo=
cales<br>
&gt;&gt; regardless of the presence of en_US.UTF-8?<br>
&gt;&gt;<br>
&gt; <br>
&gt; It may take some time depending on how many locales are enabled. The<b=
r>
&gt; command is build to generate all enabled locales, it should be technic=
ally<br>
&gt; possible to generate only one (it&#39;s a bash script) but as far I kn=
ow there<br>
&gt; is no such thing in the Debian package from Debian 12.<br>
&gt; <br>
&gt; <br>
&gt;&gt; My point being we could probably have this command in <a href=3D"h=
ttp://poky.yaml.in" rel=3D"noreferrer" target=3D"_blank">poky.yaml.in</a> l=
ike<br>
&gt;&gt; it used to be?<br>
&gt;&gt;<br>
&gt; <br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0$ locale --all-locales | grep en_US.utf8<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +If this is not the case, you can reconfigure the ``locale=
s`` package<br>
&gt;&gt; to add it::<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0$ sudo dpkg-reconfigure locales<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;<br>
&gt;&gt; How does this actually generate en_US.utf8 locale if we don&#39;t =
explicitly<br>
&gt;&gt; add it somewhere? Are you sure it&#39;s not because your system ha=
s LANG or<br>
&gt;&gt; LC_ALL set to that locale and then calling reconfigure it regenera=
te it?<br>
&gt;&gt;<br>
&gt;&gt; This runs an interactive program where you have to select explicit=
ly that<br>
&gt; you want to add this locale, there is no magic.<br>
&gt; The other solution to do similar thing is modifying `/etc/locale.gen` =
which<br>
&gt; seems not more straightforward for me.<br>
&gt; I tried it on both podman (container) and classic environnement and it=
<br>
&gt; works correctly.<br>
&gt; <br>
<br>
I assume this works correctly if one uses an interactive container. E.g. <b=
r>
I&#39;m expecting this won&#39;t work with these instructions in a <br>
Containerfile/Dockerfile for example.<br>
<br>
podman run --userns=3Dkeep-id --user root debian:bookworm sh -c &#39;apt-ge=
t <br>
update &amp;&amp; apt-get install -y locales; locale --all-locales | grep <=
br>
en_US.utf8; dpkg-reconfigure locales; locale --all-locales | grep <br>
en_US.utf8;&#39;<br>
<br>
it&#39;ll fail when running dpkg-reconfigure. If you add --frontend <br>
noninteractive, then it just does nothing.<br>
<br>
I&#39;m not sure if we really need noninteractive instructions, but I would=
 <br>
at least mention that we know it doesn&#39;t work for noninteractive <br>
terminals in a note below the instructions? I understand we may not want <b=
r>
to instruct users to modify their locales with a simple sed command <br>
which is apparently the appropriate way?<br></blockquote><div><br></div><di=
v>I see 2 solutions to solve this issue there:</div><div><ul><li><span>just=
 add &quot;(interactive mode only)&quot;=C2=A0 to the line before the comma=
nd line.</span></li><li><span>add a complete note that explain all the stuf=
f, something like:<br></span></li></ul></div><div style=3D"margin-left:40px=
">=C2=A0<span>-  If your are not using the interactive mode, ``dpkg-reconfi=
gure`` will not work as expected. To add the locale<br>   you will need to =
edit ``/etc/locale.gen`` file. A naive way to do this as root is::<br><br> =
     $ echo &quot;en_US.UTF-8 UTF-8&quot; &gt;&gt; /etc/locale.gen<br>     =
 $ locale-gen</span></div><div style=3D"margin-left:40px"><span><br></span>=
</div><span>As soon as we agree on this, I can send a v3.=C2=A0 <br></span>=
</div><div class=3D"gmail_quote"><span>Antonin, What&#39;s your opinion on =
this ?<br></span></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Cheers,<br>
Quentin<br></blockquote><div><br></div><div>Gu=C3=A9na=C3=ABl<br></div></di=
v></div>
</div>
</div>
</div>
</div>
</div>

--0000000000001399d70627bda860--

