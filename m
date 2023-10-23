Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEFFC004C0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 15:54:22 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.124374.1698076452553899619
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 08:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iKbWQSq3;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: bhstalel@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so5609220a12.0
        for <docs@lists.yoctoproject.org>; Mon, 23 Oct 2023 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698076450; x=1698681250; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DYPjAY8cCftg6tUiOwV4CK+RyeANwmcNPa/ZziZhKI0=;
        b=iKbWQSq3wTK5Xl/SxTGNZnEcmxi+ngrT/BlI700Um7/22Vjtvi9o/EwGYKNmgG8yDV
         GSLFVPikTaTbyzk7uNFGENdQtQwV6Rc56pJk7cpJjm7i/y6Uo3vn7Fif86ck0oG4y3WJ
         CYeYz4fraZJeAGIFgF74qXIjIC2rf7ACsBnrvXNQx+RxVrCAQthMFU791LMjAPUHgAjl
         Jcm8Pnr4Gf3CQW6voefcShDXkD/jt2GChK0oiedMGl3STkuNjSEa3iGnVLnVpgW5m+AD
         zcfSPyaZ2g9wzy+hX314g1rd5/khqfg+D/ARQjPtCBSKz9grP6Uqo8Hk78ggBFNCWkKz
         RPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698076450; x=1698681250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYPjAY8cCftg6tUiOwV4CK+RyeANwmcNPa/ZziZhKI0=;
        b=j1UvjnRnq+w7n8YqwQbE/9TRwGzG9cW4mWo+J0JZchaHVQzLKS8ayip9MbaF8+wG5b
         8SMZiw+x6DYBppWIaoTbL2cXF1rcBx/Ic8sTlA2Wegvkq7lrpcZDjX6v5dOlNVSairh8
         EOa57YsNIPTxqLrVphbHP6xwAXCEBWDhibgqjxdjmdROCJsrwkCr6KZWovM7snrf52Da
         1UMzYSb+EwnZAkm2Iub6RwMtoG7cfm856HcuJc6C/hzMHV9HcUCiegOUojIVEnSF0B6O
         McZEgcZR4ohyxvBep8n26XwcHGHnQ1jtL6OZoSvzOfg1TgXAqfYOCoBsbxeHbZk95n+5
         8ALA==
X-Gm-Message-State: AOJu0YxYzrtppj2PmMHK4jkb4UYovBN/LWe+aekdTkcRH2Wa7I2xQf5e
	lWrZek7cx/biBiuvpsLDQiUQyFK/x3tVyoqNyNg=
X-Google-Smtp-Source: AGHT+IFWHUR8BJEaViNIbqwaDqQMxCPR9IG5q2pXK9cv6yTIQJYbteys0PtqdUh7cDFDN2kn5q6kZhGWxyxq8wbQnHE=
X-Received: by 2002:a17:907:60d4:b0:9ad:ef31:6efc with SMTP id
 hv20-20020a17090760d400b009adef316efcmr8714188ejc.21.1698076450026; Mon, 23
 Oct 2023 08:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAOgG7m3Z8E9PvROHDV5qL8-WGJmY0f6NQgPrfxG8YXnVw6AfPA@mail.gmail.com>
 <CANNYZj8xYZWLnbxoHuBaGR0SDx98vbO26ob8qmsZ7eTRZgQA3g@mail.gmail.com>
In-Reply-To: <CANNYZj8xYZWLnbxoHuBaGR0SDx98vbO26ob8qmsZ7eTRZgQA3g@mail.gmail.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Mon, 23 Oct 2023 16:53:59 +0100
Message-ID: <CAOgG7m0w5z0TpntHnzEHwKngkwc3c9nvsnpmR0_zGR+K_Ng9-Q@mail.gmail.com>
Subject: Re: [docs] [Proposition] Workshop-like documentation
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: docs@lists.yoctoproject.org, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000009af93a0608643b66"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Oct 2023 15:54:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4456

--0000000000009af93a0608643b66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alexander,

Thanks for the suggestion.

I have the article "Things you should know about Recipe's working directory=
"

I think it can be added to "dev-manual" as "40. Understanding WORKDIR" or
"40. Recipe WORKDIR workshop"

What do you think?

Kind regards
Talel

