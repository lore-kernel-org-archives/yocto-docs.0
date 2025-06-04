Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF67AC5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 09:52:30 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.12876.1749030747225425005
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 02:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U3h0qzis;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-879d2e419b9so5656267a12.2
        for <docs@lists.yoctoproject.org>; Wed, 04 Jun 2025 02:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749030746; x=1749635546; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wLqwpOQ1KDIZ8m0EuozWF6Gqp+0ZcKBGWB9lhC7eBs=;
        b=U3h0qzisOhnmjZ7OkeJ89+x7ZL3tTHZdR7oMDIdJ46bs/5cCHQDPubjhP1Aocg1xQp
         pnsKqChMsVmJnqZjIOVbHdpebTZaIgATmAF6yhXp9EIt/XaSHVKEIJhRz/Z6dXvuGVwM
         kdD1qBZic8yelZmnNP9bWYcev3dCoWqzUBHdlH/3uE5Kt3TkOo5aBY1waCQ0pnstFnim
         Cw0xfitNNOfE0g/RWLGMTpFKkZK+edxMUc8aZTdJRJ6HQRvEybWF52Ey9uc2HYTNEL32
         S6KlSqii3krpuokEHgwcrZVJLF8kQSd7CZ1hJ3JFM0bfanHqauPXPscJtMir5HSnhqIC
         OOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030746; x=1749635546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wLqwpOQ1KDIZ8m0EuozWF6Gqp+0ZcKBGWB9lhC7eBs=;
        b=oHcxgaSR4lNHw2+VhDBD8ZE4nu4VQKRNxrAFwMxonZGB7/7n4Sx/fsr92ETNbEoywO
         mURkGFAMDl18hbAKIswELIrnLLIkUlu83crFMmzjYrp4h9pQXxEpOCgccqwT7+EVDaDS
         wsQlCer9NLFLZNb03sQVDAeSnyro0nMy3w/denN2vCpugdBIlqy6xspfNe1hBe3foE50
         ENw61OoX/YmvOjA7tSbREtBVsvloMTbyx1vPbUVq1Ocfjqk+ryVkViIaLT5TKj6GMF8Y
         EOL6NEUpE9Dwd11eApJ2QTdgN16Bx7WULgPnWap+wBzQLNwSa45UaR5ucGwgKO9yRTVj
         8l9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXndcUpPzWFh03XitV6yK0ulv2hA4nzgp1hslTFygVO5UrRnPnzYjEErp/tdkNDnprRaSRq@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyRLL+rYhJuaYwyIE0A1U0Rj1ahaWl/bnFd4jG7WG2sJRnHR47g
	KFwV8vBB3Kt11hoKZR7zj44JGs1PpTOFgajupBjPrB+O05WmGg1o8aURUwVupyf/qTVfw3uO65y
	k2BV3bmEpwTV2P+ehXAW43I/qVTzdxFg=
X-Gm-Gg: ASbGnctNgkd/sWNp8fvK/Vl9DVkjQQbaJEZImfAUkp6u8+2d+5bu7qzSKJqTqJWbavE
	y6makYhIw1OVTGhkFd+6R33Xh9cWEYn8lFJepy1X24fPQopMGQegIYGeoV2ASTz0VOmX1JFh+TD
	2zeFjOhTL4Y6bkDbPPP0DUye90yH8Ebt8=
X-Google-Smtp-Source: AGHT+IFNYFaIgZU0TNglqX8g1YNujdgAAVZfShR9eEzprmn24MdZufesK1CV+5pHYmQ9cQIFr/8yLaMpr+2ZwWnU7jk=
X-Received: by 2002:a17:90b:35cc:b0:311:e2ce:66ea with SMTP id
 98e67ed59e1d1-3130cc2a59bmr4109115a91.0.1749030746346; Wed, 04 Jun 2025
 02:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250531154900.53941-1-alperyasinak1@gmail.com>
 <4f224337-e7c7-4ccb-a0cc-861fddcabc07@cherry.de> <CAGpma=4nc0DcTEddK0FFb6sj2yenN91DnZrcit2poyqOQ_jYSQ@mail.gmail.com>
 <DADKZIPNS4NH.348N34F0WS0XD@bootlin.com>
In-Reply-To: <DADKZIPNS4NH.348N34F0WS0XD@bootlin.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Wed, 4 Jun 2025 12:52:14 +0300
X-Gm-Features: AX0GCFv_rpAoejZwC0TK7KSTP65rAZKDisC94YcnBsY34lv5kHlbC8DrOAzL52c
Message-ID: <CAGpma=54SHk+V-+GjMMuo3Db9UBYi4LcdM56Kdayvw5GA-_kEQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document KERNEL_EXTRA_FEATURES
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Jun 2025 09:52:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6998

Looks like KERNEL_EXTRA_FEATURES only exists to add to KERNEL_FEATURES
from poky.

To be honest, after wrote the documentation I felt that this variable
was unnecessary. Of course it's necessary for poky but you know what I
mean.

Antonin Godard <antonin.godard@bootlin.com>, 4 Haz 2025 =C3=87ar, 10:47
tarihinde =C5=9Funu yazd=C4=B1:
>
> Hi,
>
> On Mon Jun 2, 2025 at 5:41 PM CEST, Alper Ak via lists.yoctoproject.org w=
rote:
> > Since the KERNEL_FEATURES variable is handled in kernel-yocto.bbclass
> > and KERNEL_EXTRA_FEATURES is usually appended to it, I wanted to
> > emphasize that this class should be used.
> > That's why I made a connection between them and assumed that they were
> > complementary. Apparently I misinterpreted it.  As you said, it always
> > in final/leaf recipes and not .inc files or classes.
> >
> >> > +      such as Poky may set a default value using a soft assignment =
(``?=3D``).
> >> Does it? I don't see it, only an :append is used.
> >
> > "bitbake-getvar KERNEL_EXTRA_FEATURES" shows that it is
> > appended(:append) in poky.conf but somehow I missed it and wrote soft
>
> I don't think we should document variable default values based on poky.co=
nf, as
> Poky is only a reference distro after all.
>
> What bothers me is that KERNEL_EXTRA_FEATURES does not have any default v=
alue in
> the kernel-yocto class. And I don't see the added value compared to
> KERNEL_FEATURES, since what happens in the end is always:
>
>   KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
>
> Meaning users are fine modifying the KERNEL_FEATURES variable directly, I
> believe. What do you think?
>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

