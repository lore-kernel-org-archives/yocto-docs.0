Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232F6EEC2B0
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 23:54:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9084.1771890867846165673
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 15:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e8w8eOlT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43945763558so2997930f8f.3
        for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 15:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771890866; x=1772495666; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qBFCr58LBsVh7Gz4PTRF8fKtXMzyUSov7grWMw7/B7E=;
        b=e8w8eOlT5yFP2C/Bntbr6YOJkKfifN/KgQxSpmevHOvlVlFZhFLdFFMVlzAt1QCD5B
         3os9Oj/5RmNLM2JsoTMpFD2OqFvSFq8miMSQQ+8Lc5It52SfU1+e/rRuwVrYh/SPXTwV
         gC5hHl350oyx5drltEGn4HdbW36Sfqzk3Pgbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771890866; x=1772495666;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBFCr58LBsVh7Gz4PTRF8fKtXMzyUSov7grWMw7/B7E=;
        b=l2dJkQzflNbVkXlgNUirdoYCofHrsiJD5xbXkIciRMxeu/MarGeJt4J/yLImn2mpXc
         9iqGbNN8BorPQpolHNSlDCF594vZ9l43iRUbhsiPzJSHd3ddrYZ3zPA9bV1zqZKwCBVt
         lnfGrUiqy3FMMergz12+FuerwgGnJ3ovG540Ns9DY47UBo7JlfUai4zI56cp8hQQIcPj
         45UjuTcCMzVAMBaAW8j8Sci2zgndl7H0qh3aM0PJ4T1mKuTCFErYljkQ5p3GJGD3Hg8i
         OlSUCLFuDq5Outxf0hXGjDf8edMJlmAWJHlzutH5RiZMFl+QuYQDH2fqcohiYj9SSp2T
         MRWA==
X-Forwarded-Encrypted: i=1; AJvYcCWmNS/aDNpi/DDWSxJXS7hedOCzzMlSTLxr8zYcYTZeblBECJHr9iDQg9AD4W0AHr4qm3Dt@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzPUcfLO5+Yl32sSrWU9UzKV8BuFzy7uezXoseSIcp5vTsLgpc1
	aFRZq15fplythxhF2ZUk46x00HRIeX8H8eSBU/2Qak2+5H3SbltOHc9v4ToetJtc1Qg=
X-Gm-Gg: ATEYQzwFeSyv35fAKaAzXGMMwinyJnD07k77a9Fc/UjZQrKHoBc0jcvYfxKwg9SzeyA
	60RdvyYD2DCAkwjjE8Zi/rLjYDLST7jkysHjg1lllLNYjQDt4nNusw75lpFcblA6XZ5JSfafjUr
	b0uBZcldsdsuXEM7Ew9hiqYTJJLaJU8LLUaAwp6OcjWYq7ug8FbcX8+BSEYAUbxbypTxjfatLUZ
	zXvsOSn+cxSDOzomzqQXE+cD0wFq4Lgj5RxiekFu9lok/u5be9OcMfeLvkO257ffijn+RLscuRG
	RQ1NiqGLiS9AkXEHXCpHfe6i39D9lR6b/7XTTMeuYa+i6ggMCpYFHZZLPbqxZXnQNvx/Mc3wEp2
	E10/IdE2pIqx03sDY8UQaBuWF38pHyCBCRs6R316+nGzqwmqSJ3ODzaLYNwTAhdw1PL9sJ/2qQ4
	k4PALEdWG3C+XSHED4I7nLcRiapbO7yppyl/VIpNK67789VTnjce9I+DlvGjhVH3KIESg+41Vxf
	D234c7x62Zqs3Kj5BWFBTOAjg==
X-Received: by 2002:a05:6000:4009:b0:436:7ab:9290 with SMTP id ffacd0b85a97d-4396f16e345mr19094705f8f.1.1771890865980;
        Mon, 23 Feb 2026 15:54:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:81e8:821b:aad6:3899? ([2001:8b0:aba:5f3c:81e8:821b:aad6:3899])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9f77sm24294546f8f.5.2026.02.23.15.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 15:54:24 -0800 (PST)
