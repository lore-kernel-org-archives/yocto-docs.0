Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5A1C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 10:11:51 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.5100.1641377510311896831
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 02:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mfgBFOuB;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: simon.eu@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id s15so34800916pfk.6
        for <docs@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 02:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YnnQ6xEHSG7aN8vNd+5PIxw3/TULXS6cID5PEnL9Kgw=;
        b=mfgBFOuBkYlgZvtnv5+l/ukoJ7j8MaNjon+2AkeAJ7rCrOHNYeF0bZ6pj8UAqav7II
         cOwN6TPuwgSUFULGJYv+eAqB8TVvm5QpGv59Pop7rqLUdy1X+yep20ZmFM7InCMp15QI
         27TZIUhG6pXtUyMLmda7r6KiaTAnvVHtYhPtf3RiW2K4oUJpyGkbu5Wuv8QMkLs6XpMr
         YBAQ7s6JJhHzMOmz5lFGxjO6MYjHq0gqWniJYbo6enUa4XoGnXq8DFmS3w5t03Kg6sjD
         Jcdx68wvxcayRvmhT5V57NFv5k4y3U4KfOXRfGX46QQ6G7GWcWtO5YH8BhegrX5ZD1aA
         YQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YnnQ6xEHSG7aN8vNd+5PIxw3/TULXS6cID5PEnL9Kgw=;
        b=o/7DeXYRoHXKKSIocHtCAenNxKJLBU1afnmEsGfEVMy/Bwd73VaeZrcNdDVgOBVtcN
         afx1ubV1SqOw/V+EULQZe6R4nONst2ulDeYkzykyGxELORazVfgjJr4tjHorUF3GZ0Fk
         yvo/WYdYImAAfc+oLfl3NrqQUdGlfNzImzRnn4DLXpG8U+k/pRS1gszpgMiOmza0zf5d
         bUMes43rcBmpHaTvzz5FXqZ7PYWYICcLmJ1yjzLa5nT49ZnN+bsa2WZUIiwkKb6zaVto
         l1qs4ktQNpgWj7PxQpnm2l0eHKNviDgGtr5y3TkrPKlv0lqCd6JofpxOmZSm6zdO7lhd
         Lg7A==
X-Gm-Message-State: AOAM530dhT02BRd6/Wuufon7IX82bvw5eN79pv3SIqrRkQ1eTTGtBfhD
	oLsG5bQiZ1R0Ivdt18osy4eitI1sZ/p1vxPBZrw=
X-Google-Smtp-Source: 
 ABdhPJzlh/dYlKCgLMLWd0/RTVpx7ANiitdPZoJAA3eJsExIlq8YG5rckVDmwhYlSwl9H2kHhnr70DI7JcdGE7SKOy0=
X-Received: by 2002:a63:3f06:: with SMTP id m6mr25678479pga.542.1641377509691;
 Wed, 05 Jan 2022 02:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20211215092509.60979-1-simon.eu@gmail.com>
 <42d3ff93-33a1-e751-b0ff-974c8ecb4858@bootlin.com>
In-Reply-To: <42d3ff93-33a1-e751-b0ff-974c8ecb4858@bootlin.com>
From: Simon Eugster <simon.eu@gmail.com>
Date: Wed, 5 Jan 2022 11:11:38 +0100
Message-ID: 
 <CAO8d5BY0R2d4Ufvk9cWwx=t95sOcQXs-5NGquP-3AAH8xG-RAg@mail.gmail.com>
Subject: Re: [docs] [PATCH] bitbake: doc: bitbake-user-manual: Add more
 explanations to OVERRIDES
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000068547405d4d2fb6e"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Jan 2022 10:11:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2346

--00000000000068547405d4d2fb6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Am Mi., 15. Dez. 2021 um 11:46 Uhr schrieb Michael Opdenacker <
michael.opdenacker@bootlin.com>:

> Hi Simon,
>
> Many thanks for the new version of your patch!
> See my questions below...
>
> On 12/15/21 10:25 AM, Simon A. Eugster wrote:
> > Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> > ---
> >  .../bitbake-user-manual-metadata.rst          | 28 ++++++++++++-------
> >  1 file changed, 18 insertions(+), 10 deletions(-)
> >
> > diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > index d802a8d3..fc4f5d13 100644
> > --- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > +++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
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
>
>
> I don't have anything about this text, but I wonder whether we should
> mention the old syntax in the current docs.
> Thoughts anyone?
>

