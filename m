Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9C4CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 09:09:28 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.7013.1758791364882055062
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 02:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mJLOlQVD;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-746d7c469a8so546424a34.3
        for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758791364; x=1759396164; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3IXtA8NW/ewdMblLsgDtYQ/0GGv0tWQ1txY15EdTXeg=;
        b=mJLOlQVDP5fko8Ijz3gC/vcIG1vANVpRfgcQFO5aIPh9D6E7ceQeiglR5FrAHfqqFH
         kPyiR3b4SMXq4nWuVOZsydYzu94D8Ra3o+JCrmFYwQwa/DKKc670zGc6+exSCNfpPMja
         Ma7uFqNB5Zz8ju3UApKIRYa598bmqUGSY/iMCNfA3atyAJ7K60r8W6JQP2KDPmAUYj3l
         C2pRJqdEl6FS3KYTmaedlIUjxB9P+g5K+hj48ZgrGImQ1TOZrn+YsioOIRTwFRLhOSHu
         WoZhxSL0D4Z8n6a6cFw716zqffWY3hYfJmhoRgk6nqVM1wW2PRUYdpiYALNVT1bO+Wdd
         TKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791364; x=1759396164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IXtA8NW/ewdMblLsgDtYQ/0GGv0tWQ1txY15EdTXeg=;
        b=cwQnL4nLfBmOxnh4GP8THIrA91/Hcxn4URtgsGGsgyeIyiR5kTnfyJnAiBR+tZu7BI
         pQovgJM2Bv2WIuVcyH9Dk6kehQlzpunLbfCzQLbHCVLW+Gwvo+mmV28yqBdt0bRkq5rI
         d2u389xam1VyJVoUvFi1c+U77dBepRbh/C+mgEffPKz0ZYXepSxpJkSu9mmJVTpbjGFC
         HY8VthegT1aXavrDrUqIehEtYI+U2e6wPfXlaSSHAsfU7RZbkPcLtmd2pkHOid6KzAZG
         mDo4sq/eS8dw02OAGuGaszrsJNmVqljfY3R2/bfXRE5Tc2kWafYsbhAQzGV59CgCC9Ee
         PCsQ==
X-Gm-Message-State: AOJu0Yx2sP5Qxma29omVs3M5eofe5tzSzsBtNoKnBLvZqCNCZIH+KG2V
	WahYd2ECtqNcC38fUUR+ZrGDnOD7klgwIXsxNw2IR9CpHBLqjz/bv9LbNZlZOnzvJzEjgR/o8Hv
	DoUiUfexT4NcqxhjFVwbQdMOIjsapYK4=
X-Gm-Gg: ASbGnctzkzrEd2vwu5iys2B0jYNSWoK2RDmfLzOANhwKFWh4iNbpPIuLL2X46nWQqSV
	0Low0vah/hB1ZxkQmGhMihzNL+2SgNrXYUUlgRdRBze80oTaUz4MLYiWBTZU/IdnRQHEyavEIIX
	NlNxFtWTd9U7E3OhkWNlb2UHNDTzAydCI3IEbRL0bl1lW3csxWtok7qBqoBzz9LAgJS+m4Ezd+x
	SinK9du5Y6Fyc1VkDJ0
X-Google-Smtp-Source: AGHT+IGh/Oth/JxAO84kmOnmkrKeubdbijx+mgoc5JX0r/MKYYMd3DI7HaTa61RlbIHQLcGMRU6zmh6w9ThOQ5RtiBs=
X-Received: by 2002:a05:6808:180a:b0:438:3ae6:d5ab with SMTP id
 5614622812f47-43f4cfca3c7mr1265983b6e.41.1758791363750; Thu, 25 Sep 2025
 02:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250923121422.24593-1-adam.blank.g@gmail.com>
 <20250923121422.24593-2-adam.blank.g@gmail.com> <DD1R4OC249CA.3QCJ0Q1LI5ELE@bootlin.com>
In-Reply-To: <DD1R4OC249CA.3QCJ0Q1LI5ELE@bootlin.com>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 25 Sep 2025 11:09:12 +0200
X-Gm-Features: AS18NWDB0zMHi2d0_lFUIVKsXgCjCyLaRn4vZEK2sEl0PqEy8jg9hffHkFlXkXk
Message-ID: <CAFAffzy0ofmi6utk1jBsVaT-6FYNtkS6CZ7zpxLE88-wE3K9iA@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] kernel-dev/common.rst: fix the in-tree
 defconfig description
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000078725c063f9c8683"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 09:09:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7595

--00000000000078725c063f9c8683
Content-Type: text/plain; charset="UTF-8"

Yes, that was also my first approach, but eventually I decided towards a
minimal change.
Shall I send a V2 of the patchset?

Thanks,
Adam

On Thu, 25 Sept 2025 at 10:51, Antonin Godard <antonin.godard@bootlin.com>
wrote:

> On Tue Sep 23, 2025 at 2:14 PM CEST, Adam Blank via lists.yoctoproject.org
> wrote:
> > The description of the relation between KBUILD_DEFCONFIG and
> > SRC_URI is reversed. In fact it is the SRC_URI provided
> > defconfig which will be dropped by the kernel-yocto class
> > if both are provided.
> >
> > Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> > ---
> >  documentation/kernel-dev/common.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/documentation/kernel-dev/common.rst
> b/documentation/kernel-dev/common.rst
> > index 654c4e0a0..c7b25765a 100644
> > --- a/documentation/kernel-dev/common.rst
> > +++ b/documentation/kernel-dev/common.rst
> > @@ -655,7 +655,7 @@ Aside from modifying your kernel recipe and
> providing your own
> >  :term:`SRC_URI` to use a ``defconfig`` other than your "in-tree" file
> (e.g.
> >  a kernel's ``linux-``\ `machine`\ ``.inc`` file). In other words, if the
> >  build system detects a statement that identifies an "out-of-tree"
> > -``defconfig`` file, that statement will override your
> > +``defconfig`` file, that statement will be overriden by your
>
> s/overriden/overridden/
>
> Thanks, I can also verify that behavior so the logic is indeed reverted.
>
> In this case I think the previous sentence should also be removed:
>
>   Aside from modifying your kernel recipe and providing your own
> ``defconfig``
>   file, you need to be sure no files or statements set :term:`SRC_URI` to
> use a
>   ``defconfig`` other than your "in-tree" file (e.g. a kernel's ``linux-``\
>   `machine`\ ``.inc`` file).
>
> And instead only have one:
>
>   If the build system detects a statement that identifies an "out-of-tree"
>   ``defconfig`` file, that statement will be overriden by your
>   :term:`KBUILD_DEFCONFIG` variable.
>
> What do you think?
>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000078725c063f9c8683
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Yes, that was also my first approach, but eventually I decide=
d towards a minimal change.</div><div class=3D"gmail_default" style=3D"font=
-size:small">Shall I send a V2 of the patchset?</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Thanks,</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Adam</div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Sept 2025 at 10:=
51, Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com">antoni=
n.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Tue Sep 23, 2025 at 2:14 PM CEST, Adam Blank via <a =
href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank"=
>lists.yoctoproject.org</a> wrote:<br>
&gt; The description of the relation between KBUILD_DEFCONFIG and<br>
&gt; SRC_URI is reversed. In fact it is the SRC_URI provided<br>
&gt; defconfig which will be dropped by the kernel-yocto class<br>
&gt; if both are provided.<br>
&gt;<br>
&gt; Signed-off-by: Adam Blank &lt;<a href=3D"mailto:adam.blank.g@gmail.com=
" target=3D"_blank">adam.blank.g@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/kernel-dev/common.rst | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/documentation/kernel-dev/common.rst b/documentation/kerne=
l-dev/common.rst<br>
&gt; index 654c4e0a0..c7b25765a 100644<br>
&gt; --- a/documentation/kernel-dev/common.rst<br>
&gt; +++ b/documentation/kernel-dev/common.rst<br>
&gt; @@ -655,7 +655,7 @@ Aside from modifying your kernel recipe and provid=
ing your own<br>
&gt;=C2=A0 :term:`SRC_URI` to use a ``defconfig`` other than your &quot;in-=
tree&quot; file (e.g.<br>
&gt;=C2=A0 a kernel&#39;s ``linux-``\ `machine`\ ``.inc`` file). In other w=
ords, if the<br>
&gt;=C2=A0 build system detects a statement that identifies an &quot;out-of=
-tree&quot;<br>
&gt; -``defconfig`` file, that statement will override your<br>
&gt; +``defconfig`` file, that statement will be overriden by your<br>
<br>
s/overriden/overridden/<br>
<br>
Thanks, I can also verify that behavior so the logic is indeed reverted.<br=
>
<br>
In this case I think the previous sentence should also be removed:<br>
<br>
=C2=A0 Aside from modifying your kernel recipe and providing your own ``def=
config``<br>
=C2=A0 file, you need to be sure no files or statements set :term:`SRC_URI`=
 to use a<br>
=C2=A0 ``defconfig`` other than your &quot;in-tree&quot; file (e.g. a kerne=
l&#39;s ``linux-``\<br>
=C2=A0 `machine`\ ``.inc`` file).<br>
<br>
And instead only have one:<br>
<br>
=C2=A0 If the build system detects a statement that identifies an &quot;out=
-of-tree&quot;<br>
=C2=A0 ``defconfig`` file, that statement will be overriden by your<br>
=C2=A0 :term:`KBUILD_DEFCONFIG` variable.<br>
<br>
What do you think?<br>
<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--00000000000078725c063f9c8683--