Message-ID: <ff39746bdf0eaac7cf872d98338ed29f7dfa3832.camel@linuxfoundation.org>
Subject: Re: [docs] difference between RRECOMMENDS and RSUGGESTS?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Mon, 23 Feb 2026 23:54:23 +0000
In-Reply-To: <991f2abb-0cea-6fb3-7203-e81c5641c9f6@crashcourse.ca>
References: <5196619c-a6b5-a5a6-42fd-eb78308e8ffc@crashcourse.ca>
	  <CAO5Uq5SBWEtnW1svMNDokxUCwG7ft7dcyP87XYHtHTcVqKJLYw@mail.gmail.com>
	  <22c37f16-7352-9f81-22fa-030a265c3b2e@crashcourse.ca>
	 <579e881ff1fd2cd2a3b7221aa0a22cc19fb13a3c.camel@linuxfoundation.org>
	 <991f2abb-0cea-6fb3-7203-e81c5641c9f6@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 23:54:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8962

On Mon, 2026-02-23 at 18:51 -0500, Robert P. J. Day wrote:
> On Mon, 23 Feb 2026, Richard Purdie via lists.yoctoproject.org wrote:
>=20
> > On Mon, 2026-02-23 at 13:13 -0800, Robert P. J. Day via lists.yoctoproj=
ect.org wrote:
> > > On Mon, 23 Feb 2026, Alex Kiernan wrote:
> > >=20
> > > > I'd guess (and I can't pretend to have checked extensively) that it=
's
> > > > the same as Debian's:
> > > >=20
> > > > * Recommends: <package list>Lists packages that would be found
> > > > together with this one in all but unusual installations. The packag=
e
> > > > maintenance software will warn the user if they install a package
> > > > without those listed in its Recommends field.
> > > > * Suggests: <package list>Lists packages that are related to this o=
ne
> > > > and can perhaps enhance its usefulness, but without which installin=
g
> > > > this package is perfectly reasonable.
> > > >=20
> > > > The default is NO_RECOMMENDATIONS=3D"" so you get RRECOMMENDS, but =
not
> > > > RSUGGESTS. If you have NO_RECOMMENDATIONS=3D"1" I suspect they're
> > > > basically identical.
> > > >=20
> > > > On Sun, Feb 22, 2026 at 9:44=E2=80=AFPM Robert P. J. Day via
> > > > lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.=
org>
> > > > wrote:
> > > > >=20
> > > > >=20
> > > > > =C2=A0 the explanation for RSUGGESTS:
> > > > >=20
> > > > > https://docs.yoctoproject.org/ref-manual/variables.html#term-RSUG=
GESTS
> > > > >=20
> > > > > does not seem to explain how it differs from RRECOMMENDS:
> > > > >=20
> > > > > https://docs.yoctoproject.org/ref-manual/variables.html#term-RREC=
OMMENDS
> > >=20
> > > =C2=A0 what's missing is how to take advantage of a recipe's RSUGGEST=
S
> > > setting. unlike with RRECOMMENDS (which is installed by default, and
> > > you have variables to identify what you *don't* want), how does one
> > > use a recipe's RSUGGESTS variable? would i do something like:
> > >=20
> > > =C2=A0 IMAGE_INSTALL:append =3D "${RSUGGESTS:fubar}"
> > >=20
> > > to get fubar's RUGGESTS? or am i missing something? that should be
> > > explained in the variable reference.
> >=20
> > RSUGGESTS would only come into play when you're using a package manager
> > to install packages on the target system from a package feed.
>=20
> =C2=A0 ah, that clears it up, thanks. perhaps that should be added to the
> variable explanation in the reference.

Perhaps you could propose a patch?

Cheers,

Richard

