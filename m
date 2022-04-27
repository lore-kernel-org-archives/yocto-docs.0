Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA7FC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 11:17:58 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.6781.1651058274568130134
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 04:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=psF79qE/;
 spf=pass (domain: linaro.org, ip: 209.85.219.179,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f179.google.com with SMTP id g28so2706805ybj.10
        for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 04:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8OtXfwGKSEhAMaCOitivbK3yFrTYGwXaiFkkF7tV1xw=;
        b=psF79qE/WbvnFrOL7Uawqt1XrWkYiyz93cq/qyRBPws2tv5DSaVl8t1LiqfgIuIEJR
         9SfD3z4cS3mzgaKdekNIhwK9heDSB03ZSkkJQEzsV6z287Ty0o6oOKDLdc7LHQaHAijc
         VX0TFCE88T3egG0bBjA1QyGGwK82/2db4XTOfkynBLL7KJuvhkb3GfIkUoYullM8eG+G
         F6v89IeQtZaMGN2EeY4wXhUCGUiA6BdgL9Ow9xAU8vaY1e16H6UsTPeQyFhBz9N+sN7Z
         e5QiAUW2LsLiPCAo5hP7fXKOA3GjuioG41C2hqcvrVeiM7/NuZPoBCOdLl3aufhjj+Xg
         G6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8OtXfwGKSEhAMaCOitivbK3yFrTYGwXaiFkkF7tV1xw=;
        b=ULhRYcmy1PnVt2KkwAbd74R9StHS1Vt5tGZ7B/rU1bgyBEfe0H5mNMmN9gOadUI5wA
         foeDJR/9WiFJs66GMoGXKZY5ISwysCA9smmcHObwQ9bYzTvlb4X/mTuOWVDhzkzdo5e3
         niJX47QiDvcGkWW3rByTTSQ8ECyc7cQOCN9EKfO/YoYctjsN3hEmPjbuLwkn886RsbS9
         iNld4jVmah4O6f3y6LAUqRPwD6GxM6m0YooDf12wPUQ/w6QQvt7OvfzSfRVsDhHMKneL
         EGo71sfP0snMOl2gD4g0BJ68oDbAX4Sho6CdcOkp5Mw1iHaK4X7vmtSwj+X/Kudk+CVI
         kK6A==
X-Gm-Message-State: AOAM533LGqRdLIb1Q1BWyyd0KehtdtvooYLEeosfJfTxOGS5aiew3rPU
	zoq1X0a3lgWyaCoB7uRsYl3TGX/jONbFfdPk9oDbGg==
X-Google-Smtp-Source: 
 ABdhPJyWSdxtYL3WPYpGjj2qmddqd9JGLaLabFxiEgno5RW+ui21vc5IlR3epCx/Pp2nxGSArofmhU2DXojahvlGTng=
X-Received: by 2002:a25:2e07:0:b0:648:4b15:d47d with SMTP id
 u7-20020a252e07000000b006484b15d47dmr15396968ybu.287.1651058273628; Wed, 27
 Apr 2022 04:17:53 -0700 (PDT)
MIME-Version: 1.0
References: 
 <DM5PR1101MB236176E376BD554365050E72B9FA9@DM5PR1101MB2361.namprd11.prod.outlook.com>
 <90b05148-5215-584e-0080-24cd411b2ba8@sancloud.com>
 <CANPvuR=Sp+tuOAmFRzw207e_1+jNzOyR1AST9J=jh7_KgsOS2Q@mail.gmail.com>
 <9790963d-0e8d-c713-cc97-ab6f8ca4fef3@bootlin.com>
In-Reply-To: <9790963d-0e8d-c713-cc97-ab6f8ca4fef3@bootlin.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 27 Apr 2022 13:17:42 +0200
Message-ID: 
 <CAP71Wjw=OL8e=EqgPaLfPbQisTeFuVE2FkXq7+M9nWKckK4Y_Q@mail.gmail.com>
Subject: Re: [docs] [yocto] [ANNOUNCEMENT] Yocto Project 4.0 is Released
To: michael.opdenacker@bootlin.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
 Paul Barker <paul.barker@sancloud.com>,
	"Lee, Chee Yang" <chee.yang.lee@intel.com>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e74e7f05dda0f5ce"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 11:17:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2883

--000000000000e74e7f05dda0f5ce
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 10:59 AM Michael Opdenacker via
lists.yoctoproject.org <michael.opdenacker=
bootlin.com@lists.yoctoproject.org> wrote:

>
> On 4/27/22 10:18, Jose Quaresma wrote:
> >
> >
> > In the HTML page it is fine, the &YOCTO_DOC_VERSION is 4.0
> >
> https://docs.yoctoproject.org/4.0/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone
> >
> > In the dev version the &YOCTO_DOC_VERSION is not replaced by dev
> >
> https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone
>
>
> That's *very weird* because the substitution happened in
> https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html but
> not in
>
> https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone
> (same version).
>
> When I build the docs locally things look fine. Any ideas what could
> cause this?
>

I can reproduce the issue when building locally. I am using Sphinx==4.4.0


>
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2876):
> https://lists.yoctoproject.org/g/docs/message/2876
> Mute This Topic: https://lists.yoctoproject.org/mt/90726109/1279857
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e74e7f05dda0f5ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 27, 2022 at 10:59 AM Mich=
ael Opdenacker via <a href=3D"http://lists.yoctoproject.org">lists.yoctopro=
ject.org</a> &lt;michael.opdenacker=3D<a href=3D"mailto:bootlin.com@lists.y=
octoproject.org">bootlin.com@lists.yoctoproject.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 4/27/22 10:18, Jose Quaresma wrote:<br>
&gt;<br>
&gt; =C2=A0<br>
&gt; In the HTML page it is fine, the &amp;YOCTO_DOC_VERSION is 4.0<br>
&gt; <a href=3D"https://docs.yoctoproject.org/4.0/migration-guides/migratio=
n-4.0.html#release-notes-for-4-0-kirkstone" rel=3D"noreferrer" target=3D"_b=
lank">https://docs.yoctoproject.org/4.0/migration-guides/migration-4.0.html=
#release-notes-for-4-0-kirkstone</a><br>
&gt;<br>
&gt; In the dev version the &amp;YOCTO_DOC_VERSION is not replaced by dev<b=
r>
&gt; <a href=3D"https://docs.yoctoproject.org/dev/migration-guides/migratio=
n-4.0.html#release-notes-for-4-0-kirkstone" rel=3D"noreferrer" target=3D"_b=
lank">https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html=
#release-notes-for-4-0-kirkstone</a><br>
<br>
<br>
That&#39;s *very weird* because the substitution happened in<br>
<a href=3D"https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev/b=
rief-yoctoprojectqs/index.html</a> but<br>
not in<br>
<a href=3D"https://docs.yoctoproject.org/dev/migration-guides/migration-4.0=
.html#release-notes-for-4-0-kirkstone" rel=3D"noreferrer" target=3D"_blank"=
>https://docs.yoctoproject.org/dev/migration-guides/migration-4.0.html#rele=
ase-notes-for-4-0-kirkstone</a><br>
(same version).<br>
<br>
When I build the docs locally things look fine. Any ideas what could<br>
cause this?<br></blockquote><div><br></div><div>I can reproduce the issue w=
hen building locally. I am using Sphinx=3D=3D4.4.0</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2876): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2876" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2876</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90726109/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90726109/1279857</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e74e7f05dda0f5ce--

