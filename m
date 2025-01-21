Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7ECDC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 11:20:42 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.13923.1737458437613961817
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 03:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fbBu2W+o;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: simon.eu@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef748105deso6976009a91.1
        for <docs@lists.yoctoproject.org>; Tue, 21 Jan 2025 03:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737458437; x=1738063237; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FwJz+WZSRXy8umpIIl7icfaEgpESgXQh1651Zuw6H2M=;
        b=fbBu2W+ozhLaI9yWNym8epNPW1V0nNm0teXqJ6diIeRrFN/4Vs/X1kebG4AKdB2+Yo
         Wr9J2JddckLowHbpLexmmjXvS7BZXoTs+j0+1Omjq/9Mf+B7egc9By5Wm4pvAURGtFeH
         2E5A086DWPSv/0Mw51CCn30cLt6chGX0r4thDdTf/7rKSP/6b0dWMXd4fDUajcBTBIo8
         H98NO3uJOggD9V/HvPPhHxC/RsIJQIR5I8IudUJSpBYWtY/NFVYPzBNbKv4ADEOfuCKh
         eACvKa6JCKd0IkNjUmp1DfNkAumHbSv8GWmBJmWjEhsvB8UtkZxjYuouseowhb3iADmo
         VGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458437; x=1738063237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwJz+WZSRXy8umpIIl7icfaEgpESgXQh1651Zuw6H2M=;
        b=YAK+8p+wrHD/o6s776POfPfe4DvQe8p7F55v3uMdDryeoumGqDIAzq+y2v73B+yOdh
         AyLx2K3US4fDaWMx1GbIAvYacNOtuXAqIWtp1dIaOtZNMaaYSa6fbrc2TVj3KVMFDPLy
         j3FwjQM+DkFZ+Cx00fE3dOyxuyQXl42sMSc4lMpxDqPFsSUbjMJNxvNqUMrLBPXULV3B
         jfH6AIWGfhs2ckjSlMKob/S3SNW2g7Z2qVRpF11cHlGD+4vszmzqWLlEF8WpvOkeELk/
         Jrdog/N6eNU+O9KAs+wrsLbL64M2imRals4jFuN2WPDjq2oG1EKT7xVycjeC+xKdiQUN
         +HNA==
X-Gm-Message-State: AOJu0YxNSLROpozMWOyqZ9p4se564LnobiuRrRtn4fwBrvMFLFSlGJcw
	mQPiNjfScFTYVskUjVEfCU9+wknPfAaGFZwMuT4t32EFOKfahUuZo0KqxNbQO1tTcnSg1IEsCGO
	78MOL1n+i3EQNnWTSSZZdUiQVlM0=
X-Gm-Gg: ASbGnctLBjRqpo7n/kvqQARjyX4A+TxRZEo2VF0eNT2aqQRFappNWQf7sRKO8gt/LsT
	NmyGLS9QG5tbwq2pT3ey1hd4cAjpIbP7cr/iTlcMrkskxkyH1S+PZ
X-Google-Smtp-Source: AGHT+IG4eOHtA+8CeVeZIApiUASwJ4gkny2LEqsnvysagqZOEi1bhbfLE+yyOLqj79y7e1gmpW9fw9mTydo6ROHQvDM=
X-Received: by 2002:a17:90b:2d04:b0:2ee:863e:9fe8 with SMTP id
 98e67ed59e1d1-2f782c9974fmr26561623a91.18.1737458436922; Tue, 21 Jan 2025
 03:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20250115080758.27000-1-simon.eu@gmail.com> <D74ADJ3114PX.PP5KW6UZKD31@bootlin.com>
In-Reply-To: <D74ADJ3114PX.PP5KW6UZKD31@bootlin.com>
From: Simon Eugster <simon.eu@gmail.com>
Date: Tue, 21 Jan 2025 12:20:24 +0100
X-Gm-Features: AbW1kvb6VPDurCajPW8gYA46lY1hLcu_hRm65vMUPeMOrYI2O2qY1jwCSo1IZu4
Message-ID: <CAO8d5BbXyWDau2Go9uUP79G2G8SheQ1eyri1Ku_jHr5QEAk4Yw@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f1e928062c3590d8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Jan 2025 11:20:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6154

--000000000000f1e928062c3590d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

Thanks a lot for your suggestions! I have updated the patch according to
them.

Simon

