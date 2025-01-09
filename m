Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D76E7719A
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 21:55:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.5021.1736459737242946652
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 13:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NamAoL2g;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so14613475e9.1
        for <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 13:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736459735; x=1737064535; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ySFp61oXecks5XM9KjQBlW3hXewi39f7DWeAF1BRJHk=;
        b=NamAoL2gd4LLeUtYycHOL0HHPDZOu1oDto5JCgXkWgNfx65pmVvHgA+Txe3REvO64U
         otmkjaagv1kxeXPrjwQRPUhuMndhFnsYn4PEgRH/qW8p7lhP7rQ/CWhuDke0/h+fw0b7
         UL6RjkEkv3mnIzfsK+2q0M4L7T7TgyygYwWfdzNdeE4QNrMmhoytBOhvO2HDia45xkzF
         IOWinv7hKMVHm2VD6pR0YdvHNymM4RucV/Zn84Xw+uWsobbewUMnjzKgBbhOa43fZtxP
         E4gYIO+0i6VBpN2WhFHmf7czuRpolgP7kJcHjU/g1emgxbgYWjqTeD3z1uFjavXV9K5h
         KhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736459735; x=1737064535;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySFp61oXecks5XM9KjQBlW3hXewi39f7DWeAF1BRJHk=;
        b=Zchq5aTRdjAsSEFK+TFh4Pax24IMD4lWSu5L9smIuUYtTnBGjPxradC+vZN1GY1/Lt
         6cmD5BvXjw1r2mG36BnOoOnNRk/kER9jsh0LfhAEcMAA4/LPr26QsLIpqef4pcGq7o5+
         J+GkPPjvdWUwTDTsNOoCVbBz1cvldJn7/TEr1TGgLJhUngMDtbFrKm860Rn7mXTcrL35
         2FbqN4rCgk8I81HbcKrN98LmMcuE1lPe/FTZgEr1s1KadgJ6eeofBuaIeqZLrv7HeCJI
         dpwNwGxCXUyjU4taZRyrL17u9X4c5h9jsrfeDx6kJVEcDU/NfJjV9Q9fP8V87jp0Ogln
         m3nw==
X-Forwarded-Encrypted: i=1; AJvYcCWgvCmUU9Nc7VcplJz3ydLnr0EZrBSy4L8joL6+RK5Axoc4sbcBUlHtU9UKS+/4jaYvZgOv@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz2UzB6KG6lgHWXsFwoBXQkDs/EagD6chF9rzKKXeu+zUFNaoCH
	/8JSsGbZ3IblUUm/bZIws8+rBvAPQXFrExK1ajtHpTxr07WYieFx
X-Gm-Gg: ASbGncteHWF1ApVAGZLJBkLS3v5aoIhb/p2lLVeayYxU8OU56trxDFKRVVDtHoaYctM
	RbFAZAcZhSSqQ0Uy6s+y9D+wQyBC0FjLhLArCgSDNpVjCEmMnsywA86AJGc3w+2UFqLk2v8WGe0
	Nq4HyWM9H0VEwXQ2OK+Z0yFUWnRtKSz/Hi8z5VVmhSlTwzIK5Xkl4pV5OHBe+HgxTZCAQRAasLL
	9jHQZ2/91/GIn6XOLObKis1BbgRPFVmiNWtyYDrxgDFls2NjeB5ymtxwtxr8yFGBSdxB+a5Cz7V
	hL8Qh5CnqL4Df8cSzQam+VA0ht0JpI4=
X-Google-Smtp-Source: AGHT+IHbc7LohtnVPPi5rHZA7U714i1Md/y2YEVt+za2cd+S87PTxPK2QOtxbTS+ef4211Ru/gFXoA==
X-Received: by 2002:a05:600c:4745:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-436e26c4218mr78801885e9.11.1736459735117;
        Thu, 09 Jan 2025 13:55:35 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fd03sm33948965e9.6.2025.01.09.13.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:55:33 -0800 (PST)
Message-ID: <1ab8a7bfe383cf22b553d1e5c478705c070d93d1.camel@gmail.com>
Subject: Re: [docs] [PATCH v2 0/2] Move devtool doc from extensible to dev
 manual
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Paul Eggleton
	 <bluelightning@bluelightning.org>
Date: Thu, 09 Jan 2025 22:55:33 +0100
In-Reply-To: <20250102-devtool-dev-manual-v2-0-db3fcb81b938@bootlin.com>
References: <20250102-devtool-dev-manual-v2-0-db3fcb81b938@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41app1) 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 21:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6074

Hi Antonin

Please keep the documentation of devtool ide-sdk together with the
other commands of devtool. See also my more detailed comment here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13417#c5

Thank you
Adrian

On Thu, 2025-01-02 at 10:40 +0100, Antonin Godard via
lists.yoctoproject.org wrote:
> [ YOCTO #13417 ]
>=20
> As described in
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13417,
> the devtool documentation is not really coupled to the extensible
> SDK,
> and so documentation for it could be part of its own manual in the
> dev-manual.
>=20
> The first patch of the series moves the documentation from
> sdk-manual/extensible.rst to dev-manual/index.rst. The second patch
> removes some reference to the eSDK in the manual which no longer
> apply
> within this new context.
>=20
> This series depends on:
> https://lore.kernel.org/r/20241223-devtool-deploy-target-v1-1-ee00beb4769=
1@bootlin.com
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - forgot to fix some references to titles in the previous version,
> fixed
> =C2=A0 them in this v2.
> - Link to v1:
> https://lore.kernel.org/r/20241224-devtool-dev-manual-v1-0-0cc4fb584018@b=
ootlin.com
>=20
> ---
> Antonin Godard (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Move devtool doc from extensible to dev ma=
nual
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-manual/devtool: remove reference to th=
e extensible SDK
>=20
> =C2=A0documentation/dev-manual/devtool.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 954
> ++++++++++++++++++++
> =C2=A0.../figures/devtool-add-flow.png}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Bin
> =C2=A0.../figures/devtool-modify-flow.png}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Bin
> =C2=A0.../figures/devtool-upgrade-flow.png}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Bin
> =C2=A0documentation/dev-manual/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0documentation/sdk-manual/extensible.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 959 +----------
> ----------
> =C2=A06 files changed, 960 insertions(+), 954 deletions(-)
> ---
> base-commit: 4b904539d05fdac123ed96c3952613fbbe612c39
> change-id: 20241223-devtool-dev-manual-bb387251f9be
> prerequisite-change-id: 20241223-devtool-deploy-target-
> 27d9f6e8a250:v1
> prerequisite-patch-id: d3a98c5a92ce8ed4945595df218769028f552057
>=20
> Best regards,
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6051):
> https://lists.yoctoproject.org/g/docs/message/6051
> Mute This Topic: https://lists.yoctoproject.org/mt/110386509/4454582
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/docs/unsub=C2=A0[adrian.freihofer@gmail.=
com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


