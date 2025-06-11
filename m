Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B938C61DB2
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 01:55:06 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.715.1749606896581193204
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 18:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=Ol2qUyhJ;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.177, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e64b430daso59424487b3.3
        for <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 18:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749606896; x=1750211696; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7BsK3YwMBY2r0u8xGapLm2XVwEqq37xoHbeGJoA0N/M=;
        b=Ol2qUyhJ6AM9LxcEStEnZwW5Y5GsHjtbfvIaujBKZNiRfnLfS99KumFSiM7IU9ZPI9
         Z+jaXE4E/jo1YE+6FlpnmKRs1y22FdLUDOqXkHWHTEZKnKA6Ze5hyQbwtASvdFWc1UDx
         Y+370C0B7z2HD1E8naxIl6zPmrdwP0VR+/G8TQYEQ+6MkD/XeL+3SBhGKAHYvA6NQSgH
         yJ2aPftU+8e7WMbhhxK7pXz01iqVXuzh84NphSuBtDIpcQsFA4b83ZVimB9AqvWqt23E
         ZP/3UhSJwQ/vW0yQADtpCp6qCI+b75dmSyn+T3OVRzSBTsuBe4s8k0uGyZjoZTRLhIzx
         a0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749606896; x=1750211696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BsK3YwMBY2r0u8xGapLm2XVwEqq37xoHbeGJoA0N/M=;
        b=HJKiMQupIkam8uW1uBuTtv/xz/gk+4CnV4Sv7NVeidfc5YJno8G9k2GLAyTSpzmikc
         Gh3BNThYWKEao8i9SvDEMvkMrGKvuSupcFtQwbcr/Nwqt64Zp8FWLQvImoEE2fHtuqCg
         6fWdxDUjcG+EKGwX1zadEnkcp5FyWeRKjb3r0MpAASie86w62c62PPWG4CE9ntxKrT13
         Nf2u3KFcHYozEpzv36CSwtKuvYOdufpm55Cjk53/9lBilRdXwWkiq6TXAKzVBxJbeSVx
         yI4jsdj7nsulzUlLU57WkLTlKwWB2Z46bMPC4evlRNM2p0mKrcFORGuC85LUTTHv039d
         iAeg==
X-Gm-Message-State: AOJu0Yx6us72ob+gCq3BsZv2d6Z8kPM7gCb3b8ZY5iuWVi1RUthaUaZx
	u/TVnFrhBXkVTKdAopxY3u070/x4bo82yW1fPBXsnriZ0RQVj5uIcyBajj+nRthLyLW6X+2j937
	UBN1rHCLEQSmltBnHBmFWCzshAZFnlOEB0NH2Crs0jg==
X-Gm-Gg: ASbGnct1VlbJ95ljTZ1cDJ6xQ/mQ1wRof0xfUqEN+VAIUIGKSu+oubbxNnwA1sbxBXe
	oanS/YuXPQPKW+3f5iRbfyUTaCzBFDfUdcrmHXa6az6V3ByLvSiWsvFxxwSvvCX1H6h3iIwb1aZ
	0PXtWxFeN0auusxbBOcEqA2bDr3KK9oXiFxZsQ7fgQXxCnXQ==
X-Google-Smtp-Source: AGHT+IGZF5Pt7mmcQ98WMw3TtRhNxrXJgwY1DuZNcGMxS5eIsy7eKtpfcBjNJ3nUqWpC/Q1KnCSbbwBnOdZgz8TmAYg=
X-Received: by 2002:a05:690c:680b:b0:710:f39f:4d43 with SMTP id
 00721157ae682-711409c3fdbmr24353257b3.7.1749606895748; Tue, 10 Jun 2025
 18:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250610015125.4276-1-anibal@limonsoftware.com> <DAIYMJTVXDR1.TL3CNDVDAHHL@bootlin.com>
In-Reply-To: <DAIYMJTVXDR1.TL3CNDVDAHHL@bootlin.com>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Tue, 10 Jun 2025 19:54:44 -0600
X-Gm-Features: AX0GCFsMrQH_pIxkdGFipkKTjEH_CYoeiuKVK4dGZN8MlA-JkCgQcDvoKbq1eNg
Message-ID: <CAOU5ZMtrOfxf=XMETpiHT4BaXBom1=wPJesq3b8Y0wDzv8HGfg@mail.gmail.com>
Subject: Re: [PATCHv2] test-manual/ptest: Add info about fail state of ptest-runner/ptests
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, erik.schumacher@iris-sensing.com, 
	yoann.congal@smile.fr
Content-Type: multipart/alternative; boundary="000000000000849905063742196b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 01:55:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7057