On Fri, Jan 17, 2025 at 11:46=E2=80=AFAM Antonin Godard <antonin.godard@boo=
tlin.com>
wrote:

> Hi Simon,
>
> On Wed Jan 15, 2025 at 9:07 AM CET, Simon A. Eugster via
> lists.yoctoproject.org wrote:
> > This patch describes how to use overrides for grub-efi-cfg because that
> > is otherwise only clear after reading the .bbclass file. It also adds
> > a description for GRUB_TITLE.
> > ---
> >  documentation/ref-manual/classes.rst | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/documentation/ref-manual/classes.rst
> b/documentation/ref-manual/classes.rst
> > index 761be7b545..460f94b232 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -987,10 +987,14 @@ introspection. This functionality is only enabled
> if the
> >  The :ref:`ref-classes-grub-efi` class provides ``grub-efi``-specific
> functions for
> >  building bootable images.
> >
> > -This class supports several variables:
> > +This class supports several variables.
> > +The label specific override names are ``grub_LABEL``.
>
> "...are defined as ``grub_LABEL``"?
>
> > +To specificy an override for the label ``mylabel``, the override name
> is ``grub_mylabel``,
>
> s/specificy/specify/
>
> Also please wrap the lines to 80 chars, as recommended by our standards.m=
d
> file.
>
> > +for example ``APPEND:grub_mylabel =3D my-appends``.
>
> You are missing quotes in this example, it should be ``APPEND:grub_mylabe=
l
> =3D "my-appends"``.
>
> I think it would also make sense to give this example after the bullet
> list. I
> would move the text starting from "The label specific override names..."
> to the
> APPEND example, after the bullet list. And you keep your real life exampl=
e
> with
> the factory.
>
> >
> >  -  :term:`INITRD`: Indicates list of filesystem images to
> >     concatenate and use as an initial RAM disk (initrd) (optional).
> > +   Can be specified for each ``LABEL``.
> >
> >  -  :term:`ROOTFS`: Indicates a filesystem image to include
> >     as the root filesystem (optional).
> > @@ -1004,6 +1008,9 @@ This class supports several variables:
> >  -  :term:`APPEND`: An override list of append strings for
> >     each ``LABEL``.
> >
> > +-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
>
> In addition to adding the variable here, you also need to add its
> definition to
> documentation/ref-manual/variables.rst, otherwise you cannot make a
> cross-reference to it here. Mind that the variables.rst file had the
> variables
> alphabetically ordered.
>
> > +   Defaults to ``LABEL`` if it is not defined.
> > +
> >  -  :term:`GRUB_OPTS`: Additional options to add to the
> >     configuration (optional). Options are delimited using semi-colon
> >     characters (``;``).
> > @@ -1011,6 +1018,14 @@ This class supports several variables:
> >  -  :term:`GRUB_TIMEOUT`: Timeout before executing
> >     the default ``LABEL`` (optional).
> >
> > +For the label ``factory``, a custom GRUB menu entry titled "Factory
> Install" with the additional parameter ``factory=3Dyes``
> > +can be achieved as follows::
> > +
> > +  LABELS:append =3D "factory"
>
> I think you need a space after the quote here:
>
>   LABELS:append =3D " factory"
>
> > +  APPEND:grub_factory =3D "factory=3Dyes"
> > +  GRUB_TITLE:grub_factory =3D "Factory Install"
> > +
> > +
>
> Unneeded extra newline here
>
> >  .. _ref-classes-gsettings:
> >
> >  ``gsettings``
>
> Thank you,
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000f1e928062c3590d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Antonin,</div><div><br></div><div>Thanks a lot for=
 your suggestions! I have updated the patch according to them.</div><div><b=
