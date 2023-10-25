Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB2AC07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 13:32:58 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.173467.1698240770118114138
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 06:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqj3qo9a;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c50906f941so86385031fa.2
        for <docs@lists.yoctoproject.org>; Wed, 25 Oct 2023 06:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698240768; x=1698845568; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oj99rKPebbDk8PXdj8agMI1oTTB6XpLh6iq3xjGI9vU=;
        b=hqj3qo9axb9t16brwPCe1xzikpIh3qdQXgoEEf7+FCqtp7pTghDUtTDMS6aETLwU6K
         xRT50RJxQRl/Fe82gGQ9rbtMEMleCFnaujimUJLRFtIOpdFrWVOMXVir9PZg8775tqj1
         9kseCuXxGtZOgToOOXRxi3J4xpgB6a54gLsp2ZkMghZOYiKZJ2Nbwd21KdUBWFnaY0YF
         HsM/2uqg3PTR78JEUkUjM+S9U/fAXGUDHfr06V2ifBVVX6siSO1oND+/INJYM+0fte5D
         9OeQEmPdkAqCylLsxxYxDkVsYnn6/EHMFKBh/V2BPgfP2DLwuq2idppw1t7YaTbD1ekl
         zL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698240768; x=1698845568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oj99rKPebbDk8PXdj8agMI1oTTB6XpLh6iq3xjGI9vU=;
        b=GgByuihNuoMl8Iu5FBmJcwt05bezos/t3qTCYLfEUuvlrSeUBWDMNiMiJELFISSEz0
         FV1mHgY7mJt1nWR4nituNyE2XhXx5fItBnw5nnPqZUnV95AqLzGMgiinCYX9ImUsHYn/
         ostmCInBE5jFwtG8EMiqYy1XTDvq1wR4j0fN6BpqR+CpfJstA4sZgzoK60oveHrCxOwn
         AQG9gjRIqMlchAyA5oJkc9Jei2PzkLH6EDj33UDNlDV5ujupPi71GXA0kmvuvgbv+emf
         Qoj/qTuyaRGu0eJedt0k2+t81Rc3j+PJfORu7IoyoF+yD8zPY48ghKC5BXojlC5Nx9km
         eLkA==
X-Gm-Message-State: AOJu0YxXX4rkVoKGvMxvuBim9crBYCnqB9Ia5c9/xk/zX4fD54w7AarQ
	6uhIiiVKG8jwHlOwaO5lB/9B6rjXaMheJtKI/RY=
X-Google-Smtp-Source: AGHT+IHa5/AONM3CZWryF2CXXE5NRJ8waQeCNgoTO5oy15+lkJPMuXcm7vNkwNH/hlpLM3cNiIHKmCOhQp+8KacfAc0=
X-Received: by 2002:a2e:9cd6:0:b0:2c5:16d4:32ef with SMTP id
 g22-20020a2e9cd6000000b002c516d432efmr10504830ljj.46.1698240767648; Wed, 25
 Oct 2023 06:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231020143928.1700522-1-rybczynska@gmail.com>
 <2638fa02-b0d9-4d5e-9203-94623f065586@bootlin.com> <CAApg2=S2U6ryg68cvXtVDPJOHvNMMQu9pRwJuXm40fx+0M51Fw@mail.gmail.com>
 <3a3644f2-6c0d-47db-99f4-0f61b4257902@bootlin.com>
In-Reply-To: <3a3644f2-6c0d-47db-99f4-0f61b4257902@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 25 Oct 2023 15:32:35 +0200
Message-ID: <CAApg2=RcR1pSqWUbGveTZZfyzbhFcgg2wcwQdZcSJsv-GtPHcQ@mail.gmail.com>
Subject: Re: [PATCH v2][docs] dev--manual: add security team processes
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Oct 2023 13:32:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4499

On Wed, Oct 25, 2023 at 12:20=E2=80=AFPM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Marta,
>
> Thanks for the updates in the V3. Replying to your last question...
>
> On 23.10.23 at 20:38, Marta Rybczynska wrote:
> > +Current Security Team members
> >>> +-----------------------------
> >>> +
> >>> +For secure communications, please send your messages encrypted using=
 the GPG
> >>> +keys. Remember, message headers are not encrypted so do not include =
sensitive
> >>> +information in the subject line.
> >>> +
> >>> +  -  Ross Burton <ross@burtonini.com> `Public key <https://keys.open=
pgp.org/search?q=3Dross%40burtonini.com>`__
> >>> +
> >>> +  -  Michael Halstead <mhalstead [at] linuxfoundation [dot] org>
> >>> +     `Public key <https://pgp.mit.edu/pks/lookup?op=3Dvindex&search=
=3D0x3373170601861969>`__
> >>> +     or `Public key <https://keyserver.ubuntu.com/pks/lookup?op=3Dge=
t&search=3D0xd1f2407285e571ed12a407a73373170601861969>`__
> >>> +
> >>> +  -  Richard Purdie <richard.purdie@linuxfoundation.org> `Public key=
 <https://keys.openpgp.org/search?q=3Drichard.purdie%40linuxfoundation.org>=
`__
> >>> +
> >>> +  -  Marta Rybczynska <marta DOT rybczynska [at] syslinbit [dot] com=
> `Public key <https://keys.openpgp.org/search?q=3Dmarta.rybczynska@syslinb=
it.com>`__
> >>> +
> >>> +  -  Steve Sakoman <steve [at] sakoman [dot] com> `Public key <https=
://keys.openpgp.org/search?q=3Dsteve%40sakoman.com>`__
> >> Maybe add a ":" character right after each name?
> >> That's all I have. Thanks for the quality of this document!
> > Not sure about it. I was wondering, however, about showing key
> > fingerprint directly.
> > That would mean, however, that LTS documentation will require changes
> > in that regard
> > (key expiration is typically 1 or 2 years). What do you think?
>
> I've go no strong opinion here, but its probably safer to have the key
> fingerprints, right? Or maybe the a link with the fingerprint as text
> and the URL as target? This way, you have a confirmation of the key in
> the docs, and in case it gets out of date, there's a link to find an upda=
te.
>
> Thanks in advance for the V4 update taking Quentin and Robert's comments
> into account.
>
I've decided against adding fingerprints verbatim. And the V4 is out.
I'm happy to see that
there are so many people reviewing docs!

Kind regards,
Marta