On Mon, Oct 23, 2023 at 12:30=E2=80=AFPM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> Hello Talel,
>
> I really like the idea. Hand drawn diagrams are awesome! This could be
> on the doc website just under the 'Quick Build':
> https://docs.yoctoproject.org/index.html
>
> Alex
>
> On Fri, 20 Oct 2023 at 19:06, BELHADJ SALEM Talel <bhstalel@gmail.com>
> wrote:
> >
> > Hello Michael,
> >
> > I have a website for Yocto that I have some articles in there:
> https://yoctoleef.xyz/
> >
> > I am a Yocto trainer for long time now, and I love detailing everything=
,
> >
> > For instance check:
> https://yoctoleef.xyz/2023/07/27/details-you-should-know-about-the-recipe=
s-working-directory-part-ii/
> >
> > I would like to contribute something like:
> >
> > Practical Manual, or
> > Workshop Manual
> >
> > or something like that, the aim is to provide a learning process for
> newcomers.
> >
> > It is like putting a Yocto training path with workshops and examples to
> follow in order to master Yocto.
> >
> > It is like The Rust Programming Book idea.
> >
> > What do you think?
> >
> > Kind regards
> > Talel
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#4450):
> https://lists.yoctoproject.org/g/docs/message/4450
> > Mute This Topic: https://lists.yoctoproject.org/mt/102085617/1686489
> > Group Owner: docs+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000009af93a0608643b66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Alexander,<div><br></div><div>Thanks=C2=A0for t=
he suggestion.</div><div><br></div><div>I have the article &quot;Things you=
 should know about Recipe&#39;s working directory&quot;</div><div><br></div=
><div>I think it can be added to &quot;dev-manual&quot; as &quot;40. Unders=
tanding WORKDIR&quot; or &quot;40. Recipe WORKDIR workshop&quot;</div><div>=
<br></div><div>What do you think?</div><div><br></div><div>Kind regards</di=
v><div>Talel</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Mon, Oct 23, 2023 at 12:30=E2=80=AFPM Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello=
 Talel,<br>
<br>
I really like the idea. Hand drawn diagrams are awesome! This could be<br>
on the doc website just under the &#39;Quick Build&#39;:<br>
<a href=3D"https://docs.yoctoproject.org/index.html" rel=3D"noreferrer" tar=
get=3D"_blank">https://docs.yoctoproject.org/index.html</a><br>
<br>
Alex<br>
<br>
On Fri, 20 Oct 2023 at 19:06, BELHADJ SALEM Talel &lt;<a href=3D"mailto:bhs=
talel@gmail.com" target=3D"_blank">bhstalel@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Michael,<br>
&gt;<br>
&gt; I have a website for Yocto that I have some articles in there: <a href=
=3D"https://yoctoleef.xyz/" rel=3D"noreferrer" target=3D"_blank">https://yo=
ctoleef.xyz/</a><br>
&gt;<br>
&gt; I am a Yocto trainer for long time now, and I love detailing everythin=
g,<br>
&gt;<br>
&gt; For instance check: <a href=3D"https://yoctoleef.xyz/2023/07/27/detail=
s-you-should-know-about-the-recipes-working-directory-part-ii/" rel=3D"nore=
ferrer" target=3D"_blank">https://yoctoleef.xyz/2023/07/27/details-you-shou=
ld-know-about-the-recipes-working-directory-part-ii/</a><br>
&gt;<br>
&gt; I would like to contribute something like:<br>
&gt;<br>
&gt; Practical Manual, or<br>
&gt; Workshop Manual<br>
&gt;<br>
&gt; or something like that, the aim is to provide a learning process for n=
ewcomers.<br>
&gt;<br>
&gt; It is like putting a Yocto training path with workshops and examples t=
o follow in order to master Yocto.<br>
&gt;<br>
&gt; It is like The Rust Programming Book idea.<br>
&gt;<br>
&gt; What do you think?<br>
&gt;<br>
&gt; Kind regards<br>
&gt; Talel<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#4450): <a href=3D"https://lists.yoctoproject.org/g=
/docs/message/4450" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/docs/message/4450</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10208561=
7/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/102085617/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" ta=
rget=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" r=
el=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/u=
nsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000009af93a0608643b66--

