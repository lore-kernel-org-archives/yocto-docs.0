Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FFEC83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 21:45:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.25089.1752270329162631059
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 14:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fI9c1sTo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45348bff79fso31173755e9.2
        for <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 14:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752270327; x=1752875127; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j6RFuEUti18FUYiDxKAJhTThh49tYAifc2EdRVvJw0U=;
        b=fI9c1sToz/umThp3wtWu+mQLbiNHjIGyKWIUE3/2fPn94ETbVElpLSYKbt7zzQ0Gab
         13quGTc/o1cGc/eJSKlswXBKFSMWozMqyZ3axpmD1L51obwzWEVdwEqMMuL3p6mF7xf9
         UNlJtwD1gkTRsIYHFaAtjZ4hwEqk9kXHCwip8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752270327; x=1752875127;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6RFuEUti18FUYiDxKAJhTThh49tYAifc2EdRVvJw0U=;
        b=OiZlsiBV6vYc/7XvMakDjLR6Ndc1IAYA4tc9wM2tHhqcBwi13d+7kq41lBwBFppzQi
         w8VdSPIW/G3bBj2ic0CDYQIBOMQgB/B682EvCU2YE7akx7LNT1Oa6XoHrCRbIy1BC52m
         Yz+54L/9IeyZKSaksXjsRm1qTgtC/1TSn/LZMul5c5qEfqh1pbay7+/xGB8xgwvSeBqL
         gl1JYLh4gfjfzFiwrMplkrf+e6tKAbD0CzYKa6MuKXysyZ0HOQaM/GBe9VpfwBBPWMQD
         PEY374O3Oxv9Q4yXz/9LXNQALneBnKv9Z7U/lK9f26NogvvPsCYWapwJUBPvoKZZeMvo
         8JhA==
X-Gm-Message-State: AOJu0YxidVIti5r6dR9DaeRf7OAcsAfg3JkjtPaX5oDy7844EPF8F1Nz
	ZLYn2qO2gma0fL+re5wyePh0HsgN6Ll7qymHVPhVVx0+6G0024gWSQicN9Jprq3f1kY=
X-Gm-Gg: ASbGncvNZ+SAZ2NZezrhizbnZFbtRvg1Xy5Fm/b0YH7k8eIJJ0sGeMTZtVubcZlfBFX
	oacG/M0agaUxlnwoGD5A8iQnEj6z/jAzvgEbltLkWoFDpFC4LCKVmoJy2yQwNHY6V7vzop9ZKc5
	vc9kj8PejMakN1hgWNRSDQQHiP+79uObmzqUFYOfK3qZ4EU5GZnRjBgcC77PetP6BsDZ67lcfva
	xN7GYVDvfceGIL7TS+VtBoUbnMLLa1aHXyaYcikUgynHxqXg7X7F51f6aaPYtEZInrlslsYvhwG
	BGixsIEdWpktXniLMfwnBCPg9kfs9Rr31FR7gAElZsiuA1xL284t1oOPacADIeUR8mSI5gP12Wo
	6PJUWa6/hq9Sbrd4jJXT9poijO+wtp4lOpJdr0EEeDJqLYIgdkHGuhhbP4cxohGwk0SkoF+r6XQ
	aqJ2WFvaco
X-Google-Smtp-Source: AGHT+IE2xQukKEOsc3ntzZZrJXD70ilwQA8BFCYUGEJrUhwkD/s+nC9LfoDwRWH45hxlWVayT5ysCQ==
X-Received: by 2002:a05:600c:138d:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-454f4257d10mr42899815e9.19.1752270327418;
        Fri, 11 Jul 2025 14:45:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:785e:212:efbb:e6e8? ([2001:8b0:aba:5f3c:785e:212:efbb:e6e8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd55b068sm58137525e9.38.2025.07.11.14.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 14:45:26 -0700 (PDT)
Message-ID: <ca38bde3e186f7ff5ba3e290e49bc80cbf2df4d7.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 2/4] ref-manual/structure.rst: update with info
 on PERSISTENT_DIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, Matthias Schiffer
	 <matthias.schiffer@ew.tq-group.com>, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Jul 2025 22:45:22 +0100
In-Reply-To: <CANNYZj-4mUU9Beoz95ekGRwvGTUV9zbXqd3w2z7pU_na6qYLtA@mail.gmail.com>
References: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
	 <20250709-update-sstate-dir-docs-v1-2-9114688f33d1@bootlin.com>
	 <CANNYZj-4mUU9Beoz95ekGRwvGTUV9zbXqd3w2z7pU_na6qYLtA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 21:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7319

On Fri, 2025-07-11 at 19:09 +0200, Alexander Kanavin via lists.yoctoproject=
.org wrote:
> On Wed, 9 Jul 2025 at 09:57, Antonin Godard via lists.yoctoproject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
> >=20
> > Since we mention that SSTATE_DIR can be shared for multiple builds, als=
o
> > mention that PERSISTENT_DIR should be shared alongside SSTATE_DIR.
>=20
> NO. These changes are incorrect, please do not merge or revert if
> already merged.
>=20
> PERSISTENT_DIR can be copied from one build directory to another when
> bitbake is not running, but it cannot be shared between two active
> builds.
>=20
> If one wants to share sstate, they either have to setup a hash
> equivalence server (and then sharing PERSISTENT_DIR is not needed), or
> disable hash equivalency (in which case it is also not needed).

The changes did merge and definitely are unclear.

The point is that if you share sstate, you also need to have common
hash equivalence data.

That may be via having common hashequiv server, or, of you have a local
sstate directory and delete the build directory, you need to preserve
the hashequiv database file to make the sstate useful.

You cannot have a common PERSISTENT_DIR shared by two builds, that is
not supported.

Hopefully Antonin can tweak things to make this all clearer. I should
have caught this, sorry :/

Cheers,

Richard

