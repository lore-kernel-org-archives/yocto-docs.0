Return-Path: <aatrapps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBEBC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 11:33:21 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.25788.1658143994998902448
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 04:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pnxgbkk4;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: aatrapps@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id r70so7807272iod.10
        for <docs@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6+jUt8m3qn5OkDnM0UVz3Hb8kyx6kdKw7SGF4UQJf1s=;
        b=Pnxgbkk4zpcmGbCvayMITeRK0VItekmCUBaKzJgXk6nUSqeJjBlGhKC5biytbDE/jf
         f/cC1fg9S0ojFVbMGoGf++h2kkMeUS3y1YrF72hQXSAxxxNZlvP5760WWRS58xyn+T9u
         gkxwUkBuPqVIZAwrdwN9MEXff+7IHty33cTVL0h+QIIsKfqtqMEmYv8XeD3bBgI3b5cn
         ln6/MyYUo9+DdfJkFXcr3k6b14aE/FGbsTFZ5iDSsqDobK2NnJiIEv8qQk/OTpDu9oHj
         2+3BAfF3/io6ov2pp92ge1N7gqqvvfJObOGGFhNp0C+orjZpUh0nORKr8E/5QemV14WY
         5XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6+jUt8m3qn5OkDnM0UVz3Hb8kyx6kdKw7SGF4UQJf1s=;
        b=nI1Erjja2Gz3fYT+nv3M1PpnhTfabm4O/Y/87APUQh7rzVPZSc7ZCnihTVeXAWUZc+
         /Yn1l35algzRW3SaZ+eUFsp8dcLGVfC9308S7+rnUSDwQpFn2xMsEPZwMN/0qlugHUgk
         gmSqRw8YgY1/tBfMiYX25VF78o9ukdBtd6c/YDlBHj4XBzBidYXxlUEhHK8qZj/wKP8v
         eV8jbgvepiX7WCWM7+GK7jXBoC30iEUQXj3czUOk7gS7VOTOhQvnSh9TlCYqx4oNdyiX
         FIc0T1R0HJMT9g9kRoKZhTUep0qqPehDawnZaj1BM79N+GIeIE5Nnj17bamcZMR4jqL+
         vfzA==
X-Gm-Message-State: AJIora8ukAcHpmDK6EZLGPOEJivjaOtOVVfTDPkGlsCUIyPHzAorZVDm
	dxRWJW2VYP/BrRhjSOLc/1YsrozGEpsGGYlvtc8=
X-Google-Smtp-Source: 
 AGRyM1tgS3gruhTPlYL0W0WoPwbu86GqrfUWCsbWNZPx3eseXn7fwpzAHmVT2ryaLfE9JHLvlKjP9/WDq1hqdMsnCfY=
X-Received: by 2002:a05:6602:26c3:b0:66c:f8b2:53c with SMTP id
 g3-20020a05660226c300b0066cf8b2053cmr12460193ioo.50.1658143994392; Mon, 18
 Jul 2022 04:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220705193847.12544-1-aatrapps@gmail.com>
 <56af7b46-b595-f440-592a-79d8a3cefaf6@theobroma-systems.com>
 <d5241899-8670-dbad-1872-5f6da520b061@bootlin.com>
In-Reply-To: <d5241899-8670-dbad-1872-5f6da520b061@bootlin.com>
From: Aatir Manzur <aatrapps@gmail.com>
Date: Mon, 18 Jul 2022 07:33:03 -0400
Message-ID: 
 <CAJ1z=zxpLP-ph40B3Sid=WEimqE=JrksvfXg41tSRtrBQVrMCA@mail.gmail.com>
Subject: Re: [docs] [PATCH] docs: Sphinx note directive for DISTO_FEATURES
 definition
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c5b63d05e412bb1e"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Jul 2022 11:33:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3059

--000000000000c5b63d05e412bb1e
Content-Type: text/plain; charset="UTF-8"

Can someone please tell me where that From: field might be getting picked
up from? I can see my full name when I look at my git log.
commit caebfc10b69bcb35a4fcf850df2496de5c490b44 (HEAD -> master)
Author: Aatir Manzur <aatrapps@gmail.com>
Date:   Tue Jul 5 15:19:07 2022 -0400

    docs: Sphinx note directive for DISTO_FEATURES definition

    Signed-off-by: Aatir Manzur <aatrapps@gmail.com>

On Mon, Jul 18, 2022 at 7:02 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

