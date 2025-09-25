Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B3ACAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:55:41 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.13712.1758812137078695916
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 07:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnqwW0/x;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bhstalel@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4b78f4aa547so1942131cf.3
        for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 07:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758812136; x=1759416936; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HTwZxMX9ts4jPoi1ZV5sEpsXiiB8j1pAsom/mibn0yo=;
        b=UnqwW0/xgkNrJWccgbKVNb0Rm8W84/0tYUKiNtNJqatmgMaQa2iE53OG0ABxo2W0XO
         79GBIFuLYyYC6HT8QZdYuRHoeL/GKRRFsuDglHWpzAIR4a3tEri/xn/RkqX3EKXoo3D6
         IoJ03LApldJGaKjLE8kulKbNSbOaigoho9mC0PcCCseETFwx9R9oUE92vYmKT0LKvK/V
         NMukb2fV9heJWPgSg7319t3exbKVEU1Pj50aorj+kgZLqL/iiE+6fMCSI1gwiNDsMrUa
         hsVCCvEUq/Gy4M3F9leeUdtpBjJTUNB4bWHI4+ZY30ksZGQf8XtBYCc5PgWHLYOto6sZ
         ukqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758812136; x=1759416936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTwZxMX9ts4jPoi1ZV5sEpsXiiB8j1pAsom/mibn0yo=;
        b=F2ywRRmGbms6MwfDmPZuYvlNYvoYBXfYRAIu77M0DRyhkB+M9wzZGTVGL0mBnZDFm2
         tCwMP5dFPLNJVH34SaLvTjLF/0sOrubwiILwvi/HE41T4fSZBdDE2SOBIgHzJJ0qYcpD
         ty0nZl6HRE2NBmFJkXmOAD2CGdAZOguUOQOT3dgJ/6N09tLfl0TZFkkt5QC9DXFWGodo
         G6eFkMlMLeJjEMyYdMaCFXRigRYJYM+/5vfxpBqepYYmUvGLeFN0LzzrrAddcfudQMI+
         CTiwVo+cU+px4ClaD6MGtmzP/F9VCfU9UqF1FtThdMTM8JR9eSaA9Qi3zemcDp8YOQpn
         yXeQ==
X-Gm-Message-State: AOJu0Yw7QXmVksCjLiZULG+QT9Z4y30UivwJ8wqkLsJfuc0WhhRNAWQc
	QsOvvW3ki2OL1Euc1LzYqCR4MALpI1eer4ihUKGyWJ0lLHxYVZ4iGfQiBnm5uQ4cKkmDcLW4oWp
	9oy+2K6KxYrIDJPZV6MJZabEfbrUu/YT3FZQy
X-Gm-Gg: ASbGncsZLg4idk9ytDpdFXfXsWSJJ+voEBFPnplz0tNqQhL3b/8buMbbzg4CZKoQO+O
	PhmmtzSJOWDzTu2cmtel/bNRINkx7BsiEmgIMsNIcDAWEHUWxRUp/hYcX1v9avZMAAiedR8brlb
	XJBnrXIoYF0k992tD5id23cSITWO7u5Gbu3EvYmBHfXLvmEefHf2FIukxhcthnBGv7a9PRA6ToI
	jvRTpQ=
X-Google-Smtp-Source: AGHT+IG+dulIsWvobcb3BXiKij6irHhlq70lkLCgpMZDb563y7OR1s8FOSfn3v9S/kvcpdCXhNO+4qMMlITPPp6efn0=
X-Received: by 2002:a05:622a:606:b0:4c4:6b67:ccec with SMTP id
 d75a77b69052e-4da488a0571mr33636611cf.4.1758812135671; Thu, 25 Sep 2025
 07:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250921164306.53501-1-bhstalel@gmail.com> <20250921164306.53501-2-bhstalel@gmail.com>
 <DCZEHNS2J0WG.2PV5B9HWKUBSV@bootlin.com> <1867ACF8FB1FE7F2.23261@lists.yoctoproject.org>
 <CAOgG7m0qPUsyWcDmvfTggN7_=cKfmOKQtQ_A7OMCFDtjSd6wXw@mail.gmail.com> <DD0BBH0D637J.242PE62ZN7FPV@bootlin.com>
In-Reply-To: <DD0BBH0D637J.242PE62ZN7FPV@bootlin.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Thu, 25 Sep 2025 15:55:24 +0100
X-Gm-Features: AS18NWCQBX_ZVeAQuTrAfoDVbcvy_bwZwHiNt3l_Yy9fUhVgNayEqwLHNnc-UeE
Message-ID: <CAOgG7m3mi37XpX9QCn11TxfvP9hLsswuoLLy-X3_uzDGJn73RQ@mail.gmail.com>
Subject: Re: [docs][PATCH 1/2] ref-manual/classes.rst: add details about
 actions done by base.bbclass
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000092d00a063fa15cdd"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 14:55:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7601

--00000000000092d00a063fa15cdd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Antonin

I fixed fonts and size of the diagram, regarding the colors palette, I am
not sure how to do that in draw.io
but I kept things simple and used only black, grey and white.
I am sending a v2

On Tue, Sep 23, 2025 at 5:15=E2=80=AFPM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> On Mon Sep 22, 2025 at 8:12 PM CEST, Talel BELHADJ SALEM wrote:
> > I will wait for your review on the 2/2 patch before submitting v2.
> >
> > Kind Regards
> > Talel
>
> Feel free to send the first one separately. It's not strictly related to
> the
> second one if I understood correctly.
>
> Reviewing the diagram will take a bit more time.
>
> One remark I just had is that we would need to stick with the Yocto Proje=
ct
> color scheme, fonts, etc. See:
>
> https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n=
173
>
> Thanks,
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000092d00a063fa15cdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Antonin<div><br></div><div>I fixed fonts and size of=
 the diagram, regarding the colors palette, I am not sure how to do that in=
 <a href=3D"http://draw.io">draw.io</a></div><div>but I kept things simple =
and used only black, grey and white.</div><div>I am sending a v2</div></div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Sep 23, 2025 at 5:15=E2=80=AFPM Antonin Godard &lt=
;<a href=3D"mailto:antonin.godard@bootlin.com">antonin.godard@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Mon Sep 22, 2025 at 8:12 PM CEST, Talel BELHADJ SALEM wrote:<br>
&gt; I will wait for your review on the 2/2 patch before submitting v2.<br>
&gt;<br>
&gt; Kind Regards<br>
&gt; Talel<br>
<br>
Feel free to send the first one separately. It&#39;s not strictly related t=
o the<br>
second one if I understood correctly.<br>
<br>
Reviewing the diagram will take a bit more time.<br>
<br>
One remark I just had is that we would need to stick with the Yocto Project=
<br>
color scheme, fonts, etc. See:<br>
<a href=3D"https://git.yoctoproject.org/yocto-docs/tree/documentation/stand=
ards.md#n173" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject=
.org/yocto-docs/tree/documentation/standards.md#n173</a><br>
<br>
Thanks,<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--00000000000092d00a063fa15cdd--

