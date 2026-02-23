Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF56FEC1103
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 16:15:56 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38927.1771863346626004616
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 08:15:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mYgKopOh;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3878de20527so38589311fa.3
        for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 08:15:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771863344; cv=none;
        d=google.com; s=arc-20240605;
        b=R/c8hGFIi2FRalSj2cLXdSYZbGa2QSd4VUXBl9rG9zBQOqeL1Ga1wXG9eeV6/dgRdL
         5zSYucYtx8iszgEDGNssvyDbXohxk1sMZzhQX7KWx9RTG8mRN7NWwbLWxkyHrQCX6tCT
         HJBTDpF2jHRF5mpCkRKXyH1GpGyKggp1OCUsV2rI+bSYOUKtzRmFqdgeJUSmTii9Fo5B
         2Kamc19jBJXFR7fRAX3ppa2xICrO/t0l+uE+QBPHT7DqZk+nKNU43iIHOg/UG2LYvbyv
         jWZUZ3nofBrcDtsmr2CFDtTjMYr6HhBfNHHfQt8uY72aADvyhkKgu4dzh7J0ImMF9xRU
         xQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DQ/PRMTqkkUtv+jMvK3VTUxkJTv2DwvaLD1kz1kYkE4=;
        fh=w4udndNa3z3dS987rpA732l9rCEUCMDw7O6T9DWWVD0=;
        b=DivI0KiCMdzMDP7k+zXmh+NbMqtNc2/YBQaozQLeVEVHsWQTGhOuO2GfyDG+YQ181M
         cmI3v60QIL/0mK1IRiN9NyRDn7e64aoRrVx7Jl7h2317AFsNS+Kk0SMPHaUZflCBh0cL
         muVncoC0WHV3N1jazBVm1kY39qDtTK2eCjtuoMPfczEbVghItcnZzlCBOG0Ar0E5OreC
         bfsvVbS/qiY2VOYOdwWFRh10IKhRyG0P+aJy6q4GdRRjKdWYnLq+Wo3YpHHLajCpnT66
         ANMCd0UWcAv/rO/e8f8+rHumnFL8M7ufJ+su+u56cDPoaI78rLvez+2mM8jkBEymKWT2
         1QsQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771863344; x=1772468144; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ/PRMTqkkUtv+jMvK3VTUxkJTv2DwvaLD1kz1kYkE4=;
        b=mYgKopOhFocVYejkFI5CyjSxKGIszzxva8u7astoRyb/zUv+eYGedI3o/nenQMC/I2
         J5OzU6/94bKS/mAiJM4Oh9bLYVcvkTpyancW56yzENhsnjjFxP6tOoNy+y70HhaYxC+g
         mb7tfO1VyXtjJ1xTZkAo5SgV+gfMUMpAI75g5ypG9JwRD3ZhosGrm9ch++GT6LVjognv
         LnDkr0rFZVDXa5E/9rdJ2lOCswlCbb5Ny4Qeiegj5sNJnue2YXobhfar7PJYdq89v+OP
         34FdKnU/UHvlkMZ2bgi6jAz0CHUFZ7eai/aIr4d/pQXt84IQ8LrAZqcPB8RP3Y9+pkuF
         rDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863344; x=1772468144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQ/PRMTqkkUtv+jMvK3VTUxkJTv2DwvaLD1kz1kYkE4=;
        b=cYHImbcNpwnByUAL8XpmCJYbdLCJYepU2KpNABalGE1eepZr0lyO1GTuJHmeU0dO8x
         hNL+ld4qrOSozHCuPz/IzB35a3aiJ1kl/aifFlWv1yVucPpQ0uQF1y6VV7M6L0wHUcgB
         oy2j0g/0Co5/pTa9f0Xx/F2xjpDIqNYH2hrDik3XXXWP1QbPnkuIVsO1pETmzb5w/3Jb
         VAQqwDFP1IfDPUuSSx6iPckP0Td4FmehBsXR6dQerCfd6RP9zKnS+t1ikMNnddjMlZIb
         Vm+37waIbixjCm45ELNqkZqGozwAugt8+Pbyq/et8rzWQkYCyeZ0t+K14C2n6tSMoFKM
         tOog==
