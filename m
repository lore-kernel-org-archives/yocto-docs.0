Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF142C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 09:19:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.13750.1738055946888882666
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 01:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=le1RPHrl;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: simon.eu@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so7448728a91.2
        for <docs@lists.yoctoproject.org>; Tue, 28 Jan 2025 01:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738055946; x=1738660746; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kGiUL7bsi7OYTXM6IiJ5uCVDCF6qw19iQWxNNY28jrw=;
        b=le1RPHrlHg4oviFhayhNy6HyG9zsPoJtwJyf6+GujAwMo+64K1uzwVFSFB5WusiMMs
         HyPtqQ3GbxYOCVlmHPmnKyKC/6wu1gVv/7fIgM70ILtosZsPWUbuaEPgEkTJo4CRl9HJ
         LD+2LuXQfPJ6JRzWDuefpm9t0VI6pBebEIZjGI1MlkPXHNDWWLPV21BmlRp6tmRtno7w
         pf9N2hpfMOemPW/Yei/2Gi1JqQO6xA4QDNVPu0+CkoyLidB9YX212Mj3GBoeJaRoENfE
         Yr8WovuotOnuuJG/3uFVH4ZzFPuf68d6XUQBPL6xsTi23vVIg5iLS/uITVcXYbAnVtmC
         FzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738055946; x=1738660746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGiUL7bsi7OYTXM6IiJ5uCVDCF6qw19iQWxNNY28jrw=;
        b=DgVcpuWog+zL+Fys7dMOUC5ZUhd1GLPzzC52cXNYUdEl8xaQuQLkXGLXJ0Aqttw3Y/
         7ufr4FQatc5sLC5S4NhWRwwWnd+3drU3MT6oHuxp9n9zgKkyHn7J7jgLzO9joOuJUPtF
         vSX6p3vTD2xqWZoNljP67F9k58meo4eeiIBfOU9YE8OzYxYyEPMhIKT8YAJ7TBHxxJVb
         aGvfz2zV85CuG+UaoZy7FMww5eAGs7OX3RZBG9pPcdrP9uTSymNJuUoLMaJFeN0gMtFJ
         N3RylqUYSMaLydMERitZQh4P5E8W/PSvfyrdCou17bNFqqm56L5p60hmZR4wCFkQSpas
         PaPg==
X-Gm-Message-State: AOJu0Yy/SU36vSAZU0FiTHh3x2z3wh3LSUQO+rxbgg0GU7NUZTi2q1vw
	srfwEKIv7cCPJXm0O74Mii1fX1QPSgDDFE0a306s0TGSGQ8dxNsi3TCFQkiLrXBXtJMONZxE2Ip
	PuSaBL4FbmUOiyu9PBFcUk2u+7WkX66JO
X-Gm-Gg: ASbGncvM3zgwjP4pTmAn/bpCh6AIm1jbDfA3NLEfXlPtglk9Tv7qh6quN2g9zYnInLQ
	3XDfXYMwVbqW1WbC/vk5SdlE0b4mcbHtuJYFDFGGmfUbjczMDE7hTHZ12X3wHTS6lo2KZhVrmN5
	70sl80/te0
X-Google-Smtp-Source: AGHT+IG9IMuyQDdkqOVZlYvtlRwjcYbWCUgsKvRH6DYQzbgWLObO7EWV0RGiHV8nDPp8Z6MP9HqgcO5BR4h7vh4j5jU=
X-Received: by 2002:a17:90b:5249:b0:2ee:e518:c1cb with SMTP id
 98e67ed59e1d1-2f782c4bdd2mr67538901a91.7.1738055946169; Tue, 28 Jan 2025
 01:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20250128075328.20912-1-simon.eu@gmail.com> <D7DK5YLXCDJ3.31RLRC7EGPYS4@bootlin.com>
In-Reply-To: <D7DK5YLXCDJ3.31RLRC7EGPYS4@bootlin.com>
From: Simon Eugster <simon.eu@gmail.com>
Date: Tue, 28 Jan 2025 10:18:54 +0100
X-Gm-Features: AWEUYZk8ZBJki3sHwWmvfc_zsIAf9La9l-aEOw_aVFnXzXTXPT1bYHJat6XGDP4
Message-ID: <CAO8d5Ba0AVHET7CL3EZJnMEd6ca9sgfCWFtT25Tm8sLBRmF1TQ@mail.gmail.com>
Subject: Re: [PATCH v2] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004574b4062cc0afe1"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jan 2025 09:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6204

