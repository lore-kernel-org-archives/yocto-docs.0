Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A60C4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 12:39:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.12502.1705408746671933350
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jan 2024 04:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PGQSCn+5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40b5155e154so119301655e9.3
        for <docs@lists.yoctoproject.org>; Tue, 16 Jan 2024 04:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705408745; x=1706013545; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LE6I1WhgPqtgTK7XTVRjHbuVqJZcAZX9/OKtWKT6XI=;
        b=PGQSCn+520SprkbsQ/+1SPsRPVdDiAGaYurdr/lYGbqrS2CwrZ+uYfvMEV8EohQXsl
         HlFCxTs0mfi7kgNUQ4ihHYoUCU8xTwISz5ugTPwkMxr0fA094DljslgpRBT+5327d0xe
         wgTlfRFIQrGHdFa5i4N7hkyCgA6tlE1j3SvSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705408745; x=1706013545;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1LE6I1WhgPqtgTK7XTVRjHbuVqJZcAZX9/OKtWKT6XI=;
        b=jhEXaDSHGQYGpUajNWERI3hCWcmoE3wDEHYPcrpEchn/3Cqosm2EWw9xbjkOnNKcBf
         08etOp/zS922E3ELiVRLihgX1RDhlJxJwi5c/L8qWi1hjTStNRdUcV6Mn5/oC+WKHm+f
         WMBFJTFgfgxDOTX5cbfInAjy+TciI9p9FX3vCCmzBnDpLdGHHTVmBGnHAS0V00zuDCj5
         WzNQFFWwLPU07xgLrdbEB2iFMVVunLzUk9DAXx2aSc9TesvFr6BcPaIyKrTlrYqZeKue
         X05MWNbciE8Qn6RdJLzFQeYFB4NhT4j/dZRCprr/OQQcGuo0f8R/AZyydIgDd/5+KYiQ
         Fi8A==
X-Gm-Message-State: AOJu0Yw8u13O4e1vpxiQPmIRjdqbpRLstMZw4grBeVChZ2BRCHI83KJA
	zfiUsJDhzuUDCx4oQjDYksWBADjmb2YyGMIN4FXCozNk5gk=
X-Google-Smtp-Source: AGHT+IEimWQrGwyhm9eTjXzWv66qkxz0ZGbmJG5dkCSVENJcjH6BnGpXiH3bCVBn5ZZj0xEAkHUvow==
X-Received: by 2002:a05:600c:4708:b0:40c:3555:e230 with SMTP id v8-20020a05600c470800b0040c3555e230mr3701978wmo.46.1705408745082;
        Tue, 16 Jan 2024 04:39:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:717c:d951:6325:d768? ([2001:8b0:aba:5f3c:717c:d951:6325:d768])
        by smtp.gmail.com with ESMTPSA id jg1-20020a05600ca00100b0040d4e1393dcsm22821696wmb.20.2024.01.16.04.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 04:39:04 -0800 (PST)
Message-ID: <1ac7131af5e1f57c2348455fc2a52847d41b2683.camel@linuxfoundation.org>
Subject: Re: [docs] question about EXPORT_FUNCTIONS from bitbake user manual
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Tue, 16 Jan 2024 12:39:04 +0000
In-Reply-To: <c2e177fb-6447-98f-fd51-8017ea87294a@crashcourse.ca>
References: <c2e177fb-6447-98f-fd51-8017ea87294a@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jan 2024 12:39:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4784

On Tue, 2024-01-16 at 07:11 -0500, Robert P. J. Day wrote:
>   hoping that bitbake doc questions have been subsumed under the YP
> docs mailing list ...
>=20
> i'm reading the section, "Flexible Inheritance for Class Functions",
> here:
>=20
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-metadata.html?highlight=3Dinheritance#flexible-inheritance-for-class-f=
unctions
>=20
> and i understand the point of examples like autotools.bbclass defining
> task functions like "autotools_do_install" so recipes that "inherit
> autotools" can define their own "do_install" function that, somewhere
> internally, calls "autotools_do_install".
>=20
>   but what if the recipe that inherits autotools does *not* define its
> own do_install() function? would it still pick up the
> autotools_do_install? what if that recipe tried to:
>=20
>   do_install:append =3D ...
>=20
> would that even make sense? which install function would it be
> appending to?
>=20
>   in short, while that section explains how to invoke the "base" task
> function, it is not clear what happens if you don't invoke it that
> way, and just try to take advantage of the "default" do_install.

If you have:

autotools_do_compile () {
	:
}

EXPORT_FUNCTIONS do_compile

then do_compile will be magically mapped to autotools_do_compile, if
there is no do_compile function defined by anything.

If you have another similar class (lets say cmake) and have

inherit autotools cmake

then the last one is defined to "win" and do_compile would make to
cmake_do_compile.

This allows for functions that could do this as well:

do_compile () {
	autotools_do_compile
	cmake_do_compile
}

Cheers,

Richard

