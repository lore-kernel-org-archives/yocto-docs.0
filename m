Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04431C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 15:05:42 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.21216.1738335938909268564
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 07:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=INfOD0bZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: simon.eu@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso2855371a91.3
        for <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 07:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738335938; x=1738940738; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SdmdVGh6FWkcANxY1LHngrT9GGqKU6Pzox9kXgHzyr4=;
        b=INfOD0bZIzZD08unW/rEVbwn2BS4b8qw1/mdEXy4XJqT0fpkhGYaoSyHzfugkU0N+K
         i1lKhqA1EKrn2TxtBxmTRaH3qMUMsAmOJ+OdEaI3iOkvODrs8++kwCbMdqkRUS/VKxyL
         18/d4V9manAvXZGr3lHXUKfbYK4qlAMtelhiUMIEx1SBQMyIQ8Z5geSh+xevuoZnGwXF
         MxKHDBVbp+FzzFMnKa9hb76FLl8/mkkbzM5hGT5YRKu7UbM9z7zSqc7UB12aASGrmbK3
         +8wc6my6QFST7fLLF8tIc1xlXlMWq5ZkXk+2dLRVIKM2dMrx64h8QIv3SIaareuGIGMg
         Kgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738335938; x=1738940738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdmdVGh6FWkcANxY1LHngrT9GGqKU6Pzox9kXgHzyr4=;
        b=jA3CpEyr+fnKz52xjS4uyeerqUWwnEWfOzU8rbeqzIle0xrHYiZwcfgoozXRdrXWxh
         NjhWqZIIRV8MPwYcc0EW7pMRuEGHiFQHzUVnfOUnmxkEap/4PwqLGbIduH0RsajGDaol
         PsI1McCj1FE7FEc4lrKDu5xd3VSaIY3ZhQ0/UVNbnxolUL74LNfg3xcr4IUoQBuCk6V4
         TBpkdi2DPZgzdaFS9RodxTxnOSRoO5SwOpU15EfZ/E8l4h0meEhjdQM9C6g2BVtzVq5H
         mQGPK3szZaEYnzc5yjuoNCvqkbl+aTAkyGQ1P12LhR+PXQGGk/HY1rk2tv7t2CsIEVrZ
         I1Tw==
X-Gm-Message-State: AOJu0YxH2qHjEb17fG1n6+jeB73981l8kswQYusU491b9sfbjcIrixtR
	4BkuTfsUD7X/dN3mNukgKlq7/zRe2kC1Ira0djhjlkXE5F0WeR8IEPI2MTaJWs8dKAx1+LF48Ls
	He04x/jsuuvjAZVr1OqrjvyGxq14=
X-Gm-Gg: ASbGncvTxFdMwNI+C1bpgiZWJOmYRjI2IxAcs2Gj1TN402KYt/50DbPuJq1pbV235/i
	Biqei7Gg6/hc9/2XcH3geLWrKTbSqwAYgjKsmd2nMODYQ6CvUWSSWDjK6xaoZUcsiXxT1MBnr9g
	==
X-Google-Smtp-Source: AGHT+IHFeapXzAIFql+fRdeRHvk9NedLW9zxWIn5bXJU7tS3LRqMKrYphCTomt3N2mEp8MnHVb1q+MHlONwHn83vMqA=
X-Received: by 2002:a17:90b:2742:b0:2ee:9a82:5a93 with SMTP id
 98e67ed59e1d1-2f83abf3745mr18400971a91.14.1738335938204; Fri, 31 Jan 2025
 07:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20250128102308.42435-1-simon.eu@gmail.com> <fd45d304-a3bd-498f-816f-cc80313a9091@cherry.de>
 <CAO8d5BY-jFbyOjcfHuS1KxDVzyn2FgQNtM9G0x5sB646OtHYqA@mail.gmail.com> <548d78ed-f820-46f1-80aa-10815c53a6f1@cherry.de>
In-Reply-To: <548d78ed-f820-46f1-80aa-10815c53a6f1@cherry.de>
From: Simon Eugster <simon.eu@gmail.com>
Date: Fri, 31 Jan 2025 16:05:26 +0100
X-Gm-Features: AWEUYZnptbGdi6B_GDqqvAC7bSmk1vZlZ9tixJn1ktZjBA_CVSkWJmKk0qutWBQ
Message-ID: <CAO8d5BbLuK5uvfrk1p_Fj6sYyK9wxtXV_ad+kCdAtTq=GWsy1Q@mail.gmail.com>
Subject: Re: [docs] [PATCH v3] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000018dd7e062d01e03a"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 15:05:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6235

