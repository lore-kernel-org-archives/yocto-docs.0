Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726D1E7E364
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 10:16:28 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8651.1775211383755948751
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Apr 2026 03:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JiF3RSwH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso1102751f8f.1
        for <docs@lists.yoctoproject.org>; Fri, 03 Apr 2026 03:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775211382; x=1775816182; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OIQNshmWK9LfBrYKKtPat+pOT+T4xEJ2Ke+8EaLXRdI=;
        b=JiF3RSwHvYHWvyvu0m0chOwkmOkznZAnlEOZruWLVJ+ttH65A3xcRG1//+bteFb0OP
         /Kcm4Ai+nKW5QWufcaAJ7wwr4cwuO5DvTq3qomPQqOZ9DC1b8jaLcDIS5VGBvqynkERM
         U6KhyMuHZO2JFCPZFZOO86YKg6mTJyVSMrvJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211382; x=1775816182;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIQNshmWK9LfBrYKKtPat+pOT+T4xEJ2Ke+8EaLXRdI=;
        b=czSFV1ehO7DnNp95MgxnL5kD9OQkgYvV7iqvAayoypMkvsd4SLMwnEswhHzYTTh0jY
         4zztI7NPs/CMbS6x78b8Mk+IN2YJi8q+lwuzlCVDMs5s/I/w9mxgXKCIH4VybN8y7dLd
         TA54b3WpGyxKhoze/9xMFIMV9OshInCADma45vhDl3rjssz6HOfXXeroaukyMk4P8FJz
         O+HmEzXmkwNb3SlSBwZ807FVKXeHB3SMhZRw+4sBITKHdhkNh1VvyVCV0hHbTVW2/w2B
         pKSMSJOL8oJct+oVeSfibWDKU1gbiJE8O3PINdnV5ULY5srMRuiXTmDc206885a1F+5E
         Z5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV/RTZ3g0yqbQivjweakGFHPLSabGPKy3aYucGdLOX0MeMJg+ZGvsXuxvKAtwecI6sqUaj/@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwOz12zs7w4VNBp4pfFQryUfy9S5LIwXGbdZ4NzqXNsqwa+XNbY
	HWoGcdKeZk1IZl79GsTuMNulloBPszlCIHjLLxiBiJGGsEIIBvKdADuA/sN/I8JUhJE=
X-Gm-Gg: AeBDieuZc6zW8lsUK8gVQckB5kErI4BG5gZd+tSoG0coqdMSfdp6FrM7DHWyHEOxoHI
	rN+EFLfAYdByHern0bpfWrWhuS0s0nDQ3rgyeoItN+V6pShTWwVDIBauif+axoMxOdUjXOIAFH7
	H3S58g1uCdjXztM79JuqTqoxoCbOEUlOyggl4jvfTyyrcLyXdkIV/RX1ZiHQIDlWVNJivqjGmku
	1uF8frqYklIIvbeUMsNA31hDDP05QR6mILllM0yFnxMsyQvbdhjehYyuMNJ3ygIF06RpB+Pul5Q
	cCFjc1ojDjmXYCEAB+vR/V2zZliKNb4bzX8YJRyJA++WDlv9Uqh+c9xBPfdlsfZrbVv61gAkn0R
	v+WnDQ7zeRp/Lge/eucmi0Ml0ampO61eORMmlD9nsc4ZtS6i/QJk9VekR9YEBNyICqxRS525hZ7
	Rta0JZ1LQNve2YMM0WnjbpK3SyRd7ySixrpB0NlXr2hsreBXqqQvS4RU/pAShNJeUlWlcxxp2SJ
	+5QXmQHa0pcKg==
X-Received: by 2002:a05:6000:208a:b0:43b:492c:8345 with SMTP id ffacd0b85a97d-43d2927f4bfmr3510332f8f.10.1775211382112;
        Fri, 03 Apr 2026 03:16:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d1f2:4cb0:580:188d? ([2001:8b0:aba:5f3c:d1f2:4cb0:580:188d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f73sm16528695f8f.8.2026.04.03.03.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:16:21 -0700 (PDT)
Message-ID: <ea91cc2bf0fcaeee1a152e62f0ebfd367b58b2fa.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/2] bitbake-setup: rename
 "abort" rebase conflict stragegy to "halt"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, antonin.godard@bootlin.com
Cc: quentin.schulz@cherry.de, bitbake-devel@lists.openembedded.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Date: Fri, 03 Apr 2026 11:16:20 +0100
In-Reply-To: <CANNYZj8=z7U5jpCN+NaAmTspYduH=pcMohMcbnqGp8mQvmHoiA@mail.gmail.com>
References: <20260331-docs-fixes-v1-0-45ee34341e72@bootlin.com>
	 <20260331-docs-fixes-v1-1-45ee34341e72@bootlin.com>
	 <6f743774-fe4b-4e9e-ba99-6ffe1d76a51b@cherry.de>
	 <57bb4e5300a4be34f4cfddcf41d9a21b5b7bc579.camel@linuxfoundation.org>
	 <CANNYZj9U3BYUv-cvQvmu7d=8O82Gdg-2GSon6vNJ71BMi6bKsg@mail.gmail.com>
	 <DHJD5ZA0XGWN.3LDDWNE9PDM1X@bootlin.com>
	 <CANNYZj8=z7U5jpCN+NaAmTspYduH=pcMohMcbnqGp8mQvmHoiA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Apr 2026 10:16:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9176

On Fri, 2026-04-03 at 12:04 +0200, Alexander Kanavin wrote:
> The trouble with =E2=80=98reset=E2=80=99 is that it means resetting the w=
hole system
> to its initial state. =E2=80=98Abort=E2=80=99 is about a stopping a parti=
cular
> operation such that the system is returned to the state before the
> operation started.
>=20
> I have no idea how INI has utterly failed to catch these nuances in
> its rationale you linked, and is even accusing the term of =E2=80=98lacki=
ng
> technical clarity=E2=80=99, but it certainly doesn=E2=80=99t help the cau=
se.

"reset" also struggles as "git reset" means something quite different.

"attempt" is probably the closest other option we have since that
describes what it does rather than the way it recovers, the recovery is
then just implied.

I am torn on this, I recognise the concern around the word, equally,
the word does have two meanings and we do clearly fit one of the cases,
as Alex mentions, we are inheriting the issue from git too. I fear any
change we make here will hurt usability.

Cheers,

Richard





