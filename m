Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F73C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 14:26:31 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.19915.1738333587907064544
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 06:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iLwgz29+;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: simon.eu@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166022c5caso31852225ad.2
        for <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 06:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738333587; x=1738938387; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=caHhAvBnqDriImjg9g1UXNNkZm5/JGMS29elDsz27Pg=;
        b=iLwgz29+dzTRSJYWRnogwTTLWCJXU28A6Gg3bZuZNNRofFGWvXeC3VphQlF8cO+CMj
         2UTTSmg6Lcgi7nD4Azy66Z/SLEVjszz+MqiM2qatkZnEtNfB4pmt+omWuFPSKUEyC9nC
         MLJ2rKpDBaAJPws0h/feaL6lAI8nEiyQT1183kmgOsmroB1qk5GDyKautRXYZdK9otmO
         ckARjOE2Bex7Mc6p8SpE3LFD7v5Qprbw/Y+fMVuXvhd81jNzWPecTKhClWQQfhunyu5r
         tsYoNn+fzs8cKmmngnup9jnobMb5bcMV+AGYU/dU024BqYEoeSaj6awk2o7oCNGc84w8
         bWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738333587; x=1738938387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caHhAvBnqDriImjg9g1UXNNkZm5/JGMS29elDsz27Pg=;
        b=NlcBflRmCHHzF7AN1W7ti4MyLn8DFjyrkOfRODxVyTzzfZqm8BWwea0nz4CRs1A7tn
         5OsSnGR3c/ylNKE5V1p2ZEvJ33MkwymBal5Xerz2iKMTDWko0131omT4DogBKBktcNO4
         OCBvjw/ru6tr8xxqXjWbqXv3ezSskEpUAzvUYIGxzxliLempFlCb443hGbpJ/qI4TQ8C
         EP+8dpGVAfOmK74pnjU14KTsYxYfp2CWcDEyIN5mZForFtctVKpa/UBf/3LGy/IHs4pw
         9HEOYFEk71wvKnwE2WjWby/5MnzqwT5IKd6ffOPbzExIkgjTVMFU+xZeADcBIJq0qypg
         Wnzw==
X-Gm-Message-State: AOJu0YyzABoiBAXAGW7zAZMIthMdyv2IHp/IlyIeLYOWS+KhEWfd/lWA
	cDOcUsYrIeTc/VBGq64pmDmatMiopz4XsCDIKYhQzhJD8ShfHk3YTp8AfR8GnboPihHP77JxR+H
	tLgUiL3rdQtG15TPwDINPraDiDwk=
X-Gm-Gg: ASbGncvcTA3BcfHwnBVvNrkZp0nEp3oXXABPvBS0e0PZs6U4ibzxrZRa++r3LCNASPj
	3jneJCPAWY9M8vTJ4j619KQpdsPFb/7feT0yBXXFT8MtvER0gCTHjzFNvmAdrLw39OGJGBv+MJA
	==
X-Google-Smtp-Source: AGHT+IGJcdiXn7+4ZVMANCuR1irYqDiTNC3l/rVkOwf0ACSbKDaFGCxxxmC61QDnnQ2mKMXXDsLnfCUkELrozP4GRcs=
X-Received: by 2002:a17:903:18e:b0:215:aae1:40f0 with SMTP id
 d9443c01a7336-21dd7b57953mr173183965ad.0.1738333587083; Fri, 31 Jan 2025
 06:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20250128102308.42435-1-simon.eu@gmail.com> <fd45d304-a3bd-498f-816f-cc80313a9091@cherry.de>
In-Reply-To: <fd45d304-a3bd-498f-816f-cc80313a9091@cherry.de>
From: Simon Eugster <simon.eu@gmail.com>
Date: Fri, 31 Jan 2025 15:26:15 +0100
X-Gm-Features: AWEUYZnVERKlgeh_27bplCdaRaGBDFrVWVx0UkCCuR0Rx8B0ZR6nX_Tzt7fJVIo
Message-ID: <CAO8d5BY-jFbyOjcfHuS1KxDVzyn2FgQNtM9G0x5sB646OtHYqA@mail.gmail.com>
Subject: Re: [docs] [PATCH v3] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f5a2a4062d015343"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 14:26:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6233

--000000000000f5a2a4062d015343
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

On Thu, Jan 30, 2025 at 4:57=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de>
wrote:

