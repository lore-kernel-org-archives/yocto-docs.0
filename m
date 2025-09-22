Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C4BCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 18:06:12 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.59537.1758564364645696475
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 11:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KyVIQ9GM;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bhstalel@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4cebe3b4afcso711081cf.2
        for <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 11:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758564364; x=1759169164; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3CWQPSqt4CiXN8ztV2B/aLFEU8zL9rgONnrHvzKXKM4=;
        b=KyVIQ9GMY7xeW3HeqseWx9Z2kq8MhQh14ZqJIOh9z8nWSAAl6Xp/xaCCnUqbuYUjyu
         +rAeHjXODNXD0Oqp7kfYyi3kgTJPIdFUY+9O+d7/MQBjpOJLAmCaFggYjdIX9WUDoh9J
         cRIpWSgz37inI6vk5acMPq2fZxKd1SdRdHrHaX54/ehfRQMYvinh5ZdaW/fH4Cm6eNaf
         Ey4qHMWmxWtJG4sxdf4MgbeQyd6WYO3gxybrnyktKvu+z392KGeOHzUSWJxY/hdJ6/cO
         9YOWxlwOqLrgLHW9Xq72QD+9fXz+f3/Ls3EGbZ2X/uYCc+o+soxYYKcw+jryc84oFwmO
         H64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758564364; x=1759169164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CWQPSqt4CiXN8ztV2B/aLFEU8zL9rgONnrHvzKXKM4=;
        b=TjDv2vBzCMZ+WtSsSZjAlItHc/Oqd5fmQBTaV1DF1XB54YcV/CkSg+D2KVCUx989cB
         Yt8hpYm8XENckV5+aLgA9CYfLCpEv/PuKPLrwf+2A9c+ATm8Ru+7GdRCFklMb37ndc1D
         kAUHGCXTz3rlONKdKJ7wG3S462EBdajO0hGyFndS1MteUPi9hDP7/JZP5yrhUKlyXcSv
         hRe8L35tdVs6jf26ftkyxwpMbNVry7sf790m+cLytNsh1n1mUFaF+jpwPZyY0Bwm4TGZ
         E72LDAwV5ShcVs5p9ZtINZaamNwQInbQVmWiw0NGCdgBnGRrs054R4BLsxgjuPvxmyDc
         Bupw==
X-Gm-Message-State: AOJu0YxLTWFUucd/7xCKlidv8xhKlndAYTRXBYBU1zL4ef9Ni2AwvmFp
	m+k+jbEPyseuy4t2YuFzTsCAm5/3NadKMAKXkjNfCB5WylljL5+viFqEgjz5Ps+s8czE2Wx3dz+
	icoocz1BxToB4NKrArY+qGEDSL2CR0n96gA==
X-Gm-Gg: ASbGncv/ZLDJ1RWtDDlzdpL0Fmm17ax5tF5jezf1+skWBl7L2OLXS9TR9m1iRpicWVT
	W/tzamdGJMbu51LUY3KxRmPnuD+JGM/HKnWfXL4ZuP1D73Nhjpo/Hbq8cw/5LMYoADPYILm2Pdt
	Kb9D5c1V8hn4IttmVGq6CBY1ThoMsmU/h62vWb2G+wfX8TdcGON6w/fmOEdPY7fZwMHQpcdsaxe
	dOnotNPN0tKWtZfNv9YLfQQkQRxgZFdl2KW5+tV
X-Google-Smtp-Source: AGHT+IHyG/0o8obKgWEmeshqV0HZbGi16S7SxqN8h0W5ymWA2Cmr200+IlfF/YRmgfhwSo5Es+mmyBlx/YRPaONMO4w=
X-Received: by 2002:ac8:5e4d:0:b0:4b5:eeb8:9dbd with SMTP id
 d75a77b69052e-4c06eba98b1mr108690911cf.5.1758564363246; Mon, 22 Sep 2025
 11:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250921164306.53501-1-bhstalel@gmail.com> <20250921164306.53501-2-bhstalel@gmail.com>
 <DCZEHNS2J0WG.2PV5B9HWKUBSV@bootlin.com>
In-Reply-To: <DCZEHNS2J0WG.2PV5B9HWKUBSV@bootlin.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Mon, 22 Sep 2025 19:05:52 +0100
X-Gm-Features: AS18NWD4wjsSqEvhP1A5ayvb9CWjNn7CmJFLYSI0M0FFbQX_1uYCPOBM9KgQnNk
Message-ID: <CAOgG7m3vVgQey2Y01dHj8hmi+vGK2n7=Ahwe=Vq58qtBP5QOqA@mail.gmail.com>
Subject: Re: [docs][PATCH 1/2] ref-manual/classes.rst: add details about
 actions done by base.bbclass
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002fae66063f67ac69"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 18:06:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7575

--0000000000002fae66063f67ac69
Content-Type: text/plain; charset="UTF-8"

I totally agree with you.

I was sure that it is too vague, I don't why I did not detailed it more
clearly.

I will add more details in v2

Thanks

On Mon, 22 Sep 2025 at 15:32 Antonin Godard <antonin.godard@bootlin.com>
wrote:

> On Sun Sep 21, 2025 at 6:43 PM CEST, BELHADJ SALEM Talel via
> lists.yoctoproject.org wrote:
> > Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
> > ---
> >  documentation/ref-manual/classes.rst | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/documentation/ref-manual/classes.rst
> b/documentation/ref-manual/classes.rst
> > index 662121ed9..791c6b2ef 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -183,6 +183,14 @@ The class also contains some commonly used
> functions such as
> >  :term:`EXTRA_OEMAKE` variable as well as the
> >  arguments passed directly to ``oe_runmake``.
> >
> > +The following actions, among others, are handled by this class:
>
> I would perhaps phrase this differently, how about:
>
> """
> For example, the following items are handled by this class:
> """
>
> So intent is more about giving some examples about what the class is doing.
>
> > +
> > +- Define default dependencies and add them to :term:`DEPENDS` if
> :term:`INHIBIT_DEFAULT_DEPS`
> > +  is not defined
>
> What dependencies? I'm afraid adding this sentence may add confusion
> instead of
> adding precision.
>
> > +- Handle :term:`PACKAGECONFIG` variable
>
> This is vague too. I would extend this sentence to briefly give some
> context.
>
> > +- Handle the provided license via :term:`LICENSE` and
> :term:`LIC_FILES_CHKSUM` variables
>
> s/license/license(s)
>
> This is again a bit vague, I'm not sure what's the added value. How about:
>
> """
> Handle the provided license(s) specified in the :term:`LICENSE` variable,
> and
> verify its checksum specified in the :term:`LIC_FILES_CHKSUM` variable.
> """
>
> > +- Prepare the native recipe that correspond to the scheme set in
> :term:`SRC_URI`
>
> This is too vague, I'm not sure what you wanted to convey here.
>
> > +
> >  .. _ref-classes-bash-completion:
> >
> >  ``bash-completion``
>
> I would finish by saying:
>
> """
> See the source code of the :ref:`ref-classes-base` class to get a complete
> overview of what the class handles.
> """
>
> So that way we insist on the fact that we were just giving examples.
>
> Thanks,
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000002fae66063f67ac69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I totally agree with you.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I was sure that it is too vague, I don&#39;t why I did =
not detailed it more clearly.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">I will add more details in v2</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Thanks=C2=A0</div><div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 22 Sep 2025 at 1=
5:32 Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com">anton=
in.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Sun Sep 2=
1, 2025 at 6:43 PM CEST, BELHADJ SALEM Talel via <a href=3D"http://lists.yo=
ctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org=
</a> wrote:<br>
&gt; Signed-off-by: Talel BELHAJ SALEM &lt;<a href=3D"mailto:bhstalel@gmail=
.com" target=3D"_blank">bhstalel@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/ref-manual/classes.rst | 8 ++++++++<br>
&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt;<br>
&gt; diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-=
manual/classes.rst<br>
&gt; index 662121ed9..791c6b2ef 100644<br>
&gt; --- a/documentation/ref-manual/classes.rst<br>
&gt; +++ b/documentation/ref-manual/classes.rst<br>
&gt; @@ -183,6 +183,14 @@ The class also contains some commonly used functi=
ons such as<br>
&gt;=C2=A0 :term:`EXTRA_OEMAKE` variable as well as the<br>
&gt;=C2=A0 arguments passed directly to ``oe_runmake``.<br>
&gt;=C2=A0 <br>
&gt; +The following actions, among others, are handled by this class:<br>
<br>
I would perhaps phrase this differently, how about:<br>
<br>
&quot;&quot;&quot;<br>
For example, the following items are handled by this class:<br>
&quot;&quot;&quot;<br>
<br>
So intent is more about giving some examples about what the class is doing.=
<br>
<br>
&gt; +<br>
&gt; +- Define default dependencies and add them to :term:`DEPENDS` if :ter=
m:`INHIBIT_DEFAULT_DEPS`<br>
&gt; +=C2=A0 is not defined<br>
<br>
What dependencies? I&#39;m afraid adding this sentence may add confusion in=
stead of<br>
adding precision.<br>
<br>
&gt; +- Handle :term:`PACKAGECONFIG` variable<br>
<br>
This is vague too. I would extend this sentence to briefly give some contex=
t.<br>
<br>
&gt; +- Handle the provided license via :term:`LICENSE` and :term:`LIC_FILE=
S_CHKSUM` variables<br>
<br>
s/license/license(s)<br>
<br>
This is again a bit vague, I&#39;m not sure what&#39;s the added value. How=
 about:<br>
<br>
&quot;&quot;&quot;<br>
Handle the provided license(s) specified in the :term:`LICENSE` variable, a=
nd<br>
verify its checksum specified in the :term:`LIC_FILES_CHKSUM` variable.<br>
&quot;&quot;&quot;<br>
<br>
&gt; +- Prepare the native recipe that correspond to the scheme set in :ter=
m:`SRC_URI`<br>
<br>
This is too vague, I&#39;m not sure what you wanted to convey here.<br>
<br>
&gt; +<br>
&gt;=C2=A0 .. _ref-classes-bash-completion:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ``bash-completion``<br>
<br>
I would finish by saying:<br>
<br>
&quot;&quot;&quot;<br>
See the source code of the :ref:`ref-classes-base` class to get a complete<=
br>
overview of what the class handles.<br>
&quot;&quot;&quot;<br>
<br>
So that way we insist on the fact that we were just giving examples.<br>
<br>
Thanks,<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000002fae66063f67ac69--

