Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5D9CCFA18
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:33:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2704.1762385582077963832
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 15:33:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A+oq2chj;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477632cc932so658625e9.3
        for <docs@lists.yoctoproject.org>; Wed, 05 Nov 2025 15:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762385580; x=1762990380; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QDeNvQfhMoNQ9pHdD6/bj/pyG9bP1OsnAhyqxTK93ns=;
        b=A+oq2chjajsBJfH+d3YZhhdLHYeGQ+vOj0AT6C4CSTr44Sbggf8YjUrcVSVG/ySuZN
         ZnREmbkPbgxj+/tYmpeAZNBXg0UuhvELsDihJ/LjW7REqXnltZ0XlRlWaKduR3qrRuOg
         TafcZs/i8pMBZdkXICV+WWP387CGTNFX4+q/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762385580; x=1762990380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDeNvQfhMoNQ9pHdD6/bj/pyG9bP1OsnAhyqxTK93ns=;
        b=aWQxdZn00VgQYLOW08vQvEw5lsLq294azSOBw7IK7+HkKwFsxL3JMkrdi547nEhfWX
         Z1oO/TSff23zv5vWXozqQ+kiEzMsVVBQOSFY8r/JaXEhUs7Mceat3h0GaITi6vX9Ksda
         NQU8bn+TjPcBrDe54oIxhDdZW53N7q8FDmr9DEPn7Jy6E70qf+1jTOSbhVCV3HToUk0t
         qM+gfq/f8BZytKaa77g01xJNKoOkuRm5s92QrGWoXD1qiwfYcWnm1hCSpSsy0XJmeDlb
         PFGPDFvEOkAnesXPO1U2C12L31JpsVUSe4FsYpIqQzFtNTWniKzUayA4cnrKvRiiyDj6
         Bkow==
X-Forwarded-Encrypted: i=1; AJvYcCVWvt+SBR6uUUqHwuVLflME408iYIi8/VcPDjvmZr9trWSKAXJ7J3tZ1Na5mIzODVJRZ3PE@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxqfByraTWphgRVCzw0jTtli9xnIO+CdH6TEP+9aZf6Xjx8LWdm
	dp1yRdRMit0pt0w9syBV5F7vCusIiyK9tqD1dAR4iJfCTx7YiNVFlCbDdWrOLVjOphknOxRj7NE
	l9MzxJriC3RPzVE5SAIF5FEhIF7FoIUiKeDqOBveUrQ==
X-Gm-Gg: ASbGnctCtsA55A7ShteWUwQRxQLJmC7SIyeGbLY8Xe5rQxBJpCji+cYzZ6127FJAysS
	doWYPt2rMF3sM9+U0hZQlpnFUdn0Gv1sDndTcgK/hf7JZLx2zi/hhpjGIZFnX1wI2+jW/IC0pEj
	rmdb/gFzgPYZJt3NUBf7JiTGsYVeQMvMysGHwst0DQv5F8Ske8pwt8vkkIUzhZquHkJ1fPID8l2
	wuiUDk23npL39O9XAGOEYtumkU7b5PP9/KZa7+3DvzYLAiir14U3MI8m/zkbp2jhrWAgWz/9v7u
	zjyB9U3mglFVYF4R0/I=
X-Google-Smtp-Source: AGHT+IFpXqTUgxkjP5NA/qAwD+HCnB87Y9zzGQpk5XxdX8hpC4dzTgVpEBTrzsN8KRgX7JcRZC5oKYRJ7w8t/Skl1mQ=
X-Received: by 2002:a05:6000:1ac6:b0:429:cf88:f7ab with SMTP id
 ffacd0b85a97d-429e3305849mr4366984f8f.36.1762385580402; Wed, 05 Nov 2025
 15:33:00 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8p5zTnzo3AO88_c7Q=qDtO1-QWaFNh+z37xLX4Y1H8Bw@mail.gmail.com>
 <20251104151156.3125937-1-johannes.schneider@leica-geosystems.com>
 <DE0USKLW9WXP.3MKV2P4AI36E1@bootlin.com> <CANNYZj_bTNkWmDLe=wmDOXfL1xWxSTx6yP2yqAbjLVaomXoVaQ@mail.gmail.com>
 <CAMSfU+5SOfNvM-ynzLRzthh-7=mAyFs4aAYrTM9+=e94ahrsQg@mail.gmail.com>
