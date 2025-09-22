Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163FACAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 18:08:42 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.59581.1758564517527914717
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 11:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RxaYtl3k;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bhstalel@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-84baf04db73so26633885a.2
        for <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 11:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758564516; x=1759169316; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pyepvNKQQDDCLi35GVNbo1UovkEWLAbuJ67wko61RgQ=;
        b=RxaYtl3kWJ6R8gx4hg2UY6DEjm4v64bWu7MbneKskvzqoUFRKAH1B8LZU57Qi9vm0j
         Q0ooB84PzKIgwctBiGHbVFn8vb9TlZfmszD2Zu5levPgzW29medoeYcdAZ7CKFSf2W2s
         NZ9ilap6ISNoe4wqKiP2ZqpiXoODcy92/2DMAVsIeEeW8DSkqcJuyrFcee8clN3FY61K
         edFzAo69WZtiBVorIAzuyjDC6xkBeohpvoz4vCqfaxJQpW3Nig3CljA/Rhs/Cx7vOH71
         7pYa1Vylfb+h0t60pzGWlDHNUNGsCGmNyc8fkkIzW99iC+nGfy5eEcMg4DMkb/Q/NhE+
         lpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758564516; x=1759169316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyepvNKQQDDCLi35GVNbo1UovkEWLAbuJ67wko61RgQ=;
        b=b7RLZLnXc8Tvc49reA0P0TtKaVSEH/2dQWGHRVDqNj0gN33M+Hh/9WvgYBS4wyer8r
         K5lIk3ySYBTJejlr1b0VhGDo+kepNBc8eTsaQyG7TISH9BHyXwC74TtAYlPgrDS2st9i
         HN8SL5GzlvADfv22M20e2190sbgAw5zMk9bMTXWo59BFEj+xuMAgBz5jx9N32v/D9Bcl
         681JmSZ+yCIb2ZSF4tT2AAvmbfv60Db6gYzA6v1SOGIG5PQWW1Z2egkrhzZPAbWAt0s6
         ufL3SFmK/WwPQZKO18z/1eqIjaE+dZbI596QzYh/QkNV3lzoeQKnnf1lUSpRfUBpUQLx
         RELg==
X-Gm-Message-State: AOJu0YzHK5yaKc5THZ8I7VfHeAK68kCswJYoaKOOtNI0zFMXCdqKqpkK
	5Mvf2XFS+KJt6RKyiQJGboRVhHDf4VQje48PVwFY77ehKxrPEAMuabkqII2PAn8gfIm2aQXfJJ3
	C6jkcRZ6bJIa042vb+8nuccE70iWCUCJmWg==
X-Gm-Gg: ASbGncv+410f94CHN0coPXUBiGETc3FmSV58buBqon3M8C+wGg3oDL1HTGkZ85tLZ57
	sbBRJVsFPHt6J6wQ2M9yoI/WpGlNIqaLoUgDkp+VS8T86cEZfYS1auzEzNQz49PszqCh19/I2Gw
	uoDiV9auwdVIwnTRvI+niVvvqdEOzEmzhrlVae1fI53JznArMP17pCwOGdeXPdBg/pTumy8nrdC
	jR3kCXURABW8zJu7feqSGP99G46UM9gVaSv1yLd
X-Google-Smtp-Source: AGHT+IGfFVCBR9TOQBPX2dxaP5X655y9w08xFkHlErmSramYmpGc5mBIpTWywC1eQLCQ7gEMRWDEmhKcswY+zAiL2CY=
X-Received: by 2002:ac8:578c:0:b0:4b7:94ee:4fb2 with SMTP id
 d75a77b69052e-4c06ebaa24amr102762811cf.5.1758564516079; Mon, 22 Sep 2025
 11:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250921132033.31644-1-bhstalel@gmail.com> <20250921132033.31644-2-bhstalel@gmail.com>
 <DCZE7GR7DWSC.20I17FKZ0DHZK@bootlin.com>
In-Reply-To: <DCZE7GR7DWSC.20I17FKZ0DHZK@bootlin.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Mon, 22 Sep 2025 19:08:25 +0100
X-Gm-Features: AS18NWCOQ9pByrGA6dZKU5S5bY03-g0__GdKrOVN7In0kKFS_33IeXq2a2y4g6A
Message-ID: <CAOgG7m1VGahbYM5rGdYy3y2en1+u0ANjFRuRs66-QJJSMOTP2g@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] dev-manual/building.rst: add note about
 globally inheriting externalsrc class
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004bb434063f67b56b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 18:08:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7576

