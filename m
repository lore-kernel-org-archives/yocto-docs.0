Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103E8C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 10:58:40 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.45519.1747997913363543198
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 03:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=APSKEgua;
 spf=pass (domain: snapchat.com, ip: 209.85.208.176, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-328b943ae7bso57048701fa.3
        for <docs@lists.yoctoproject.org>; Fri, 23 May 2025 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1747997911; x=1748602711; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nits5QBSkpI3LUNqAxNxcCyHllywO6P2/TtZGwZ8JgI=;
        b=APSKEguaUHjuFdaL+CaS6LfRlG3w9+QUHzLhMT69uu4IDDZWhGXXVySfCU+yUOLM4H
         1QBddPLAqHAZ5MLfoLB9pOj+ixRJU13wI+vaTkzYSZeZVAK67ycpoRLuPVZQKfAW6bAD
         02GnNCiuiZdPyyHMOixRK6/TkD+fzA0tkT/vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997911; x=1748602711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nits5QBSkpI3LUNqAxNxcCyHllywO6P2/TtZGwZ8JgI=;
        b=BH88r/66N1sArrNay7hdIlykqSh14+GrAcRM/bPQ0ICFzSgMX+SKbh/aww22yP/bJI
         /QlrdmmwBMYg3blt4uzpw/gj425EVLP2JCsrKc//vd5o46G1iGmKkdUmQZoQYaUrqhTH
         xtyHFgF1Xn8jCIPZx6rtJysOrWu8FYPDfgaVivYqJdCWuDBSF5UwlNlkjyhPsPF6TCtV
         JpVjAFjgCrwhwktAdj6+KnU0cL3eIVpmGibLDd4VSGtQlMa6NQ33CIQrMj8DQwO/goH+
         F36GOYRREAHTzLl7k7btwTo0D2vw1Whu4Qjbj78uppyyF2yNRFsl1TwPbCf/8gd02oNr
         T5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVIk5MBgylXwV78Gz8DtxycvHnT5J+p7p7UODJ7gBkPWhOTITFdZZRFkHZ/yWMk2u6W1hp+@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzIFpigX2tb9mcNjb7i0Xh80pHRdW0RRLAEmwScbL8NP2CkQR4k
	ctGaM/DpHrp4mx+8GTry3SxHiLz+eq54oQh8MMEoVyv2Tnpv99dZpSob/V+hgwAXDqKay6sbGUm
	jeJAavm+VtRVJDtL/uc6Ebt2OHVLD7e0c4L0/kJG3LQ==
X-Gm-Gg: ASbGncsZF6jdbE4GUe1fYo/IE7SNt4VP4sIP1e0ovDK/NczZCFV5DXWWoWXgPSkzI5j
	NTIMmpbWSJ7G4pbyPXuxjhTtNhZ3Nxrl38RbpjNP8eG5owux4zjER0U8l5QqDP2jhFPKNV3j/ph
	yKyx8NtJBGJXnAbojFgEfWdj+CdDTMVelY
X-Google-Smtp-Source: AGHT+IEF1y8o5qeRgUu/lPN7h5woSE+UBcsNVXC1nqOPQAK2dUz2TOwQGYzBy7pnIXA+bRiNEPOYQg7JP+nzWT24u+U=
X-Received: by 2002:a05:651c:e17:b0:30b:ecd6:b9d1 with SMTP id
 38308e7fff4ca-328077c39e7mr88523121fa.25.1747997911196; Fri, 23 May 2025
 03:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250520123955.2341427-1-ecordonnier@snap.com>
 <DA2L8QNZB47I.27YDS1YIT9KMZ@bootlin.com> <50b432ab211b1634c09e693ea23dfec1872ca383.camel@linuxfoundation.org>
In-Reply-To: <50b432ab211b1634c09e693ea23dfec1872ca383.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 23 May 2025 12:58:19 +0200
X-Gm-Features: AX0GCFuDmM5MA9HfQXM72SdXJZmNb0-OCkFE8K_mZpOBGoLxP0eTN-iNbJn4BXA
Message-ID: <CAHUKmYahFxc7-sYFSD03KqHCSU-ZN_Qm738AGBJBtrc5oLmOVw@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document SSTATE_SKIP_CREATION
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000090d4cf0635cb7a1c"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 May 2025 10:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6887

--00000000000090d4cf0635cb7a1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
I'm using it to avoid some recipes from a buggy bsp layer (which can't
build from a pre-populated sstate-cache) populating my sstate-cache and
breaking builds down the line. I understand the proper fix is to fix the
recipes to work with sstate-cache, but for various reasons (e.g. no control
over a third-party bsp layer) it is not always possible.

=C3=89tienne


