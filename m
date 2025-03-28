Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1CFC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:53:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.13135.1743173577905542448
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 07:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LpQrXhVU;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso11319525e9.0
        for <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743173576; x=1743778376; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4D7Mqy7p0Zq53VqfOF9h5fnoVTqikjTybiLv27dQRz0=;
        b=LpQrXhVUVmZqSZhHvvrrhmF6IVVwT9tNQMn3CCHszwwJO55xDG2BYdIemloFm0D9AJ
         /OQMNsNkKNSxxmdigC5yXYVzJxk45tw0xjtiCjxMllmS2EW/ELOmMeUC0fvbnkSCreew
         jdEsk1Z4178IdevVdGPhBMdMGl5lJBf8olTQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743173576; x=1743778376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4D7Mqy7p0Zq53VqfOF9h5fnoVTqikjTybiLv27dQRz0=;
        b=NFW+Z4wfg4SmtXekAZeuHS930F79Cl0epcVpmF7UYGw9ngR8H3wi5/iq+pTsw/CW5K
         +/QZ6tqQDcRZi4svMiwtrR2rG9QX8mG4YE2oHOfUJuB7bWaDRFk42+q88Tdtv0ZZRoGK
         HboIdQyWlt7/EfoxsZvzJaEE+Rui9+xBs9Pk0Xh7MGEse7qF/0BRIdjuKeGSqHLteD2R
         IAbyYYcBUCo4DEEADUAKxeNrnV4fuJ5NT7Un4tvo4Av5tB/NiADtWK4XFx21Iz8V41HQ
         s8FYvMwyxodTMrDQHl7pVrMtfEsZHTQdQFuZutzwKTZBOxflNzGPlio6rqfWBK1zT6zv
         x42A==
X-Gm-Message-State: AOJu0YyAgWCaq5L8LsmmzB+fCtdBFUCG+GEZw4ULKM35T49+VH/t92DO
	mf5o+xCelhcqViGfwRlO4UAsUmGhaH+VezRAZOG2AYpwjWW97zi1soCvLpTD89jVa40pxpGEIFB
	YCM8+ZVzZJU7x08U37DETCqTYBrKvZUZIWrzIhe+fvhg9w8zc
X-Gm-Gg: ASbGncvpRG9TRW62NSG0aKBJFBOPk5VSTnL1TezAOv4iSsXJkxDgKShT/tTlFPhL5+D
	7jSasYUouN9H/09uqZy2hWvsguHnshTmasS/CdYOpDj3N7s5ZeRbpYfbv48jQ13klA5s3cnpbds
	7UAgPGu0PdM1pyBpmpKe+eFtFvErIcUotsax+Ru29NO4eOnfwPAfA4RoUOQW4=
X-Google-Smtp-Source: AGHT+IFzvjqbnatgQBH1KYi5vmKsnYUdilbefJmRGV3JAXMMvjqZiifOLMlxXAZ2aM4nHnOHGVM3ZUkXYEhCuEM7OPI=
X-Received: by 2002:a05:600c:3516:b0:43c:f81d:34 with SMTP id
 5b1f17b1804b1-43d84f9a1dfmr76374525e9.9.1743173575168; Fri, 28 Mar 2025
 07:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
 <CAMSfU+5tH=CG2HQp+A6U-ScX4QyetPh7xfK1YyYxKNf2JXZ5Lw@mail.gmail.com> <D8RZE2BZV20O.1JDF6VIZWNL2F@bootlin.com>
In-Reply-To: <D8RZE2BZV20O.1JDF6VIZWNL2F@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 28 Mar 2025 15:52:29 +0100
X-Gm-Features: AQ5f1Jqjh6jUkYVy5hMZCIMxiA62-fFuEDAahdcgoHk3H0O0MS229BWsKv2TP5s
Message-ID: <CAMSfU+6_3467Z7NRfOTDOV6gKgJ2k-R6EkQ-yO8yZpC2kwSTEA@mail.gmail.com>
Subject: Re: [docs] [PATCH 00/11] Final release note updates for 5.2
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000baedbd063168397c"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 14:53:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6678

