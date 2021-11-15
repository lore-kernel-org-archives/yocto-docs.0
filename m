Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598A5C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 13:15:29 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.22174.1636982127992130840
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 05:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hhsuTuJN;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: simon.eu@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id b11so14369325pld.12
        for <docs@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 05:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gzQZbUWQaVZUVNMxTl+20Jpy3+vzPJW/igdAxHTTu2A=;
        b=hhsuTuJNUcPaGljIhCUo/yQiyFvP/Xg2UlAt6TaDfs2PXNn7hA62LU6uwjC7KJ6qla
         t3StTUVLmsAUzPx6cvh2xTuyK/DeOajC6FbP2XTcHRRF5zbRfsofrAgnCw2vAU6X57Qq
         6nL0NGROWqngvlLPJS9CQeYbAPOMBhLc/tjmbHrlDvpF6Jj775NN81McdSd5N7UoFK2E
         O15fnY8kVlokH2Febi0yASAo1bhNtZWiCnCJKxFgwdIyAGr3iGQnmqP4O9pTlkvlLGIk
         R12zETsSYkz7XyH8kI36xIaVmNVkvpPRypwYW7D32haAS/nc4pqvq3i8kfVsTrXO6uQU
         bu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gzQZbUWQaVZUVNMxTl+20Jpy3+vzPJW/igdAxHTTu2A=;
        b=w16NdyEYF8/pZziXLG7PrJaA3GwsOHTphGMRinYNeuBzEJsH4qTs1zplPuJGqTVuha
         cXXKQtXzUkn47D9DSHfB91n2DPCRwtZySyeTV7xS5Cy94Vy0XJROWWZmUhTx2UXclFGS
         +NTwHeBMrAEe3fJV1jhp2sPIQt9NS2DBrRxMlnZhMP2D4v6CM6mtx42cHoaKbSfqviaW
         RA9VYpAGICsQycgTjrs5+D6T96PT/4JISDSycnCdWdO7f3Ta48pmigXAZjZqvuD0oUun
         uoxlW+fbknSBInnF7z7m9MwsTolgeHHICDhLk2aCv4HEg4ijJ+mNGmvoZMnyaDMaWrn8
         BIgQ==
X-Gm-Message-State: AOAM533vQort7w4X8QeI7solcyMWJsvrJvY8TJsCRn7OE9xC1o+/EL8r
	HCZNoCQ7Xtvat0vekTZMYjwcfOqR898yvt76thQ=
X-Google-Smtp-Source: 
 ABdhPJywCkPjYZMr/Pw99goZ/ykv7H/A3SnWu17KJ1usM3FkUcMBZAHkCRWFvdtiTl8OS5726RsR9K4Z4GLNY53MIU4=
X-Received: by 2002:a17:90a:4a06:: with SMTP id
 e6mr66008147pjh.228.1636982127384;
 Mon, 15 Nov 2021 05:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20211115124546.97456-1-simon.eu@gmail.com>
 <09f9337d978b9d0727de2a937eb417e8185ca0b3.camel@linuxfoundation.org>
In-Reply-To: 
 <09f9337d978b9d0727de2a937eb417e8185ca0b3.camel@linuxfoundation.org>
From: Simon Eugster <simon.eu@gmail.com>
Date: Mon, 15 Nov 2021 14:15:16 +0100
Message-ID: 
 <CAO8d5BbLW1o1UO4HneaZp8zwKmboQYxAJ5Br7xvVdzTaGzsseQ@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] bitbake: doc: bitbake-user-manual: Add more
 explanations to OVERRIDES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/mixed; boundary="00000000000034f00c05d0d39ada"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Nov 2021 13:15:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2156

--00000000000034f00c05d0d39ada
Content-Type: multipart/alternative; boundary="00000000000034f00a05d0d39ad8"

--00000000000034f00a05d0d39ad8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I found it confusing to have arm mentioned but not present in the example,
and wondered if machine would first be resolved to arm and then used as
override. But I also liked the good practice hint.

Will remove the DEPENDS:append and add a space, you are right. I did not
test it and only believed what I understood from a youtube video :)

