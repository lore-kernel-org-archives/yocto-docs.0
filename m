Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98C2CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 16:52:37 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12485.1780678354986022369
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 09:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sKdVH4Cx;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf30d530bdso21884785ad.3
        for <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 09:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780678354; cv=none;
        d=google.com; s=arc-20240605;
        b=BdKg7Zie4R1eOvdGZYQ8wxMsHgSnVFwuiKj12Jm1rQ7EEVdMS9XUgKTpBCbxFBqoEG
         BSkIDXOk6/mSt7F4AAPyIyI4efFgJQb2KN1nXe8s7uN8uDM5Qw8Y33WohseN1dE5HZDX
         gNkEj7vpkVvnFqlfGD19+bkk7K9u0rbiZyI34haBI06lLIqs3yHHMvDY5mxYFGKONQiW
         J5vPCwuqIiqY2JZY8NkRZ3jYrBhudIQF2S//6PeH3LW1tPuhYKiUf5pwZAe9YVUkj5R3
         MUuxAClcagI05SzvdX+GNvk9Km4XDyfCAD8WIJsbDUJhCkf27HvAgnoQCT3AYNK/E5jg
         Mnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VeZUMw0HpsIyp0mONwGLTLn1SrcjqcTVf5S2r7VGC4Y=;
        fh=4hS1yeconpIjCT2RpsjSCX8nsHAojH08ouzykNU7bCU=;
        b=WPLrQJm0kNvgSGMq8RhiotGHQ+y/keKIM6wFGmSE+gY1CnfUANbDUy0QQqIJsBx06t
         G7grB7r1p3WYTTd2gNqt9wlX2U0WJMDbSO3VLVqgooXYnmN0ymkl45r1VQ7NgFkVsVoD
         mCDsg6xZ5UIHDEiKcLV8KLwAP7dcP8ThPCs1idT7M0/6pLYk3afrXT/nPcj9uOMlgzxj
         kpzDnNWiIRDz7nC1SHYvocHrHPtRRNIWjgE/sx/g6qNPstGUoTBp+aa7tU+PX6ZkUmKt
         pptwmBop2O6tVOrmmlbbBrTcfLTaQlDlo7/WIkqGmy1nEVDxz/ElkpHx+vr02b3CTjJO
         BfUw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780678354; x=1781283154; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VeZUMw0HpsIyp0mONwGLTLn1SrcjqcTVf5S2r7VGC4Y=;
        b=sKdVH4CxskVQew5DYoKfQyHqJJryfGZLwUUEcbVIohhH2x2hhSkpJcM/1xBgRwy3be
         62uqyK7pxtc2+DXQ6R4JpaIc+qkOZM1RM+495JRXpj9cvh0jtICqvpm/4nPZv0XflF11
         EHGAN9hJ7yzVikVyfZZYQC4OKZuGNfsBqyXPwARbAnGqBGv7tavvEO2bklvy6qDwL9Gg
         mR4VqyHzWYs/CeykwE/x2uciqkhEHCMpWJSqS6UmgU4VsBg4Y0Ds0IoRJAC4XCck0C1O
         798wXXBQaRaGJzZ6ZFhqjdIvJeEtJhVpzkYVqNzRgCKF+Iqda+XAQOr8iG2ZNqdN14l7
         MOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780678354; x=1781283154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeZUMw0HpsIyp0mONwGLTLn1SrcjqcTVf5S2r7VGC4Y=;
        b=q0dkbfMZGeyebQqX0gTT90J90JDmCV4I3wnak22a41xkdKkq/arOM/xxxwld8GpWNw
         affNZ29iffF8bVu415xB319o5bmNZUg6DIxqsT+1BW7yQ+LVhvgCRjSOP7PcDh5ecWin
         K0NCSnBIEv78s7hdL0vjkLblEcFFobYFU+Ky5Eu9rt+dk70zisiBys2E3VSzy12nQ11f
         OrILZURmtbhizjhmOHOjIs68yt9/+BQKNWDYYLlQ6dKrgwHmiejftyh06xEDFQbdRgbC
         7tPVvQvb/sHVygwwwn9lsbUWpxT9w54TWVsSjF/Yzx99j2E3gtqHfrqIIa9UgFK9Yj39
         wdUQ==
