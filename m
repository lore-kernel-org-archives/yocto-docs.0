Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1AFC0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 15:16:22 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.21496.1738336573153121740
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 07:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l5U0/zAq;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: simon.eu@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so3566384a91.0
        for <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 07:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738336572; x=1738941372; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kzxpMQs09LT32JHMi3/HHYA6nIwfkqbfM29Fc/gbON8=;
        b=l5U0/zAqBK0ERYndgNObgRWMegxzaqeZ4Lfv0iIOpcVRhkIvfb9xD4D4x80H1IUgK4
         hATFz8Qx3FwR6tY6slLri+qdAkMLPOk2UOZYTZjPc1kvvmENbsi7jQOa7cyZoJDeFtZv
         iLb8r0+XQlPZz1/jyMvrtblE0ez2dyz1c4Chi7GYF4H7/wz/vPF78wg5wTRwStRgrdcx
         GKKyvqUJDfWwnySeHPsiluneZ1meX3CQN5UjQeuLDEu5jBq1dU45Bt65GA9JersmKFYv
         PTvrfpTZICzou7xW3jphUjeqdaq1LsScarOMP0c1sHReWaBaCMWTa6HeJ02y5aug1+p5
         duhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336572; x=1738941372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzxpMQs09LT32JHMi3/HHYA6nIwfkqbfM29Fc/gbON8=;
        b=FjmMu33fIvw84z2ZJmErQjrcUsw7jreiDvfmhoDomtE/VilEUzz3FRWWpVVqs7KFgs
         zLqa5BgOURvYRvNYvCE16StC1zktXfdqY0FXkFefPNuintEkXii44/5zqRyHorUYPXG8
         /G7jD93ZMOoTJrCnBsJ1y8hZC19nPwKMwkqF7bbcPqW2WQFYYGMWZPnE0RHvtTgtMJ0Y
         G/nwK4LdGONQbOIDWS1HK8fmOE5w5TLx4cr7KadTsKFvpwuE6Azm+bhlFXlw+KjMeGGE
         bwv0w3rIcgUms1qyLXqesQnO3YZXDK7RtnI1IVVd08b/3dy30tOXVnEhKhXZvZCW/gTF
         2wfw==
X-Gm-Message-State: AOJu0YwpNNYoN7fhp1RP6KptQjo5Hx12srhsQU0rtnrUq/S88zQuf5W3
	ySQaRrbS8CXdazfV5zE70W4r+c/Nwg3lQtbIjnYND+KATMMXTbW0feipptImjNIfsbjxb7DcOPm
	y1hCXF+5PH18ZwfeMjmipFxZDWKM=
X-Gm-Gg: ASbGnctEV3w4nH0NdKGS8sLPQ/fb2D8GTSW3RohcAKhoTyULxhHkWZoErCt1MlXWF/g
	/UwoAdQIU9qrTxfZvWPUZ75N1HIi/1VJ2/q2pqft9UyZpf3jS0rxNQny9bwNI50oGmMSHsEfIdw
	==
X-Google-Smtp-Source: AGHT+IE+T9cfvJrlQYyvUlQhG22DLHO7tUXkaUDzTjhrTAQwH7XbwK5NoT6FpIBp65uQXdOI3A1jM7vpWV/RBopEUt8=
X-Received: by 2002:a17:90b:5245:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-2f83abaf3f2mr18371824a91.7.1738336572374; Fri, 31 Jan 2025
 07:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20250128102308.42435-1-simon.eu@gmail.com> <fd45d304-a3bd-498f-816f-cc80313a9091@cherry.de>
 <CAO8d5BY-jFbyOjcfHuS1KxDVzyn2FgQNtM9G0x5sB646OtHYqA@mail.gmail.com>
 <548d78ed-f820-46f1-80aa-10815c53a6f1@cherry.de> <CAO8d5BbLuK5uvfrk1p_Fj6sYyK9wxtXV_ad+kCdAtTq=GWsy1Q@mail.gmail.com>
 <f6c77a80-b4c0-423c-abf7-d29c5a6cdf4d@cherry.de>