--00000000000018dd7e062d01e03a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

Ok, I see! That makes sense. So find found the grub.cfg file in the build
directory at
work/intel_corei7_64-poky-linux/IMAGENAME/1.0/IMAGENAME-1.0/grub_live.cfg
and now it is on modified. So I ran the build again after changing the
variable, and it was updated.

Was this a valid test now? :)

Simon

On Fri, Jan 31, 2025 at 3:34=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de>
wrote:

> Hi Simon,
>
> On 1/31/25 3:26 PM, Simon A. Eugster via lists.yoctoproject.org wrote:
> > Hi Quentin,
> >
> > On Thu, Jan 30, 2025 at 4:57=E2=80=AFPM Quentin Schulz <quentin.schulz@=
cherry.de
> >
> > wrote:
> >
> >> Hi Simon,
> >>
> >> On 1/28/25 11:23 AM, Simon A. Eugster via lists.yoctoproject.org wrote=
:
> >>> This patch describes how to use overrides for grub-efi-cfg because th=
at
> >>> is otherwise only clear after reading the .bbclass file. It also adds
> >>> a description for GRUB_TITLE.
> >>>
> >>> Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> >>> ---
> >>>    documentation/ref-manual/classes.rst   | 16 ++++++++++++++++
> >>>    documentation/ref-manual/variables.rst |  5 +++++
> >>>    2 files changed, 21 insertions(+)
> >>>
> >>> diff --git a/documentation/ref-manual/classes.rst
> >> b/documentation/ref-manual/classes.rst
> >>> index 761be7b545..1d64ac2f28 100644
> >>> --- a/documentation/ref-manual/classes.rst
> >>> +++ b/documentation/ref-manual/classes.rst
> >>> @@ -991,6 +991,7 @@ This class supports several variables:
> >>>
> >>>    -  :term:`INITRD`: Indicates list of filesystem images to
> >>>       concatenate and use as an initial RAM disk (initrd) (optional).
> >>> +   Can be specified for each ``LABEL``.
> >>>
> >>>    -  :term:`ROOTFS`: Indicates a filesystem image to include
> >>>       as the root filesystem (optional).
> >>> @@ -1004,6 +1005,9 @@ This class supports several variables:
> >>>    -  :term:`APPEND`: An override list of append strings for
> >>>       each ``LABEL``.
> >>>
> >>> +-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
> >>> +   Defaults to ``LABEL`` if it is not defined.
> >>> +
> >>
> >> I would rather say that it defaults to label's name (``LABEL``) or
> >> something like this. GRUB_TITLE does not defaults to LABEL, which is
> >> what this may imply.
> >>
> >>>    -  :term:`GRUB_OPTS`: Additional options to add to the
> >>>       configuration (optional). Options are delimited using semi-colo=
n
> >>>       characters (``;``).
> >>> @@ -1011,6 +1015,18 @@ This class supports several variables:
> >>>    -  :term:`GRUB_TIMEOUT`: Timeout before executing
> >>>       the default ``LABEL`` (optional).
> >>>
> >>> +Each ``LABEL`` defined in the :term:``LABELS`` variable creates a GR=
UB
> >> boot
> >>> +entry, and some variables can be defined individually per ``LABEL``.
> >> The label
> >>> +specific override names are defined as ``grub_LABEL``.
> >>> +
> >>> +For example, for a label ``factory``, the override name would be
> >>> +``grub_factory``. A custom GRUB menu entry titled "Factory Install"
> >> with the
> >>> +additional parameter ``factory=3Dyes`` can be achieved as follows::
> >>> +
> >>> +   LABELS:append =3D " factory"
> >>> +   APPEND:grub_factory =3D "factory=3Dyes"
> >>> +   GRUB_TITLE:grub_factory =3D "Factory Install"
> >>> +
> >>
> >> FYI, I believe this is currently not properly handled by sstate-cache.
> >> We use the same OVERRIDES trick on extlinux.conf generation for U-Boot
> >> and we needed (it seems like, wasn't there when it was implemented)
> >> explicitly list all variables with their OVERRIDES.
> >>
> >> c.f. do_create_extlinux_config[vardeps] in
> >> meta/classes-recipe/uboot-extlinux-config.bbclass.
> >>
> >> An easy way to check that would be to only modify APPEND:grub_factory
> >> and see if it regenerates the grub config file appropriately.
> >>
> >
> > I checked briefly and first built the image,  then I modified one singl=
e
> > variable by adding =E2=80=9Cmodified=E2=80=9D, and ran the build again.=
 After both runs,
> I
> > did a bitbake -e, and the =E2=80=9Emodified=E2=80=9D was not present af=
ter the first
> build,
> > but after the second build.
> >
> > GRUB_TITLE:grub_install:append =3D "Another NEW title for the
> > grub_install label, modified"
> >
> > Did I check correctly?
> >
>
> No :) bitbake -e is the result of parsing. Parsing isn't an issue here,
> but rather what is going to invalidate the sstate-cache for a task or
> not. Tasks are only rebuilt if their content changed (taskhask), the
> variables they depend on change (this is done by checking the content of
> variables stored in the task's vardeps varflag and also I believe by
> some heuristic detecting ${VAR}, $VAR, d.getVar('VAR') and the likes),
> or if a task they depend on has their output changed (see Hash
> Equivalence in the docs).
>
> You need to generate the grub config file once, change a value, generate
> it a second time and then inspect the file before and after that change.
> GRUB_TITLE for the install LABEL should be modified if everything works
> correctly.
>
> Cheers,
> Quentin
>

