Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1022C61DD6
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 09:58:14 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4513.1787997484829743714
 for <docs@lists.yoctoproject.org>;
 Sat, 29 Aug 2026 02:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SOXARQvg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fecbb7000so640267f8f.2
        for <docs@lists.yoctoproject.org>; Sat, 29 Aug 2026 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787997483; x=1788602283; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FoyJSgMWMSu5vJW8FxPk9dMVPJFcnqewuZyBdvA1DIY=;
        b=SOXARQvgyGMFm+mx7Arf/ocQLqN5Ds8rNyBqpvuItc16d2Nj1k6Au9/r6or38nXoJQ
         nFYF/CfLKpqVJqZapEFq+GVjbHYYEBUInszGsIM27U8Zp8STUXgGbRLnAmg/Dx8i4mQ4
         XXCG+nHk/sonND9fbazwEik/xvfFLkatGUpJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787997483; x=1788602283;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FoyJSgMWMSu5vJW8FxPk9dMVPJFcnqewuZyBdvA1DIY=;
        b=Gn4XX/cDVlke5I4Z0x2Wyg5Kwvocw07xniQQ78uBoaOTgkDp2cazoSNSMjRL3nnjg2
         WJzHy8baH2mORhwAD8J7AxlKvVyWNuYcRv7hI9b3oco40oe6jyjPONjQmgy7rF3SO/g2
         i7a9ejhF5ypYaYjCuNUppiB60m0K+UU+GSvZp3v8yZhyjfi70lAvuYACf5hx6HmieiXC
         OgW66TSlYWgmFjD1bwqvzvMBe2WGfNQ8VkaUq8r+C431UFYe2rcQP8cArNoiQ/buMryL
         Hw45DM0OdAOYBYQlSevM1sIMckbH4zVoOIkq79bwPyATtgr5tjes0gkMHOCJ2LEUbNGZ
         6fsg==
X-Gm-Message-State: AFuF++mQI7dWTdQYabHPx4Ns/jKdHf6+hgBcSoGPTCfZpm7HNloBN44k
	yFhWlaKf5YwpFmb/zQEI75q1oz7Qz1bd77cHWyjmdB8mgk4U0S+ofannlO4GaPrkT8w=
X-Gm-Gg: AYBFou04fNzfvK/woPCdO44gijz6KkZlMjQ2zx3GhOfuTnzTmoJQxWFQurUYIbY1S7i
	P70OEcrU6RLE47lvMWrgc0xLX8KYKjj1U1W1wcPD4uKumIBKDX5e+j+rjppwlgmSpSxr4wypy5o
	xAkCkwFHSBQCrd1oI49+dK5WAiPYjXkrOLyDEc9DYK3Vth+LPT5KP1ut9BODMCZvSqY6gb1aDWf
	oQd4EBkuefBWhUEZf1//KFkTMJdFLRIMNYKv79CIh/If21W6F/KZFoAxv/OZq8Yq5wXpAlCbRMZ
	CIqLtfnKuvIEEac3TCMtn1tgW5iSR6adP3JUfOTIci2Jl97aUsbCBuYvF/zsy5mgW/OXrYuLLfO
	/daiaO0uxs6NUzvJUJWfdfs4ah1gYfQ/YXBrYBzNtQkAtQRQysB87G/r+iY806kDXHJK6g9okHt
	xju7b6E8AEZhTspeTtxCtnNgGfawSiMpHACHQmxxEE5U0Uy3LmCW9t41r5iTG9MKeWnBGN7V3B2
	souwV/8dUS2WxaA8hRllotdNaXnQd32zsuTAP+V75mB/zEUdmEP
X-Received: by 2002:a05:6000:41d1:b0:482:f4f8:7a00 with SMTP id ffacd0b85a97d-482f79cf9fbmr22288874f8f.16.1787997482908;
        Sat, 29 Aug 2026 02:58:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d9f:3b8:a15a:494f? ([2001:8b0:aba:5f3c:8d9f:3b8:a15a:494f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb278f7sm11591359f8f.26.2026.08.29.02.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:58:02 -0700 (PDT)
Message-ID: <81f397e0bfb6373b29d8a6205ae926946f8c12e0.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2 1/4] lib: rename fetch2 as fetch; invert
 compat shim to make bb.fetch2 = bb.fetch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chris.laplante@agilent.com, bitbake-devel@lists.openembedded.org, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: docs@lists.yoctoproject.org
Date: Sat, 29 Aug 2026 10:58:01 +0100
In-Reply-To: <20260828162612.753815-1-chris.laplante@agilent.com>
References: <20260828162612.753815-1-chris.laplante@agilent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 29 Aug 2026 09:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10403

On Fri, 2026-08-28 at 12:26 -0400, Chris Laplante via lists.yoctoproject.or=
g wrote:
> From: Chris Laplante <chris.laplante@agilent.com>
>=20
> bb.fetch2 replaced bb.fetch back in 2012, and the compatibility shim of
> bb.fetch =3D bb.fetch2 has been in place ever since. There's no longer a
> good reason to keep the '2' suffix, so lets drop it.
>=20
> We also invert the bb.fetch =3D bb.fetch2 compatibility shim to now make
> bb.fetch2 =3D bb.fetch. We do this by creating a new lib/bb/fetch2.py.
>=20
> Layers are accustomed to accessing bb.fetch2 without first importing
> bb.fetch2, so we declare a module __getattr__
> (https://peps.python.org/pep-0562/) to keep this working.
>=20
> Finally, we add a deprecation warning for good measure.
>=20
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>

I confirmed this is still resulting in failures in oe-selftest, e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4744

I've not dug into why...

Cheers,

Richard