Simon

Am Mo., 15. Nov. 2021 um 13:51 Uhr schrieb Richard Purdie <
richard.purdie@linuxfoundation.org>:

> On Mon, 2021-11-15 at 13:45 +0100, Simon A. Eugster wrote:
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
> >
> >  The resulting HTML index page will be _build/html/index.html, and you
> >  can browse your own copy of the locally generated documentation with
> > diff --git
> a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > index 119720d527..3449bc1f68 100644
> > --- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > +++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > @@ -268,7 +268,7 @@ examples::
> >     C =3D "cval"
> >     C =3D. "test"
> >
> > -The variable :term:`B` contains "bvaladditionaldata" and ``C`` contain=
s
> > +The variable ``B`` contains "bvaladditionaldata" and ``C`` contains
> >  "testcval".
> >
> >  Appending and Prepending (Override Style Syntax)
> > @@ -300,6 +300,12 @@ It is also possible to append and prepend to shell
> functions and
> >  BitBake-style Python functions. See the
> ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:shell functions`"
> and ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:bitbake-style
> python functions`"
> >  sections for examples.
> >
> > +.. note::
> > +
> > +   Before Honister (3.4), override style used ``_`` instead of ``:``,
> so you will
> > +   still find a lot of documentation using =E2=80=9C_append=E2=80=9D, =
=E2=80=9C_prepend=E2=80=9D, and
> > +   =E2=80=9C_remove=E2=80=9D.
> > +
> >  .. _removing-override-style-syntax:
> >
> >  Removal (Override Style Syntax)
> > @@ -517,20 +523,21 @@ variable.
> >  -  *Selecting a Variable:* The :term:`OVERRIDES` variable is a
> >     colon-character-separated list that contains items for which you wa=
nt
> >     to satisfy conditions. Thus, if you have a variable that is
> > -   conditional on "arm", and "arm" is in :term:`OVERRIDES`, then the
> > +   conditional on "arm", and "arm" is listed in :term:`OVERRIDES`, the=
n
> the
> >     "arm"-specific version of the variable is used rather than the
> >     non-conditional version. Here is an example::
> >
> > -      OVERRIDES =3D "architecture:os:machine"
> > +      OVERRIDES =3D "foo:linux:arm"
> >        TEST =3D "default"
> > -      TEST_os =3D "osspecific"
> > -      TEST_nooverride =3D "othercondvalue"
> > +      TEST:arm =3D "armspecific"
> > +      TEST:nooverride =3D "othercondvalue"
> >
> > -   In this example, the :term:`OVERRIDES`
> > -   variable lists three overrides: "architecture", "os", and "machine"=
.
> > -   The variable ``TEST`` by itself has a default value of "default". Y=
ou
> > -   select the os-specific version of the ``TEST`` variable by appendin=
g
> > -   the "os" override to the variable (i.e. ``TEST_os``).
> > +   In this example, the :term:`OVERRIDES` variable lists three
> > +   overrides: "foo", "linux", and "arm". The variable ``TEST`` by itse=
lf
> > +   has a default value of "default", and the value of the =E2=80=9Carm=
=E2=80=9D specific
> > +   version =E2=80=9Carmspecific=E2=80=9D is used because :term:`OVERRI=
DES` contains
> > +   =E2=80=9Carm=E2=80=9D. The =E2=80=9Cnooverride=E2=80=9D specific ve=
rsion is not used because
> > +   :term:`OVERRIDES` does not contain =E2=80=9Cnooverride=E2=80=9D.
>
> Why are you removing the mentions of architecture and machine here? It is
> in
> some ways a hint as to how the overrides are used in OE and elsewhere so
> I'm not
> sure that is a good thing to make it generic...
>
> >
> >     To better understand this, consider a practical example that assume=
s
> >     an OpenEmbedded metadata-based Linux kernel recipe file. The
> > @@ -546,15 +553,21 @@ variable.
> >        KBRANCH:qemux86-64 =3D "standard/common-pc-64/base"
> >        KBRANCH:qemumips64 =3D "standard/mti-malta64"
> >
> > +   This works because in poky the :term:`OVERRIDES` variable by defaul=
t
> > +   includes the ``MACHINE`` variable, which is set to e.g. =E2=80=9Cqe=
mux86=E2=80=9D.
> > +
> >  -  *Appending and Prepending:* BitBake also supports append and prepen=
d
> >     operations to variable values based on whether a specific item is
> >     listed in :term:`OVERRIDES`. Here is an example::
> >
> >        DEPENDS =3D "glibc ncurses"
> >        OVERRIDES =3D "machine:local"
> > +      DEPENDS:append =3D "defaultappend"
> >        DEPENDS:append:machine =3D "libmad"
> >
> > -   In this example, :term:`DEPENDS` becomes "glibc ncurses libmad".
> > +   In this example, :term:`DEPENDS` becomes "glibc ncurses libmad". Th=
e
> > +   default append is ``DEPENDS:append`` is not used because the overri=
de
> > +   mechanism choses the specific ``:append``.
>
> This example looks incorrect to me, I think it would become:
>
> "glibc ncursesdefaultappendlibmad"
>
> although the example should say DEPENDS:append:machine =3D " libmad" as
> there is a
> missing space there too.
>
> Cheers,
>
> Richard
>
>
>
>
>

