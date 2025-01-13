Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844C1C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 22:09:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.30811.1736806155956605554
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 14:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g9Th2WvW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436a03197b2so33976085e9.2
        for <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 14:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736806154; x=1737410954; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lHOIZpo+6YpUuBSjSFikZSf0zaeDxk9sDnGSsH1f9SE=;
        b=g9Th2WvWljJEHrrAHHXoaBUkAwvYjw+xP1vrLeP/PQFNv/Gm+29RiGhIP1rGUtV/gU
         6kvYpWIJUkcZlXTMyovYpEqtkO33H6rhYioqV5xlOEqLaU5J+0oRHA2GQ1SiNJjmwKQn
         zbq92Gn9mYKkYWqtgBSXWt857ceHSLhwkHaYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736806154; x=1737410954;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lHOIZpo+6YpUuBSjSFikZSf0zaeDxk9sDnGSsH1f9SE=;
        b=aq4JxAaMsrhmHqnGkPLh5aHNqjEd2H1SBZnX16g1p9zFvOCgGkQ1fRaS4DVF5OuAIE
         3Xgla9O9A16D7ZBZOskiDPumss1ld3XwWp0CIc+kZ/z+ut+rWr2/RqMTgJlf/1P4zZFd
         gqqp/0iD6WVUj6rBUxRUyNp5HYUTiNHHmeVXybaMI2DvlUO8rhCx7GHDeA+ZBFn4rsoA
         Ai6z9o9Si8VV3srZXgJsBkGP3CkUcfGqBzHaIK7Dgo5AzUQ02fgAg0i84YcU0TpKF7Xg
         z6tz83P5eMt0hyr5l5bZkhSTOsfsFwXs0XXUVYDOxwXGb9Sv2DSxmd4yusGuvYrCVBjg
         d5Rw==
X-Gm-Message-State: AOJu0Yz9p5+G3U2ULU7GnGOI+iC6ENOgTe5CrRRndiEzuaotii18jceF
	SM6uq1xgSXckLKiwWMLZJxFN37uJLcIqA2Cnz6xcsI45gkZznewBLCqKcHuPpdQ=
X-Gm-Gg: ASbGncv2zLf7sCdLgx/AWHo7b7mZ7kewtpb3yyH0AY+on7yFHV90Nhrlm3eVIcjNMJm
	VfUZOrC4lyJuLmRpCxRIJ+ENA5p07o/AYs4kvs4bgRS7b5X9CRoVS2j5fhDISQF5hy7LqAeRwUY
	6zxRonPE7q1R7YRuLWIKjT7v3m3ZyE1xvtMYS7QvGb7O2fVQtdhUWhwODWrPHwHXv35Kcfgv+3f
	uZ+ThT1W0nTPv/F3YWefxNZvyuu0CW/r4TBnsuL2CD1A3JZhKX3C4JFxg9nKF244FCPxwiZ9oUX
	d2ny7dn0U/Ev86LOyOdBc2O3kaZpwlhdaLiSeqdRLhk=
X-Google-Smtp-Source: AGHT+IG8EqBI9Ybd8SykhUhwoZ1DZQ5QZu0ujoMmUAueAfEcqDXdtSLwmydSUQnHXEoGvSgTOvNsrQ==
X-Received: by 2002:a05:600c:4455:b0:434:fbcd:1382 with SMTP id 5b1f17b1804b1-436e26a80b6mr223991665e9.11.1736806154268;
        Mon, 13 Jan 2025 14:09:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2bb:f945:1ed5:d845? ([2001:8b0:aba:5f3c:2bb:f945:1ed5:d845])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc14ebsm188070205e9.17.2025.01.13.14.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 14:09:12 -0800 (PST)
Message-ID: <76df28efd27f93840ce4e7a8c9e8f8af8acf8c72.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] Update autobuilder URLs to valkyrie
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, mhalstead@linuxfoundation.org, 
	antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jan 2025 22:09:10 +0000
In-Reply-To: <3fee6045-ef55-42ac-9dfd-e3b6a07e02de@cherry.de>
References: <20241227-update-autobuilder-link-v1-1-6c1ec14a32fd@bootlin.com>
	 <CADfgfobhK_b+kyi2QDFbMR1=CkKziGTFdMCX1SGxkJ7VmR+i_A@mail.gmail.com>
	 <3fee6045-ef55-42ac-9dfd-e3b6a07e02de@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 22:09:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6093

On Mon, 2025-01-13 at 18:05 +0100, Quentin Schulz via lists.yoctoproject.or=
g wrote:
> > > --=C2=A0 CentOS: :yocto_ab:`/typhoon/#/builders/reproducible-centos`
> > > --=C2=A0 Debian: :yocto_ab:`/typhoon/#/builders/reproducible-debian`
> > > --=C2=A0 Fedora: :yocto_ab:`/typhoon/#/builders/reproducible-fedora`
> > > --=C2=A0 Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducible-ubuntu`
> > > +-=C2=A0 CentOS: :yocto_ab:`/#/builders/reproducible-centos`
> > > +-=C2=A0 Debian: :yocto_ab:`/#/builders/reproducible-debian`
> > > +-=C2=A0 Fedora: :yocto_ab:`/#/builders/reproducible-fedora`
> > > +-=C2=A0 Ubuntu: :yocto_ab:`/#/builders/reproducible-ubuntu`
> > >=20
>=20
> Am I supposed to see anything at=20
> https://valkyrie.yoctoproject.org/#/builders/reproducible-debian? I only=
=20
> have None in all Build requests, Build times, Success Rate... Same for=
=20
> all other builders.

Initially when we implemented reproducible builds, we ran then on
multiple distros explicitly. Over time the errors subsided and we
eventually decided it was good enough to test this on a distro at
random. We therefore just do that now and no longer use the distro
specific targets. They were left around just in case we needed them.
You therefore want the plain "reproducible" target rather than the
distro specific ones.

Cheers,

Richard