In-Reply-To: <f6c77a80-b4c0-423c-abf7-d29c5a6cdf4d@cherry.de>
From: Simon Eugster <simon.eu@gmail.com>
Date: Fri, 31 Jan 2025 16:16:00 +0100
X-Gm-Features: AWEUYZkG5auMDun8sREV08DeA3yu7FTBlmTQORn7_ukagovEGYeTkHxv-89FVWc
Message-ID: <CAO8d5BZnm_NEofGVUp9NOFsFcFf321SLbe8nHSaKSxqctvmdAg@mail.gmail.com>
Subject: Re: [docs] [PATCH v3] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e58496062d02055c"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 15:16:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6237

--000000000000e58496062d02055c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

On Fri, Jan 31, 2025 at 4:09=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de>
wrote:

> Hi Simon,
>
> On 1/31/25 4:05 PM, Simon Eugster wrote:
> > Hi Quentin,
> >
> > Ok, I see! That makes sense. So find found the grub.cfg file in the bui=
ld
> > directory at
> > work/intel_corei7_64-poky-linux/IMAGENAME/1.0/IMAGENAME-1.0/grub_live.c=
fg
> > and now it is on modified. So I ran the build again after changing the
> > variable, and it was updated.
> >
> > Was this a valid test now? :)
> >
>
> It should indeed, and I now have more questions than I started with :)
>
> Will try to find time to figure out what's going on on my own.
>

Let me know if I can test something else on my side too.
Also, I have added GRUB_TITLE to grub-bootconf.bb if that is relevant for
your case:

do_configure[vardeps] +=3D "APPEND ROOT GRUB_TITLE"

(Thinking about it, INITRD should probably also be in this list, right?

Have a good week-end!
Simon

--000000000000e58496062d02055c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Quentin,</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Jan 31, 2025 at 4:09=E2=80=AFPM Quentin Schulz &lt;<a href=3D"ma=
ilto:quentin.schulz@cherry.de">quentin.schulz@cherry.de</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Simon,<br>
<br>
On 1/31/25 4:05 PM, Simon Eugster wrote:<br>
&gt; Hi Quentin,<br>
&gt; <br>
&gt; Ok, I see! That makes sense. So find found the grub.cfg file in the bu=
ild<br>
&gt; directory at<br>
&gt; work/intel_corei7_64-poky-linux/IMAGENAME/1.0/IMAGENAME-1.0/grub_live.=
cfg<br>
&gt; and now it is on modified. So I ran the build again after changing the=
<br>
&gt; variable, and it was updated.<br>
&gt; <br>
&gt; Was this a valid test now? :)<br>
&gt; <br>
<br>
It should indeed, and I now have more questions than I started with :)<br>
<br>
Will try to find time to figure out what&#39;s going on on my own.<br></blo=
ckquote><div><br></div><div>Let me know if I can test something else on my =
side too.</div><div>Also, I have added GRUB_TITLE to <a href=3D"http://grub=
-bootconf.bb">grub-bootconf.bb</a> if that is relevant for your case:</div>=
<div><div style=3D"background-color:rgb(255,255,255);color:rgb(8,8,8)"><pre=
 style=3D"font-family:&quot;JetBrains Mono&quot;,monospace;font-size:9.8pt"=
><span style=3D"color:rgb(135,16,148);font-style:italic">do_configure</span=
>[<span style=3D"color:rgb(6,125,23)">vardeps</span>] +=3D <span style=3D"c=
olor:rgb(6,125,23)">&quot;APPEND ROOT GRUB_TITLE&quot;<br></span></pre></di=
v></div><div>(Thinking about it, INITRD should probably also be in this lis=
t, right?</div><div><br></div><div>Have a good week-end!<br></div><div>Simo=
n</div></div></div>

--000000000000e58496062d02055c--

