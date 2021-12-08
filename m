Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849ACC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:08:32 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.3231.1639001311226107994
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 14:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=d8uyJ/EM;
 spf=pass (domain: linaro.org, ip: 209.85.208.45,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f45.google.com with SMTP id r25so13151715edq.7
        for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 14:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1aqLGn9ZQxBf1z5rYNrGj34kzBjlfbRmglUFHoRGdDY=;
        b=d8uyJ/EMtnoQ38jteUX48iY3EA4rU82aEkwiPdRWomBUY/eQP15YQSli4KUh8a8P00
         I1tPjGI4hUBIywYHh5N2ii8QgXAst7vo/asg1AIQOmu36w8ee/Vphl0XDHFlVxY8cPB4
         StpOaMyrievxOmacpg1U5F6LTd2BG/gw0pumKi1nOirHllxVO0KNiiGonEu8HFsXTRZu
         f00S16gEUcfWYXR+DlbX53AYm9mu2iVBVlxh8mRKUtMA52ru/Y4St2q/ZsgWzS661d6n
         yqCXlXuKV3leAAPYkBoh1cy83Umja1PRLWDIPwIVduFJToma+oA0V17V+RQ+XB4hbpzp
         8Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1aqLGn9ZQxBf1z5rYNrGj34kzBjlfbRmglUFHoRGdDY=;
        b=fAUVg/py36C+9Cv0jQIdyRkJprUVt/5VJxxNTllEIZbWKEKJvu+u+JYi+7YjgvvE2/
         pmRcGWdmOf+/HvtfPNi+BPZC3D/W+VjigOlCjhFEOwet6i31n8x6cYN1qso7M1XXgPHB
         DzQJky+kJkxSDLgJrmzFaKqhpTEVAhLQe9e57257FjDQ1THeuCThEEs4RE/jjZLSX4mE
         nPu8bbtn/Kp95gxAOPKxTlKBwVroLhd3OLe8T1E+0x9sUjUEBh3nl/XNKKICgTuaxEmg
         7ZrxV80AQvCegOzdIGNzYTtrXcAWVlVH76L28fElsJcO2/lfKoro/iErdqQCU6dti0UB
         CDSg==
X-Gm-Message-State: AOAM531nJzjRmRlIHNESgBxEEMeU27FMls8booeWXXSIa6ZBWnP6fHo0
	uUlLBbm3PK8aoOTc6y8FIhU4NYwIIihFxis1pC92WQ==
X-Google-Smtp-Source: 
 ABdhPJz7pkoJeHs/OCLoPsyVMRqf8MVCkRV7IqAAH7lPj5OKNGPki3zb/6dPhTZ0pbkv5GNcWdbahM41RAwXhZRx78o=
X-Received: by 2002:a17:907:7f8b:: with SMTP id
 qk11mr9919219ejc.204.1639001309340;
 Wed, 08 Dec 2021 14:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20211201135949.193842-1-michael.opdenacker@bootlin.com>
 <20211203093452.sk3e6ksnwmsbnjn2@fedora>
 <CAP71WjwoVHYOvLSKkW+fSSO2T5MupA-vEt1_cDfwdMjy8ZhP0g@mail.gmail.com>
 <20211203100259.54n7h7ghlqfr5tia@fedora>
 <CAP71Wjxp04oP_YXX-em4OhRAvbjztATUEy9fozZ4+ves7NvVTw@mail.gmail.com>
 <20211203105151.3hez2atqxq3ye63h@fedora>
 <56b2a1f4-9a8e-11a7-1ced-b9cbba5eda53@bootlin.com>
In-Reply-To: <56b2a1f4-9a8e-11a7-1ced-b9cbba5eda53@bootlin.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 8 Dec 2021 23:08:18 +0100
Message-ID: 
 <CAP71WjxH8CObAABCQTdQN7YYUSww+w=a1BsF5hYCzVABLgH2Sg@mail.gmail.com>
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 stop using the "transition" branch
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d47a1805d2a9ba6c"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 22:08:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2237

--000000000000d47a1805d2a9ba6c
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 8, 2021 at 10:57 PM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Quentin, Nico,
>
> On 12/3/21 11:51 AM, Quentin Schulz wrote:
> >
> > I think all our issues always come down to this weird and inefficient
> > organization we have for docs and common files between doc releases.
> > We'll need to settle on something one day because I don't think what
> > we're doing today is working :/
>
>
> Thanks for your reviews. Good to know that the "transition" branch is
> still in use in spite of what I wrongly believed.
> It indeed, it's a good idea to see what other projects are doing. Maybe
> what we are doing is unnecessarily complicated.
>
> Look at Python docs (https://docs.python.org/) for example. They have a
> switcher as we do, and also a left bar the latest versions and a
> separate page for all versions. However, such versions are only shown on
> the top page. When you enter one of the documents though for a given
> version, the left bar is used for navigation between sections instead,
> and you no longer have references to other versions.
>

docs.pythong.org is where we stole the idea of the switcher ;-)
Would anyone be able to figure out if their 'publishing' script is
available anywhere? if we could mimic that somehow that might be good.


>
> Let's keep thinking about this, to find an easier to manage solution.
> Thanks again
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000d47a1805d2a9ba6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 8, 2021 at 10:57 PM Micha=
el Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael=
.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Quentin, Nico,<br>
<br>
On 12/3/21 11:51 AM, Quentin Schulz wrote:<br>
&gt;<br>
&gt; I think all our issues always come down to this weird and inefficient<=
br>
&gt; organization we have for docs and common files between doc releases.<b=
r>
&gt; We&#39;ll need to settle on something one day because I don&#39;t thin=
k what<br>
&gt; we&#39;re doing today is working :/<br>
<br>
<br>
Thanks for your reviews. Good to know that the &quot;transition&quot; branc=
h is<br>
still in use in spite of what I wrongly believed.<br>
It indeed, it&#39;s a good idea to see what other projects are doing. Maybe=
<br>
what we are doing is unnecessarily complicated.<br>
<br>
Look at Python docs (<a href=3D"https://docs.python.org/" rel=3D"noreferrer=
" target=3D"_blank">https://docs.python.org/</a>) for example. They have a<=
br>
switcher as we do, and also a left bar the latest versions and a<br>
separate page for all versions. However, such versions are only shown on<br=
>
the top page. When you enter one of the documents though for a given<br>
version, the left bar is used for navigation between sections instead,<br>
and you no longer have references to other versions.<br></blockquote><div><=
br></div><div><a href=3D"http://docs.pythong.org">docs.pythong.org</a> is w=
here we stole the idea of the switcher ;-)=C2=A0</div><div>Would anyone be =
able to figure out if their &#39;publishing&#39; script is available anywhe=
re? if we could mimic that somehow that might be good.=C2=A0</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Let&#39;s keep thinking about this, to find an easier to manage solution.<b=
r>
Thanks again<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000d47a1805d2a9ba6c--