--000000000000849905063742196b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 9:31=E2=80=AFAM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> On Tue Jun 10, 2025 at 3:51 AM CEST, Anibal Limon wrote:
> > On the ML was pointed about no specific information about
> > ptest-runner/ptests so improve docs around.
> >
> > https://lists.yoctoproject.org/g/yocto-patches/message/1622
> >
> > [YOCTO #15832]
> >
> > Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> > ---
> >  documentation/test-manual/ptest.rst | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/documentation/test-manual/ptest.rst
> b/documentation/test-manual/ptest.rst
> > index 2c021af51..d01735c08 100644
> > --- a/documentation/test-manual/ptest.rst
> > +++ b/documentation/test-manual/ptest.rst
> > @@ -46,13 +46,19 @@ Running ptest
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >  The ``ptest-runner`` package installs a shell script that loops throug=
h
> > -all installed ptest test suites and runs them in sequence. Consequentl=
y,
> > -you might want to add this package to your image.
> > +all installed ptest test suites and runs them in sequence.
> > +
> > +During the execution ``ptest-runner`` keeps counter of failed ``ptests=
``
> > +and use it as exit value, failing the execution if any of the
> ``run-ptest``
> > +scripts fails.
> > +
> > +Consequently, you might want to add this package to your image.
> > +
> >
> >  Getting Your Package Ready
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >
> > -In order to enable a recipe to run installed ptests on target hardware=
,
> > +In order to enable a recipe to run installed ``ptests`` on target
> hardware,
> >  you need to prepare the recipes that build the packages you want to
> >  test. Here is what you have to do for each recipe:
> >
> > @@ -77,8 +83,9 @@ test. Here is what you have to do for each recipe:
> >
> >  -  *Create run-ptest:* This script starts your test. Locate the
> >     script where you will refer to it using
> > -   :term:`SRC_URI`. Here is an
> > -   example that starts a test for ``dbus``::
> > +   :term:`SRC_URI`. Be sure your ``run-ptest`` exit with 0 to mark it
>
> I think Yoann suggested that the run-ptest script should return 1 in case
> of
> failure. Can you also mention that? We need to be clear that the run-ptes=
t
> script must return a static code and not any non-zero code, as it could
> clash
> with ptest-runner's own exit code (e.g. 127), if I understood correctly.
>

Current logic is any non-zero is taken as a failure, so at level of the
ptest_runner only increments the counter + 1 when
tests fail, at this stage the PATCHv3 matches the current behaviour.


>
> > +   as succesfully executed.
>
> s/succesfully/sucessfully/
>

Fixed on v3.

Regards!,
Anibal

>
> > +   Here is an example that starts a test for ``dbus``::
> >
> >        #!/bin/sh
> >        cd test
>
> Thanks,
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000849905063742196b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 10,=
 2025 at 9:31=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.godar=
d@bootlin.com">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Tue Jun 10, 2025 at 3:51 AM CES=
T, Anibal Limon wrote:<br>
&gt; On the ML was pointed about no specific information about<br>
&gt; ptest-runner/ptests so improve docs around.<br>
&gt;<br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/yocto-patches/message/1622=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yoc=
to-patches/message/1622</a><br>
&gt;<br>
&gt; [YOCTO #15832]<br>
&gt;<br>
&gt; Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware=
.com" target=3D"_blank">anibal@limonsoftware.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/test-manual/ptest.rst | 17 ++++++++++++-----<br>
&gt;=C2=A0 1 file changed, 12 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/documentation/test-manual/ptest.rst b/documentation/test-=
manual/ptest.rst<br>
&gt; index 2c021af51..d01735c08 100644<br>
&gt; --- a/documentation/test-manual/ptest.rst<br>
&gt; +++ b/documentation/test-manual/ptest.rst<br>
&gt; @@ -46,13 +46,19 @@ Running ptest<br>
&gt;=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The ``ptest-runner`` package installs a shell script that loops =
through<br>
&gt; -all installed ptest test suites and runs them in sequence. Consequent=
ly,<br>
&gt; -you might want to add this package to your image.<br>
&gt; +all installed ptest test suites and runs them in sequence.<br>
&gt; +<br>
&gt; +During the execution ``ptest-runner`` keeps counter of failed ``ptest=
s``<br>
&gt; +and use it as exit value, failing the execution if any of the ``run-p=
test``<br>
&gt; +scripts fails.<br>
&gt; +<br>
&gt; +Consequently, you might want to add this package to your image.<br>
&gt; +<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Getting Your Package Ready<br>
&gt;=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 <br>
&gt; -In order to enable a recipe to run installed ptests on target hardwar=
e,<br>
&gt; +In order to enable a recipe to run installed ``ptests`` on target har=
dware,<br>
&gt;=C2=A0 you need to prepare the recipes that build the packages you want=
 to<br>
&gt;=C2=A0 test. Here is what you have to do for each recipe:<br>
&gt;=C2=A0 <br>
&gt; @@ -77,8 +83,9 @@ test. Here is what you have to do for each recipe:<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 -=C2=A0 *Create run-ptest:* This script starts your test. Locate=
 the<br>
&gt;=C2=A0 =C2=A0 =C2=A0script where you will refer to it using<br>
&gt; -=C2=A0 =C2=A0:term:`SRC_URI`. Here is an<br>
&gt; -=C2=A0 =C2=A0example that starts a test for ``dbus``::<br>
&gt; +=C2=A0 =C2=A0:term:`SRC_URI`. Be sure your ``run-ptest`` exit with 0 =
to mark it<br>
<br>
I think Yoann suggested that the run-ptest script should return 1 in case o=
f<br>
failure. Can you also mention that? We need to be clear that the run-ptest<=
br>
script must return a static code and not any non-zero code, as it could cla=
sh<br>
with ptest-runner&#39;s own exit code (e.g. 127), if I understood correctly=
.<br></blockquote><div><br></div><div>Current logic is any non-zero is take=
n as a failure, so at level of the ptest_runner only increments the counter=
=C2=A0+ 1 when</div><div>tests fail, at this stage the PATCHv3 matches the =
current behaviour.</div><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0as succesfully executed.<br>
<br>
s/succesfully/sucessfully/<br></blockquote><div><br></div><div>Fixed on v3.=
</div><div><br></div><div>Regards!,</div><div>Anibal=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0Here is an example that starts a test for ``dbus``::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #!/bin/sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd test<br>
<br>
Thanks,<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000849905063742196b--

