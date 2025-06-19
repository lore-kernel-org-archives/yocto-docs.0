Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218F7C7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 16:09:42 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.3651.1750349377076917986
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Jun 2025 09:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=ASDa5uZx;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.180, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70a57a8ffc3so8605617b3.0
        for <docs@lists.yoctoproject.org>; Thu, 19 Jun 2025 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1750349376; x=1750954176; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=46Xvr08/ixGNKR5yOru4I2yxsRbsNTsCIP7QhDBq+DY=;
        b=ASDa5uZxwq7nBLEeyHtdl0yRY2oH9SoTeWHQdOYOdD/CYpmV/RwvMW5v84FpEWAPh1
         Pjv4lO/AIS7ezbsznzFAbH0ZdAj8dm9rdd0zAgQ26BNWXZxoATtYbR2+cEvT8Z+aedaj
         pw+wlCJi7hZKkCqbtKTojowxtlvxi0z0mwJeU42GG88S3+CWcWbl/FnVZhl4HVueQWtn
         aE+T4MA3a/g1LiBFfQWUYWdMpISYLHTM7osB/UElVaylK4ssrJJ6ZLDuPPAzqrXpkdwT
         mtvGx7MRjQRHRK6GNzs5lrUQE41w6A+BK+m4sQkkOND22K/OhWQxbHmSIQ8xr/pLIubh
         zKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750349376; x=1750954176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46Xvr08/ixGNKR5yOru4I2yxsRbsNTsCIP7QhDBq+DY=;
        b=fw9YMt5XAifzZ62rWeZDERWODvjKj18Z4Bhl4Xqydd/PDr0w4bDS9ONg44/dzeiRnx
         //K054LhhxIyXDRzYq9m/F8RvET8apdKmcpEgdPd9zbuCKXaBYjTTOAPfu17inVBpjqj
         LP/ga5286a8egpiILlQffiISdRcM8v9iEERoWSEb+D8/PS9lecZJEjAoFG9uN3fYYPLI
         q1FgnHvmcZmRVltwZw0/sIl5znl9Kh+ro1RwEodOr0FwOFvTbU2+Koo5OCxjw3sPt34c
         4NczGLlqvHnZh8EhhKIyKaOetE+dAMrwqXGD2ltnjGtYAxxHzgWSPAyubwBncFRSeZos
         y/iQ==
X-Gm-Message-State: AOJu0YyO9lpLuQZt4ouDqOJRec0yP9X54/IuWKzbYkB3hBIGSiA4WxiJ
	HcLlsBo6/47hOp6uQXgR60CDATI4jtNBw2dUfSTctLEXZpPo18gEhVdck8bPEXFzo05ktWQmaDV
	MVeXRFFuyq5I2zeLyZWSCvSNzyZJJd7PFjsyXiL9AsA==
X-Gm-Gg: ASbGncsAHtU3ZWmeFOw/Yyk+zJZ/PKZ+ZuypiyksFwkkGeYHFE+KbxHMFoK+eAeLv7L
	mF3O8uiUQLaXmvrGisZ/1aFr3MEmWdANsfJLf4tecvFm/Iw0eKLgn0AWi+XzNMhsBq6mzeuiEJK
	GP9JDpqFN58vq03ePOnJ0dxCb0HlqaNx8kGb0RpwWrbGAI365pMgk7+Qk1
X-Google-Smtp-Source: AGHT+IFZ6lSkmWzvxY+6c5R1s8qjl1ADO8POSs5KUmqHaRsb3adc008CZvTvod0E05Thp2z5S+45TvX65Fg6rl4xmOk=
X-Received: by 2002:a05:690c:5607:b0:712:c295:d017 with SMTP id
 00721157ae682-712c295db12mr8201237b3.1.1750349376075; Thu, 19 Jun 2025
 09:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250611184034.566623-1-anibal@limonsoftware.com> <DAOSXOJWO5XZ.NNSHYLHQQ40T@bootlin.com>
