Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E9AC021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:48:00 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.53210.1739803679530982129
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:47:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gp1oskWK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-439714a799aso19256935e9.2
        for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 06:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739803678; x=1740408478; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yoPO0b/gcpT0ADALg/JjTYpgqu6p+hzcXhriURAPFwM=;
        b=Gp1oskWKz691/cgzFNl/bGkuDaWUpc5pAk0rbkGXMgzgvm1E2tnl5zYqM87/ejQOm6
         cPZwsjDtP/2e72QJ6cPBP9udESq8gs6bd24mXXt7sVVzu06A6O+YAK7A5MNgoQ1hA/pN
         Ae2PhRls1mG++jfeNGcItiziD3l+XJj8XPZ18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739803678; x=1740408478;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoPO0b/gcpT0ADALg/JjTYpgqu6p+hzcXhriURAPFwM=;
        b=aEeeGt6deYNJHbp2Cwhq2YEVnsrDr4XERa/0YDibH4eUaWPwmszBnRNtRECLL53Puv
         FTVt9U2AyDPUZQECkoQc7s24dHvxOd6TnAEDfLKbcsIrkrl+BECqWv83nhTZm9M+mgS/
         T1Yxx7xkBXysrElL2qVenJ4Lr+gSLN5SGzVVx1D5IVbmmC5DRV0WSONG0mWCiYSveN5K
         ZKZFKJl0rUxsj5oZo5qSgIvMVZRBeGRjOC5lOBHlD5t/9KBEZoTtOW4522wbZyD74iPu
         1DMa2Efu3D+KxQDD7u8+RFFWExdaRg6S3ZoPeZJDKoiCsGd88y26ojUzMUwMbeKZY2Mo
         +PZA==
X-Gm-Message-State: AOJu0YwH3hvHlC6E4Jqq2g1gKdRhaOClecgvFxyqTYoe3BfE6wIzZ/Tk
	CpmyUpEkn8maE3Rq77xQTWN99tXOyT0F0MdbKrT3Uye2uwDLLB8S/82dcA5gX1A=
X-Gm-Gg: ASbGncsTloR/1ETLP8Ae6oxXYEnjQj12BobGS+hQL/9jvsr5EpTeZnpfYaJV9RbMKVL
	oYxSHrrz6r2sWCpw6xJMhXwcGwkOtyO9HXln+Z7WaT498E8B4RKKmlRhcaPtMbuymsZkG2RO5+a
	RuRhcncjFx6lplSTvepH712riiunNc5NMljpuKTO/U4bsY9DEUUuj+ACKD58grMPO8fXAp2duf4
	iozdL4ETjmGQFf/mNaKgR24drth2SV3cFc1davbSVe/x56VGwiyBOhx4miG+ZJnDvPrO4aoQ+NS
	2PGEVRSsWF5ivzMDfpjhE+FrdtM8K2ngpQZGOV6183u673I/NDNYTODxG0B6nWuTVfkf7pnsi5T
	DqC3d
X-Google-Smtp-Source: AGHT+IHPaKwMvQbNytFVuDFx44k3jFXT+P9bsSSV6t0vZgUpFXjwf+ReVN0AcLNCRrE+onOcHVrB9Q==
X-Received: by 2002:a05:600c:4f03:b0:438:a240:c63 with SMTP id 5b1f17b1804b1-4396e6978f1mr74953035e9.2.1739803677903;
        Mon, 17 Feb 2025 06:47:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:12f2:fcaa:2c32:45fc? ([2001:8b0:aba:5f3c:12f2:fcaa:2c32:45fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fc885sm122890205e9.9.2025.02.17.06.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:47:56 -0800 (PST)
Message-ID: <74453d28c603c2c23074b52cdcab879df1990155.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v3 0/2] Document the PACKAGE_KEEP_DEBUG_FRAME
 variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: othacehe@gnu.org, Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>
Date: Mon, 17 Feb 2025 14:47:56 +0000
In-Reply-To: <87v7t8swvn.fsf@gnu.org>
References: <20250211161239.5396-1-othacehe@gnu.org>
		<D7ULJGLDCLNM.2F5SN59SUVGYR@bootlin.com> <87v7t8swvn.fsf@gnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:48:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6393

On Mon, 2025-02-17 at 11:12 +0100, Mathieu Othacehe via
lists.yoctoproject.org wrote:
>=20
> Hello Antonin,
>=20
> > > poky:
> > > https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D104482=
00b63bdc45b39504ebcddd85b5f274f0c4
> >=20
> > This link does not work for me. Could you give me a new link with
> > your
> > commits, on master? I couldn't find them.
>=20
> Not sure why that one broke, here's a new one:
>=20
> https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3Ddf2c9e8840=
66aafb0dfb60521a4809c5ba4cfd5d

The patch hasn't merged yet, it was queued in master-next which
rebases, hence the ID changes. There are some concerns about the patch,
I'm working on trying to get some feedback about it.

Cheers,

Richard

