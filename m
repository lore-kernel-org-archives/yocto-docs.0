Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56823C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:40:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.2988.1739317229987508671
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Qko6xT6K;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso154792f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739317228; x=1739922028; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GeUAechg/IVAXouiXQ2NJ3XIry1Ct0oSUB1IE+5DJlc=;
        b=Qko6xT6KVh/ib7qFvdb53HIwioET0MhRSVqjhVE7P3gBpD3VZOo5hKT6eqrOATq9AA
         R6x7Rl2oUITB8LPA8Y0DPVLOqJOR9+eOcjwARD4J8nQoTr8Xe9vao1AGt/7edQaC+Z5O
         t9VilXN+gsSEhwoqSITukvsPGwL5ZeJr6UnK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739317228; x=1739922028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeUAechg/IVAXouiXQ2NJ3XIry1Ct0oSUB1IE+5DJlc=;
        b=BIEcmSI8erS0DdGYDrZRPVDRONam2YmInBaSvp10nbyfdsUzr7JtQCUzIjF+A4RsWR
         y6YzWYRdwmeBHqIU8Y/tVYhFUUASLZGCOFqpL77XgXXxjFgdJzcU6kQBdyIqAYkWunWA
         /1nJDZHNlvoSXaRbMDtbW4FPS9qhvgwf9BGZ1DFXnAztDxjUCW6iCCX+yovBLUWCqs6H
         qZMF5C7KMrcNa8f78GXMm47ljNxUZXB0NIySQktY78yszfAm09gaud9FWEYWziwwzt9r
         IGWytqdOjoLEkKArUDIdTcUgeBxZWXDiVPZegXnNCRD5V3TkTi+I+mXZt8d68Yf2yZCw
         Eo5w==
X-Gm-Message-State: AOJu0YyzrGpQ/Ma89cO0F2bhDzFdmD9P1jtghKpqG3llZDgV6xd158s8
	Yz4Vl1rrGrwO8a/OigwILHWVkbsYoX++aMQBEXY4HcaSIhcXFS5MKya6smcIq90/NcCIOyU6LSz
	WlehAsgQzgAc7lyI+46rx0bz2NqubAnnjCis+mqdfV9LxAT3INHk=
X-Gm-Gg: ASbGncvE1EIct6fmxtvblIeaVu2wnwOrl6T7MNMqrb0WC0RgimJ4/IubgQRfsWrHJH+
	fQ6nSxIgWUfu/1mE48f3QFx2PPi1bEV8ad0mOoxWq/3AORHXdAQ6JquZOI2gRlQpIzjohztAl
X-Google-Smtp-Source: AGHT+IED9RwWYV4y4g3E3etBqgQe4dJh5m97hCe0SMWfu85MD2GtOO+1GoMmCqFb2w17JMjfJ0FfV1XGt90osHuZzEU=
X-Received: by 2002:a5d:598d:0:b0:38a:8b34:76b0 with SMTP id
 ffacd0b85a97d-38de43ec4b6mr4860502f8f.27.1739317228424; Tue, 11 Feb 2025
 15:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20250209233245.1397155-1-yoann.congal@smile.fr>
 <20250209233245.1397155-4-yoann.congal@smile.fr> <54970eb0-9353-4e34-b3b8-10022c3b29cd@cherry.de>
In-Reply-To: <54970eb0-9353-4e34-b3b8-10022c3b29cd@cherry.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 12 Feb 2025 00:40:01 +0100
X-Gm-Features: AWEUYZmx4-ZEIbkJ9fXp7ks8inFSzQWZU9co7tlbhE6RaHNCa9SlQEWJdRQLfyU
Message-ID: <CAMSfU+5k4LwsHEh32o5FTCuw8wYtwzA89jOXMdKQfWCwF56Omg@mail.gmail.com>
Subject: Re: [docs] [PATCH v3 4/4] release-notes-5.2: Add new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008d6203062de659d8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:40:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6344