--00000000000034f00a05d0d39ad8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Richard,</div><div><br></div><div=
>I found it confusing to have arm mentioned but not present in the example,=
 and wondered if machine would first be resolved to arm and then used as ov=
erride. But I also liked the good practice hint.</div><div><br></div><div>W=
ill remove the DEPENDS:append and add a space, you are right. I did not tes=
t it and only believed what I understood from a youtube video :)</div><div>=
<br></div><div>Simon<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Am Mo., 15. Nov. 2021 um 13:51=C2=A0Uhr schri=
eb Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt;:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Mon, 2021-11-15 at 13:45 +0100, Simon A. Eu=
gster wrote:<br>
&gt; Signed-off-by: Simon A. Eugster &lt;<a href=3D"mailto:simon.eu@gmail.c=
om" target=3D"_blank">simon.eu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bitbake/doc/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 .../bitbake-user-manual-metadata.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 35 +++++++++++++------<br>
&gt;=C2=A0 2 files changed, 25 insertions(+), 13 deletions(-)<br>
&gt; <br>
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
&gt;=C2=A0 <br>
&gt;=C2=A0 The resulting HTML index page will be _build/html/index.html, an=
d you<br>
&gt;=C2=A0 can browse your own copy of the locally generated documentation =
with<br>
&gt; diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metad=
ata.rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst<=
br>
&gt; index 119720d527..3449bc1f68 100644<br>
&gt; --- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst=
<br>
&gt; +++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst=
<br>
&gt; @@ -268,7 +268,7 @@ examples::<br>
&gt;=C2=A0 =C2=A0 =C2=A0C =3D &quot;cval&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0C =3D. &quot;test&quot;<br>
&gt;=C2=A0 <br>
&gt; -The variable :term:`B` contains &quot;bvaladditionaldata&quot; and ``=
C`` contains<br>
&gt; +The variable ``B`` contains &quot;bvaladditionaldata&quot; and ``C`` =
contains<br>
&gt;=C2=A0 &quot;testcval&quot;.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Appending and Prepending (Override Style Syntax)<br>
&gt; @@ -300,6 +300,12 @@ It is also possible to append and prepend to shel=
l functions and<br>
&gt;=C2=A0 BitBake-style Python functions. See the &quot;:ref:`bitbake-user=
-manual/bitbake-user-manual-metadata:shell functions`&quot; and &quot;:ref:=
`bitbake-user-manual/bitbake-user-manual-metadata:bitbake-style python func=
tions`&quot;<br>
&gt;=C2=A0 sections for examples.<br>
&gt;=C2=A0 <br>
&gt; +.. note::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0Before Honister (3.4), override style used ``_`` instead=
 of ``:``, so you will<br>
