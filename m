Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6D3C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 16:56:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.33434.1737910595130168211
 for <docs@lists.yoctoproject.org>;
 Sun, 26 Jan 2025 08:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Aa9Zmo9w;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so3170644f8f.0
        for <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 08:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1737910593; x=1738515393; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WItNPfAwME8Z58t9HFXldHPxUUz72ayndHnPhvso0dk=;
        b=Aa9Zmo9wc/nX3dIXC8GCD6FSJXKoCDe6z7wZ1a6+1m2mXbq/TdzZdT7ofxGaBIWkyQ
         Ys15CZl51d6bK0vmAtX+T0X7TxhTt8ab9PzYmwdEt8fgnPo2KwG4yv5l2ZY26EDmQWqp
         nbLmqcUZX/ZeCtX/Etzq2Boq7D2bNh8v4Ezy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737910593; x=1738515393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WItNPfAwME8Z58t9HFXldHPxUUz72ayndHnPhvso0dk=;
        b=WvZ6QHeN86aQWDNmQD+RPSnBYR+IQZZlal6pThSEX4/hOSyeUjIiOJzlEKsUxEGvym
         Lgs060OFfwqvKOspSNsj8rC+YP9sdi45/SkGqWGgLOQLhhcqv8+JG0yBl73T8SV+tFN3
         X+drJX7vyPdn8QCeRFgbP1oBAgAQsQdFkVfE1Hs+z5ayrXQzXYpF8RpjPu/pJa4LHbGS
         lT6uzm0RFwGruRgNgsXjsGQtF3QMQC4UICEY9rqWq6TJ5+Pm7GQqXvE+9fFSC4r2yZfm
         MYCpvh/FOLG6rCnFf0N40opBSvE7sFFnlO3V+uaCauUVPhUpJYdcWhqQzR/QWEENxFXR
         fO+g==
X-Forwarded-Encrypted: i=1; AJvYcCWICcNzfaT5D1EH9FqQNY9n76DLP20ASoWb9i87d30dBMaEcipPQtdPLFUjN8SW3AFSqAhD@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx5SIaMJ8QPlV1zKvSS97/FHvaQUFeMlJDkYM51LDBV2Mqbi9F0
	zj0ggATH5/IdUUbgEqt9nGWtD9yoWTHpWAUmPGmseWxcKoY9VkvmCAp5PGzhuzcSEqT9UFVVUSv
	PAw0xBnYVbTfam0VG9HBr/feKPMG35Xillutqww==
X-Gm-Gg: ASbGncvZ8+kdxZQnRDWLLJNb7zImu1y+ZQumkLrW0GrEV/TPgt9Lsas7q2/P9HWYF36
	raS7VPknhNvtu0807HZTIAQfpNo8d+meFuwchOnr9pZiKok3NXLXTyj5StISU26qRjmqrjg77TT
	zpzSuCHMRvKwuqmGNLBRo=
X-Google-Smtp-Source: AGHT+IGoCSBV0Yr25GAOeko/njAbcFNKVdmOkbc0chyN/0YThMV04ATUcR/7D0b6hmsNoSPSt3V2z5g7XqzW8ljGWts=
X-Received: by 2002:a5d:47cf:0:b0:38c:1270:f96b with SMTP id
 ffacd0b85a97d-38c1270fbb5mr24444795f8f.45.1737910593221; Sun, 26 Jan 2025
 08:56:33 -0800 (PST)
MIME-Version: 1.0
References: <2cef35c707ab0d985578ca4d042cfb33902dbcb5.1737894876.git.joerg.sommer@navimatix.de>
 <2d28b3a78a7bdc3be27bee7d9d911e87bf4ad45b.camel@linuxfoundation.org> <hxkb5rwmau5lcil6xwof2wksghwsqbyrxys67uu4xv3goep3je@sepxesev554o>
In-Reply-To: <hxkb5rwmau5lcil6xwof2wksghwsqbyrxys67uu4xv3goep3je@sepxesev554o>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sun, 26 Jan 2025 17:56:07 +0100
X-Gm-Features: AWEUYZmolYfOAyM0cs7Mv5q6MtikBqkkUnNtggQLjO_GoLgfA9OIsewBH2AAkxg
Message-ID: <CAMSfU+5h-mNsFTRng95D1Wa_-ezrwp9WDjsJVoZmEUWHUxj_mw@mail.gmail.com>
Subject: Re: [docs] [PATCH] doc/wic,README.hardware: add dd option conv=sparse
To: joerg.sommer@navimatix.de
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008f8e71062c9ed7a3"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 16:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6183

--0000000000008f8e71062c9ed7a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 26 janv. 2025 =C3=A0 16:25, J=C3=B6rg Sommer via lists.yoctoproject=
.org
<joerg.sommer=3Dnavimatix.de@lists.yoctoproject.org> a =C3=A9crit :

