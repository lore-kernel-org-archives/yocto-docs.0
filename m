Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C0CD0C61A
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 14:28:48 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.13299.1729866519463344365
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 07:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CRP1wuMr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so2652841e87.1
        for <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 07:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729866517; x=1730471317; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p9msIZD8Q99f2cv7h6QeS0K9MQwMoYdpQjIjQBvSg30=;
        b=CRP1wuMr7tTt4bNyMkwIBAI5C++R7nCRK+MT7RI9vIS3uvIfNrv5a/ZRYdU3+4UCp1
         ugkDNH2cDUzk6O/UO1FyFCIjJRqb0k3X/9MpcSlYyI39obdFCiobF4pgqBzx1wADkCRu
         9hS24OIn9QyBbm+5jCRUgxNW28vVH9y5bPpcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729866517; x=1730471317;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9msIZD8Q99f2cv7h6QeS0K9MQwMoYdpQjIjQBvSg30=;
        b=dQjmZRmZlNR4mOVSQ8VkZtco7Og87gyHzz3pBdhS62N43KU9dKRRB02kSHwXq4Y4hJ
         0CS6XHEbOA0Dl9mnb9AaQZl1YVaid24dTsjXUPnhiXj/PPEwxYcReef6mQLcfkIv7ydt
         zGUzQ4Elnd3eBB1MdRmavQyTFYhs1Q1m47xBNvhOICRAKY4ilVlgoR+eqiB28NPaaq0+
         9btJqhXPqJrcPERw/l8EDmtqinAB9ulBYQT2JABao9mHNyA/+EhKrgDIDqSebnRQE7kh
         VPYANlcxNINEU+kN5n8rRQxu9VwmwICGCH8Pb3Jp0Z6+5o893gkVH7wfZAjEkpQetH+p
         U0+g==
X-Forwarded-Encrypted: i=1; AJvYcCVYqkaPW+C3zOaN8oRH2/N7pq/H8gXqjunJodetCMgL9mQpTmOw179/FBzZwqXa/ZVkcT/M@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yzh/E5++VJBnOi+0HV6lfzy2iHusg+MjtHwTJT0GDXML/fTSXy/
	PKZM79djf4ImuVAxndSWTPMXHZi6sprTnvZaXE+P9Z7sYFVzEShdBlllPIrPsTc=
X-Google-Smtp-Source: AGHT+IHnijfWH7lR25LxCWcpA0aBgVxJKZ/4BGrVXiZPKFiGsjkBZURp7u2wggfxAhIbP1Qfb9WTkA==
X-Received: by 2002:a05:6512:33c8:b0:539:f961:f485 with SMTP id 2adb3069b0e04-53b1a3303damr5847596e87.29.1729866517352;
        Fri, 25 Oct 2024 07:28:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5e58:696f:3954:9f3f? ([2001:8b0:aba:5f3c:5e58:696f:3954:9f3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b7124csm1651903f8f.81.2024.10.25.07.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:28:36 -0700 (PDT)
Message-ID: <fb85055a28b4e3f236ee1c29467d4a503539d2dc.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] docs: update current releases
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, antonin.godard@bootlin.com, 
	docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2024 15:28:36 +0100
In-Reply-To: <0006cdff-a101-40f4-81e5-c23540bf4df6@cherry.de>
References: <20241025-update-switchers-v2-1-290a6c777a68@bootlin.com>
	 <08d90707d7524f11e37604749c1275aa771fd073.camel@linuxfoundation.org>
	 <0006cdff-a101-40f4-81e5-c23540bf4df6@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 14:28:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5596

On Fri, 2024-10-25 at 16:24 +0200, Quentin Schulz wrote:
> Hi Antonin, Richard,
>=20
> On 10/25/24 4:16 PM, Richard Purdie wrote:
> > On Fri, 2024-10-25 at 16:07 +0200, Antonin Godard via
> > lists.yoctoproject.org wrote:
> > > Remove dunfell and nanbield which are not supported anymore.
> > > Add styhead as an active release.
> > > Set walnascar as the dev branch.
> > >=20
> > > The switcher menu now contains:
> > > - Unstable (dev)
> > > - Styhead (5.1)
> > > - Scarthgap (5.0.4)
> > > - Kirkstone (4.0.22)
> > >=20
> > > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > > ---
> > > @Quentin: adding Walnascar as the devbranch does the trick and adds
> > > Styhead to the switchers menu. And indeed, walnascar _is_ the current
> > > dev branch, not styhead.
> >=20
> > The patch looks good thanks. I just wanted to mention:
> >=20
> > https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?id=3D51d8=
42b5e0b14e5439b5c89ec314886218a62ebf
> >=20
> > i.e. we do have a script in helper which we're also doing some of this
> > in. I think that script goes on to generation a json file which powers
> > bits of the main website.
> >=20
> > Could we try and converge things. The reason for adding this script was
> > to get the website code somewhere more accessible so we are slowly
> > making progress towards that...
> >=20
>=20
> We should be able to build the docs with only code from yocto-docs git=
=20
> repo and without network access.
>=20
> One of the issues we have in the docs is that there are releases without=
=20
> tags in yocto-docs but we still have some migration=20
> manuals/documentation for those, c.f. missing_tags in the script.

We should probably add those. I can't remember what was blocking us on
doing that...

>=20
> Less duplication across multiple repos to build is a good thing though :)

One possibility is an additional make target for docs which does get
the release info from elsewhere and updates things. The autobuilder
docs build could run that but if you were offline, you wouldn't...

Cheers,

Richard