&gt; +=C2=A0 =C2=A0still find a lot of documentation using =E2=80=9C_append=
=E2=80=9D, =E2=80=9C_prepend=E2=80=9D, and<br>
&gt; +=C2=A0 =C2=A0=E2=80=9C_remove=E2=80=9D.<br>
&gt; +<br>
&gt;=C2=A0 .. _removing-override-style-syntax:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Removal (Override Style Syntax)<br>
&gt; @@ -517,20 +523,21 @@ variable.<br>
&gt;=C2=A0 -=C2=A0 *Selecting a Variable:* The :term:`OVERRIDES` variable i=
s a<br>
&gt;=C2=A0 =C2=A0 =C2=A0colon-character-separated list that contains items =
for which you want<br>
&gt;=C2=A0 =C2=A0 =C2=A0to satisfy conditions. Thus, if you have a variable=
 that is<br>
&gt; -=C2=A0 =C2=A0conditional on &quot;arm&quot;, and &quot;arm&quot; is i=
n :term:`OVERRIDES`, then the<br>
&gt; +=C2=A0 =C2=A0conditional on &quot;arm&quot;, and &quot;arm&quot; is l=
isted in :term:`OVERRIDES`, then the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;arm&quot;-specific version of the variable is=
 used rather than the<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-conditional version. Here is an example::<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 OVERRIDES =3D &quot;architecture:os:machine&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 OVERRIDES =3D &quot;foo:linux:arm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST =3D &quot;default&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 TEST_os =3D &quot;osspecific&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 TEST_nooverride =3D &quot;othercondvalue&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 TEST:arm =3D &quot;armspecific&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 TEST:nooverride =3D &quot;othercondvalue&quot;<b=
r>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0In this example, the :term:`OVERRIDES`<br>
&gt; -=C2=A0 =C2=A0variable lists three overrides: &quot;architecture&quot;=
, &quot;os&quot;, and &quot;machine&quot;.<br>
&gt; -=C2=A0 =C2=A0The variable ``TEST`` by itself has a default value of &=
quot;default&quot;. You<br>
&gt; -=C2=A0 =C2=A0select the os-specific version of the ``TEST`` variable =
by appending<br>
&gt; -=C2=A0 =C2=A0the &quot;os&quot; override to the variable (i.e. ``TEST=
_os``).<br>
&gt; +=C2=A0 =C2=A0In this example, the :term:`OVERRIDES` variable lists th=
ree<br>
&gt; +=C2=A0 =C2=A0overrides: &quot;foo&quot;, &quot;linux&quot;, and &quot=
;arm&quot;. The variable ``TEST`` by itself<br>
&gt; +=C2=A0 =C2=A0has a default value of &quot;default&quot;, and the valu=
e of the =E2=80=9Carm=E2=80=9D specific<br>
&gt; +=C2=A0 =C2=A0version =E2=80=9Carmspecific=E2=80=9D is used because :t=
erm:`OVERRIDES` contains<br>
&gt; +=C2=A0 =C2=A0=E2=80=9Carm=E2=80=9D. The =E2=80=9Cnooverride=E2=80=9D =
specific version is not used because<br>
&gt; +=C2=A0 =C2=A0:term:`OVERRIDES` does not contain =E2=80=9Cnooverride=
=E2=80=9D.<br>
<br>
Why are you removing the mentions of architecture and machine here? It is i=
n<br>
some ways a hint as to how the overrides are used in OE and elsewhere so I&=
#39;m not<br>
sure that is a good thing to make it generic...<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0To better understand this, consider a practical exa=
mple that assumes<br>
&gt;=C2=A0 =C2=A0 =C2=A0an OpenEmbedded metadata-based Linux kernel recipe =
file. The<br>
&gt; @@ -546,15 +553,21 @@ variable.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 KBRANCH:qemux86-64 =3D &quot;standard/commo=
n-pc-64/base&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 KBRANCH:qemumips64 =3D &quot;standard/mti-m=
alta64&quot;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0This works because in poky the :term:`OVERRIDES` variabl=
e by default<br>
&gt; +=C2=A0 =C2=A0includes the ``MACHINE`` variable, which is set to e.g. =
=E2=80=9Cqemux86=E2=80=9D.<br>
&gt; +<br>
&gt;=C2=A0 -=C2=A0 *Appending and Prepending:* BitBake also supports append=
 and prepend<br>
