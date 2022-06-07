Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F6FC43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 10:22:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.10743.1654597335482967192
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 03:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LWHbWp6o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so11441228wme.5
        for <docs@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=mJCsL9Q+wmBVCWGjWc9CE/12Na3qL+Ou/J1XfKwVeB0=;
        b=LWHbWp6oXCAMycLpAG3XZ8ESAc6TqGhdcS7SfYgMnziyq5UPIHujb3BtsLwdpsQAg6
         vTK+rPQJH2nnzyBow251z4LGXUWN/6fghVdViHe66DP0wYfpIDvJdikS0NeO5mJ/LwKQ
         5fGNGAkErTftTufR9uKYCaoTc7srDA1AO/ibY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=mJCsL9Q+wmBVCWGjWc9CE/12Na3qL+Ou/J1XfKwVeB0=;
        b=eJXlfW4HWxfvXDpr8KbEUhAUEIOuyOe8q32xBCZHuMiKtpeBmRTk1+Y0/jyHHWQ88A
         4DGBFo48VrhLBT/dPS/DDUH58VrsU/mN2XqCFHGMwstXrCW41PojFNQmQ87OwAFi3Y/r
         IAaNwXAEcymO8pfIgyXiZC0gt6DaUKZVhHPlVdHSmwtbPXi1E6mFtbVsaOoacDkroZPe
         RafdDtjdXrO9mZTSNHPHD6oTuxF9bxB1u1tP6EjiCGsCZ1mIuZdMODyChAiCe8ef9PnA
         mjkA/gz/uq29QmeWyCZsz6/OjmL4E7iRSlCAbSGJEY2hjBfgnCOEPoOZjbEi7N17KxAU
         Cluw==
X-Gm-Message-State: AOAM531+0idB+hvz8++RgHa22A+5Y3LsE6CBoBNyoRKL3oY0tK67K6bW
	6tS0fSviPLeVmYOAoAVariF1jw==
X-Google-Smtp-Source: 
 ABdhPJwpFJJ2bkNOzuQr94LbiqG2rguLn5LkVzglKVVZOlLVUin5l44JiFbhHvDTE0FmomtX33rqnw==
X-Received: by 2002:a05:600c:22d9:b0:39c:4b1b:5f99 with SMTP id
 25-20020a05600c22d900b0039c4b1b5f99mr13832428wmg.151.1654597333531;
        Tue, 07 Jun 2022 03:22:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e835:fc94:6c5b:fc12?
 ([2001:8b0:aba:5f3c:e835:fc94:6c5b:fc12])
        by smtp.gmail.com with ESMTPSA id
 a13-20020a5d456d000000b0021024f82e01sm17475150wrc.16.2022.06.07.03.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 03:22:12 -0700 (PDT)
Message-ID: 
 <a0058bb37f8f05cc7b9775c40c44dceee3bcb15a.camel@linuxfoundation.org>
Subject: Re: [PATCH] docs: releases: move hardknott and honister to outdated
 section
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Quentin Schulz
	 <foss+yocto@0leil.net>, docs@lists.yoctoproject.org, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Date: Tue, 07 Jun 2022 11:22:12 +0100
In-Reply-To: <a67c00b5-20a9-fd64-66ed-fc0e040f2999@theobroma-systems.com>
References: <20220603133353.506482-1-foss+yocto@0leil.net>
	 <a67c00b5-20a9-fd64-66ed-fc0e040f2999@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Jun 2022 10:22:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2970

On Tue, 2022-06-07 at 11:02 +0200, Quentin Schulz wrote:
> Richard, Michael(s),
>=20
> I have been working on automating this release page so we don't have to=
=20
> maintain it (I stumbled upon it by chance).
>=20
> The issue I'm having right now is that we are missing a handful of tags=
=20
> in yocto-docs which makes it non-straightforward to order the releases.
>=20
> +# list missing tags in yocto-docs
> +missing_tags =3D [
> +        'yocto-0.9',
> +        'yocto-1.0', 'yocto-1.0.1',
> +        'yocto-1.1', 'yocto-1.1.1',
> +        'yocto-1.2',
> +        'yocto-1.4.4', 'yocto-1.4.5',
> +        'yocto-1.5', 'yocto-1.5.2', 'yocto-1.5.3', 'yocto-1.5.4',
> +        'yocto-1.6', 'yocto-1.6.1', 'yocto-1.6.2',
> +        'yocto-1.7', 'yocto-1.7.1',
> +        'yocto-1.9',
> +        'yocto-2.5.3',
> +        'yocto-3.1', 'yocto-3.1.1', 'yocto-3.1.2', 'yocto-3.1.3',
> +        ]
>=20
> Those seems to be the only missing tags (didn't check really carefully=
=20
> though, so might be missing one or two).

If someone can work out the commit for each of the tags we can
definitely tag them. We should be able to work that information out, it
is just a bit of a pain to do.

> Is it possible to tag those (do we know which commit was used for each=
=20
> release?)? Or do I need to work on some ordering "algorithm" (there does=
=20
> not seem to exist a semver ordering in Python?)?

I'd have thought there would be way to do that even if we had to use
our own version function (we have one in bitbake, mainly so we have one
definitive way to compare versions).

Cheers,

Richard


