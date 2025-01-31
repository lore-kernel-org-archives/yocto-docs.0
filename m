Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EE4C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 12:13:21 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.17580.1738325599440566496
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 04:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EIA3jNXK;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: simon.eu@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2164b662090so36863765ad.1
        for <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 04:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738325599; x=1738930399; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zATgjozODBASl1BsOd4N+GGHnMKkb0sycqUIg27OuAE=;
        b=EIA3jNXKT5nWJzhgpbT25JinoTtbjmaLFUNBq6azqBr+VcIyUV37pJo3OWn8ZJbU4t
         eKlnhhfl2kYtD9XFDnPWwzC+0SQHPzibkQMoXfYh4w5Fvs1d2jFRnPlpn2ElaOQ2IDzN
         Ha//TMp64hpOYHKfEqOd1B+hEE2a2IeNwZ8JqsvwmwrtHn+Moo6ZM+FhC3VHOoYRGQnx
         NabhOO+oYwVmeaneajtt+Vfu2qq4U0sYKPWtEzbjsQMzz/kMurg7GcfhKaKdvB6UwxIt
         fD2wf1bBQCOiIrqq7gQ2IrWMwbG/Hr2CHJafqhQZk5DKnvneHl4K4tR02qQf+CdP2aA8
         4Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738325599; x=1738930399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zATgjozODBASl1BsOd4N+GGHnMKkb0sycqUIg27OuAE=;
        b=pukRSlkIamtA7iF45WRJ33t4WMzGtGXOYMMYlxsB1iWyhQ7DD6u+4Sq2u3lqjYmn2K
         6unbJipX+m2DeZ79fBIQKnSTt+w1Ldu9i2Veh78hSoAqTQnhLvF2dnXXfqPzRn8BbWoX
         e6s/5rrD3/qs9v3X0W7tbaIWo0nmiZxxIV4r7z9LyueOKXegWorQyxN7WG3ynsoQph4d
         gTAEIAOLzDDwh6AyqzI34z0zJCwrk/+HvAsIq5AtomPpFd+MnmS1TSRvOtS+mIrXedA+
         +z6AsAF0fhl7k4+HH5qCh1CgaZUbdDnUUWqczxdPe36Yf2qTyg1hKhgoUnlu/TuUBjN2
         jk5Q==
X-Gm-Message-State: AOJu0Yw3v+d6WvN0JgnXja8bq3TfBS0Zqi7R1hR1J5TuzkEzH0M1eKpn
	jjJvz9JQUC+TK6ccFcjamPE+t743leYUabp6AbjFrPb6EpOY2sDiSgHEFo7X7PM46ZiVDucDuP4
	txM6+k0LM8r1fWnWjCRNRczNFtEI=
X-Gm-Gg: ASbGncuEuieUkOTcb6jvVz9b/3evc09KzH0Y59uS0On3H7VWdZXgbmAEaa9AqGzRm1e
	PU14PqAE0m+M8H0gVz/Ff7GhDWb6rofvMOrI9uxXn0FYz1NXcBSFEC48mTzDltqGVzkWxY0r3uQ
	==
X-Google-Smtp-Source: AGHT+IEvgVyn2ZYrkH8oZDU69vNhjiQanEqadhVthuE+OMOVxDIJlO7jGa8Xti6cnBbUedpaDa1ln6qrKbTDXeOCtB0=
X-Received: by 2002:a17:90b:2802:b0:2ee:a127:ba96 with SMTP id
 98e67ed59e1d1-2f83ac5e619mr13548210a91.23.1738325598584; Fri, 31 Jan 2025
 04:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20250128102308.42435-1-simon.eu@gmail.com> <D7EH1XIIFP1V.1E5Q88E740ECO@bootlin.com>
In-Reply-To: <D7EH1XIIFP1V.1E5Q88E740ECO@bootlin.com>
From: Simon Eugster <simon.eu@gmail.com>
Date: Fri, 31 Jan 2025 13:13:07 +0100
X-Gm-Features: AWEUYZmOrCaHy3nYyUHFGylIay2hmieqln_uJDPT7xXOYAIbn4g_jzEIURJLtzY
Message-ID: <CAO8d5BaXpuCKLTXKJZD0K2efg7tGHtkncmedM2Y6Xb-nJW5m6g@mail.gmail.com>
Subject: Re: [PATCH v3] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ceca04062cff77c3"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 12:13:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6228

--000000000000ceca04062cff77c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

On Wed, Jan 29, 2025 at 11:06=E2=80=AFAM Antonin Godard <antonin.godard@boo=
tlin.com>
wrote:

> Hi Simon,
>
> On Tue Jan 28, 2025 at 11:23 AM CET, Simon A. Eugster wrote:
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
> > index 761be7b545..1d64ac2f28 100644
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
> > +Each ``LABEL`` defined in the :term:``LABELS`` variable creates a GRUB
> boot
>
> :term:``LABELS`` is incorrect, it should be enclosed with single backtick=
s
> only.
>

Thanks, will fix that!

Simon

--000000000000ceca04062cff77c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Antonin,<br></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 29, =
2025 at 11:06=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.godar=
d@bootlin.com">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi Simon,<br>
<br>
On Tue Jan 28, 2025 at 11:23 AM CET, Simon A. Eugster wrote:<br>
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
&gt; index 761be7b545..1d64ac2f28 100644<br>
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
&gt; +Each ``LABEL`` defined in the :term:``LABELS`` variable creates a GRU=
B boot<br>
<br>
:term:``LABELS`` is incorrect, it should be enclosed with single backticks =
only.<br></blockquote><div><br></div><div>Thanks, will fix that!</div><div>=
<br></div></div><div class=3D"gmail_quote gmail_quote_container">Simon<br><=
/div></div>

--000000000000ceca04062cff77c3--