>
> On 7/18/22 11:06, Quentin Schulz wrote:
> > Hi Aatir,
> >
> > Sorry for the delay, just had the time to look at it now.
> >
> > On 7/5/22 21:38, aatir wrote:
> >> Signed-off-by: Aatir Manzur <aatrapps@gmail.com>
> >> ---
> >>   documentation/ref-manual/variables.rst | 12 ++++++++----
> >>   1 file changed, 8 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/documentation/ref-manual/variables.rst
> >> b/documentation/ref-manual/variables.rst
> >> index c4b2119f2..6a43e8dc5 100644
> >> --- a/documentation/ref-manual/variables.rst
> >> +++ b/documentation/ref-manual/variables.rst
> >> @@ -1886,10 +1886,14 @@ system and gives an overview of their
> >> function and contents.
> >>         optionally support the feature. For example, specifying "x11" in
> >>         :term:`DISTRO_FEATURES`, causes every piece of software built
> >> for the
> >>         target that can optionally support X11 to have its X11 support
> >> -      enabled. Note: just enabling :term:`DISTRO_FEATURES` alone
> >> doesn't
> >> -      enable feature support for packages, mechanisms such as making
> >> -      :term:`PACKAGECONFIG` track :term:`DISTRO_FEATURES` are used
> >> -      to enable/disable package features.
> >> +      enabled.
> >> +
> >
> > Spurious white space after the dot.
> >
> >> +      .. note::
> >> +
> >
> > Spurious white space after the second colon.
> >
> > This looks good otherwise, can be fixed while applying by the
> > maintainer I guess.
>
>
> Right, I fixed that, as well as a typo in the commit title.
> By the way, the commit author was still wrong, because the "From" field
> of your e-mail was incomplete:
>
> From: "aatir" <aatrapps@gmail.com>
> instead of
> From: "Aatir Manzur" <aatrapps@gmail.com>
>
> I fixed the commit in master-next, but I hope you can fix it for next time.
>
> Many thanks!
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000c5b63d05e412bb1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can someone please tell me where that From: field might be=
 getting picked up from? I can see my full name when I look at my git log.<=
div>commit caebfc10b69bcb35a4fcf850df2496de5c490b44 (HEAD -&gt; master)<br>=
Author: Aatir Manzur &lt;<a href=3D"mailto:aatrapps@gmail.com">aatrapps@gma=
il.com</a>&gt;<br>Date: =C2=A0 Tue Jul 5 15:19:07 2022 -0400<br><br>=C2=A0 =
=C2=A0 docs: Sphinx note directive for DISTO_FEATURES definition<br>=C2=A0 =
=C2=A0 <br>=C2=A0 =C2=A0 Signed-off-by: Aatir Manzur &lt;<a href=3D"mailto:=
aatrapps@gmail.com">aatrapps@gmail.com</a>&gt;<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 18, 202=
2 at 7:02 AM Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bo=
otlin.com">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
On 7/18/22 11:06, Quentin Schulz wrote:<br>
&gt; Hi Aatir,<br>
&gt;<br>
&gt; Sorry for the delay, just had the time to look at it now.<br>
&gt;<br>
&gt; On 7/5/22 21:38, aatir wrote:<br>
&gt;&gt; Signed-off-by: Aatir Manzur &lt;<a href=3D"mailto:aatrapps@gmail.c=
om" target=3D"_blank">aatrapps@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 documentation/ref-manual/variables.rst | 12 ++++++++----<br=
>
&gt;&gt; =C2=A0 1 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/documentation/ref-manual/variables.rst <br>
&gt;&gt; b/documentation/ref-manual/variables.rst<br>
&gt;&gt; index c4b2119f2..6a43e8dc5 100644<br>
&gt;&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt;&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt;&gt; @@ -1886,10 +1886,14 @@ system and gives an overview of their <br>
&gt;&gt; function and contents.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optionally support the =
feature. For example, specifying &quot;x11&quot; in<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`DISTRO_FEATURES`=
, causes every piece of software built <br>
&gt;&gt; for the<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target that can optiona=
lly support X11 to have its X11 support<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled. Note: just enabling :term=
:`DISTRO_FEATURES` alone <br>
&gt;&gt; doesn&#39;t<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable feature support for package=
s, mechanisms such as making<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`PACKAGECONFIG` track :term:=
`DISTRO_FEATURES` are used<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to enable/disable package features=
.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled.<br>
&gt;&gt; +<br>
&gt;<br>
&gt; Spurious white space after the dot.<br>
&gt;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .. note::<br>
&gt;&gt; +<br>
&gt;<br>
&gt; Spurious white space after the second colon.<br>
&gt;<br>
&gt; This looks good otherwise, can be fixed while applying by the <br>
&gt; maintainer I guess.<br>
<br>
<br>
Right, I fixed that, as well as a typo in the commit title.<br>
By the way, the commit author was still wrong, because the &quot;From&quot;=
 field <br>
of your e-mail was incomplete:<br>
<br>
From: &quot;aatir&quot; &lt;<a href=3D"mailto:aatrapps@gmail.com" target=3D=
"_blank">aatrapps@gmail.com</a>&gt;<br>
instead of<br>
From: &quot;Aatir Manzur&quot; &lt;<a href=3D"mailto:aatrapps@gmail.com" ta=
rget=3D"_blank">aatrapps@gmail.com</a>&gt;<br>
<br>
I fixed the commit in master-next, but I hope you can fix it for next time.=
<br>
<br>
Many thanks!<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000c5b63d05e412bb1e--