--0000000000008d6203062de659d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 10 f=C3=A9vr. 2025 =C3=A0 18:43, Quentin Schulz <quentin.schulz@che=
rry.de> a
=C3=A9crit :

> Hi Yoann,
>
> On 2/10/25 12:32 AM, Yoann Congal via lists.yoctoproject.org wrote:
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> > v2->v3: Antonin's Review:
> > * Add OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS ot release-notes-5.2
> > ---
> >   documentation/migration-guides/release-notes-5.2.rst | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/documentation/migration-guides/release-notes-5.2.rst
> b/documentation/migration-guides/release-notes-5.2.rst
> > index b0e538700..069e34be5 100644
> > --- a/documentation/migration-guides/release-notes-5.2.rst
> > +++ b/documentation/migration-guides/release-notes-5.2.rst
> > @@ -17,6 +17,9 @@ New Features / Enhancements in |yocto-ver|
> >      -  ``linux-firmware``: Add the :term:`FIRMWARE_COMPRESSION`
> variable which
> >         allows compression the firmwares provided by the
> ``linux-firmware`` recipe.
> >         Possible values are ``xz`` and ``zst``.
> > +   -  reproducibility: Add the
> :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
> > +      variable which enables a reproducibility test on a single recipe
> (without
> > +      the dependencies). See :doc:`/test-manual/reproducible-builds`.
>
> s/single recipe/recipes/ ? You can have multiple recipes listed there I
> believe?
>

You're right, I've updated for v4.


> nitpick: I would say "using sstate-cache for its dependencies" (with a
> link for sstate-cache)
>

I like it, I took this suggestion for v4.


> Cheers,
> Quentin
>


--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000008d6203062de659d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 10=
 f=C3=A9vr. 2025 =C3=A0=C2=A018:43, Quentin Schulz &lt;<a href=3D"mailto:qu=
entin.schulz@cherry.de">quentin.schulz@cherry.de</a>&gt; a =C3=A9crit=C2=A0=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
On 2/10/25 12:32 AM, Yoann Congal via <a href=3D"http://lists.yoctoproject.=
org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:=
<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; v2-&gt;v3: Antonin&#39;s Review:<br>
&gt; * Add OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS ot release-notes-5.2<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/migration-guides/release-notes-5.2.rst | 3 +=
++<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/documentation/migration-guides/release-notes-5.2.rst b/do=
cumentation/migration-guides/release-notes-5.2.rst<br>
&gt; index b0e538700..069e34be5 100644<br>
&gt; --- a/documentation/migration-guides/release-notes-5.2.rst<br>
&gt; +++ b/documentation/migration-guides/release-notes-5.2.rst<br>
&gt; @@ -17,6 +17,9 @@ New Features / Enhancements in |yocto-ver|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -=C2=A0 ``linux-firmware``: Add the :term:`FIRMWAR=
E_COMPRESSION` variable which<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allows compression the firmwares prov=
ided by the ``linux-firmware`` recipe.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Possible values are ``xz`` and ``zst`=
`.<br>
&gt; +=C2=A0 =C2=A0-=C2=A0 reproducibility: Add the :term:`OEQA_REPRODUCIBL=
E_TEST_LEAF_TARGETS`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 variable which enables a reproducibility test on=
 a single recipe (without<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 the dependencies). See :doc:`/test-manual/reprod=
ucible-builds`.<br>
<br>
s/single recipe/recipes/ ? You can have multiple recipes listed there I <br=
>
believe?<br></blockquote><div><br></div><div>You&#39;re right, I&#39;ve upd=
ated for v4.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
nitpick: I would say &quot;using sstate-cache for its dependencies&quot; (w=
ith a <br>
link for sstate-cache)<br></blockquote><div>=C2=A0</div></div><div class=3D=
"gmail_quote gmail_quote_container">I like it, I took this suggestion for v=
4.<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
Quentin<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--0000000000008d6203062de659d8--