On Thu, May 22, 2025 at 12:36=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2025-05-22 at 11:39 +0200, Antonin Godard via
> lists.yoctoproject.org wrote:
> > Hi,
> >
> > Some suggestions and formatting related suggestions below.
> >
> > On Tue May 20, 2025 at 2:39 PM CEST, Etienne Cordonnier via
> lists.yoctoproject.org wrote:
> > > From: Etienne Cordonnier <ecordonnier@snap.com>
> > >
> > > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > > ---
> > >  documentation/ref-manual/variables.rst | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > > index 643a3e7ae..7d8e257b9 100644
> > > --- a/documentation/ref-manual/variables.rst
> > > +++ b/documentation/ref-manual/variables.rst
> > > @@ -9049,6 +9049,12 @@ system and gives an overview of their function
> and contents.
> > >
> > >        For details on the process, see the :ref:`ref-classes-staging`
> class.
> > >
> > > +   :term:`SSTATE_SKIP_CREATION`
> > > +      SSTATE_SKIP_CREATION variable will be used to skip creation of
> >
> > s/SSTATE_SKIP_CREATION/The :term:`SSTATE_SKIP_CREATION` variable/
> > s/will be/can be/
> > s/to skip creation/to skip the creation/
> >
> > > +      sstate tarball files. It makes sense e.g. for image creation
> tasks as
> >
> > s/sstate/:ref:`shared state <overview-manual/concepts:shared state
> cache>`/
> >
> > > +      tarring images and keeping them in sstate would consume a lot =
of
> > > +      disk space.
> >
> > An example would be nice, such as:
> >
> >    SSTATE_SKIP_CREATION:task-image-complete =3D "1"
> >
> > >     :term:`STAGING_BASE_LIBDIR_NATIVE`
> > >        Specifies the path to the ``/lib`` subdirectory of the sysroot
> > >        directory for the build host.
>
> I've really not wanted this one documented in the past as I've not
> wanted people using it. The reason is the implications of it. I see the
> use has grown in OE-Core to multiple classes now :(.
>
> If we do add a doc, I'd suggest adding something along the lines of:
>
> """
> In general it is not recommended to use this variable as missing sstate
> artefacts adversely impact the build, particularly for entries in the
> middle of dependency chains. The case it can make sense is where the
> size and time costs of the artefact are similar to just running the
> tasks. This generally only applies to end artefact output like images.
> """
>
> Cheers,
>
> Richard
>

--00000000000090d4cf0635cb7a1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br>I&#39;m using it to avoid some recipes from=
 a buggy bsp layer (which can&#39;t build from a pre-populated sstate-cache=
) populating my sstate-cache and breaking builds down the line. I understan=
d the proper fix is to fix the recipes to work with sstate-cache, but for v=
arious reasons (e.g. no control over a third-party bsp layer) it is not alw=
ays possible.<br><br>=C3=89tienne<br><br></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May =
22, 2025 at 12:36=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2025-0=
5-22 at 11:39 +0200, Antonin Godard via <a href=3D"http://lists.yoctoprojec=
t.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrot=
e:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Some suggestions and formatting related suggestions below.<br>
&gt; <br>
&gt; On Tue May 20, 2025 at 2:39 PM CEST, Etienne Cordonnier via <a href=3D=
"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.=
yoctoproject.org</a> wrote:<br>
&gt; &gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.c=
om" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonni=
er@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0documentation/ref-manual/variables.rst | 6 ++++++<br>
&gt; &gt; =C2=A01 file changed, 6 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/documentation/ref-manual/variables.rst b/documentati=
on/ref-manual/variables.rst<br>
&gt; &gt; index 643a3e7ae..7d8e257b9 100644<br>
&gt; &gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; &gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; &gt; @@ -9049,6 +9049,12 @@ system and gives an overview of their func=
tion and contents.<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For details on the process, =
see the :ref:`ref-classes-staging` class.<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; +=C2=A0=C2=A0 :term:`SSTATE_SKIP_CREATION`<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_SKIP_CREATION variable wil=
l be used to skip creation of<br>
&gt; <br>
&gt; s/SSTATE_SKIP_CREATION/The :term:`SSTATE_SKIP_CREATION` variable/<br>
&gt; s/will be/can be/<br>
&gt; s/to skip creation/to skip the creation/<br>
&gt; <br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sstate tarball files. It makes se=
nse e.g. for image creation tasks as<br>
&gt; <br>
&gt; s/sstate/:ref:`shared state &lt;overview-manual/concepts:shared state =
cache&gt;`/<br>
&gt; <br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tarring images and keeping them i=
n sstate would consume a lot of<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disk space.<br>
&gt; <br>
&gt; An example would be nice, such as:<br>
&gt; <br>
&gt; =C2=A0=C2=A0 SSTATE_SKIP_CREATION:task-image-complete =3D &quot;1&quot=
;<br>
&gt; <br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 :term:`STAGING_BASE_LIBDIR_NATIVE`<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies the path to the ``=
/lib`` subdirectory of the sysroot<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 directory for the build host=
.<br>
<br>
I&#39;ve really not wanted this one documented in the past as I&#39;ve not<=
br>
wanted people using it. The reason is the implications of it. I see the<br>
use has grown in OE-Core to multiple classes now :(.<br>
<br>
If we do add a doc, I&#39;d suggest adding something along the lines of:<br=
>
<br>
&quot;&quot;&quot;<br>
In general it is not recommended to use this variable as missing sstate<br>
artefacts adversely impact the build, particularly for entries in the<br>
middle of dependency chains. The case it can make sense is where the<br>
size and time costs of the artefact are similar to just running the<br>
tasks. This generally only applies to end artefact output like images.<br>
&quot;&quot;&quot;<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--00000000000090d4cf0635cb7a1c--

