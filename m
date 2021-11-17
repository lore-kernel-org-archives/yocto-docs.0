Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98423C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 10:13:13 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.5277.1637143991941293632
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 02:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AWrdoSFD;
 spf=pass (domain: linaro.org, ip: 209.85.208.45,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f45.google.com with SMTP id m20so8675734edc.5
        for <docs@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 02:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hS4iVvvUNazrGG4vBHnKf1VwLFwJZjCFt+ggm/1Gbv8=;
        b=AWrdoSFDBU3z2GvgAXaQtsrKcp+4KLXAxZXGgbZy1zAS0q0hBDeQ7xjMlDMohcgHSz
         wKuqNOiPbQr9DxdjnnB1GpesRUeHdsetdbvWSkSxT1NbqE/ZQrjGU7RBN5ZdYmq/QawM
         Ebl5ziMB2RhFA2efHObg2vmjtGG64NP1fWY7q8DVG6pKYWIUcDyNN44AtL8jy8rUC/8L
         TbqqgPzwzvrWuS9HutBS6kw9pU/eteF8K8PRoj09wC/hdj4weKpnZsp5WFakppj/+OKY
         JUWr527GhuXRGUeYkJOydpXt4Yb9OjZRe4bKUiUtHKuXrBBDmmAGqFetN3hmkhIIC1QN
         e42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hS4iVvvUNazrGG4vBHnKf1VwLFwJZjCFt+ggm/1Gbv8=;
        b=sGeYpTSbI/Q60PpcDqwjtIEsGOxTg5WJrOVA+yUdwLB3hXxwzqj/bs6kMMHVNcWsf/
         n5sDAQv13lGasn8yzkZUeUxlCCTZkgYV+B+AuHUC+BZvAkE4nyqNjEOR5uiRPkDj4kof
         hHGrYPosVCoKgVSs25cDzHqblE1H/D7/E9y9h+ewTdBaHyV8dEst6n7Yo5ExOzYW1mT/
         grMmoq8TFAMBWSTZ966YwsntrvBtEed8HhYVpVo8VWvuFlAxRatkivkBC95CoNtsMKkk
         ANyjOjWc75rb/f/xZ/gBvEAEz0Poex5HL2kA6p88EnIzuft4CfjJ7fR5oLphX4NU/5n5
         nukQ==
X-Gm-Message-State: AOAM532ix1BzKvGLtcRY32Vm7sFCuAKm/ACC6BRiG0TNts89ahKXGdK1
	LdA9G53aaKBlj22aUTtsARrbsX31m0inMJ9i/Foqeg==
X-Google-Smtp-Source: 
 ABdhPJws8450ZvQScUsAjWE1PCkRHdinRV2iRD1MMjR8O60t44yORnIbg55ppqQGlGBBhfvONZCOR6In2dKDsvaz2xI=
X-Received: by 2002:a17:907:6da9:: with SMTP id
 sb41mr21163796ejc.88.1637143990020;
 Wed, 17 Nov 2021 02:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20211115124546.97456-1-simon.eu@gmail.com>
 <fe161f54-aaf5-afdd-f715-0b5b9d4df916@bootlin.com>
In-Reply-To: <fe161f54-aaf5-afdd-f715-0b5b9d4df916@bootlin.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 17 Nov 2021 11:12:59 +0100
Message-ID: 
 <CAP71Wjz77WrU3gb3tgtYFVdvj85uYy-A=DF_mMROQ=g8Habo8Q@mail.gmail.com>
Subject: Re: [docs] [PATCH] bitbake: doc: bitbake-user-manual: Add more
 explanations to OVERRIDES
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: "Simon A. Eugster" <simon.eu@gmail.com>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f8bced05d0f949e5"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Nov 2021 10:13:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2159

--000000000000f8bced05d0f949e5
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 11:05 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Simon,
>
> Thank you for proposing documentation improvements!
>
> On 11/15/21 1:45 PM, Simon A. Eugster wrote:
> > Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> > ---
> >  bitbake/doc/README                            |  3 +-
> >  .../bitbake-user-manual-metadata.rst          | 35 +++++++++++++------
> >  2 files changed, 25 insertions(+), 13 deletions(-)
> >
> > diff --git a/bitbake/doc/README b/bitbake/doc/README
> > index 16e6cdf990..84e7cb702d 100644
> > --- a/bitbake/doc/README
> > +++ b/bitbake/doc/README
> > @@ -47,8 +47,7 @@ To install all required packages run:
> >
> >  To build the documentation locally, run:
> >
> > - $ cd documentation
> > - $ make -f Makefile.sphinx html
> > + $ make html
>
>
> What version of the Bitbake manual did you create your patch from? The
> above changes have already been made last year...
> Thanks again
>

More generally, patches should be split in individual/independent changes,
and this change would not belong to this patch regardless. Like this
snippet which was in the original patch sent:

@@ -268,7 +268,7 @@ examples::
    C = "cval"
    C =. "test"

-The variable :term:`B` contains "bvaladditionaldata" and ``C`` contains
+The variable ``B`` contains "bvaladditionaldata" and ``C`` contains
 "testcval".

Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2158):
> https://lists.yoctoproject.org/g/docs/message/2158
> Mute This Topic: https://lists.yoctoproject.org/mt/87068011/1279857
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f8bced05d0f949e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 11:05 AM Mich=
ael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michae=
l.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi Simon,<br>
<br>
Thank you for proposing documentation improvements!<br>
<br>
On 11/15/21 1:45 PM, Simon A. Eugster wrote:<br>
&gt; Signed-off-by: Simon A. Eugster &lt;<a href=3D"mailto:simon.eu@gmail.c=
om" target=3D"_blank">simon.eu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bitbake/doc/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 .../bitbake-user-manual-metadata.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 35 +++++++++++++------<br>
&gt;=C2=A0 2 files changed, 25 insertions(+), 13 deletions(-)<br>
&gt;<br>
&gt; diff --git a/bitbake/doc/README b/bitbake/doc/README<br>
&gt; index 16e6cdf990..84e7cb702d 100644<br>
&gt; --- a/bitbake/doc/README<br>
&gt; +++ b/bitbake/doc/README<br>
&gt; @@ -47,8 +47,7 @@ To install all required packages run:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 To build the documentation locally, run:<br>
&gt;=C2=A0 <br>
&gt; - $ cd documentation<br>
&gt; - $ make -f Makefile.sphinx html<br>
&gt; + $ make html<br>
<br>
<br>
What version of the Bitbake manual did you create your patch from? The<br>
above changes have already been made last year...<br>
Thanks again<br></blockquote><div><br></div><div>More generally, patches sh=
ould be split in individual/independent=C2=A0changes, and this change would=
 not belong to this patch regardless. Like this snippet which was in the or=
iginal patch sent:</div><div><br></div><div>@@ -268,7 +268,7 @@ examples::<=
br>=C2=A0 =C2=A0 C =3D &quot;cval&quot;<br>=C2=A0 =C2=A0 C =3D. &quot;test&=
quot;<br><br>-The variable :term:`B` contains &quot;bvaladditionaldata&quot=
; and ``C`` contains<br>+The variable ``B`` contains &quot;bvaladditionalda=
ta&quot; and ``C`` contains<br>=C2=A0&quot;testcval&quot;.<br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2158): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2158" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2158</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87068011/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87068011/1279857</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f8bced05d0f949e5--