--00000000000018dd7e062d01e03a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Quentin,</div><div><br></div><div>Ok, I see! That =
makes sense. So find found the grub.cfg file in the build directory at</div=
><div>work/intel_corei7_64-poky-linux/IMAGENAME/1.0/IMAGENAME-1.0/grub_live=
.cfg</div><div>and now it is on modified. So I ran the build again after ch=
anging the variable, and it was updated.</div><div><br></div><div>Was this =
a valid test now? :)</div><div><br></div><div>Simon<br></div></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, Jan 31, 2025 at 3:34=E2=80=AFPM Quentin Schulz &lt;<a href=
=3D"mailto:quentin.schulz@cherry.de">quentin.schulz@cherry.de</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Simon,<br>
<br>
On 1/31/25 3:26 PM, Simon A. Eugster via <a href=3D"http://lists.yoctoproje=
ct.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wro=
te:<br>
&gt; Hi Quentin,<br>
&gt; <br>
&gt; On Thu, Jan 30, 2025 at 4:57=E2=80=AFPM Quentin Schulz &lt;<a href=3D"=
mailto:quentin.schulz@cherry.de" target=3D"_blank">quentin.schulz@cherry.de=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi Simon,<br>
&gt;&gt;<br>
&gt;&gt; On 1/28/25 11:23 AM, Simon A. Eugster via <a href=3D"http://lists.=
yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.o=
rg</a> wrote:<br>
&gt;&gt;&gt; This patch describes how to use overrides for grub-efi-cfg bec=
ause that<br>
&gt;&gt;&gt; is otherwise only clear after reading the .bbclass file. It al=
so adds<br>
&gt;&gt;&gt; a description for GRUB_TITLE.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Simon A. Eugster &lt;<a href=3D"mailto:simon.eu=
@gmail.com" target=3D"_blank">simon.eu@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 documentation/ref-manual/classes.rst=C2=A0 =C2=A0=
| 16 ++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 documentation/ref-manual/variables.rst |=C2=A0 5 =
+++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 21 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/documentation/ref-manual/classes.rst<br>
&gt;&gt; b/documentation/ref-manual/classes.rst<br>
&gt;&gt;&gt; index 761be7b545..1d64ac2f28 100644<br>
&gt;&gt;&gt; --- a/documentation/ref-manual/classes.rst<br>
&gt;&gt;&gt; +++ b/documentation/ref-manual/classes.rst<br>
&gt;&gt;&gt; @@ -991,6 +991,7 @@ This class supports several variables:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 -=C2=A0 :term:`INITRD`: Indicates list of filesys=
tem images to<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0concatenate and use as an initial RA=
M disk (initrd) (optional).<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0Can be specified for each ``LABEL``.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 -=C2=A0 :term:`ROOTFS`: Indicates a filesystem im=
age to include<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0as the root filesystem (optional).<b=
r>
&gt;&gt;&gt; @@ -1004,6 +1005,9 @@ This class supports several variables:<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 -=C2=A0 :term:`APPEND`: An override list of appen=
d strings for<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0each ``LABEL``.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +-=C2=A0 :term:`GRUB_TITLE`: A custom title for each ```LABEL`=
`.<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0Defaults to ``LABEL`` if it is not defined.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;<br>
&gt;&gt; I would rather say that it defaults to label&#39;s name (``LABEL``=
) or<br>
&gt;&gt; something like this. GRUB_TITLE does not defaults to LABEL, which =
is<br>
&gt;&gt; what this may imply.<br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 -=C2=A0 :term:`GRUB_OPTS`: Additional options to =
add to the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration (optional). Options ar=
e delimited using semi-colon<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0characters (``;``).<br>
&gt;&gt;&gt; @@ -1011,6 +1015,18 @@ This class supports several variables:<=
br>
&gt;&gt;&gt;=C2=A0 =C2=A0 -=C2=A0 :term:`GRUB_TIMEOUT`: Timeout before exec=
uting<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the default ``LABEL`` (optional).<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +Each ``LABEL`` defined in the :term:``LABELS`` variable creat=
es a GRUB<br>
&gt;&gt; boot<br>
&gt;&gt;&gt; +entry, and some variables can be defined individually per ``L=
ABEL``.<br>
&gt;&gt; The label<br>
&gt;&gt;&gt; +specific override names are defined as ``grub_LABEL``.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +For example, for a label ``factory``, the override name would=
 be<br>
&gt;&gt;&gt; +``grub_factory``. A custom GRUB menu entry titled &quot;Facto=
ry Install&quot;<br>
&gt;&gt; with the<br>
&gt;&gt;&gt; +additional parameter ``factory=3Dyes`` can be achieved as fol=
lows::<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0LABELS:append =3D &quot; factory&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0APPEND:grub_factory =3D &quot;factory=3Dyes&quot=
;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0GRUB_TITLE:grub_factory =3D &quot;Factory Instal=
l&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;<br>
&gt;&gt; FYI, I believe this is currently not properly handled by sstate-ca=
che.<br>
&gt;&gt; We use the same OVERRIDES trick on extlinux.conf generation for U-=
Boot<br>
&gt;&gt; and we needed (it seems like, wasn&#39;t there when it was impleme=
nted)<br>
&gt;&gt; explicitly list all variables with their OVERRIDES.<br>
&gt;&gt;<br>
&gt;&gt; c.f. do_create_extlinux_config[vardeps] in<br>
&gt;&gt; meta/classes-recipe/uboot-extlinux-config.bbclass.<br>
&gt;&gt;<br>
&gt;&gt; An easy way to check that would be to only modify APPEND:grub_fact=
ory<br>
&gt;&gt; and see if it regenerates the grub config file appropriately.<br>
&gt;&gt;<br>
&gt; <br>
&gt; I checked briefly and first built the image,=C2=A0 then I modified one=
 single<br>
&gt; variable by adding =E2=80=9Cmodified=E2=80=9D, and ran the build again=
. After both runs, I<br>
&gt; did a bitbake -e, and the =E2=80=9Emodified=E2=80=9D was not present a=
fter the first build,<br>
&gt; but after the second build.<br>
&gt; <br>
&gt; GRUB_TITLE:grub_install:append =3D &quot;Another NEW title for the<br>
&gt; grub_install label, modified&quot;<br>
&gt; <br>
&gt; Did I check correctly?<br>
&gt; <br>
<br>
No :) bitbake -e is the result of parsing. Parsing isn&#39;t an issue here,=
 <br>
but rather what is going to invalidate the sstate-cache for a task or <br>
not. Tasks are only rebuilt if their content changed (taskhask), the <br>
variables they depend on change (this is done by checking the content of <b=
r>
variables stored in the task&#39;s vardeps varflag and also I believe by <b=
r>
some heuristic detecting ${VAR}, $VAR, d.getVar(&#39;VAR&#39;) and the like=
s), <br>
or if a task they depend on has their output changed (see Hash <br>
Equivalence in the docs).<br>
<br>
You need to generate the grub config file once, change a value, generate <b=
r>
it a second time and then inspect the file before and after that change. <b=
r>
GRUB_TITLE for the install LABEL should be modified if everything works <br=
>
correctly.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div>

--00000000000018dd7e062d01e03a--

