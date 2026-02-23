Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A30FEEC2AE
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 23:37:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8731.1771889853382458950
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 15:37:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pm/oT5QY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4362507f0bcso3451069f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 15:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771889852; x=1772494652; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GP2qNeCuw/7yuSKT95c1XPLdEbuelJLrP2hM7M2Tah0=;
        b=Pm/oT5QY6F809N07GM9QOTvkMto4jNdbaBSJrrqJdFFluz1e0/0DQzBEUXMIW6A6Oy
         0tHWzBZXVr/El/2p/YFUg96FqFXamu3qsTrfWCVcf4AGE+tHGO1F7cssPpjALzzrZ+Qf
         Dxb6zYAX3N88hlPoHKc+1mtwghgMaJo2/aDD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771889852; x=1772494652;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GP2qNeCuw/7yuSKT95c1XPLdEbuelJLrP2hM7M2Tah0=;
        b=VClYe33uTJekrW/bndeIoLdhc1PzRNW2LLHZgL/nTeqlDE4yYzHxslcL3+aP+vZcVH
         E/yHzao6ibK0vsTEon0Xf1uajnej9CM/yXt2jLSdYh56wMiHP/JrAiF/RRLoGnDcr58H
         8DTF8xMHGR3cGTOYjFf4lytX4rkaRULr082lbPmxmfBk2YGuue3ZHGqJ0tvME7JDnS+D
         chQj7kD1FGdga1A5bKbPqWg9+TD3D/1dfkj9nDKRPn5Bj5y3YOVT28h/1fmy4m50gvEK
         2SRE3RyESAxrO7UmoRnrsDEJvFKDLRB31CfpT3JpWT+KI5ZNAN9Yl+RQZOOzBG494yyF
         5VHQ==
X-Gm-Message-State: AOJu0Yz2tXs8c2ERuQsjw0tLFNmUZ4phPbD10trz/QUBQK9NSnqp0CGa
	WWvUdiOJgTyflDWDf/l4jYmJsKBP7pSN5lnyp0/KuwmqQd7YZzSr7IDUybmlWEXGymQ=
X-Gm-Gg: ATEYQzwJe9HpfwQaMvMXZEy+nsygcnbPNtdWKplFWkecDM/bLsaynY+/gE02OsczQX0
	hgKKW5euTtQXwo1D2MSIZ5HyTmKVa6GRRcwcxfL2uRzvulAKSmCE30MlpiHF8Ia9BvIrPJwPjNC
	eRGgdVM0eOe/DIoYX9eEDcNrYXe1GahFO8aIYR+qrSMtDh8Y/cMlcxE2rystzYeyesE9PmvMs7H
	tmWxB423u/9Mclhoc9Fc3PQPv6KWY402biV+7eH37dEkv+TwLRccfpUsTIjQFseo3jD9eU6u9gO
	PaXt1a8/aF2kTy2ZUTx9PurL/eOAVclABEluJhayJEHoCdvC3JJDBiPblIWG7pwTG8lC45cSG1K
	RQP4qZjHCY9aKcGFVZx/wZB7APB+7a/cMXd5R2eWc99YBVgD0JhdVJWZ67QUbW9z8e4WGFtp1jY
	5+Z/8q2Q/UJNcfY0bu6Zq/6w2LxVEv7L0ML/vGFHn66DF6gZWWsF8yGka9yrHYzbCH5I/2MkNkL
	EASJmpPH0WreDk=
X-Received: by 2002:a05:6000:616:b0:437:6963:a104 with SMTP id ffacd0b85a97d-4396ffd45efmr20114111f8f.20.1771889851659;
        Mon, 23 Feb 2026 15:37:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:81e8:821b:aad6:3899? ([2001:8b0:aba:5f3c:81e8:821b:aad6:3899])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm20447086f8f.24.2026.02.23.15.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 15:37:30 -0800 (PST)
Message-ID: <579e881ff1fd2cd2a3b7221aa0a22cc19fb13a3c.camel@linuxfoundation.org>
Subject: Re: [docs] difference between RRECOMMENDS and RSUGGESTS?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, Alex Kiernan <alex.kiernan@gmail.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 23 Feb 2026 23:37:29 +0000
In-Reply-To: <22c37f16-7352-9f81-22fa-030a265c3b2e@crashcourse.ca>
References: <5196619c-a6b5-a5a6-42fd-eb78308e8ffc@crashcourse.ca>
	 <CAO5Uq5SBWEtnW1svMNDokxUCwG7ft7dcyP87XYHtHTcVqKJLYw@mail.gmail.com>
	 <22c37f16-7352-9f81-22fa-030a265c3b2e@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 23:37:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8960

On Mon, 2026-02-23 at 13:13 -0800, Robert P. J. Day via lists.yoctoproject.=
org wrote:
> On Mon, 23 Feb 2026, Alex Kiernan wrote:
>=20
> > I'd guess (and I can't pretend to have checked extensively) that it's
> > the same as Debian's:
> >=20
> > * Recommends: <package list>Lists packages that would be found
> > together with this one in all but unusual installations. The package
> > maintenance software will warn the user if they install a package
> > without those listed in its Recommends field.
> > * Suggests: <package list>Lists packages that are related to this one
> > and can perhaps enhance its usefulness, but without which installing
> > this package is perfectly reasonable.
> >=20
> > The default is NO_RECOMMENDATIONS=3D"" so you get RRECOMMENDS, but not
> > RSUGGESTS. If you have NO_RECOMMENDATIONS=3D"1" I suspect they're
> > basically identical.
> >=20
> > On Sun, Feb 22, 2026 at 9:44=E2=80=AFPM Robert P. J. Day via
> > lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org>
> > wrote:
> > >=20
> > >=20
> > > =C2=A0 the explanation for RSUGGESTS:
> > >=20
> > > https://docs.yoctoproject.org/ref-manual/variables.html#term-RSUGGEST=
S
> > >=20
> > > does not seem to explain how it differs from RRECOMMENDS:
> > >=20
> > > https://docs.yoctoproject.org/ref-manual/variables.html#term-RRECOMME=
NDS
>=20
> =C2=A0 what's missing is how to take advantage of a recipe's RSUGGESTS
> setting. unlike with RRECOMMENDS (which is installed by default, and
> you have variables to identify what you *don't* want), how does one
> use a recipe's RSUGGESTS variable? would i do something like:
>=20
> =C2=A0 IMAGE_INSTALL:append =3D "${RSUGGESTS:fubar}"
>=20
> to get fubar's RUGGESTS? or am i missing something? that should be
> explained in the variable reference.

RSUGGESTS would only come into play when you're using a package manager
to install packages on the target system from a package feed.

Cheers,

Richard

