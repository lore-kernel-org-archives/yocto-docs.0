Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A83C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 10:32:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.46618.1748860336315095077
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 03:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KmzhPk4a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a367ec7840so2840381f8f.2
        for <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 03:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748860334; x=1749465134; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7xP6fPXuXVP9hXhYmBaCYEpxjER2Xsk3C39RwVZmro=;
        b=KmzhPk4aFBbn4etH4vVVjTDcUkSYeQnFM1uSBJ+BKCpCBiDKG5m4wV84lXAntHhn2t
         AeKWd7gCuMR2uSGR36qGDhP1L9MhMiiaS6uXjQRVC0eubksmHuGjtS8VPc8K1J02TSPi
         CKeEe5svdP9wDrv0zcPRBguR07Emep54uF5NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860334; x=1749465134;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N7xP6fPXuXVP9hXhYmBaCYEpxjER2Xsk3C39RwVZmro=;
        b=oaNoF2mOVWcCgql3zEXo7xIJYZ/VE6qOWBCoC/vcFEl4WhruJ7B0jT0PasWbrIv5xd
         FdBeGDI9+nqBVPo32xu5Zvw3eWnL5xAehOaV0LZjK73zSy3xLqM5jABJggR4vqe/Ye2u
         Xd1OP6mwrgp44Pma26xpRDwPfvSY8rkbTK0q0L+063zsu97JmRhR6/a+w16eyQNS8H4S
         xTFv8RpJgmTPyIsn6+Z6H1uWCa6taNcyBncQoi76gEIy43mzH8h346oH+gXUpMbJNaeU
         T3aRHt2IzoTDYYvzhzYl/bQzdLJsm+mToeQImYHqkfPUvhceE49tVLUx+zxAijTsIJN3
         EKaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhU2bAd5Y/XK5QQEQPFF36muOopD9MfE6mNDPXLpmtd94jyWIArfAwSgx7jXtLrCpZKInS@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yyi9V4e8Rl8Wms8j/70rBx09Mqmp/IfmlSmWjomS5V/lEBUK35R
	SPS9ZasZ3RHPhNZmCnVskll//iSxWQeveMelW01Y/PznzrOWVtHEocXuId+IbIwXjSM2c0jsJoh
	s+M6cOGg=
X-Gm-Gg: ASbGncvKZIB5iSoe9IsgFS/z36TipVNv5rcPDT7S1DLatc1aK5uz1yBqC75qKRj1YbR
	MCeNBotGfxq+eFubFdNHQGDiZK8Uh8J91n1Ybw546NMozrqVYo0Oj9GZmsdkl4PKzIm0YTw39Ug
	GCV3N6Zq4ucMjmWQMd0WgxhdJziJXgovGiSbkAZGJCFKmkwh5hPm7TfYdVsenAEZ5xu+PLHLxkz
	4bsQIM0MTaNMzpXFQ9wALnIQNJmoRGZZ85Ut9Selb/80FCj4j+WWBIuwYC0Nax0YoAShc58FzU7
	ZS680/wQ/utqMJ53aJGpdfumHRxUl0FBAv2iYRdieYqeWFF6PBIeHQMtfrzYxdZu0h0TZTSKWuW
	OPIgu4wk6SeTiH4Z9yez29BPjxdRkqZstgzoTyfBA
X-Google-Smtp-Source: AGHT+IFj2kMdjEdNTCFQn2vTvofVsJpeJLGtBw932nIgP8Ztkxc0i9oJ6LnBeP2LEIev09D3BEUAVA==
X-Received: by 2002:a5d:5f48:0:b0:3a4:d700:f773 with SMTP id ffacd0b85a97d-3a4f89a7ea0mr9210043f8f.11.1748860334508;
        Mon, 02 Jun 2025 03:32:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:907c:f576:5b06:73b7? ([2001:8b0:aba:5f3c:907c:f576:5b06:73b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009758esm14462318f8f.75.2025.06.02.03.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 03:32:13 -0700 (PDT)
Message-ID: <83a0be71c4f60e239433414463972ee89bbc6f29.camel@linuxfoundation.org>
Subject: Re: [docs] Any objection to discouraging the use of "PROVIDES +="
 in reference manual?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 02 Jun 2025 11:32:13 +0100
In-Reply-To: <0ed60e64-5e7b-1d7e-4d9b-eb5e8ede5341@crashcourse.ca>
References: <0ed60e64-5e7b-1d7e-4d9b-eb5e8ede5341@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 10:32:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6966

On Mon, 2025-06-02 at 06:05 -0400, Robert P. J. Day via lists.yoctoproject.=
org wrote:
> Given the explanation of "PROVIDES" here:
>=20
> https://docs.yoctoproject.org/ref-manual/variables.html#term-PROVIDES
>=20
> I'd like to rewrite that to really discourage the use of the "+=3D"
> operator with that variable.
>=20
> First, the example given:
>=20
> =C2=A0 PROVIDES +=3D "udev"
>=20
> is not even correct as the current eudev recipe correctly uses only
> "=3D".
>=20
> In addition, I dislike this Note:
>=20
> "A recipe=E2=80=99s own recipe name (PN) is always implicitly prepended t=
o
> PROVIDES, so while using =E2=80=9C+=3D=E2=80=9D in the above example may =
not be
> strictly
> necessary it is recommended to avoid confusion."
>=20
> That makes no sense -- to use an unnecessary language construct "to
> avoid confusion." If that's true, then *all* uses of PROVIDES should
> use that. One cannot encourage readers to use a particular syntax
> if the recipes themselves don't use it.
>=20
> P.S. There are about a couple dozen recipes in OE-Core that still use
> "PROVIDES +=3D"; I see no special cases that need that so another patch
> could be to clean all that up.
>=20
> Thoughts?

In many ways I'd personally say +=3D is more correct. If recipes actually
did that, we could set the default using =3D. Since most recipes don't do
that and trample anything the base config does, that has to use :append
and we end up escalating. I also say this partly as I'd prefer DEPENDS
were changed using +=3D too and this brings symmetry. I suspect that
previous discussions about defaults is why the manual is the way it is.
That isn't to say the wording can't be improved though.

Cheers,

Richard