r></div><div>Simon<br></div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 17, 2025 at 1=
1:46=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin=
.com">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Simon,<br>
<br>
On Wed Jan 15, 2025 at 9:07 AM CET, Simon A. Eugster via <a href=3D"http://=
lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctopro=
ject.org</a> wrote:<br>
&gt; This patch describes how to use overrides for grub-efi-cfg because tha=
t<br>
&gt; is otherwise only clear after reading the .bbclass file. It also adds<=
br>
&gt; a description for GRUB_TITLE.<br>
&gt; ---<br>
&gt;=C2=A0 documentation/ref-manual/classes.rst | 17 ++++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 16 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-=
manual/classes.rst<br>
&gt; index 761be7b545..460f94b232 100644<br>
&gt; --- a/documentation/ref-manual/classes.rst<br>
&gt; +++ b/documentation/ref-manual/classes.rst<br>
&gt; @@ -987,10 +987,14 @@ introspection. This functionality is only enable=
d if the<br>
&gt;=C2=A0 The :ref:`ref-classes-grub-efi` class provides ``grub-efi``-spec=
ific functions for<br>
&gt;=C2=A0 building bootable images.<br>
&gt;=C2=A0 <br>
&gt; -This class supports several variables:<br>
&gt; +This class supports several variables.<br>
&gt; +The label specific override names are ``grub_LABEL``.<br>
<br>
&quot;...are defined as ``grub_LABEL``&quot;?<br>
<br>
&gt; +To specificy an override for the label ``mylabel``, the override name=
 is ``grub_mylabel``,<br>
<br>
s/specificy/specify/<br>
<br>
Also please wrap the lines to 80 chars, as recommended by our standards.md =
file.<br>
<br>
&gt; +for example ``APPEND:grub_mylabel =3D my-appends``.<br>
<br>
You are missing quotes in this example, it should be ``APPEND:grub_mylabel =
=3D &quot;my-appends&quot;``.<br>
<br>
I think it would also make sense to give this example after the bullet list=
. I<br>
would move the text starting from &quot;The label specific override names..=
.&quot; to the<br>
APPEND example, after the bullet list. And you keep your real life example =
with<br>
the factory.<br>
<br>
&gt;<br>
&gt;=C2=A0 -=C2=A0 :term:`INITRD`: Indicates list of filesystem images to<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0concatenate and use as an initial RAM disk (initrd)=
 (optional).<br>
&gt; +=C2=A0 =C2=A0Can be specified for each ``LABEL``.<br>
&gt;<br>
&gt;=C2=A0 -=C2=A0 :term:`ROOTFS`: Indicates a filesystem image to include<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0as the root filesystem (optional).<br>
&gt; @@ -1004,6 +1008,9 @@ This class supports several variables:<br>
&gt;=C2=A0 -=C2=A0 :term:`APPEND`: An override list of append strings for<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0each ``LABEL``.<br>
&gt;<br>
&gt; +-=C2=A0 :term:`GRUB_TITLE`: A custom title for each ```LABEL``.<br>
<br>
In addition to adding the variable here, you also need to add its definitio=
n to<br>
documentation/ref-manual/variables.rst, otherwise you cannot make a<br>
cross-reference to it here. Mind that the variables.rst file had the variab=
les<br>
alphabetically ordered.<br>
<br>
&gt; +=C2=A0 =C2=A0Defaults to ``LABEL`` if it is not defined.<br>
&gt; +<br>
&gt;=C2=A0 -=C2=A0 :term:`GRUB_OPTS`: Additional options to add to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0configuration (optional). Options are delimited usi=
ng semi-colon<br>
&gt;=C2=A0 =C2=A0 =C2=A0characters (``;``).<br>
&gt; @@ -1011,6 +1018,14 @@ This class supports several variables:<br>
&gt;=C2=A0 -=C2=A0 :term:`GRUB_TIMEOUT`: Timeout before executing<br>
&gt;=C2=A0 =C2=A0 =C2=A0the default ``LABEL`` (optional).<br>
&gt;<br>
&gt; +For the label ``factory``, a custom GRUB menu entry titled &quot;Fact=
ory Install&quot; with the additional parameter ``factory=3Dyes``<br>
&gt; +can be achieved as follows::<br>
&gt; +<br>
&gt; +=C2=A0 LABELS:append =3D &quot;factory&quot;<br>
<br>
I think you need a space after the quote here:<br>
<br>
=C2=A0 LABELS:append =3D &quot; factory&quot;<br>
<br>
&gt; +=C2=A0 APPEND:grub_factory =3D &quot;factory=3Dyes&quot;<br>
&gt; +=C2=A0 GRUB_TITLE:grub_factory =3D &quot;Factory Install&quot;<br>
&gt; +<br>
&gt; +<br>
<br>
Unneeded extra newline here<br>
<br>
&gt;=C2=A0 .. _ref-classes-gsettings:<br>
&gt;<br>
&gt;=C2=A0 ``gsettings``<br>
<br>
Thank you,<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000f1e928062c3590d8--