In-Reply-To: <DAOSXOJWO5XZ.NNSHYLHQQ40T@bootlin.com>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Thu, 19 Jun 2025 10:09:25 -0600
X-Gm-Features: AX0GCFvlOsbaqSbWr3uP1D213mcetzBOxbwdvnFv4TXBFgGt1o-Z3n9vf4LOhwM
Message-ID: <CAOU5ZMsxHyY+JOdeJ75cmaSnse_CdGuhE_8swN7zu7eW113V_g@mail.gmail.com>
Subject: Re: [PATCHv4] test-manual/ptest: Add info about fail state of ptest-runner/ptests
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, erik.schumacher@iris-sensing.com, 
	yoann.congal@smile.fr
Content-Type: multipart/alternative; boundary="000000000000cb4de70637eef84b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Jun 2025 16:09:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7111

--000000000000cb4de70637eef84b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

Thanks for the corrections, sending the next PATCH version.

Cheers!,
Anibal

On Tue, Jun 17, 2025 at 6:20=E2=80=AFAM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> Hi,
>
> On Wed Jun 11, 2025 at 8:40 PM CEST, Anibal Limon wrote:
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
> > index 2c021af51..9442387f7 100644
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
> > +During the execution ``ptest-runner`` keeps counter of total and faile=
d
>
> s/keeps counter of/keeps count of/
>
> > +``ptests``, At end the execution summary is written to the console. If
>
> Should be a "." not "," after ``ptests``.
>
> > +any of the ``run-ptest`` fails returns '1'.
>
> Missing a word?
>
> s/``run-ptest`` fails returns '1'/``run-ptest``, ``ptest-runner`` returns
> '1'/
>
> > +
> > +Consequently, you might want to add this package to your image.
>
> I would suggest:
>
> "Consequently, you might want to add ``ptest-runner`` to your image."
>
> So users know they can add the package "ptest-runner" in IMAGE_INSTALL
> directly.
>
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
> > +   :term:`SRC_URI`. Be sure ``run-ptest`` exit with 0 to mark it
>
> s/exit/exits/
>
> > +   as sucessfully executed otherwise will be marked as fail.
>
> Sorry, I corrected your typo with a typo the first time. It's actually:
>
> s/sucessfully/successfully/
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

--000000000000cb4de70637eef84b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Antonin,<div><br></div><div>Thanks for the corrections,=
 sending the next PATCH version.</div><div><br></div><div>Cheers!,</div><di=
v>Anibal</div></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 17, 2025 at 6:20=E2=80=AFAM=
 Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com">antonin.g=
odard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hi,<br>
<br>
On Wed Jun 11, 2025 at 8:40 PM CEST, Anibal Limon wrote:<br>
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
&gt; index 2c021af51..9442387f7 100644<br>
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
&gt; +During the execution ``ptest-runner`` keeps counter of total and fail=
ed<br>
<br>
s/keeps counter of/keeps count of/<br>
<br>
&gt; +``ptests``, At end the execution summary is written to the console. I=
f<br>
<br>
Should be a &quot;.&quot; not &quot;,&quot; after ``ptests``.<br>
<br>
&gt; +any of the ``run-ptest`` fails returns &#39;1&#39;.<br>
<br>
Missing a word?<br>
<br>
s/``run-ptest`` fails returns &#39;1&#39;/``run-ptest``, ``ptest-runner`` r=
eturns &#39;1&#39;/<br>
<br>
&gt; +<br>
&gt; +Consequently, you might want to add this package to your image.<br>
<br>
I would suggest:<br>
<br>
&quot;Consequently, you might want to add ``ptest-runner`` to your image.&q=
uot;<br>
<br>
So users know they can add the package &quot;ptest-runner&quot; in IMAGE_IN=
STALL directly.<br>
<br>
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
&gt; +=C2=A0 =C2=A0:term:`SRC_URI`. Be sure ``run-ptest`` exit with 0 to ma=
rk it<br>
<br>
s/exit/exits/<br>
<br>
&gt; +=C2=A0 =C2=A0as sucessfully executed otherwise will be marked as fail=
.<br>
<br>
Sorry, I corrected your typo with a typo the first time. It&#39;s actually:=
<br>
<br>
s/sucessfully/successfully/<br>
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
</blockquote></div>

--000000000000cb4de70637eef84b--