In-Reply-To: <CAMSfU+5SOfNvM-ynzLRzthh-7=mAyFs4aAYrTM9+=e94ahrsQg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 6 Nov 2025 00:32:34 +0100
X-Gm-Features: AWmQ_bnpLmxWHnXk38nm1nAESqaCbIFVGS7qOlQsGE4UIVCTPBbGF_6zlkxvwkk
Message-ID: <CAMSfU+77r9+SW7OOjg8RNp7cycXa14x_2KL9GnBKXhcOEaO3-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add bitbake-setup documentation
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
	Johannes Schneider <johannes.schneider@leica-geosystems.com>, 
	bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000007a3a320642e15eb6"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Nov 2025 23:33:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7993

--0000000000007a3a320642e15eb6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 5 nov. 2025 =C3=A0 18:44, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :

>
>
> Le mer. 5 nov. 2025 =C3=A0 16:20, Alexander Kanavin <alex.kanavin@gmail.c=
om> a
> =C3=A9crit :
>
>> On Wed, 5 Nov 2025 at 16:07, Antonin Godard <antonin.godard@bootlin.com>
>> wrote:
>>
>> > Thanks Alex and Johannes for the suggestions and corrections. A v2
>> should be out
>> > soon!
>>
>> Before I forget, THISDIR in bb-layers should be also documented:
>>
>> https://git.openembedded.org/bitbake/commit/?id=3Db3153be29de8b8570b0c18=
4369bd41f4c646cf92
>>
>> Sadly it isn't part of the formal schema definition, in hindsight it
>> probably should have.
>>
>
> I can do that:
> * documenting "{THISDIR}/..."
>
Sent in [master-next][PATCH] bitbake-user-manual-environment-setup:
Document "{THISDIR}" in bb-layers
https://lists.yoctoproject.org/g/docs/topic/master_next_patch/116144584

* Integrating "{THISDIR}" into the formal schema definition
>
Sent in [PATCH] bitbake-setup.schema.json: Add schema for "{THISDIR}"
bb-layer https://lists.openembedded.org/g/openembedded-core/topic/116144544


>
>> Alex
>>
> --
Yoann Congal
Smile ECS

--0000000000007a3a320642e15eb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 5 =
nov. 2025 =C3=A0=C2=A018:44, Yoann Congal &lt;<a href=3D"mailto:yoann.conga=
l@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">Le=C2=A0mer. 5 nov. 2025 =C3=A0=C2=A016:20, Alexander Kanavin &lt;=
<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gm=
ail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Wed, 5 Nov 2025 at 16:07, Antonin Godard &lt;<a href=
=3D"mailto:antonin.godard@bootlin.com" target=3D"_blank">antonin.godard@boo=
tlin.com</a>&gt; wrote:<br>
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
iv><div>* documenting &quot;{THISDIR}/...&quot;</div></div></div></blockquo=
te><div>Sent in [master-next][PATCH] bitbake-user-manual-environment-setup:=
 Document &quot;{THISDIR}&quot; in bb-layers <a href=3D"https://lists.yocto=
project.org/g/docs/topic/master_next_patch/116144584">https://lists.yoctopr=
oject.org/g/docs/topic/master_next_patch/116144584</a></div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><div>* Integrating &quot;{THISDIR}&quot; into the formal=
 schema definition</div></div></div></blockquote><div>Sent in [PATCH] bitba=
ke-setup.schema.json: Add schema for &quot;{THISDIR}&quot; bb-layer=C2=A0<a=
 href=3D"https://lists.openembedded.org/g/openembedded-core/topic/116144544=
" rel=3D"nofollow noreferrer noopener" target=3D"_blank">https://lists.open=
embedded.org/g/openembedded-core/topic/116144544</a></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br></blockquote></div></div></blockquote></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000007a3a320642e15eb6--

