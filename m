Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DDDCF2594
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:47:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.52104.1728902840418267403
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 03:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E3XcdfEn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so1332723f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 03:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728902839; x=1729507639; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbTe1XaDGHX/7d2V8+ZsXSH8/DGlwS4ZV49jAElyP6M=;
        b=E3XcdfEn9e87ipK8XMYgNIoGcwocu3d4sokVk1aCT62sTZDDaqVBh2g8p0TdbWJLrA
         0vOrCWeEU2haZitZxxvZyNrc682Edh+BD6QvwCaw6VmdjDqA8rpdAoLLqgwjDN/fw1uY
         be/CzQ1a44Wzsq8xJImUq+zuWaH3xCgocERg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902839; x=1729507639;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XbTe1XaDGHX/7d2V8+ZsXSH8/DGlwS4ZV49jAElyP6M=;
        b=H9DShVJCBBEREByS3tUvhk8xgOhqVF4z7+IlBfbufkScETLpS3k7HmvfjVMXduuIod
         ry/5QedYmy+/shEc3X5+G2YSHlIn4dvQd/acLZWvwq/YhqHvZm9eKoYOooHKVgLuKtDy
         jse2Le6C3zT0I8TLXwN3HlOGnZnBb5ZadXHBbAMFGOw6bO6M13X+Ai3JrlMaK0CqxsWv
         cM7vAYKU+CMtK9xwfCIAvV1TDEz2R0hJKIU/dzO0d4+zys3329509HGCqfRII4KUuGjS
         BgUrWSA59jfbw7RLDhJoPlmiwz6jDDu83wS14Ts5Th9PEqq02mFyH7QdYdJ8aIUURqyx
         W2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV7rgPBCuB83w50aLNRJjP6+HHdykOScmFiqrWFXv68LbbJRaNlnsYFZXp37/bChBRSL3dy@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy8k8prN+tjTiL7Tysn5vRjgSmQPGlhvo1BbfDQBnhnrEHtY2U2
	Bh+kNNsj3hrRSBoZziKhOAuCbS2d5VrT3U9LzjM6pIYmEfA8S7BAWU03LKDFFoQ=
X-Google-Smtp-Source: AGHT+IHdgQuV/65PMGVRz7HBadwd+gDQ3AbR0DZKS4rh46fPwgn1zBVO24eftuUU3VEaFvEnCPz8yQ==
X-Received: by 2002:a5d:5147:0:b0:37d:3dfd:cd92 with SMTP id ffacd0b85a97d-37d551fc83fmr7285738f8f.28.1728902838681;
        Mon, 14 Oct 2024 03:47:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4468:7613:7612:e2d5? ([2001:8b0:aba:5f3c:4468:7613:7612:e2d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6cfb2asm11017284f8f.51.2024.10.14.03.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:47:18 -0700 (PDT)
Message-ID: <1d9c6e2c2cb42a4127e0eb1c1eefee9adc5de8f0.camel@linuxfoundation.org>
Subject: Re: [docs] Docs build/workers need inkscape?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, docs <docs@lists.yoctoproject.org>, Michael
 Halstead <mhalstead@linuxfoundation.org>, "antonin.godard"
 <antonin.godard@bootlin.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Mon, 14 Oct 2024 11:47:17 +0100
In-Reply-To: <6c969fd6-d6b9-41ce-9ed7-a5138414780c@cherry.de>
References: 
	<3019070797186fd40c2b71959ed6b995660a790f.camel@linuxfoundation.org>
	 <6c969fd6-d6b9-41ce-9ed7-a5138414780c@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 10:47:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5477

On Mon, 2024-10-14 at 12:43 +0200, Quentin Schulz via
lists.yoctoproject.org wrote:
> Hi Richard,
>=20
> On 10/12/24 11:19 AM, Richard Purdie via lists.yoctoproject.org
> wrote:
> > Hi All,
> >=20
> > We've seeing docs build failures:
> >=20
> > https://valkyrie.yoctoproject.org//#/builders/34/builds/6
> >=20
> > The issue is that inkscape isn't installed on the workers and isn't
> > in
> > the docs buildtools tarball either.
> >=20
> > I'm reluctant to start requiring installing inkscape on all
> > autobuilder
> > workers as we try and keep the packages installed minimal for the
> > other
> > builds.
> >=20
> > I'm wondering if we should just pre-generate those png files
> > alongside
> > the svg sources? I can send a patch doing that...
> >=20
>=20
> This will necessarily mean we'll forget to update one or the other :/
> It's bound to happen.

Well, one is clearly derived from the other and listed in the makefile
so I'd hope that makes it clear and relatively easy to fix.

I know what you mean though.

> librsvg is Rust-based IIRC, so that adds up A LOT of build time to=20
> generate the buildtools tarball.

I think that ship has sailed...

> For my company's user manual, we use rsvg-convert (which seems to be=20
> coming from librsvg :) ).

That could be easier for us to build rather than the whole of inkscape.

Cheers,

Richard