> Richard Purdie schrieb am So 26. Jan, 12:53 (+0000):
> > On Sun, 2025-01-26 at 13:37 +0100, J=C3=B6rg Sommer via
> lists.yoctoproject.org wrote:
> > > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > >
> > > The GNU implementation of dd supports the skipping of sparse blocks
> which
> > > can speed-up the write, esp. of wic images with big holes:
> > >
> > >     $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M
> > >     2683+1 Datens=C3=A4tze ein
> > >     2683+1 Datens=C3=A4tze aus
> > >     5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 84,2773 s, 66,8 MB/s
> > >
> > >     $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M conv=3Dsparse
> > >     2683+1 Datens=C3=A4tze ein
> > >     2683+1 Datens=C3=A4tze aus
> > >     5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 11,3314 s, 497 MB/s
> > >
> > > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > > ---
> > >  documentation/dev-manual/wic.rst  |  8 +++++++-
> > >  meta-yocto-bsp/README.hardware.md | 20 ++++++++++++++------
> > >  2 files changed, 21 insertions(+), 7 deletions(-)
> >
> > I'm torn on this as it is potentially dangerous. It depends whether the
> > blocks really need to be zero or their contents doesn't matter. You
> > could leave existing data behind if you use the sparse option.
>
> Isn't this the same what bmaptool does?
> https://github.com/yoctoproject/bmaptool?tab=3Dreadme-ov-file#concept
>

It look it does not. bmaptool readme is very particular on what a "unmapped
block" is. And is not a zero block.
TL;DR: (a gross reinterpretation) that is a block not referenced anywhere
in your filesystem.

Imagine a file filled with zeroes on your filesystem. Those zeros are
referenced so must be flashed. bmaptool will flash them.
"dd conv=3Dsparse" will not and this is only right in a corner case : if yo=
u
already know that your disk/memory is zero filled.
But, in the general case, you'll get a "zero file" filled with garbage.

Sorry, but I'm against this change since it will be a source of weird/hard
bugs.
Maybe instead of changing the dd command to speedup we can push users to
"bmaptool copy" (we will get speedup without compromising on the validity
of the filesystem)?

Regards,
--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000008f8e71062c9ed7a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 26=
 janv. 2025 =C3=A0=C2=A016:25, J=C3=B6rg Sommer via <a href=3D"http://lists=
.yoctoproject.org">lists.yoctoproject.org</a> &lt;joerg.sommer=3D<a href=3D=
"mailto:navimatix.de@lists.yoctoproject.org">navimatix.de@lists.yoctoprojec=
t.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Richard Purdie schrieb am So 26. Jan, 12:53 (+0000):<br>
&gt; On Sun, 2025-01-26 at 13:37 +0100, J=C3=B6rg Sommer via <a href=3D"htt=
p://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoct=
oproject.org</a> wrote:<br>
&gt; &gt; From: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimat=
ix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; The GNU implementation of dd supports the skipping of sparse bloc=
ks which<br>
&gt; &gt; can speed-up the write, esp. of wic images with big holes:<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M=
<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze ein<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze aus<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 84=
,2773 s, 66,8 MB/s<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M=
 conv=3Dsparse<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze ein<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze aus<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 11=
,3314 s, 497 MB/s<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.somme=
r@navimatix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0documentation/dev-manual/wic.rst=C2=A0 |=C2=A0 8 +++++++-<b=
r>
&gt; &gt; =C2=A0meta-yocto-bsp/<a href=3D"http://README.hardware.md" rel=3D=
"noreferrer" target=3D"_blank">README.hardware.md</a> | 20 ++++++++++++++--=
----<br>
&gt; &gt; =C2=A02 files changed, 21 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; I&#39;m torn on this as it is potentially dangerous. It depends whethe=
r the<br>
&gt; blocks really need to be zero or their contents doesn&#39;t matter. Yo=
u<br>
&gt; could leave existing data behind if you use the sparse option.<br>
<br>
Isn&#39;t this the same what bmaptool does?<br>
<a href=3D"https://github.com/yoctoproject/bmaptool?tab=3Dreadme-ov-file#co=
ncept" rel=3D"noreferrer" target=3D"_blank">https://github.com/yoctoproject=
/bmaptool?tab=3Dreadme-ov-file#concept</a><br></blockquote><div><br></div><=
div>It look it does not. bmaptool readme is very particular on what a &quot=
;unmapped block&quot; is. And is not a zero block.</div><div>TL;DR: (a gros=
s reinterpretation) that is a block not referenced anywhere in your filesys=
tem.</div><div><br></div><div>Imagine a file filled with zeroes on your fil=
esystem. Those zeros are referenced so must be flashed. bmaptool will flash=
 them.</div><div>&quot;dd conv=3Dsparse&quot; will not and this is only rig=
ht in a corner case : if you already know that your disk/memory is zero fil=
led.</div><div>But, in the general case, you&#39;ll get a &quot;zero file&q=
uot; filled with garbage.</div><div><br></div><div>Sorry, but I&#39;m again=
st this change since it will be a source of weird/hard bugs.</div><div>Mayb=
e instead of changing the dd command to speedup we can push users to &quot;=
bmaptool copy&quot; (we will get speedup without compromising on the validi=
ty of the filesystem)?</div><div><br></div><div>Regards,</div></div><span c=
lass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal=
</font><div><font face=3D"Raleway, regular">Smile ECS - Tech expert<br></fo=
nt></div></div></div></div>

--0000000000008f8e71062c9ed7a3--