> Hi Simon,
>
> On 1/28/25 11:23 AM, Simon A. Eugster via lists.yoctoproject.org wrote:
> > This patch describes how to use overrides for grub-efi-cfg because that
> > is otherwise only clear after reading the .bbclass file. It also adds
> > a description for GRUB_TITLE.
> >
> > Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> > ---
> >   documentation/ref-manual/classes.rst   | 16 ++++++++++++++++
> >   documentation/ref-manual/variables.rst |  5 +++++
> >   2 files changed, 21 insertions(+)
> >
> > diff --git a/documentation/ref-manual/classes.rst
> b/documentation/ref-manual/classes.rst
> > index 761be7b545..1d64ac2f28 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -991,6 +991,7 @@ This class supports several variables:
> >
> >   -  :term:`INITRD`: Indicates list of filesystem images to
> >      concatenate and use as an initial RAM disk (initrd) (optional).
> > +   Can be specified for each ``LABEL``.
> >
> >   -  :term:`ROOTFS`: Indicates a filesystem image to include
> >      as the root filesystem (optional).
> > @@ -1004,6 +1005,9 @@ This class supports several variables:
> >   -  :term:`APPEND`: An override list of append strings for
> >      each ``LABEL``.
> >
> > +-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
> > +   Defaults to ``LABEL`` if it is not defined.
> > +
>
> I would rather say that it defaults to label's name (``LABEL``) or
> something like this. GRUB_TITLE does not defaults to LABEL, which is
> what this may imply.
>
> >   -  :term:`GRUB_OPTS`: Additional options to add to the
> >      configuration (optional). Options are delimited using semi-colon
> >      characters (``;``).
> > @@ -1011,6 +1015,18 @@ This class supports several variables:
> >   -  :term:`GRUB_TIMEOUT`: Timeout before executing
> >      the default ``LABEL`` (optional).
> >
> > +Each ``LABEL`` defined in the :term:``LABELS`` variable creates a GRUB
> boot
> > +entry, and some variables can be defined individually per ``LABEL``.
> The label
> > +specific override names are defined as ``grub_LABEL``.
> > +
> > +For example, for a label ``factory``, the override name would be
> > +``grub_factory``. A custom GRUB menu entry titled "Factory Install"
> with the
> > +additional parameter ``factory=3Dyes`` can be achieved as follows::
> > +
> > +   LABELS:append =3D " factory"
> > +   APPEND:grub_factory =3D "factory=3Dyes"
> > +   GRUB_TITLE:grub_factory =3D "Factory Install"
> > +
>
> FYI, I believe this is currently not properly handled by sstate-cache.
> We use the same OVERRIDES trick on extlinux.conf generation for U-Boot
> and we needed (it seems like, wasn't there when it was implemented)
> explicitly list all variables with their OVERRIDES.
>
> c.f. do_create_extlinux_config[vardeps] in
> meta/classes-recipe/uboot-extlinux-config.bbclass.
>
> An easy way to check that would be to only modify APPEND:grub_factory
> and see if it regenerates the grub config file appropriately.
>

I checked briefly and first built the image,  then I modified one single
variable by adding =E2=80=9Cmodified=E2=80=9D, and ran the build again. Aft=
er both runs, I
did a bitbake -e, and the =E2=80=9Emodified=E2=80=9D was not present after =
the first build,
but after the second build.

GRUB_TITLE:grub_install:append =3D "Another NEW title for the
grub_install label, modified"

Did I check correctly?

Thanks,

Simon

--000000000000f5a2a4062d015343
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Quentin,<br></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Jan 30, 2025 at 4:57=E2=80=AFPM Quentin Schulz &lt;<a href=3D"mailto:qu=
entin.schulz@cherry.de">quentin.schulz@cherry.de</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi Simon,<br>
<br>
On 1/28/25 11:23 AM, Simon A. Eugster via <a href=3D"http://lists.yoctoproj=
ect.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wr=
ote:<br>
&gt; This patch describes how to use overrides for grub-efi-cfg because tha=
t<br>
&gt; is otherwise only clear after reading the .bbclass file. It also adds<=
br>
&gt; a description for GRUB_TITLE.<br>
&gt; <br>
&gt; Signed-off-by: Simon A. Eugster &lt;<a href=3D"mailto:simon.eu@gmail.c=
om" target=3D"_blank">simon.eu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/classes.rst=C2=A0 =C2=A0| 16 ++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/variables.rst |=C2=A0 5 +++++<br>
&gt;=C2=A0 =C2=A02 files changed, 21 insertions(+)<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-=
manual/classes.rst<br>
&gt; index 761be7b545..1d64ac2f28 100644<br>
&gt; --- a/documentation/ref-manual/classes.rst<br>
&gt; +++ b/documentation/ref-manual/classes.rst<br>
&gt; @@ -991,6 +991,7 @@ This class supports several variables:<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0-=C2=A0 :term:`INITRD`: Indicates list of filesystem image=
s to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 concatenate and use as an initial RAM disk (initrd=
) (optional).<br>
&gt; +=C2=A0 =C2=A0Can be specified for each ``LABEL``.<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0-=C2=A0 :term:`ROOTFS`: Indicates a filesystem image to in=
clude<br>
&gt;=C2=A0 =C2=A0 =C2=A0 as the root filesystem (optional).<br>
&gt; @@ -1004,6 +1005,9 @@ This class supports several variables:<br>
&gt;=C2=A0 =C2=A0-=C2=A0 :term:`APPEND`: An override list of append strings=
 for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 each ``LABEL``.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +-=C2=A0 :term:`GRUB_TITLE`: A custom title for each ```LABEL``.<br>
&gt; +=C2=A0 =C2=A0Defaults to ``LABEL`` if it is not defined.<br>
&gt; +<br>
<br>
I would rather say that it defaults to label&#39;s name (``LABEL``) or <br>
something like this. GRUB_TITLE does not defaults to LABEL, which is <br>
what this may imply.<br>
<br>
&gt;=C2=A0 =C2=A0-=C2=A0 :term:`GRUB_OPTS`: Additional options to add to th=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 configuration (optional). Options are delimited us=
ing semi-colon<br>
&gt;=C2=A0 =C2=A0 =C2=A0 characters (``;``).<br>
&gt; @@ -1011,6 +1015,18 @@ This class supports several variables:<br>
&gt;=C2=A0 =C2=A0-=C2=A0 :term:`GRUB_TIMEOUT`: Timeout before executing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the default ``LABEL`` (optional).<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +Each ``LABEL`` defined in the :term:``LABELS`` variable creates a GRU=
B boot<br>
&gt; +entry, and some variables can be defined individually per ``LABEL``. =
The label<br>
&gt; +specific override names are defined as ``grub_LABEL``.<br>
&gt; +<br>
&gt; +For example, for a label ``factory``, the override name would be<br>
&gt; +``grub_factory``. A custom GRUB menu entry titled &quot;Factory Insta=
ll&quot; with the<br>
&gt; +additional parameter ``factory=3Dyes`` can be achieved as follows::<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0LABELS:append =3D &quot; factory&quot;<br>
&gt; +=C2=A0 =C2=A0APPEND:grub_factory =3D &quot;factory=3Dyes&quot;<br>
&gt; +=C2=A0 =C2=A0GRUB_TITLE:grub_factory =3D &quot;Factory Install&quot;<=
br>
&gt; +<br>
<br>
FYI, I believe this is currently not properly handled by sstate-cache. <br>
We use the same OVERRIDES trick on extlinux.conf generation for U-Boot <br>
and we needed (it seems like, wasn&#39;t there when it was implemented) <br=
>
explicitly list all variables with their OVERRIDES.<br>
<br>
c.f. do_create_extlinux_config[vardeps] in <br>
meta/classes-recipe/uboot-extlinux-config.bbclass.<br>
<br>
An easy way to check that would be to only modify APPEND:grub_factory <br>
and see if it regenerates the grub config file appropriately.<br></blockquo=
te><div><br></div><div>I checked briefly and first built the image,=C2=A0 t=
hen I modified one single variable by adding =E2=80=9Cmodified=E2=80=9D, an=
d ran the build again. After both runs, I did a bitbake -e, and the =E2=80=
=9Emodified=E2=80=9D was not present after the first build, but after the s=
econd build.<br></div><div><div style=3D"background-color:rgb(255,255,255);=
color:rgb(8,8,8)"><pre style=3D"font-family:&quot;JetBrains Mono&quot;,mono=
space;font-size:9.8pt">GRUB_TITLE:grub_install:<span style=3D"color:rgb(0,5=
1,179)">append </span>=3D <span style=3D"color:rgb(6,125,23)">&quot;Another=
 NEW title for the grub_install label, modified&quot;<br></span><br></pre><=
pre style=3D"font-family:&quot;JetBrains Mono&quot;,monospace;font-size:9.8=
pt">Did I check correctly?<br><br></pre><pre style=3D"font-family:&quot;Jet=
Brains Mono&quot;,monospace;font-size:9.8pt">Thanks,<br></pre><pre style=3D=
"font-family:&quot;JetBrains Mono&quot;,monospace;font-size:9.8pt">Simon<br=
></pre></div></div></div></div>

--000000000000f5a2a4062d015343--