--000000000000baedbd063168397c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 28 mars 2025 =C3=A0 15:49, Antonin Godard <antonin.godard@bootlin.c=
om> a
=C3=A9crit :

> Hi Yoann,
>
> On Fri Mar 28, 2025 at 3:44 PM CET, Yoann Congal wrote:
> > Hi Antonin,
> >
> > Le ven. 28 mars 2025 =C3=A0 14:07, Antonin Godard via lists.yoctoprojec=
t.org
> > <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> a =C3=A9crit :
> >
> >> This series makes the final updates before the 5.2 release, which
> >> includes adding the recipe upgrades, license changes, as well as
> cleaning
> >> up a few empty sections.
> >>
> >> It also updates the release notes / migration guide and overall
> >> documentation with regards to the latest changes on Poky.
> >>
> >
> > I don't see
> > [PATCH] poky.yaml.in: Raise minimum GCC version to 10.1
> > https://lists.yoctoproject.org/g/docs/message/6606
> > in your 5.2 branch. I feel like it should be in it.
> >
> > It might conflict with
> > [PATCH 08/11] poky.yaml.in: bump minimum required Python version to 3.9
> > https://lists.yoctoproject.org/g/docs/message/6663
> >
> > Tell me if you want me to rebase/resend to a branch.
>
> Sorry, I just forgot (and didn't get that you were talking about this
> patch on
> IRC, I confounded it with your C++ toolchain flag sanity check patch
> somehow).
>

Well those are close, one document the other.


> Applied to master-next, thanks for the awareness!
>

Thank you :)


> Regards,
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Yoann Congal
Smile ECS

--000000000000baedbd063168397c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 28=
 mars 2025 =C3=A0=C2=A015:49, Antonin Godard &lt;<a href=3D"mailto:antonin.=
godard@bootlin.com">antonin.godard@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
On Fri Mar 28, 2025 at 3:44 PM CET, Yoann Congal wrote:<br>
&gt; Hi Antonin,<br>
&gt;<br>
&gt; Le ven. 28 mars 2025 =C3=A0 14:07, Antonin Godard via <a href=3D"http:=
//lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctop=
roject.org</a><br>
&gt; &lt;antonin.godard=3D<a href=3D"mailto:bootlin.com@lists.yoctoproject.=
org" target=3D"_blank">bootlin.com@lists.yoctoproject.org</a>&gt; a =C3=A9c=
rit :<br>
&gt;<br>
&gt;&gt; This series makes the final updates before the 5.2 release, which<=
br>
&gt;&gt; includes adding the recipe upgrades, license changes, as well as c=
leaning<br>
&gt;&gt; up a few empty sections.<br>
&gt;&gt;<br>
&gt;&gt; It also updates the release notes / migration guide and overall<br=
>
&gt;&gt; documentation with regards to the latest changes on Poky.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I don&#39;t see<br>
&gt; [PATCH] <a href=3D"http://poky.yaml.in" rel=3D"noreferrer" target=3D"_=
blank">poky.yaml.in</a>: Raise minimum GCC version to 10.1<br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/docs/message/6606" rel=3D"=
noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/message=
/6606</a><br>
&gt; in your 5.2 branch. I feel like it should be in it.<br>
&gt;<br>
&gt; It might conflict with<br>
&gt; [PATCH 08/11] <a href=3D"http://poky.yaml.in" rel=3D"noreferrer" targe=
t=3D"_blank">poky.yaml.in</a>: bump minimum required Python version to 3.9<=
br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/docs/message/6663" rel=3D"=
noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/message=
/6663</a><br>
&gt;<br>
&gt; Tell me if you want me to rebase/resend to a branch.<br>
<br>
Sorry, I just forgot (and didn&#39;t get that you were talking about this p=
atch on<br>
IRC, I confounded it with your C++ toolchain flag sanity check patch someho=
w).<br></blockquote><div><br></div><div>Well those are close, one document =
the other.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
Applied to master-next, thanks for the awareness!<br></blockquote><div><br>=
</div><div>Thank you :)</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Regards,<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000baedbd063168397c--

