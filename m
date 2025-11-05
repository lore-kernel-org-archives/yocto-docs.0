Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F309ACCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 17:44:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15873.1762364695650766431
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 09:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Dd33rmzh;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-426fc536b5dso66547f8f.3
        for <docs@lists.yoctoproject.org>; Wed, 05 Nov 2025 09:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762364694; x=1762969494; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AgHfKntNlLThV9CqOLGSKA6GyQAIjwTllB+La4U/xhE=;
        b=Dd33rmzhvSJWfWeFx5pYKkjcx2mCOaLtKSXQDaUH7lTyU2Vx4FFyDdmtpAhyV2rNsj
         M1FDKJgG9h9Hkzu0hl2jwePSHpnYskO5gZS68zT0qCy/qfx+7Z6s3I9r1Dz74/Vj0Ouy
         nD0SFUtOYuaQ8k44uKnw/Fn8TE/lmM96zg4v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762364694; x=1762969494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgHfKntNlLThV9CqOLGSKA6GyQAIjwTllB+La4U/xhE=;
        b=SH9Gb78ZIdTzSpU9aiHpWlUCe7sNkGA5QuRxr7Qt+nlATxhjhCdViwjS3PZOMzRl9T
         8KWY3iXCBUjpQSvgAHWxoLMXS3/zGLhfIO9iV2ERv4krAnLmD6YI79twNBmC1SQWRcHR
         lSVhmps2sTRmZtcsF/fp9NbeNtTl8bVZbg+FzCpc5PlIpTDdG0tsK75ya8I2NScR8vif
         zTh48At0u/ULLGEZzhp3tfIVS7dMQsj+04dQUsKmpfga9WEBEMV9zxwFH+rH7GAEvr0D
         iikiOiWezUT3uI6XYuTLYx9owmcpmIZHZKs03MVeIgbrqa0LQstA75Sa84wfuwT7NLZH
         ioFA==
X-Forwarded-Encrypted: i=1; AJvYcCUNUtvZW79h8/GddBFo31qkwiA9Pf+kQgutIGe2O+HJSFouODNXOZNoj4D5k+pqndT54T3y@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwFtGHwI1KygfZELuZqTQF7B2Sfl+7WyrW5fHAfPsHX/izZUCuZ
	p+b1KiGNTyODf3TbNohgLBPMvqrCaisPuYqQXItK8g04RSb7rpTgUmrqug+BJul2/v/C2i49bDx
	N7xJMd2wyoXKWZC6m2w+w+1y59GlKjRdMnkcFVLpZQw==
X-Gm-Gg: ASbGncsvN4hkcdR5oDyOE+iSiFgRGgU4rjLkNDxQH/J8zJh5BLaM87n66DIaRRY1H6k
	Vg7QiM6ek9fdXD4XK+ms7FWEFn3nxDpKpZutCLGfI78kSzICX0354iWPyZD2E8NLdiPBQyKPbpR
	UMoazJZs6e3qNgvhLDb6JzsWj3M1njPnt5+nXzwYXrSV5E2P79jeI1ca6q8BKUAIXIlNu2iwSwp
	egHSHWndn2ne0+mCZoq6e8TTaWq3JXcHCuBbRyv9stibOc83YNmfMcmRR/7PJ4e9Lx1SHaOEhC2
	VWiYBPz3r/9OXopk+AQ=
X-Google-Smtp-Source: AGHT+IHWH9amKacgvPB2cJo1hdvNVHIAdzyIUPR0mL8d1VVjVziCBeBRQ4nmbRUiS3eGD0PZZ9Cveuzc7RGwMiDaat4=
X-Received: by 2002:a05:6000:2482:b0:429:cacf:107e with SMTP id
 ffacd0b85a97d-429e32e48camr3628303f8f.19.1762364693963; Wed, 05 Nov 2025
 09:44:53 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8p5zTnzo3AO88_c7Q=qDtO1-QWaFNh+z37xLX4Y1H8Bw@mail.gmail.com>
 <20251104151156.3125937-1-johannes.schneider@leica-geosystems.com>
 <DE0USKLW9WXP.3MKV2P4AI36E1@bootlin.com> <CANNYZj_bTNkWmDLe=wmDOXfL1xWxSTx6yP2yqAbjLVaomXoVaQ@mail.gmail.com>
In-Reply-To: <CANNYZj_bTNkWmDLe=wmDOXfL1xWxSTx6yP2yqAbjLVaomXoVaQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 5 Nov 2025 18:44:27 +0100
X-Gm-Features: AWmQ_bmkmGKF8_ueaps5-QqM31CuBWDKuuAah3eSEdP0i_m9IYhqO5kVTSHkN84
Message-ID: <CAMSfU+5SOfNvM-ynzLRzthh-7=mAyFs4aAYrTM9+=e94ahrsQg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add bitbake-setup documentation
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
	Johannes Schneider <johannes.schneider@leica-geosystems.com>, 
	bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000008c788a0642dc81fb"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Nov 2025 17:44:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7991

--0000000000008c788a0642dc81fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 5 nov. 2025 =C3=A0 16:20, Alexander Kanavin <alex.kanavin@gmail.com=
> a
=C3=A9crit :

> On Wed, 5 Nov 2025 at 16:07, Antonin Godard <antonin.godard@bootlin.com>
> wrote:
>
> > Thanks Alex and Johannes for the suggestions and corrections. A v2
> should be out
> > soon!
>
> Before I forget, THISDIR in bb-layers should be also documented:
>
> https://git.openembedded.org/bitbake/commit/?id=3Db3153be29de8b8570b0c184=
369bd41f4c646cf92
>
> Sadly it isn't part of the formal schema definition, in hindsight it
> probably should have.
>

I can do that:
* documenting "{THISDIR}/..."
* Integrating "{THISDIR}" into the formal schema definition


>
> Alex
>


--=20
Yoann Congal
Smile ECS

--0000000000008c788a0642dc81fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 5 =
nov. 2025 =C3=A0=C2=A016:20, Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 5 Nov 2025 at =
16:07, Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" tar=
get=3D"_blank">antonin.godard@bootlin.com</a>&gt; wrote:<br>
<br>
&gt; Thanks Alex and Johannes for the suggestions and corrections. A v2 sho=
uld be out<br>
&gt; soon!<br>
<br>
Before I forget, THISDIR in bb-layers should be also documented:<br>
<a href=3D"https://git.openembedded.org/bitbake/commit/?id=3Db3153be29de8b8=
570b0c184369bd41f4c646cf92" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.openembedded.org/bitbake/commit/?id=3Db3153be29de8b8570b0c184369bd41f4c64=
6cf92</a><br>
<br>
Sadly it isn&#39;t part of the formal schema definition, in hindsight it<br=
>
probably should have.<br></blockquote><div><br></div><div>I can do that:</d=
iv><div>* documenting &quot;{THISDIR}/...&quot;</div><div>* Integrating &qu=
ot;{THISDIR}&quot; into the formal schema definition</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000008c788a0642dc81fb--

