Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EDFE9B37C
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 12:59:35 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.159617.1772456374886143176
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 04:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JxSJJOxg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65f92a597a1so6025461a12.0
        for <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 04:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772456373; x=1773061173; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nABVef5C5tvC7fpE/xaR6DoLDonD4JGzw6J/Z9HGMdY=;
        b=JxSJJOxg33KkqF+BPvIseh9iIzRPuR76FbcMrR52ULMh6tWZE3NCRaTDPAaB0aVjyt
         AgssLNvg0kwwmj/f44I77la08W4VmHlWXR8V3lPLPjE4gsuvQAoyAEdPfcTMdS241V0J
         ine+GhQtXNBmyv4HYtsIpVg11QyZr6+m1ggsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456373; x=1773061173;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nABVef5C5tvC7fpE/xaR6DoLDonD4JGzw6J/Z9HGMdY=;
        b=ZCCFEeUHBGp8FpN873/6NvOUoNcvwYqv5gjo13dc0ddEslwd0soqSstOt6PFDxMcFl
         l+KtKresKmEeT0zyIPEjgEIMqx5+FRmfRD5IaS2edLSmugwJctN1NTs482LR/uUrgBr0
         medk92DK5LM2fSQSWRIEMXSSNfc8YO8hvIFkNHc4A9wu+DIM8zDq4j2vq8BoKUNpuOKk
         tzW6TKD7n34yxi97LizJRTI0vb1lGdY+ZcwCpvwsxejP2i9yBLZ9UYECMz2FO8qtxh27
         N8XsXtC68XwZMMbBeidz61VvpWcn0FXWfn/rV/vU0/OdhShXJsaP19pNHR4qMv50WusR
         1evg==
X-Gm-Message-State: AOJu0YyM2Pa0JcCOGOaA9fMSgNwOotsT5oG/1NXzCYsPW3ucvnnzrseh
	+p6yNQpuS88IWg1MA5qvKtuIXsftgToTd14HT1vcvS/uWlIzgcjst5ZxnvjNO5vX5bRBb/T+pGM
	+8sofk9A=
X-Gm-Gg: ATEYQzw6PBVlfRZnAzmIgBUWIsQwmOn8Wvp+LnC7DiezQRLTRbGL+CYavSAc554+Ekb
	J52xyJK/qHU1H8V3UUkN3XqLgIduqJlW7+Q1M/LUAXXveaQRsfsDnUEotrvUEYloscry6MXcSsP
	G40mHrhzAB5iigq9Z5vfvKPnd4oax2Oi9Z3fQEvI6E/CdgeB1ywAYe0/rxSXOSefaW+bba7Z7Q2
	ZQFXrl7xR890/adQn2xl6z5gG7ir5RGQMkY+zluf3CkJaB8E8qdX6MiruVEJpA11tS0iv6q+9g+
	5aoR3290ohFB4T8HkBorNlthepDLM+wJUMcGEJUOI/3PVRQP2Fjp1bHIMl1PrUJ5xgkGr2FW7tu
	raKOqdrOM6GSGNjrwvrnbAVk2ONjRpaA1K1UyDof7c4GFC21KjASKnN7njUxEilqTA7lHfDP0cL
	s/a1SyNGKRdi1nLVtsFg7QbU9lG6fnbgfXlWhf5wDWsSI1SHdEc127ST3nf0oyuMOpUBTed8qtv
	QLcQSyx8/vMoBxdsA4Or5fZ4w==
X-Received: by 2002:a05:6402:2801:b0:65c:6d0:d9f8 with SMTP id 4fb4d7f45d1cf-65fddceedf6mr6689181a12.25.1772456373153;
        Mon, 02 Mar 2026 04:59:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:42f5:ee0f:6e5e:ba39? ([2001:8b0:aba:5f3c:42f5:ee0f:6e5e:ba39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660057835e2sm2002608a12.18.2026.03.02.04.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:59:32 -0800 (PST)
Message-ID: <5499ea4cab6026d916e4382546f8f5f8c671453b.camel@linuxfoundation.org>
Subject: Re: [docs] does PACKAGE_EXCLUDE not handle .deb packages?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, Michael Opdenacker
 <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 02 Mar 2026 12:59:31 +0000
In-Reply-To: <ea6a195a-ac68-ffb3-5a52-a1af97e3356b@crashcourse.ca>
References: <929b18be-e9ac-ad9-b8b2-36f95834834a@crashcourse.ca>
	 <1a48de66-a431-451f-ad28-70879392ffe9@bootlin.com>
	 <ea6a195a-ac68-ffb3-5a52-a1af97e3356b@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 12:59:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9043

On Mon, 2026-03-02 at 07:38 -0500, Robert P. J. Day via
lists.yoctoproject.org wrote:
> On Tue, 10 Oct 2023, Michael Opdenacker wrote:
>=20
> > Hi Robert
> >=20
> > On 09.10.23 at 07:33, Robert P. J. Day wrote:
> > > =C2=A0=C2=A0 from
> > > https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_=
EXCLUDE
> > > :
> > >=20
> > > "This variable is supported only when using the IPK and RPM
> > > packaging
> > > backends. DEB is not supported."
> > >=20
> > > =C2=A0=C2=A0 i just tried it with .deb packages and it *appears* to w=
ork.
> > > thoughts?
> >=20
> >=20
> > Funny, I came across this paragraph last week. Thanks for testing!
> > Indeed, the code seems to support this.
> > Shall we change the docs if nobody objects?
>=20
> =C2=A0 From *way* back in 2023, I just noticed this ... the docs still
> suggest that PACKAGE_EXCLUDE does not support .deb packaging:
>=20
> https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCL=
UDE
>=20
> can someone clarify this?

I think it means that nobody has had time to look into the issue and
propose the docs change if needed. Unfortunately we're not all able to
dive into every issue you raise.

Cheers,

Richard


