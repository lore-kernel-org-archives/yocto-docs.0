Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9909C5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:36:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16079.1787639812595326911
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 23:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IW7paYXp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499b6c02b02so20075825e9.1
        for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787639811; x=1788244611; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EtZolS2rTRu+zpfbdJxHZqpR7Kj5oTHA95+W82PkZTA=;
        b=IW7paYXpGiXpWZI7MX5wbzrklelTMlD6jbyNPuAaa2pi0Lz4g6DGqfCOZCM1nfo3/Z
         q2LvXAPxdiN16h+EwY3Y6jJlcskFlnsPm0paN73CghloFhioFoZR4+7Un3ckh8LyUXFB
         yIxkMunSYgkRigF+HNRNu0uqn0HdY22dnpADw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787639811; x=1788244611;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtZolS2rTRu+zpfbdJxHZqpR7Kj5oTHA95+W82PkZTA=;
        b=SUU8fz5hRt4pYjPQK8rOJ9R7nTf/iMqkFeq2UieTVQUik2254Uy3dV4xje6XV6EdEp
         rp1Qxf2yqAAHkJiTFIVRboQrR22xWwB7KoVsGbcgMO8fwUSqFOt5onSHOyCo+uCJ8XD6
         +cbAArsDYdhNdrlbXQsFWZ5CxUMwoF/o4ErG0M3Ms403ht91eWxdLv9XLr9w/Jsi4Smo
         aEAuahe2OCJuew+liaQtHW8eaugVeyZhvzhyKy8kZ6OZu7iPx2CfelZBr+tRXB2jTDHE
         7x2X3+WYcM2NXx5RwTHqJWQ/sSjvB5VvTYZClYhAJilajm4ORS9kkU/XgJOUp+VKKcmF
         oVMw==
X-Forwarded-Encrypted: i=1; AHgh+RrZ4yVM+BvUXf8/5dqH+JroItCV5NGOu1RnexV0Io5lCvbRIuuja0OOv+Pi9Bsl63r88Mam@lists.yoctoproject.org
X-Gm-Message-State: AFuF++nlqFlt5MONxNlDj5iirEfOnqIYhNmoNKpYZYRU2GR3rSFuJkiS
	303hvbo2pjCJgqI47ce8apXwh4S7q+oTni4y8Rsd+qqs2sj6FOBDTmxQ6RIGtyIJQ98=
X-Gm-Gg: AR+sD13pzDluuN2C3ERvgXgfBWFCzoaHV+B5UWNVOXaA3phXBDJ7BmjARyALWoggXBs
	oZ3hbbVBVQqNLe7mVJP2Trm66WIgyUJPW6w7dSczl2oRlwL/Wtzc7jwpLzRiBCnoj1paZ409+MO
	TvNs6Rx63d+NYN0E/JcEVS7JvRXQ4q2emTbUeUWwC7Ht0vknbt3hdyWO1y4z/kBNfYFnx3yE3S+
	0V5cq2Z4+iS86h2cHQMQ4AqD1NfDPbJbfbQQdZ5saQPp/YzKebOJ8aHhBLrzIY59j/FZ1GbGvR+
	9knhlt6EBhO2x3br+JrsTp1WoyCM8WDwytXpbQz1OX5CxMkIGxyafbrTCIiq8y8Bnhxt8WMvro9
	SIoHD9I+FxGUNo/hb9DXZ2hP3qkh11MvA5cJ8cHzoZjrvzSW2s8Vf/SDfypVQJFWMWSTY+1s22b
	V4Ot+rp/FM93hTD8x6PBCSln7Uvlcm6pvwtGJf2sfqjUTjGed7x3DjPbugGiSONsNVwo8fjk2o2
	XQNPLXf2MHmXC+O8Ren28KgmTz9fLVddbxZq8Vyh0GmnSLUuDlDCQ==
X-Received: by 2002:a05:600c:c494:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-499b82f4d3bmr364643315e9.3.1787639810761;
        Mon, 24 Aug 2026 23:36:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1d9d:dbf1:7ccf:7617? ([2001:8b0:aba:5f3c:1d9d:dbf1:7ccf:7617])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b78df1sm10201949f8f.10.2026.08.24.23.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:36:50 -0700 (PDT)
Message-ID: <53235180fe3e221ea8bd27c81afc4a35085226b7.camel@linuxfoundation.org>
Subject: Re: request a rebuild to pick up Pygments 2.21.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Aug 2026 07:36:48 +0100
In-Reply-To: <aozKcnogXKWfOiFA@localhost.localdomain>
References: <aozKcnogXKWfOiFA@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 06:36:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10336

On Mon, 2026-08-24 at 18:49 -0400, Trevor Woerner wrote:
> Could someone build buildtools-docs against current master and publish
> the result?
>=20
> scripts/run-docs-build line 29 pins the docs toolchain to the
> yocto-6.0_M2 tarball, which ships Pygments 2.19.2. The newest
> published milestone, yocto-6.1_M2, has 2.20.0. OE-Core master carries
> python3-pygments_2.21.0.bb.
>=20
> 2.21.0 is the release that added a BitBake lexer, so it is the first
> version in which
>=20
> 	.. code-block:: bitbake
>=20
> does anything at all. I have a conversion of the BitBake snippets
> in yocto-docs and the BitBake user manual ready to send, but on the
> current toolchain every block would publish unhighlighted - and since
> run-docs-build drops the Makefile's -W, silently.
>=20
> I've tested the change. run-docs-build feeds every BitBake docs branch
> through $builddir/buildtools unconditionally, and yocto-docs from
> scarthgap forward, so I built all of them twice - once with 2.19.2,
> once with 2.21.0 - applying the same docs-build-patches and master-file
> checkouts the script does:
>=20
> 	bitbake=C2=A0=C2=A0=C2=A0=C2=A0 1.46 through 2.18, and master=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14/14 identical
> 	yocto-docs=C2=A0 scarthgap styhead walnascar whinlatter=C2=A0=C2=A0 4/4 =
identical
>=20
> 36 builds, same exit status, same warning count - zero warnings
> throughout.

How urgent is this? Could we do this as part of M3 and use the artefact
from that release build?

Cheers,

Richard