X-Gm-Message-State: AOJu0YzfKgn5f6DnFAOAxSvT/Zh6p1s8NMWxNBdsu8lT/iTVrvC0B8s8
	AZVFfWfRYTNPu83bEzCP0mV2DI1FskyqK82KNTQ/LCLWSIQWDHA6rRBwbquR37vmdhMom85A9ZO
	FFqJRNQzX2pgOZlZ3pPvWMA79eb1zfukW47u1
X-Gm-Gg: ATEYQzwpOzd2IJJsEDdTb++fbE+QzFZLgISBYJ8y6NpULwD2p1JItqVXv8U4WkaQ4N7
	QWkuNgLL8ERaV86KER3dUKRLHjoW6O/ChZZ7Yu/ArcTE497iLuEReOvfcEXlLNizML8cVqOLWyV
	gN073TYMLp40cyVzsj+3EVaDHVaiuy2ulErnInX3t6ngAsYZ+rE9/NwtIJD8jiytnlFmqxq3NbN
	5TdxUYLmxnoWGl20R1chQavJdbnFbFURqpy8BD4Sm2aeCK/dNi9xT1D9fRm6B0PoYjEZ6Th4MSX
	gLFE4PGyEFY5wIJhtgu7zM1gg98YAcGBSqYgtzdEPGxStto=
X-Received: by 2002:a2e:be1d:0:b0:387:1ca3:57d3 with SMTP id
 38308e7fff4ca-389a5ca99b7mr30098371fa.8.1771863344131; Mon, 23 Feb 2026
 08:15:44 -0800 (PST)
MIME-Version: 1.0
References: <5196619c-a6b5-a5a6-42fd-eb78308e8ffc@crashcourse.ca>
In-Reply-To: <5196619c-a6b5-a5a6-42fd-eb78308e8ffc@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 23 Feb 2026 16:15:31 +0000
X-Gm-Features: AaiRm50QM22dVqPGSZP4wCgJKlqoBmwBFo9uZDzBu1IqKu7SMQcg7YbiidDlLKY
Message-ID: <CAO5Uq5SBWEtnW1svMNDokxUCwG7ft7dcyP87XYHtHTcVqKJLYw@mail.gmail.com>
Subject: Re: [docs] difference between RRECOMMENDS and RSUGGESTS?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 16:15:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8956

I'd guess (and I can't pretend to have checked extensively) that it's
the same as Debian's:

* Recommends: <package list>Lists packages that would be found
together with this one in all but unusual installations. The package
maintenance software will warn the user if they install a package
without those listed in its Recommends field.
* Suggests: <package list>Lists packages that are related to this one
and can perhaps enhance its usefulness, but without which installing
this package is perfectly reasonable.

The default is NO_RECOMMENDATIONS=3D"" so you get RRECOMMENDS, but not
RSUGGESTS. If you have NO_RECOMMENDATIONS=3D"1" I suspect they're
basically identical.

On Sun, Feb 22, 2026 at 9:44=E2=80=AFPM Robert P. J. Day via
lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org>
wrote:
>
>
>   the explanation for RSUGGESTS:
>
> https://docs.yoctoproject.org/ref-manual/variables.html#term-RSUGGESTS
>
> does not seem to explain how it differs from RRECOMMENDS:
>
> https://docs.yoctoproject.org/ref-manual/variables.html#term-RRECOMMENDS
>
>   what is the distinction between suggesting and recommending?
>
> rday
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8949): https://lists.yoctoproject.org/g/docs/message/=
8949
> Mute This Topic: https://lists.yoctoproject.org/mt/117947510/3618097
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kiernan@gm=
ail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

