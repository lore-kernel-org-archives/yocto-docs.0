Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99609C43219
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 19:26:44 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.918.1649961129160769133
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 11:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qrYKy8i7;
 spf=pass (domain: linaro.org, ip: 209.85.128.174,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2ec0bb4b715so64380107b3.5
        for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 11:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1KRq5EZph7txrEWEKb5nIHGb5RqxVHs0LsqbrfjAf0w=;
        b=qrYKy8i7505IUU0X0wIxL2PHLMfKfVBWJ+g9x3v9ve3PnobODxD0bAmgP0G3+2UBTj
         tCNd2+YJj3SmU/hQfGe0UMYqQ6jPztrSIB8pUylBpUAJDASY4wLnlu6vMduNyvZI/BE4
         DO9kOnWLa1uUExIKho7vpyHnqMN0vHAN/6/0wdgcY9I2W3Nu8mj3wmjkJZmAHOQ9Z7dy
         OMaeEBIF+ULCrLsaPcM+PyeHae+nvITJgSYaEDj8faJWZ6y+IwnqICZidaoxKHF0gC9q
         yHd1J0FFJdEnmZ+h0aSb0uh3/Z+blqPBz+Q5VsZcLizWtiPcJfQqFse3Io8XUwU95Fiv
         N0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1KRq5EZph7txrEWEKb5nIHGb5RqxVHs0LsqbrfjAf0w=;
        b=ppMQU4uVClxiqa89/HSHp9PrN6k4HamYL8X30lg4ExwdnsZIE3t1uDLF5Y39YG4XYv
         fBBwnR1TVS17WwOu4jLCZz8koDbvhsnvb94ECFnMc9aopArxEIbH+D53q15N2i0P1RLz
         uFW8+wA8BuXORXGOUe9wbP4U4Hm7hfEjIB1ntYxWhjKyuH348mPA5lQk8l1dRAI193dC
         xrjmPLe/afgieZhzO9GxqIYPn6aESWF/ZgjzGJBdNH2sde5CP+poxT4VxN7bHLkTUFrs
         V8ZIxqAiUlaPqkVOc04fwDiCKBNlEaMeL1Gg8ZB/Xr7yeRM8ztXFWUtSOdewWFwg6HAF
         UHmg==
X-Gm-Message-State: AOAM531D0PfFgWAH2gXDhOhO+LMUNy+Jax7NkkiWU3P5vFXKSQEPYnHG
	GKndirk6qpHOw3BrqaAGCuSm6awHgoqUATSafhIQPQ==
X-Google-Smtp-Source: 
 ABdhPJxgTmq/8tN0cr3/X5hmzwKahwJD41ckgOVT3re716cxZREwimjQMA11+bkR/0zT7t8JCoHvgLPJSX9zxSczYYU=
X-Received: by 2002:a81:15c5:0:b0:2ec:4251:e9b8 with SMTP id
 188-20020a8115c5000000b002ec4251e9b8mr3045533ywv.82.1649961128225; Thu, 14
 Apr 2022 11:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220414144718.63967-1-abongwabonalais@gmail.com>
 <7853fd42-b65e-65e1-746a-1e7c9a4c2b7b@bootlin.com>
In-Reply-To: <7853fd42-b65e-65e1-746a-1e7c9a4c2b7b@bootlin.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 14 Apr 2022 19:31:57 +0100
Message-ID: 
 <CAP71WjzkR82H+03o4RJ5PddHj3=xrYGcR6RnO8iB=qB12WRC0A@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] yocto-docs: profile manual, added banner at the
 top for direction to most recent website for version 3.1.3
To: michael.opdenacker@bootlin.com
Cc: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>,
 docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f106b005dca1825a"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Apr 2022 19:26:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2774

--000000000000f106b005dca1825a
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 14, 2022 at 6:46 PM Michael Opdenacker via
lists.yoctoproject.org <michael.opdenacker=
bootlin.com@lists.yoctoproject.org> wrote:

> Hi Abongwa,
>
> On 4/14/22 16:47, Abongwa Amahnui Bonalais wrote:
> > Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
> > ---
> >  3.1.3/profile-manual/profile-manual-style.css | 28 ++++++++++++++++---
> >  3.1.3/profile-manual/profile-manual.html      |  8 +++++-
> >  2 files changed, 31 insertions(+), 5 deletions(-)
>
>
> Thanks for the patch, but which git repository (or branch?) is it
> supposed to apply to?
>

We've discussed that on IRC, the context is basically
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14394.

So this patch can't really be applied on yocto-docs, but is needed to
update the 'old docs' tarball that we use on the autobuilder when we
produce the content of docs.yoctoproject.org. Abongwa offered to add the
banner and has sent the work done on the list for review.

I suppose RP will take that into the autobuilder, one way or the other.



> Cheers
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
> View/Reply Online (#2773):
> https://lists.yoctoproject.org/g/docs/message/2773
> Mute This Topic: https://lists.yoctoproject.org/mt/90466004/1279857
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f106b005dca1825a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 14, 2022 at 6:46 PM Micha=
el Opdenacker via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproj=
ect.org</a> &lt;michael.opdenacker=3D<a href=3D"mailto:bootlin.com@lists.yo=
ctoproject.org">bootlin.com@lists.yoctoproject.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Abongwa,<br>
<br>
On 4/14/22 16:47, Abongwa Amahnui Bonalais wrote:<br>
&gt; Signed-off-by: Abongwa Bonalais Amahnui &lt;<a href=3D"mailto:abongwab=
onalais@gmail.com" target=3D"_blank">abongwabonalais@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 3.1.3/profile-manual/profile-manual-style.css | 28 +++++++++++++=
+++---<br>
&gt;=C2=A0 3.1.3/profile-manual/profile-manual.html=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 8 +++++-<br>
&gt;=C2=A0 2 files changed, 31 insertions(+), 5 deletions(-)<br>
<br>
<br>
Thanks for the patch, but which git repository (or branch?) is it<br>
supposed to apply to?<br></blockquote><div><br></div><div>We&#39;ve discuss=
ed that on IRC, the context is basically=C2=A0<a href=3D"https://bugzilla.y=
octoproject.org/show_bug.cgi?id=3D14394">https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D14394</a>.=C2=A0</div><div><br></div><div>So this patch c=
an&#39;t really be applied on yocto-docs, but is needed to update the &#39;=
old docs&#39; tarball that we use on the autobuilder when we produce the co=
ntent of <a href=3D"http://docs.yoctoproject.org">docs.yoctoproject.org</a>=
. Abongwa offered to add the banner and has sent the work done on the list =
for review.=C2=A0</div><div><br></div><div>I suppose RP will take that into=
 the autobuilder, one way or the other.=C2=A0</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers<br>
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
View/Reply Online (#2773): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2773" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2773</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90466004/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90466004/1279857</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f106b005dca1825a--