I added this because I (as a new user) found it very confusing to find all
the _ style syntax in guides online and no mention of it in the docs. I
would have expected such a note.


> >  .. _removing-override-style-syntax:
> >
> >  Removal (Override Style Syntax)
> > @@ -517,20 +523,22 @@ variable.
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
> > +      # Typically, OVERRIDES contains something like
> architecture:os:machine
> > +      OVERRIDES =3D "linux:arm"
>
>
> Here you quote an example with two items, but this doesn't align with
> the typical contents with three items you mention in the comment that
> you added.
> By the way, according to the below text, didn't you mean?
>
> OVERRIDES =3D "foo:linux:arm"
>
> It looks like a good idea to have this comment; this way you can give a
> concrete example. In my opinion, "foo" is vague, what about instead?
>
> OVERRIDES =3D "arm:linux:beaglebone"
>

Yes, will change that!


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
> >
> >     To better understand this, consider a practical example that assume=
s
> >     an OpenEmbedded metadata-based Linux kernel recipe file. The
> > @@ -552,7 +560,7 @@ variable.
> >
> >        DEPENDS =3D "glibc ncurses"
> >        OVERRIDES =3D "machine:local"
> > -      DEPENDS:append:machine =3D "libmad"
> > +      DEPENDS:append:machine =3D " libmad"
> >
> >     In this example, :term:`DEPENDS` becomes "glibc ncurses libmad".
>

Thanks,
Simon

--00000000000068547405d4d2fb6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Michael,<br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Am Mi., 15. Dez. 2021 um 11:46=C2=A0Uh=
r schrieb Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootl=
in.com">michael.opdenacker@bootlin.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Simon,<br>
<br>
Many thanks for the new version of your patch!<br>
See my questions below...<br>
<br>
On 12/15/21 10:25 AM, Simon A. Eugster wrote:<br>
&gt; Signed-off-by: Simon A. Eugster &lt;<a href=3D"mailto:simon.eu@gmail.c=
om" target=3D"_blank">simon.eu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bitbake-user-manual-metadata.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 28 ++++++++++++-------<br>
&gt;=C2=A0 1 file changed, 18 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt; diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst =
b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst<br>
&gt; index d802a8d3..fc4f5d13 100644<br>
&gt; --- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst<br>
&gt; +++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst<br>
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
<br>
<br>
I don&#39;t have anything about this text, but I wonder whether we should<b=
r>
mention the old syntax in the current docs.<br>
Thoughts anyone?<br></blockquote><div><br></div><div>I added this because I=
 (as a new user) found it very confusing to find all the _ style syntax in =
guides online and no mention of it in the docs. I would have expected such =
a note.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
&gt;=C2=A0 .. _removing-override-style-syntax:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Removal (Override Style Syntax)<br>
&gt; @@ -517,20 +523,22 @@ variable.<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 # Typically, OVERRIDES contains something like a=
rchitecture:os:machine<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 OVERRIDES =3D &quot;linux:arm&quot;<br>
<br>
<br>
Here you quote an example with two items, but this doesn&#39;t align with<b=
r>
the typical contents with three items you mention in the comment that<br>
you added.<br>
By the way, according to the below text, didn&#39;t you mean?<br>
<br>
OVERRIDES =3D &quot;foo:linux:arm&quot;<br>
<br>
It looks like a good idea to have this comment; this way you can give a<br>
concrete example. In my opinion, &quot;foo&quot; is vague, what about inste=
ad?<br>
<br>
OVERRIDES =3D &quot;arm:linux:beaglebone&quot;<br></blockquote><div><br></d=
iv><div>Yes, will change that!<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
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
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0To better understand this, consider a practical exa=
mple that assumes<br>
&gt;=C2=A0 =C2=A0 =C2=A0an OpenEmbedded metadata-based Linux kernel recipe =
file. The<br>
&gt; @@ -552,7 +560,7 @@ variable.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEPENDS =3D &quot;glibc ncurses&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 OVERRIDES =3D &quot;machine:local&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 DEPENDS:append:machine =3D &quot;libmad&quot;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 DEPENDS:append:machine =3D &quot; libmad&quot;<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0In this example, :term:`DEPENDS` becomes &quot;glib=
c ncurses libmad&quot;.<br></blockquote><div><br></div><div>Thanks,</div><d=
iv>Simon<br></div></div></div>

--00000000000068547405d4d2fb6e--