--0000000000004bb434063f67b56b
Content-Type: text/plain; charset="UTF-8"

I think that beginners may not catch the idea from the example, and they,
accidentally, inherit globally without setting them to specific recipes.

Kind regards

On Mon, 22 Sep 2025 at 15:18 Antonin Godard <antonin.godard@bootlin.com>
wrote:

> On Sun Sep 21, 2025 at 3:20 PM CEST, BELHADJ SALEM Talel via
> lists.yoctoproject.org wrote:
> > Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
> > ---
> >  documentation/dev-manual/building.rst | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/documentation/dev-manual/building.rst
> b/documentation/dev-manual/building.rst
> > index 04c150094..8d00d908e 100644
> > --- a/documentation/dev-manual/building.rst
> > +++ b/documentation/dev-manual/building.rst
> > @@ -736,6 +736,13 @@ are the statements to put in your ``local.conf``
> file::
> >     INHERIT += "externalsrc"
> >     EXTERNALSRC:pn-myrecipe = "path-to-your-source-tree"
> >
> > +.. note::
> > +
> > +   When you inherit :ref:`ref-classes-externalsrc` class globally make
> > +   sure to set the :term:`EXTERNALSRC` and :term:`EXTERNALSRC_BUILD`
> > +   variables to specific recipes, not doing that will redirect
> > +   all recipes to one external source directory.
> > +
> >  This next example shows how to accomplish the same thing by setting
> >  :term:`EXTERNALSRC` in the recipe itself or in the recipe's append
> file::
> >
>
> Hi,
>
> When reading this, I had the feeling that the previous paragraph shows how
> to
> set EXTERNALSRC for a specific recipe, and the next paragraph shows how to
> set
> both EXTERNALSRC and EXTERNALSRC_BUILD from a recipe - which is exactly
> what you
> say in your note. So, why a note to repeat this? What was the intent?
>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000004bb434063f67b56b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think that beginners may not catch the idea from the ex=
ample, and they, accidentally, inherit globally without setting them to spe=
cific recipes.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Kind rega=
rds</div><div dir=3D"auto"><br></div><div><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 22 Sep 2025 a=
t 15:18 Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com">an=
tonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Sun Se=
p 21, 2025 at 3:20 PM CEST, BELHADJ SALEM Talel via <a href=3D"http://lists=
.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.=
org</a> wrote:<br>
&gt; Signed-off-by: Talel BELHAJ SALEM &lt;<a href=3D"mailto:bhstalel@gmail=
.com" target=3D"_blank">bhstalel@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/dev-manual/building.rst | 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;<br>
&gt; diff --git a/documentation/dev-manual/building.rst b/documentation/dev=
-manual/building.rst<br>
&gt; index 04c150094..8d00d908e 100644<br>
&gt; --- a/documentation/dev-manual/building.rst<br>
&gt; +++ b/documentation/dev-manual/building.rst<br>
&gt; @@ -736,6 +736,13 @@ are the statements to put in your ``local.conf`` =
file::<br>
&gt;=C2=A0 =C2=A0 =C2=A0INHERIT +=3D &quot;externalsrc&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0EXTERNALSRC:pn-myrecipe =3D &quot;path-to-your-sour=
ce-tree&quot;<br>
&gt;=C2=A0 <br>
&gt; +.. note::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0When you inherit :ref:`ref-classes-externalsrc` class gl=
obally make<br>
&gt; +=C2=A0 =C2=A0sure to set the :term:`EXTERNALSRC` and :term:`EXTERNALS=
RC_BUILD`<br>
&gt; +=C2=A0 =C2=A0variables to specific recipes, not doing that will redir=
ect<br>
&gt; +=C2=A0 =C2=A0all recipes to one external source directory.<br>
&gt; +<br>
&gt;=C2=A0 This next example shows how to accomplish the same thing by sett=
ing<br>
&gt;=C2=A0 :term:`EXTERNALSRC` in the recipe itself or in the recipe&#39;s =
append file::<br>
&gt;=C2=A0 <br>
<br>
Hi,<br>
<br>
When reading this, I had the feeling that the previous paragraph shows how =
to<br>
set EXTERNALSRC for a specific recipe, and the next paragraph shows how to =
set<br>
both EXTERNALSRC and EXTERNALSRC_BUILD from a recipe - which is exactly wha=
t you<br>
say in your note. So, why a note to repeat this? What was the intent?<br>
<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000004bb434063f67b56b--

