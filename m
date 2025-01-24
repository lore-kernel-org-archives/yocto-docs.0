Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3D1C0218C
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:41:34 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.17006.1737736892696858114
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 08:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GSTJ7zkK;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30229d5b229so21988271fa.0;
        Fri, 24 Jan 2025 08:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737736891; x=1738341691; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiPATP6ajRxANi8qt7aYpWK9Bltil3FZVzjwRGzeZQ0=;
        b=GSTJ7zkKA2ElU80AGyr2g2x6bZAQkE2/wowvZQRi7LLUeyEtwDWgkdm23AavjilvpZ
         WLEg/UI1G+Gl8/pMZdqslrlh/++XkQ7E1xYiX/GA6P1KlmqoZq1vXSZQJs5GYjEfBcTw
         VbMgRoRMjxSyF7WTiYpEMyGhEkaHnMHl32JbMKkj3EDbMO/oOyuEjEbMUPZ3OxiEkxnI
         B6P3Jowg08Y0H78yewWBHXrQoSL9hfc0cARqX9A/MhIfXPSmqDKGpmxO3jkRIs0prrof
         e6Wv8z5grugCYxCukyWjmb9YMOTNjgBeZk6huZio5WbsNzykoLpAxJ7oSViSRlUWQKRK
         2grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737736891; x=1738341691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiPATP6ajRxANi8qt7aYpWK9Bltil3FZVzjwRGzeZQ0=;
        b=nPmQByOLPVVU+x/dvPvISAY97brq+MCm3M5bRBfyvGF45XXs+e/w9VkZOtzD5CsBwI
         JZWGe9TB4ahq4BHP0ZK7V4u8G1WQHEkcxwBCCuy0CvWxY2ockKDTSPW6YLwrVgCdYCKd
         231qXdn5Q1DTdrAjZ+zq8x53OJK6fZny387Iy7kok8hyD9AhGUA6ro6MFtRp38SvoBL3
         wXK32aQox4/6Nj6CYHAJTIT2bptKTdHp9FXxQpOHg71dx9Zj7SAZDiOVNGAgTHKLQu4b
         IHkkZt+tYz5pzoNfufVLnrYSOFVJTHkjMzCFlsWhU/YKxsU/8hqdo+5eYjllXcgSUwoX
         8A2A==
X-Forwarded-Encrypted: i=1; AJvYcCW7+SruN7NC9pAY6dx8wF5wEjdMwJT7Doy4Mon2LN31+PLuGllA9yn//rwaFqPlh2/LnXc=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwC2Ql6/s/tNZnmWpJYy+URXvlaQ4qjF0zunhsF67LSp1zIM52f
	ehzT2retPJoianxMhuThx5PWiDupyQgJWm3nD+IVVzOqKf9rMyNHim0zwQUF4dPGU6kBhoMZ6qY
	XvqdjfTR0G+xexkFjxKbS3t42SD8=
X-Gm-Gg: ASbGnctr2m4zurWIOq/64f78F4p0QHKFQCOF5zijFxNPgXLpnpnRkqnn6MbCynUM7Iz
	CdzUwt1JRC9/ITMUTSXWqNUNoW6oWUX3V6HPQ4nghhY2TFmAWR3umghSNFGREWodbiL8UKEMJTu
	NU
X-Google-Smtp-Source: AGHT+IHT3yM60/71q5D5bZ4wNYPNdgRTBf+mHBByW8KKp65iW6N0KYao6eiUDSkB9rs0uBkT/3XXf9w1qiD42Mj/jvw=
X-Received: by 2002:ac2:5dce:0:b0:542:6d01:f54d with SMTP id
 2adb3069b0e04-5439c21f2cbmr10091366e87.3.1737736890534; Fri, 24 Jan 2025
 08:41:30 -0800 (PST)
MIME-Version: 1.0
References: <4d28594d59069ca0dc8c6a04db71b934acb572fa.camel@linuxfoundation.org>
In-Reply-To: <4d28594d59069ca0dc8c6a04db71b934acb572fa.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 24 Jan 2025 09:41:17 -0700
X-Gm-Features: AWEUYZk4VY-bnCIhSAUiNDk2Y4MoFU6k2qxIA5jy9zAy28UxeSzoJoBdE9x0Cfw
Message-ID: <CAJdd5GYsibHPTNMittYAT71B0XUY3ndMJeJiVuXo42Fnxo1XbA@mail.gmail.com>
Subject: Re: [docs] New FAQ entry
To: richard.purdie@linuxfoundation.org
Cc: docs <docs@lists.yoctoproject.org>, Yocto TSC <tsc@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jan 2025 16:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6171

LGTM

On Fri, Jan 24, 2025 at 5:02=E2=80=AFAM Richard Purdie via
lists.yoctoproject.org
<richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:
>
> Hi,
>
> Since I keep getting asked this and I'm weary of repeating msyelf, I
> have a new FAQ entry, probably a slightly controversial one.
>
> """
> Q: Why isn't systemd the default init system for OpenEmbedded/Yocto
> Project or in Poky?
>
> A: systemd is a desktop Linux init system with a specific focus that
> isn't entirely aligned with a customisable 'embedded' build
> system/environment.
>
> It understandably mandates certain layouts and configurations which may
> or may not align with what the objectives and direction OE/YP want to
> take. It doesn't support all of our targets, for example musl support
> in systemd is problematic.
>
> If it were our default, we would have to align with all their choices
> and this doesn't make sense. It is therefore a configuration option and
> available to anyone where the design goals align but we're clear it
> isn't the only way to handle init.
>
> It is included in our automated testing through poky-altcfg and we
> don't really need it to be the default, it is tested, it works, people
> can choose to use it, it works fine.
> """
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6169): https://lists.yoctoproject.org/g/docs/message/=
6169
> Mute This Topic: https://lists.yoctoproject.org/mt/110788689/3616693
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [JPEWhacker@gmai=
l.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

