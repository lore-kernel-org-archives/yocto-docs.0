Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7F0C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:01:03 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web12.18415.1636736462645812102
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 09:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e8CfAs8t;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id t13so20135549uad.9
        for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 09:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fqxRFtPwecoOcA7wot28sbbfW7nZGw7xxhUKjK9/fco=;
        b=e8CfAs8t7JxjPIKxe4XB+yfhcs5UNE4fjdWTr6ClqO3b2wfFe9UKLMeImhxA4ZqosT
         7A9+tEVzYPrP8gfY4roRZIBXRQ24CbishS0UPOIqjSf6F40x6DRY6FdhOLHQHwdAB8qe
         x5sIQW0p/wfoTI6JUg9aA9GdmZVeOATpWxv6UDjuUsSDrP4gMji7YWxSRdh9N0E65RYs
         ERN9alUfVbBqzhypkooaE8BgXmhYh3iNWuKRH2aDsYPKpo6t4IjGDfVmCWKSx0q7HGqS
         0m80ug3xMYNpsOejYlDcSvBgctEGMDabtzKVzIuR3NriyH66ewPH9KevVZosk1xcwTTz
         cq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fqxRFtPwecoOcA7wot28sbbfW7nZGw7xxhUKjK9/fco=;
        b=zB7Ds7Wp2NJgJX9R+npaXh4akQPDQCb21Tc9EI9ekvwhFZYIIgPZMusy/vcmPEwLGE
         ew/Sd+lqnnWbnrpF7E+zcNz1mGoqdFVHwAMdmluwiyerN5pygzWveZvXnuSVckcfhwtr
         9xOdeZwF4iycqoJF5eBqWgcvT/1cKbjeiniGCbs6zcdtgm81bcccfO8+abmDctXt9Sgi
         cn/qVbmV2Vr4mSpn+GsY8U8GXTtftu8p66TWj2Dh8gGyiLY1uX9+BMrLGTCcYObKVOc0
         gzDkRF9YMbLFLOIzHsfgTLdL3D3bnDwX64/CRKuh0cTtuSMJK7UBmX4R3Z7B6U8zf0+w
         HqXA==
X-Gm-Message-State: AOAM53031HXhy1jXDUqGLrh7oNQthaBluhJ8NqAHyKjDWkpfYJomzAvV
	Foq9URrm7bDEg59ThKqVyQCaeC3CjQwHP7fNSwU39zB7zzQ=
X-Google-Smtp-Source: 
 ABdhPJz+P4SPnqmenIyTwDzXPunbgSd6tr7oY4nW1NIrzD/e19qNrDx/1inQp0HzBHC6cGfjCHTUAxKAuuzzf7grpbo=
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr24174640uaj.89.1636736461589;
 Fri, 12 Nov 2021 09:01:01 -0800 (PST)
MIME-Version: 1.0
References: <84ac62a4-4e20-5453-47eb-994be2e11511@bootlin.com>
 <8f1064b166e71dc88c99f702041a8f611929b9b5.camel@linuxfoundation.org>
In-Reply-To: 
 <8f1064b166e71dc88c99f702041a8f611929b9b5.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Nov 2021 18:00:50 +0100
Message-ID: 
 <CANNYZj-L4jFf_4v2rV0tMkRpr-2_4ZrQzMyPXvU9BkYu_MRXeg@mail.gmail.com>
Subject: Re: [docs] Why "git send-email -M -1" in our contributing
 instructions?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000062525305d09a67ee"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 17:01:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2143

--00000000000062525305d09a67ee
Content-Type: text/plain; charset="UTF-8"

There's no confusion. 'format-patch' writes a patch to disk, send-email
formats a patch in the same way with the same options and sends it over
email. We want rename detection in both.

Alex

On Fri, 12 Nov 2021 at 17:58, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-11-12 at 17:55 +0100, Michael Opdenacker wrote:
> > Hi,
> >
> > I've just sent a patch to the bitbake-devel and docs mailing lists using
> > "git send-email -M -1", strictly following the contribution instructions.
> >
> > However, my e-mail got sent twice. What's this "-M -1" option? I can't
> > find it in the manual of "git send-email", and I had done without it so
> far.
> >
> > I wonder if we could remove it from our guidelines for sending patches
> > with "git send-email"...
>
> It is possible it was confused with git format-patch which we definitely
> want -M
> for? I agree we can probably drop it.
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2142):
> https://lists.yoctoproject.org/g/docs/message/2142
> Mute This Topic: https://lists.yoctoproject.org/mt/87010850/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000062525305d09a67ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There&#39;s no confusion. &#39;format-patch&#39; writ=
es a patch to disk, send-email formats a patch in the same way with the sam=
e options and sends it over email. We want rename detection in both.<br></d=
iv><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, 12 Nov 2021 at 17:58, Richard =
Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Fri, 2021-11-12 at 17:55 +0100, Michael Opdenack=
er wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I&#39;ve just sent a patch to the bitbake-devel and docs mailing lists=
 using<br>
&gt; &quot;git send-email -M -1&quot;, strictly following the contribution =
instructions.<br>
&gt; <br>
&gt; However, my e-mail got sent twice. What&#39;s this &quot;-M -1&quot; o=
ption? I can&#39;t<br>
&gt; find it in the manual of &quot;git send-email&quot;, and I had done wi=
thout it so far.<br>
&gt; <br>
&gt; I wonder if we could remove it from our guidelines for sending patches=
<br>
&gt; with &quot;git send-email&quot;...<br>
<br>
It is possible it was confused with git format-patch which we definitely wa=
nt -M<br>
for? I agree we can probably drop it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2142): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2142" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2142</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87010850/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87010850/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000062525305d09a67ee--