&gt;=C2=A0 =C2=A0 =C2=A0operations to variable values based on whether a sp=
ecific item is<br>
&gt;=C2=A0 =C2=A0 =C2=A0listed in :term:`OVERRIDES`. Here is an example::<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEPENDS =3D &quot;glibc ncurses&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 OVERRIDES =3D &quot;machine:local&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 DEPENDS:append =3D &quot;defaultappend&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEPENDS:append:machine =3D &quot;libmad&quo=
t;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0In this example, :term:`DEPENDS` becomes &quot;glibc ncu=
rses libmad&quot;.<br>
&gt; +=C2=A0 =C2=A0In this example, :term:`DEPENDS` becomes &quot;glibc ncu=
rses libmad&quot;. The<br>
&gt; +=C2=A0 =C2=A0default append is ``DEPENDS:append`` is not used because=
 the override<br>
&gt; +=C2=A0 =C2=A0mechanism choses the specific ``:append``.<br>
<br>
This example looks incorrect to me, I think it would become:<br>
<br>
&quot;glibc ncursesdefaultappendlibmad&quot;<br>
<br>
although the example should say DEPENDS:append:machine =3D &quot; libmad&qu=
ot; as there is a<br>
missing space there too.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000034f00a05d0d39ad8--

--00000000000034f00c05d0d39ada
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-bitbake-doc-bitbake-user-manual-Add-more-explanation.patch"
Content-Disposition: attachment;
	filename="0001-bitbake-doc-bitbake-user-manual-Add-more-explanation.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kw0ov4gj0>
X-Attachment-Id: f_kw0ov4gj0