--0000000000004574b4062cc0afe1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

thanks again for your comments.

On Tue, Jan 28, 2025 at 9:20=E2=80=AFAM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> Hi Simon,
>
> On Tue Jan 28, 2025 at 8:53 AM CET, Simon A. Eugster wrote:
> > This patch describes how to use overrides for grub-efi-cfg because that
> > is otherwise only clear after reading the .bbclass file. It also adds
> > a description for GRUB_TITLE.
> >
> > Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> > ---
> >  documentation/ref-manual/classes.rst   | 16 ++++++++++++++++
> >  documentation/ref-manual/variables.rst |  5 +++++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/documentation/ref-manual/classes.rst
> b/documentation/ref-manual/classes.rst
> > index 761be7b545..1de362e864 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -991,6 +991,7 @@ This class supports several variables:
> >
> >  -  :term:`INITRD`: Indicates list of filesystem images to
> >     concatenate and use as an initial RAM disk (initrd) (optional).
> > +   Can be specified for each ``LABEL``.
> >
> >  -  :term:`ROOTFS`: Indicates a filesystem image to include
> >     as the root filesystem (optional).
> > @@ -1004,6 +1005,9 @@ This class supports several variables:
> >  -  :term:`APPEND`: An override list of append strings for
> >     each ``LABEL``.
> >
> > +-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
> > +   Defaults to ``LABEL`` if it is not defined.
> > +
> >  -  :term:`GRUB_OPTS`: Additional options to add to the
> >     configuration (optional). Options are delimited using semi-colon
> >     characters (``;``).
> > @@ -1011,6 +1015,18 @@ This class supports several variables:
> >  -  :term:`GRUB_TIMEOUT`: Timeout before executing
> >     the default ``LABEL`` (optional).
> >
> > +Each ``LABEL`` defined in the ``LABELS`` variable creates a GRUB boot
> entry,
> > +and some variables can be defined individually per ``LABEL``. The labe=
l
> > +specific override names are defined as ``grub_LABEL``.
>
> +
> > +For example, for a label ``factory``, the override name would be
> > +``grub_factory``. A custom GRUB menu entry titled "Factory Install"
> with the
> > +additional parameter ``factory=3Dyes`` can be achieved as follows::
> > +
> > +   LABELS:append =3D " factory"
> > +   APPEND:grub_factory =3D "factory=3Dyes"
> > +   GRUB_TITLE:grub_factory =3D "Factory Install"
> > +
> >  .. _ref-classes-gsettings:
> >
> >  ``gsettings``
> > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > index 0c5c7aab97..16ffbf0e85 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -3320,6 +3320,11 @@ system and gives an overview of their function
> and contents.
> >        :ref:`ref-classes-grub-efi` class for more information
> >        on how this variable is used.
> >
> > +   :term:`GRUB_TITLE`
> > +      Specifies custom titles for GRUB labels defined in
> :ref:`LABELS`. See
>
> Here you make a :ref: to LABELS, but like GRUB_TITLE, it needs to be adde=
d
> to
> variables.rst, otherwise it produces a compile error. You would also use
> :term:,
> not :ref:.
>
> Can you add documentation for it?
>

I will change it to :term:. The LABELS term already exists, right?

Also, is it okay if I fix a typo in standards.md in this same MR, or do you
need a separate patch for that?

Since "LABELS" by its own does not refer to Grub, just make sure to start
> the
> description with:
>
> """
> When inheriting the :ref:`ref-classes-grub-efi` class, ...
> """
>
> So someone reading the description knows in which context it's used.
>
> If you do, please also use :term: in the class description above.
>

Will do.


> Thanks for the separate mail/Signed-off-by!
>

Thanks for the reminder, I hardly have to sign off commits :)

Simon

--0000000000004574b4062cc0afe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Antonin,</div><div><br></div><div=
>thanks again for your comments.<br></div></div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan=
 28, 2025 at 9:20=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.g=
