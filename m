Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3063CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 12:33:22 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16512.1762259594356062564
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Nov 2025 04:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cI67SgkE;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8801e4da400so62415986d6.3
        for <docs@lists.yoctoproject.org>; Tue, 04 Nov 2025 04:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762259593; x=1762864393; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rgp/NiPpQjCKcZAb+fr4vvT/V8U5yBlKHMDB/166zMg=;
        b=cI67SgkEogFRSbsJP3Rr1CpF0dh/bvdXewlxZUK6HQN88qPLV7Vr8nMML/7D+C+Wj/
         0aSKAFbVEgvn3F047zPWtzcjlhCXB/oGHysy71Xu6rvaxu2q7Zfdi9tnokk/ZFvJWx1+
         EN+UNq7vAikpzytYPFYUPXqPnCiYeUuk6jxGBN/6YqVWWzqGJllnUD+SaEmoYW5DcYya
         /lOe5XwHpFU+rEJtZgg8mAfqwdOUzMnV/xlS/qE1cwy/KDS0Yj37aBm8i4XDo+NPRhLK
         fjloAI3zCVsg/xMg3qZMxyjSKbROexi09b6UJqsFWlN9jm3Vmn94vxvRD421QpAmU3Nq
         3nTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762259593; x=1762864393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgp/NiPpQjCKcZAb+fr4vvT/V8U5yBlKHMDB/166zMg=;
        b=qgZzkK3G8n3Oixcdj5x3pQtZ6VOv6dz2ygjSaJ2DmPL/LILz9gaKxMCtqdRPnO4W8/
         Q5dF26HU5ajUi6tf/PjFSy24wLv862IzFg+pG/4OoJdHgysFrw8sERwUWaFbfEiU6oU6
         C1xHBObtj+cwGIVZI+P1IPwhs6xD/VO3dTOGWBe/Dofsv8dz6Z9dtBRLu6ZmCon8dFgT
         paMGngwEaJsZVoMcoX6ex0KDoH8oAAxpE3m8aZiOQe1BXwLKVEAFEnmYesELJZL/2Lzf
         8posUnxLZxZ1MKrcUgpOZ/notQ9YxKRUtAw1oxu1UkAUCDh7E/DJnTu6NHsQXAlpN/dU
         Jm3g==
X-Gm-Message-State: AOJu0YxsFkCZu/ePjLDUAG92gd6OxHR/AYEW6lOVg7sM+2fFZaX60c6W
	AN/4Ggh3mitn7oR8hDIlUa5EE2ITMbuUsXk0CXBn1ELe/yQt7hObg3oElwrFzQMxmwgH4ATISyl
	oYkzqxUsg49nt+N/BFvBlafBSaNljP1o=
X-Gm-Gg: ASbGncvNeWWCtin0PKJ+NzINg2+Jt92iNEhMabaUartRUiB8oVBhG17CQejP778kQdQ
	L69F3/UqoXfaVs5u9+E4EX52GndXYzpQeRnC2LsiKBSoH20rQDBE/eLLLD79tkaiy0t/KqJY4iv
	pYPvLlLzY/rzcCHn9sWvIidnCc5mdjlS0szXjWkxF0aIAfJrIMeGlhyFSjtMvxmTSnHPdZKG1Rd
	006OQhcau7haZDKlPcAJU39FJBFeZpBhS2hDXKOP/bn6dLFxSQQrybVAxiIlw3GHDfiwGGyhGtg
	y1ACIyBp4FW/qaYUccs=
X-Google-Smtp-Source: AGHT+IGpDwDkMkpjsEOXhqvODf70A8iqEsvllEuy9VsBELak/qThfS8g3ZXP2slltIlI2ARovt82OOQOew+6MyCp4Hg=
X-Received: by 2002:ad4:5f0c:0:b0:81c:6455:ec77 with SMTP id
 6a1803df08f44-8802f46f986mr206732856d6.40.1762259593313; Tue, 04 Nov 2025
 04:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
 <20251030-bitbake-setup-v1-4-f44a8a2b7c0b@bootlin.com> <CANNYZj8=Fvwcqf+Mei7DoH1egppRtdmTb7S6EcnpESMh3+z+EQ@mail.gmail.com>
 <DDZ6TLNMLGVM.3FH9I5FYI9QHT@bootlin.com>
In-Reply-To: <DDZ6TLNMLGVM.3FH9I5FYI9QHT@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Nov 2025 13:33:01 +0100
X-Gm-Features: AWmQ_blkvZQJLU55DWE8h3_USzpLMuT08yV096PQtsuCIUtO4aTNlq7j1PsWkec
Message-ID: <CANNYZj9zuz8R7fWN+LTdJbtcHL+b27ay9r18n1osRFQrSo33kg@mail.gmail.com>
Subject: Re: [docs] [PATCH 4/6] brief-yoctoprojectqs: switch to bitbake-setup
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Nov 2025 12:33:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7984

On Mon, 3 Nov 2025 at 17:07, Antonin Godard <antonin.godard@bootlin.com> wrote:
> > That is assuming the user has selected 'nodistro' which does not
> > include meta-yocto. If they selected poky, then we need another layer
> > as an example, probably meta-raspberrypi?
>
> The issue with this is that there is a lag between when a Yocto release comes
> out, and when the BSP layer is ready for it. So there is a timespan where the
> docs will not work. With meta-yocto-bsp, we're sure that this example will
> always work.
>
> On the other hand, having an external layer here would be an opportunity to shed
> some light on `bitbake-layers layerindex-fetch --branch scarthgap --fetchdir
> ../layers/ meta-raspberrypi`. So I'm a bit torn on this but I think I prefer
> going with meta-yocto-bsp.
>
> What do you think?

I still think there should be a useful and well-supported 3rd party
community layer here that enables common and cheap hardware, and not
something contrived like meta-yocto-bsp.

meta-raspberrypi fits the bill perfectly, and has little-to-no lag
(e.g. whinlatter compatibility was added already 4 months ago), but
there should perhaps still be a caution note about it.

Alex