RnJvbSA0MzJhN2U0YTViYmYyYzE2YTJmMjE4MmUxZGM3N2YyZTVmMTZlYmI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiU2ltb24gQS4gRXVnc3RlciIgPHNpbW9uLmV1QGdtYWlsLmNv
bT4KRGF0ZTogTW9uLCAxNSBOb3YgMjAyMSAxMzozMDoxMCArMDEwMApTdWJqZWN0OiBbUEFUQ0hd
IGJpdGJha2U6IGRvYzogYml0YmFrZS11c2VyLW1hbnVhbDogQWRkIG1vcmUgZXhwbGFuYXRpb25z
IHRvCiBPVkVSUklERVMKClNpZ25lZC1vZmYtYnk6IFNpbW9uIEEuIEV1Z3N0ZXIgPHNpbW9uLmV1
QGdtYWlsLmNvbT4KLS0tCiBiaXRiYWtlL2RvYy9SRUFETUUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMyArLQogLi4uL2JpdGJha2UtdXNlci1tYW51YWwtbWV0YWRhdGEucnN0ICAgICAg
ICAgIHwgMzMgKysrKysrKysrKysrLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9iaXRiYWtlL2RvYy9SRUFETUUg
Yi9iaXRiYWtlL2RvYy9SRUFETUUKaW5kZXggMTZlNmNkZjk5MC4uODRlN2NiNzAyZCAxMDA2NDQK
LS0tIGEvYml0YmFrZS9kb2MvUkVBRE1FCisrKyBiL2JpdGJha2UvZG9jL1JFQURNRQpAQCAtNDcs
OCArNDcsNyBAQCBUbyBpbnN0YWxsIGFsbCByZXF1aXJlZCBwYWNrYWdlcyBydW46CiAKIFRvIGJ1
aWxkIHRoZSBkb2N1bWVudGF0aW9uIGxvY2FsbHksIHJ1bjoKIAotICQgY2QgZG9jdW1lbnRhdGlv
bgotICQgbWFrZSAtZiBNYWtlZmlsZS5zcGhpbnggaHRtbAorICQgbWFrZSBodG1sCiAKIFRoZSBy
ZXN1bHRpbmcgSFRNTCBpbmRleCBwYWdlIHdpbGwgYmUgX2J1aWxkL2h0bWwvaW5kZXguaHRtbCwg
YW5kIHlvdQogY2FuIGJyb3dzZSB5b3VyIG93biBjb3B5IG9mIHRoZSBsb2NhbGx5IGdlbmVyYXRl
ZCBkb2N1bWVudGF0aW9uIHdpdGgKZGlmZiAtLWdpdCBhL2JpdGJha2UvZG9jL2JpdGJha2UtdXNl
ci1tYW51YWwvYml0YmFrZS11c2VyLW1hbnVhbC1tZXRhZGF0YS5yc3QgYi9iaXRiYWtlL2RvYy9i
aXRiYWtlLXVzZXItbWFudWFsL2JpdGJha2UtdXNlci1tYW51YWwtbWV0YWRhdGEucnN0CmluZGV4
IDExOTcyMGQ1MjcuLmNlYTBjZTZkYTggMTAwNjQ0Ci0tLSBhL2JpdGJha2UvZG9jL2JpdGJha2Ut
dXNlci1tYW51YWwvYml0YmFrZS11c2VyLW1hbnVhbC1tZXRhZGF0YS5yc3QKKysrIGIvYml0YmFr
ZS9kb2MvYml0YmFrZS11c2VyLW1hbnVhbC9iaXRiYWtlLXVzZXItbWFudWFsLW1ldGFkYXRhLnJz
dApAQCAtMjY4LDcgKzI2OCw3IEBAIGV4YW1wbGVzOjoKICAgIEMgPSAiY3ZhbCIKICAgIEMgPS4g
InRlc3QiCiAKLVRoZSB2YXJpYWJsZSA6dGVybTpgQmAgY29udGFpbnMgImJ2YWxhZGRpdGlvbmFs
ZGF0YSIgYW5kIGBgQ2BgIGNvbnRhaW5zCitUaGUgdmFyaWFibGUgYGBCYGAgY29udGFpbnMgImJ2
YWxhZGRpdGlvbmFsZGF0YSIgYW5kIGBgQ2BgIGNvbnRhaW5zCiAidGVzdGN2YWwiLgogCiBBcHBl
bmRpbmcgYW5kIFByZXBlbmRpbmcgKE92ZXJyaWRlIFN0eWxlIFN5bnRheCkKQEAgLTMwMCw2ICsz
MDAsMTIgQEAgSXQgaXMgYWxzbyBwb3NzaWJsZSB0byBhcHBlbmQgYW5kIHByZXBlbmQgdG8gc2hl
bGwgZnVuY3Rpb25zIGFuZAogQml0QmFrZS1zdHlsZSBQeXRob24gZnVuY3Rpb25zLiBTZWUgdGhl
ICI6cmVmOmBiaXRiYWtlLXVzZXItbWFudWFsL2JpdGJha2UtdXNlci1tYW51YWwtbWV0YWRhdGE6
c2hlbGwgZnVuY3Rpb25zYCIgYW5kICI6cmVmOmBiaXRiYWtlLXVzZXItbWFudWFsL2JpdGJha2Ut
dXNlci1tYW51YWwtbWV0YWRhdGE6Yml0YmFrZS1zdHlsZSBweXRob24gZnVuY3Rpb25zYCIKIHNl
Y3Rpb25zIGZvciBleGFtcGxlcy4KIAorLi4gbm90ZTo6CisKKyAgIEJlZm9yZSBIb25pc3RlciAo
My40KSwgb3ZlcnJpZGUgc3R5bGUgdXNlZCBgYF9gYCBpbnN0ZWFkIG9mIGBgOmBgLCBzbyB5b3Ug
d2lsbAorICAgc3RpbGwgZmluZCBhIGxvdCBvZiBkb2N1bWVudGF0aW9uIHVzaW5nIOKAnF9hcHBl
bmTigJ0sIOKAnF9wcmVwZW5k4oCdLCBhbmQKKyAgIOKAnF9yZW1vdmXigJ0uCisKIC4uIF9yZW1v
dmluZy1vdmVycmlkZS1zdHlsZS1zeW50YXg6CiAKIFJlbW92YWwgKE92ZXJyaWRlIFN0eWxlIFN5
bnRheCkKQEAgLTUxNywyMCArNTIzLDIyIEBAIHZhcmlhYmxlLgogLSAgKlNlbGVjdGluZyBhIFZh
cmlhYmxlOiogVGhlIDp0ZXJtOmBPVkVSUklERVNgIHZhcmlhYmxlIGlzIGEKICAgIGNvbG9uLWNo
YXJhY3Rlci1zZXBhcmF0ZWQgbGlzdCB0aGF0IGNvbnRhaW5zIGl0ZW1zIGZvciB3aGljaCB5b3Ug
d2FudAogICAgdG8gc2F0aXNmeSBjb25kaXRpb25zLiBUaHVzLCBpZiB5b3UgaGF2ZSBhIHZhcmlh
YmxlIHRoYXQgaXMKLSAgIGNvbmRpdGlvbmFsIG9uICJhcm0iLCBhbmQgImFybSIgaXMgaW4gOnRl
cm06YE9WRVJSSURFU2AsIHRoZW4gdGhlCisgICBjb25kaXRpb25hbCBvbiAiYXJtIiwgYW5kICJh
cm0iIGlzIGxpc3RlZCBpbiA6dGVybTpgT1ZFUlJJREVTYCwgdGhlbiB0aGUKICAgICJhcm0iLXNw
ZWNpZmljIHZlcnNpb24gb2YgdGhlIHZhcmlhYmxlIGlzIHVzZWQgcmF0aGVyIHRoYW4gdGhlCiAg
ICBub24tY29uZGl0aW9uYWwgdmVyc2lvbi4gSGVyZSBpcyBhbiBleGFtcGxlOjoKIAotICAgICAg
T1ZFUlJJREVTID0gImFyY2hpdGVjdHVyZTpvczptYWNoaW5lIgorICAgICAgIyBUeXBpY2FsbHks
IE9WRVJSSURFUyBjb250YWlucyBzb21ldGhpbmcgbGlrZSBhcmNoaXRlY3R1cmU6b3M6bWFjaGlu
ZQorICAgICAgT1ZFUlJJREVTID0gImxpbnV4OmFybSIKICAgICAgIFRFU1QgPSAiZGVmYXVsdCIK
LSAgICAgIFRFU1Rfb3MgPSAib3NzcGVjaWZpYyIKLSAgICAgIFRFU1Rfbm9vdmVycmlkZSA9ICJv
dGhlcmNvbmR2YWx1ZSIKKyAgICAgIFRFU1Q6YXJtID0gImFybXNwZWNpZmljIgorICAgICAgVEVT
VDpub292ZXJyaWRlID0gIm90aGVyY29uZHZhbHVlIgogCi0gICBJbiB0aGlzIGV4YW1wbGUsIHRo
ZSA6dGVybTpgT1ZFUlJJREVTYAotICAgdmFyaWFibGUgbGlzdHMgdGhyZWUgb3ZlcnJpZGVzOiAi
YXJjaGl0ZWN0dXJlIiwgIm9zIiwgYW5kICJtYWNoaW5lIi4KLSAgIFRoZSB2YXJpYWJsZSBgYFRF
U1RgYCBieSBpdHNlbGYgaGFzIGEgZGVmYXVsdCB2YWx1ZSBvZiAiZGVmYXVsdCIuIFlvdQotICAg
c2VsZWN0IHRoZSBvcy1zcGVjaWZpYyB2ZXJzaW9uIG9mIHRoZSBgYFRFU1RgYCB2YXJpYWJsZSBi
eSBhcHBlbmRpbmcKLSAgIHRoZSAib3MiIG92ZXJyaWRlIHRvIHRoZSB2YXJpYWJsZSAoaS5lLiBg
YFRFU1Rfb3NgYCkuCisgICBJbiB0aGlzIGV4YW1wbGUsIHRoZSA6dGVybTpgT1ZFUlJJREVTYCB2
YXJpYWJsZSBsaXN0cyB0aHJlZQorICAgb3ZlcnJpZGVzOiAiZm9vIiwgImxpbnV4IiwgYW5kICJh
cm0iLiBUaGUgdmFyaWFibGUgYGBURVNUYGAgYnkgaXRzZWxmCisgICBoYXMgYSBkZWZhdWx0IHZh
bHVlIG9mICJkZWZhdWx0IiwgYW5kIHRoZSB2YWx1ZSBvZiB0aGUg4oCcYXJt4oCdIHNwZWNpZmlj
CisgICB2ZXJzaW9uIOKAnGFybXNwZWNpZmlj4oCdIGlzIHVzZWQgYmVjYXVzZSA6dGVybTpgT1ZF
UlJJREVTYCBjb250YWlucworICAg4oCcYXJt4oCdLiBUaGUg4oCcbm9vdmVycmlkZeKAnSBzcGVj
aWZpYyB2ZXJzaW9uIGlzIG5vdCB1c2VkIGJlY2F1c2UKKyAgIDp0ZXJtOmBPVkVSUklERVNgIGRv
ZXMgbm90IGNvbnRhaW4g4oCcbm9vdmVycmlkZeKAnS4KIAogICAgVG8gYmV0dGVyIHVuZGVyc3Rh
bmQgdGhpcywgY29uc2lkZXIgYSBwcmFjdGljYWwgZXhhbXBsZSB0aGF0IGFzc3VtZXMKICAgIGFu
IE9wZW5FbWJlZGRlZCBtZXRhZGF0YS1iYXNlZCBMaW51eCBrZXJuZWwgcmVjaXBlIGZpbGUuIFRo
ZQpAQCAtNTQ2LDEzICs1NTQsMTYgQEAgdmFyaWFibGUuCiAgICAgICBLQlJBTkNIOnFlbXV4ODYt
NjQgPSAic3RhbmRhcmQvY29tbW9uLXBjLTY0L2Jhc2UiCiAgICAgICBLQlJBTkNIOnFlbXVtaXBz
NjQgPSAic3RhbmRhcmQvbXRpLW1hbHRhNjQiCiAKKyAgIFRoaXMgd29ya3MgYmVjYXVzZSBpbiBw
b2t5IHRoZSA6dGVybTpgT1ZFUlJJREVTYCB2YXJpYWJsZSBieSBkZWZhdWx0CisgICBpbmNsdWRl
cyB0aGUgYGBNQUNISU5FYGAgdmFyaWFibGUsIHdoaWNoIGlzIHNldCB0byBlLmcuIOKAnHFlbXV4
ODbigJ0uCisKIC0gICpBcHBlbmRpbmcgYW5kIFByZXBlbmRpbmc6KiBCaXRCYWtlIGFsc28gc3Vw
cG9ydHMgYXBwZW5kIGFuZCBwcmVwZW5kCiAgICBvcGVyYXRpb25zIHRvIHZhcmlhYmxlIHZhbHVl
cyBiYXNlZCBvbiB3aGV0aGVyIGEgc3BlY2lmaWMgaXRlbSBpcwogICAgbGlzdGVkIGluIDp0ZXJt
OmBPVkVSUklERVNgLiBIZXJlIGlzIGFuIGV4YW1wbGU6OgogCiAgICAgICBERVBFTkRTID0gImds
aWJjIG5jdXJzZXMiCiAgICAgICBPVkVSUklERVMgPSAibWFjaGluZTpsb2NhbCIKLSAgICAgIERF
UEVORFM6YXBwZW5kOm1hY2hpbmUgPSAibGlibWFkIgorICAgICAgREVQRU5EUzphcHBlbmQ6bWFj
aGluZSA9ICIgbGlibWFkIgogCiAgICBJbiB0aGlzIGV4YW1wbGUsIDp0ZXJtOmBERVBFTkRTYCBi
ZWNvbWVzICJnbGliYyBuY3Vyc2VzIGxpYm1hZCIuCiAKLS0gCjIuMzAuMgoK
--00000000000034f00c05d0d39ada--