odard@bootlin.com">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Simon,<br>
<br>
On Tue Jan 28, 2025 at 8:53 AM CET, Simon A. Eugster wrote:<br>
&gt; This patch describes how to use overrides for grub-efi-cfg because tha=
t<br>
&gt; is otherwise only clear after reading the .bbclass file. It also adds<=
br>
&gt; a description for GRUB_TITLE.<br>
&gt;<br>
&gt; Signed-off-by: Simon A. Eugster &lt;<a href=3D"mailto:simon.eu@gmail.c=
om" target=3D"_blank">simon.eu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/ref-manual/classes.rst=C2=A0 =C2=A0| 16 ++++++++++=
++++++<br>
&gt;=C2=A0 documentation/ref-manual/variables.rst |=C2=A0 5 +++++<br>
&gt;=C2=A0 2 files changed, 21 insertions(+)<br>
&gt;<br>
&gt; diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-=
manual/classes.rst<br>
&gt; index 761be7b545..1de362e864 100644<br>
&gt; --- a/documentation/ref-manual/classes.rst<br>
&gt; +++ b/documentation/ref-manual/classes.rst<br>
&gt; @@ -991,6 +991,7 @@ This class supports several variables:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 -=C2=A0 :term:`INITRD`: Indicates list of filesystem images to<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0concatenate and use as an initial RAM disk (initrd)=
 (optional).<br>
&gt; +=C2=A0 =C2=A0Can be specified for each ``LABEL``.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 -=C2=A0 :term:`ROOTFS`: Indicates a filesystem image to include<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0as the root filesystem (optional).<br>
&gt; @@ -1004,6 +1005,9 @@ This class supports several variables:<br>
&gt;=C2=A0 -=C2=A0 :term:`APPEND`: An override list of append strings for<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0each ``LABEL``.<br>
&gt;=C2=A0 <br>
&gt; +-=C2=A0 :term:`GRUB_TITLE`: A custom title for each ```LABEL``.<br>
&gt; +=C2=A0 =C2=A0Defaults to ``LABEL`` if it is not defined.<br>
&gt; +<br>
&gt;=C2=A0 -=C2=A0 :term:`GRUB_OPTS`: Additional options to add to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0configuration (optional). Options are delimited usi=
ng semi-colon<br>
&gt;=C2=A0 =C2=A0 =C2=A0characters (``;``).<br>
&gt; @@ -1011,6 +1015,18 @@ This class supports several variables:<br>
&gt;=C2=A0 -=C2=A0 :term:`GRUB_TIMEOUT`: Timeout before executing<br>
&gt;=C2=A0 =C2=A0 =C2=A0the default ``LABEL`` (optional).<br>
&gt;=C2=A0 <br>
&gt; +Each ``LABEL`` defined in the ``LABELS`` variable creates a GRUB boot=
 entry,<br>
&gt; +and some variables can be defined individually per ``LABEL``. The lab=
el<br>
&gt; +specific override names are defined as ``grub_LABEL``. <br></blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
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
&gt;=C2=A0 .. _ref-classes-gsettings:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ``gsettings``<br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst<br>
&gt; index 0c5c7aab97..16ffbf0e85 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -3320,6 +3320,11 @@ system and gives an overview of their function =
and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 :ref:`ref-classes-grub-efi` class for more =
information<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 on how this variable is used.<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0:term:`GRUB_TITLE`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Specifies custom titles for GRUB labels defined =
in=C2=A0 :ref:`LABELS`. See<br>
<br>
Here you make a :ref: to LABELS, but like GRUB_TITLE, it needs to be added =
to<br>
variables.rst, otherwise it produces a compile error. You would also use :t=
erm:,<br>
not :ref:.<br>
<br>
Can you add documentation for it?<br></blockquote><div><br></div><div>I wil=
l change it to :term:. The LABELS term already exists, right?</div><div><br=
></div><div>Also, is it okay if I fix a typo in standards.md in this same M=
R, or do you need a separate patch for that?<br></div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
Since &quot;LABELS&quot; by its own does not refer to Grub, just make sure =
to start the<br>
description with:<br>
<br>
&quot;&quot;&quot;<br>
When inheriting the :ref:`ref-classes-grub-efi` class, ...<br>
&quot;&quot;&quot;<br>
<br>
So someone reading the description knows in which context it&#39;s used.<br=
>
<br>
If you do, please also use :term: in the class description above.<br></bloc=
kquote><div><br></div><div>Will do.<br></div><div>=C2=A0<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Thanks for the separate mail/Signed-off-by!<br></blockquote><div><br></div>=
<div>Thanks for the reminder, I hardly have to sign off commits :)</div><di=
v><br></div><div>Simon<br>
</div></div></div>

--0000000000004574b4062cc0afe1--