X-Gm-Message-State: AOJu0Yxnu5mje6GTCpqX6NHMFOWcChnzgLZyi2VtxuqWAUg2pX7oCTaI
	HEM4CSdvC+ITKuHlqFtEisla+NHJPjeJIuncJIHsKtQYzSiJ/MBHS9rP/DOJ7fx7xtKdLfrAYjg
	AiNwZQ9v7oDkc+tTHUsQfluhZQbkjtm8=
X-Gm-Gg: Acq92OGNK54slLwNbshGojYjjULAOj7FoMAxM4AJTwUrRKY8rk+/hyxQPzAMsH+YnlU
	yZ2StGqc+TbC2dwtPWtCac8wWdD6RFlr2RwMlVchMVR6+ilJ6XW/zOBsTOxFJ919pTG5HiGzGYk
	x6an0nF6Sh1kNTJ0BVOHZQ1f9a8PexzU9FZ+sPfJdbuil7LDcdG506hJzy7sVoWMmJB6cEkjglf
	sJsJTHBAO/iWHc9PMxBMA8UNpU60YkxLmeXCBa+wDHRDb4FS9cY70wzBYImG6waFx7E56ekOygz
	Oo//3PxwPE6dwoHK+0+jEe4WDRgioJeYgctHAJ1HtbYZzK/tPEHAHBK5oX8n5x+PQeCdfzUwnpL
	UvW7NMpbmATtzUxSlHQp1yhp9aPc3Dljr3UYE
X-Received: by 2002:a17:903:244e:b0:2c0:ab92:584c with SMTP id
 d9443c01a7336-2c1e8209b98mr50755695ad.25.1780678354174; Fri, 05 Jun 2026
 09:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260605115821.2909728-1-bruce.ashfield@gmail.com> <DJ16ICUL4B42.2ZEFA8MW8FNEA@bootlin.com>
In-Reply-To: <DJ16ICUL4B42.2ZEFA8MW8FNEA@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Jun 2026 12:52:22 -0400
X-Gm-Features: AVHnY4IFzOR73mrvUae5RKEttK32lFtzKrbZxfDBusoPvHmBM8yoApSqaFt5c-g
Message-ID: <CADkTA4Pzgw=qB3aJyxMn+pwxf2vLhfpJe=nRS0SLTUh3tqgCtA@mail.gmail.com>
Subject: Re: [docs][PATCH] kernel-dev: document patch handling for discovered
 BSP descriptions
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c284300653847ca1"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 16:52:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9622

--000000000000c284300653847ca1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 10:18=E2=80=AFAM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> Hi,
>
> On Fri Jun 5, 2026 at 1:58 PM CEST, Bruce Ashfield via
> lists.yoctoproject.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Users adding a recipe-space BSP commonly list their machine ``.scc``
> > directly on SRC_URI as a ``file://*.scc`` fragment. That fragment is
> > processed in both the configuration and patch phases, so any ``patch``
> > directives it (or the arch/bsp descriptions it includes) reference are
> > applied to the kernel source. When the branch being built already
> > contains those commits, do_patch fails -- a confusing result with no
> > documentation explaining it.
> >
> > The kernel tools only inhibit patch application for the *discovered*
> > BSP description (the one located via KMACHINE/LINUX_KERNEL_TYPE), on th=
e
> > assumption that its commits are already in the branch's history. Nothin=
g
> > in the manual states this, nor that delivering the description as a
> > type=3Dkmeta directory is what makes it discoverable rather than a plai=
n
> > fragment.
> >
> > Document the discovered-BSP patch-skip behavior, show the KMACHINE +
> > type=3Dkmeta form required to trigger it, and describe the
> > KMETA_EXTERNAL_BSP opt-in for genuinely out-of-tree BSPs whose patches
> > must still be applied.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >
> > Hi all,
> >
> > This is my first direct patch to the docuentation after all these
> > years.
> >
> > So I'm sure I've got something wrong!
> >
> > Cheers,
> >
> > Bruce
> >
> >  documentation/kernel-dev/advanced.rst | 58 +++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/documentation/kernel-dev/advanced.rst
> b/documentation/kernel-dev/advanced.rst
> > index 97cb66322..12473cbb3 100644
> > --- a/documentation/kernel-dev/advanced.rst
> > +++ b/documentation/kernel-dev/advanced.rst
> > @@ -719,6 +719,18 @@ form from your kernel append file::
> >         file://myplatform;type=3Dkmeta;destsuffix=3Dmyplatform \
> >         "
> >
> > +The ``type=3Dkmeta`` attribute is significant: it adds the directory t=
o
> the
> > +kernel Metadata that the tools search to *discover* the BSP descriptio=
n
> > +matching :term:`KMACHINE` and ``LINUX_KERNEL_TYPE``. A ``.scc`` file
> listed
> > +directly on :term:`SRC_URI` (for example ``file://myplatform.scc``) is
> instead
> > +treated as a configuration fragment and is processed in both the
> configuration
> > +and the patch phases. Any ``patch`` directives that such a fragment
> references,
> > +or that are reached through files it ``include``\ s (such as an
> ``arch/`` or
> > +``bsp/`` description), are then applied to the kernel source and will
> fail if
> > +those patches are already present in the branch. See the
> > +":ref:`kernel-dev/advanced:patch application for bsp descriptions`"
> section for
> > +the reasoning behind this.
> > +
> >  Metadata Outside the Recipe-Space
> >  ---------------------------------
> >
> > @@ -750,6 +762,52 @@ wish to use. Changing the data in these branches
> and not updating the
> >  :term:`SRCREV` statements to match will cause the build to fetch an
> older
> >  commit.
> >
> > +Patch Application for BSP Descriptions
> > +--------------------------------------
> > +
> > +During the build, the kernel tools search the kernel Metadata for the
> BSP
> > +description that most closely matches the :term:`KMACHINE` and
> > +``LINUX_KERNEL_TYPE`` values passed in from the recipe, and use the
> first
> > +description they find that matches both. This is referred to as the
> > +*discovered* BSP description.
> > +
> > +For a discovered BSP description, the tools deliberately do **not**
> apply the
> > +``patch`` directives reachable from it, either directly or through any
> files it
> > +``include``\ s. The kernel source branch you are building
> (:term:`KBRANCH`) is
> > +assumed to already contain those commits as part of its history, so
> re-applying
> > +them would fail. Configuration fragments (``kconf`` directives) are
> always
> > +applied. In other words, a discovered BSP contributes *configuration*,
> not
>
> s/discovered BSP/discovered BSP description/ ?
>
> > +*patches*.
> > +
> > +This is why a recipe-space BSP description must be delivered as a
> > +``type=3Dkmeta`` directory rather than as an individual ``file://*.scc=
``
> entry on
> > +:term:`SRC_URI` (see the
> > +":ref:`kernel-dev/advanced:recipe-space metadata`" section). To have
> your
> > +description discovered, place it in a ``type=3Dkmeta`` directory and s=
et
> > +:term:`KMACHINE` so the tools locate it::
> > +
> > +   KMACHINE:myplatform ?=3D "myplatform"
> > +
> > +   SRC_URI:append:myplatform =3D " \
> > +       file://myplatform;type=3Dkmeta;destsuffix=3Dmyplatform \
> > +       "
> > +
> > +Here, the ``myplatform`` directory contains the BSP description (for
> example
> > +``myplatform-standard.scc``, beginning with ``define KMACHINE
> myplatform`` and
> > +``define KTYPE standard``). Because the description is discovered
> rather than
> > +supplied as a fragment, its ``patch`` directives, and those of
> everything it
> > +``include``\ s, are inhibited, while its configuration is still applie=
d.
> > +
> > +If your BSP genuinely lives outside the kernel source history (the
> branch you
> > +build does **not** already contain the BSP commits, and the patches
> *must* be
> > +applied), the BSP description can opt back in to patch application by
> adding the
> > +following directive to the description itself::
> > +
> > +   define KMETA_EXTERNAL_BSP t
>
> Just making sure, but you meant to add that "t", right? What does it stan=
d
> for?
> Maybe you could quickly explain it below.
>


It's just a non zero value. We have to define it to something, what it is,
doesn't matter.

Bruce



>
> > +
> > +With that directive present, the discovered BSP description is also
> injected
> > +into the patch phase and its ``patch`` directives are applied.
> > +
> >  Organizing Your Source
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
>
> Otherwise the explanation is clear to me although I don't have much
> experience
> with advanced kernel metadata.
>
> Thanks,
> Antonin
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c284300653847ca1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 5, 2026 at 10:18=
=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com=
">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi,<br>
<br>
On Fri Jun 5, 2026 at 1:58 PM CEST, Bruce Ashfield via <a href=3D"http://li=
sts.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproje=
ct.org</a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Users adding a recipe-space BSP commonly list their machine ``.scc``<b=
r>
&gt; directly on SRC_URI as a ``file://*.scc`` fragment. That fragment is<b=
r>
&gt; processed in both the configuration and patch phases, so any ``patch``=
<br>
&gt; directives it (or the arch/bsp descriptions it includes) reference are=
<br>
&gt; applied to the kernel source. When the branch being built already<br>
&gt; contains those commits, do_patch fails -- a confusing result with no<b=
r>
&gt; documentation explaining it.<br>
&gt;<br>
&gt; The kernel tools only inhibit patch application for the *discovered*<b=
r>
&gt; BSP description (the one located via KMACHINE/LINUX_KERNEL_TYPE), on t=
he<br>
&gt; assumption that its commits are already in the branch&#39;s history. N=
othing<br>
&gt; in the manual states this, nor that delivering the description as a<br=
>
&gt; type=3Dkmeta directory is what makes it discoverable rather than a pla=
in<br>
&gt; fragment.<br>
&gt;<br>
&gt; Document the discovered-BSP patch-skip behavior, show the KMACHINE +<b=
r>
&gt; type=3Dkmeta form required to trigger it, and describe the<br>
&gt; KMETA_EXTERNAL_BSP opt-in for genuinely out-of-tree BSPs whose patches=
<br>
&gt; must still be applied.<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; This is my first direct patch to the docuentation after all these<br>
&gt; years.<br>
&gt;<br>
&gt; So I&#39;m sure I&#39;ve got something wrong!<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;=C2=A0 documentation/kernel-dev/advanced.rst | 58 +++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 58 insertions(+)<br>
&gt;<br>
&gt; diff --git a/documentation/kernel-dev/advanced.rst b/documentation/ker=
nel-dev/advanced.rst<br>
&gt; index 97cb66322..12473cbb3 100644<br>
&gt; --- a/documentation/kernel-dev/advanced.rst<br>
&gt; +++ b/documentation/kernel-dev/advanced.rst<br>
&gt; @@ -719,6 +719,18 @@ form from your kernel append file::<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://myplatform;type=3Dkmeta;destsu=
ffix=3Dmyplatform \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; +The ``type=3Dkmeta`` attribute is significant: it adds the directory =
to the<br>
&gt; +kernel Metadata that the tools search to *discover* the BSP descripti=
on<br>
&gt; +matching :term:`KMACHINE` and ``LINUX_KERNEL_TYPE``. A ``.scc`` file =
listed<br>
&gt; +directly on :term:`SRC_URI` (for example ``file://myplatform.scc``) i=
s instead<br>
&gt; +treated as a configuration fragment and is processed in both the conf=
iguration<br>
&gt; +and the patch phases. Any ``patch`` directives that such a fragment r=
eferences,<br>
&gt; +or that are reached through files it ``include``\ s (such as an ``arc=
h/`` or<br>
&gt; +``bsp/`` description), are then applied to the kernel source and will=
 fail if<br>
&gt; +those patches are already present in the branch. See the<br>
&gt; +&quot;:ref:`kernel-dev/advanced:patch application for bsp description=
s`&quot; section for<br>
&gt; +the reasoning behind this.<br>
&gt; +<br>
&gt;=C2=A0 Metadata Outside the Recipe-Space<br>
&gt;=C2=A0 ---------------------------------<br>
&gt;=C2=A0 <br>
&gt; @@ -750,6 +762,52 @@ wish to use. Changing the data in these branches =
and not updating the<br>
&gt;=C2=A0 :term:`SRCREV` statements to match will cause the build to fetch=
 an older<br>
&gt;=C2=A0 commit.<br>
&gt;=C2=A0 <br>
&gt; +Patch Application for BSP Descriptions<br>
&gt; +--------------------------------------<br>
&gt; +<br>
&gt; +During the build, the kernel tools search the kernel Metadata for the=
 BSP<br>
&gt; +description that most closely matches the :term:`KMACHINE` and<br>
&gt; +``LINUX_KERNEL_TYPE`` values passed in from the recipe, and use the f=
irst<br>
&gt; +description they find that matches both. This is referred to as the<b=
r>
&gt; +*discovered* BSP description.<br>
&gt; +<br>
&gt; +For a discovered BSP description, the tools deliberately do **not** a=
pply the<br>
&gt; +``patch`` directives reachable from it, either directly or through an=
y files it<br>
&gt; +``include``\ s. The kernel source branch you are building (:term:`KBR=
ANCH`) is<br>
&gt; +assumed to already contain those commits as part of its history, so r=
e-applying<br>
&gt; +them would fail. Configuration fragments (``kconf`` directives) are a=
lways<br>
&gt; +applied. In other words, a discovered BSP contributes *configuration*=
, not<br>
<br>
s/discovered BSP/discovered BSP description/ ?<br>
<br>
&gt; +*patches*.<br>
&gt; +<br>
&gt; +This is why a recipe-space BSP description must be delivered as a<br>
&gt; +``type=3Dkmeta`` directory rather than as an individual ``file://*.sc=
c`` entry on<br>
&gt; +:term:`SRC_URI` (see the<br>
&gt; +&quot;:ref:`kernel-dev/advanced:recipe-space metadata`&quot; section)=
. To have your<br>
&gt; +description discovered, place it in a ``type=3Dkmeta`` directory and =
set<br>
&gt; +:term:`KMACHINE` so the tools locate it::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0KMACHINE:myplatform ?=3D &quot;myplatform&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0SRC_URI:append:myplatform =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://myplatform;type=3Dkmeta;destsuffix=
=3Dmyplatform \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +Here, the ``myplatform`` directory contains the BSP description (for =
example<br>
&gt; +``myplatform-standard.scc``, beginning with ``define KMACHINE myplatf=
orm`` and<br>
&gt; +``define KTYPE standard``). Because the description is discovered rat=
her than<br>
&gt; +supplied as a fragment, its ``patch`` directives, and those of everyt=
hing it<br>
&gt; +``include``\ s, are inhibited, while its configuration is still appli=
ed.<br>
&gt; +<br>
&gt; +If your BSP genuinely lives outside the kernel source history (the br=
anch you<br>
&gt; +build does **not** already contain the BSP commits, and the patches *=
must* be<br>
&gt; +applied), the BSP description can opt back in to patch application by=
 adding the<br>
&gt; +following directive to the description itself::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0define KMETA_EXTERNAL_BSP t<br>
<br>
Just making sure, but you meant to add that &quot;t&quot;, right? What does=
 it stand for?<br>
Maybe you could quickly explain it below.<br></blockquote><div><br></div><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">It=
&#39;s just a non zero value. We have to define it to something, what it is=
, doesn&#39;t matter.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bru=
ce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +<br>
&gt; +With that directive present, the discovered BSP description is also i=
njected<br>
&gt; +into the patch phase and its ``patch`` directives are applied.<br>
&gt; +<br>
&gt;=C2=A0 Organizing Your Source<br>
&gt;=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt;=C2=A0 <br>
<br>
Otherwise the explanation is clear to me although I don&#39;t have much exp=
erience<br>
with advanced kernel metadata.<br>
<br>
Thanks,<br>
Antonin<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000c284300653847ca1--

