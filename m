Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF1EC36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 17:49:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.2225.1742924947688013745
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 10:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ql7z2mR0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0618746bso41103525e9.2
        for <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742924946; x=1743529746; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9fGdQRUEJjttc6jTA3ESli94bm2GxQ09TBcWVbFkHxg=;
        b=Ql7z2mR0wMTbf+v3akjcpAPwjSih6/xm5hk9PjMH05mY/jAJ/g/1vfSnvQBVf7q1R6
         9XeQFlbQS2T0p5squCh/PG9ZK4FjZmHF7dCsOVIRyTDAZjs7CmLbfLwSHVXnUh0w1QLZ
         lRMnqjnGpNxsEz+vBXgw/qHaIXba3QwKXyX4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924946; x=1743529746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9fGdQRUEJjttc6jTA3ESli94bm2GxQ09TBcWVbFkHxg=;
        b=f+7Ty/U75A68wp3QlYpkBrDxg88P7OXFVItKF2NPU1D9eeqsV7HRJ83laL7OuvgNt0
         xbZFbeMfcrnrKeaa7mEFrK5OXKnNDPhQ1NwBPpH2bFz9TPhwy3GIqDXPRIWd1EG6pmmY
         jJLmb3JaJWi9fVSVXLvib/D3ZhIHLWyrypxr/Pr4NdtQBbsYrAx+xDcPcO+vCiQLX8nd
         ZtzI3+05c3Kg6j09/iIGhA569zK4cKqu7acCdW9VphoF9OyX0Oj96bpiAd/Yd9/umZQv
         qqCLQxuaBW/eEVuEFW/9/1PP+LatsvYxnbU+ZVnIAEof5+x9PF87R8KinrQrv2Jd0QJo
         3nng==
X-Gm-Message-State: AOJu0YzU5u/qA0Ul/KeAx1wbovlaXe6R0MaKRMTSgcEMhz/Hr+Icm16B
	dUdWB/Yfq4wU20KeyqbWJ2Y9vcDxtmYp22J0mmFqqDWCjQ2walswIrOMerkLaNQ=
X-Gm-Gg: ASbGnctJHgs0hS0ao6DWaMoWp3lmwLlgm93q/D4LXBbiygoYxviX3oq8X/bCy7lWEt8
	Aa8Sey0ZWa7rpdbs+84SkbUSW3y0VQtYDdASXpRGKlpaMiSJQRJf2eywkl/1DEvlZQj0B0FY5NV
	lSFNfVDlLYtFfy/tlIYKcQhm+gsGywOWkVEZfIc7KcNOsNTdcVqtNdh/0pKGq6R2Xf0Vjz445RL
	umNRei6CRY4NrU93gPh7yV+EabVGr4D3B/HHzxCzj/HI2OLfRTZsj4rSKi8kKljaabJ1bb7HSmm
	lHYSRDBfYSpi3LnBCOgCnvJmEyD7yChwFnwGiEul3hDtaRcMiPNA5TFjtdtVfR14DXLHWYNTMNn
	zJACHhaXdw6BtTC/SYLd2l/q7bBzkj28DuN+ZaVvTHOPb
X-Google-Smtp-Source: AGHT+IEQx0H9sn55V5pVjNcWsDo0qIQwBx1Vs0eZB7q7dH8RwvdJpw6Fp+TBpgdGCRJi/dnvUmFMTA==
X-Received: by 2002:a5d:6d81:0:b0:391:29c0:83f5 with SMTP id ffacd0b85a97d-3997f94da3bmr16175842f8f.44.1742924945687;
        Tue, 25 Mar 2025 10:49:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd49:ef6e:5ada:f0b5? ([2001:8b0:aba:5f3c:bd49:ef6e:5ada:f0b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eef37sm14063962f8f.85.2025.03.25.10.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 10:49:05 -0700 (PDT)
Message-ID: <605de159f6b70b6750fa94cb5268511ff2ce84fd.camel@linuxfoundation.org>
Subject: Re: [docs] [bitbake-devel] [PATCH] doc: Mention `if [[
 somecondition ]]` is not supported
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, javier.tia@linaro.org, 
	bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 25 Mar 2025 17:49:04 +0000
In-Reply-To: <92482b25-bd0e-4a9d-82f5-1fd4fdf473cb@cherry.de>
References: <20250320003358.977774-1-javier.tia@linaro.org>
	 <0531cca3-683c-4ec3-853c-59da9492c8b6@cherry.de>
	 <7275d5d500666f6278ec7937ab15ceb10cdf4f58.camel@linuxfoundation.org>
	 <92482b25-bd0e-4a9d-82f5-1fd4fdf473cb@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 17:49:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6629

On Tue, 2025-03-25 at 18:30 +0100, Quentin Schulz wrote:
> Hi Richard,
>=20
> On 3/25/25 11:14 AM, Richard Purdie wrote:
> > On Tue, 2025-03-25 at 11:04 +0100, Quentin Schulz via lists.yoctoprojec=
t.org wrote:
> > >=20
> > >=20
> > > On 3/20/25 1:33 AM, Javier Tia via lists.openembedded.org wrote:
> > > > I keep forgetting using `if [[ somecondition ]]` is not supported.
> > > >=20
> > > > Signed-off-by: Javier Tia <javier.tia@linaro.org>
> > > > ---
> > > > =C2=A0=C2=A0 doc/bitbake-user-manual/bitbake-user-manual-metadata.r=
st | 4 ++++
> > > > =C2=A0=C2=A0 1 file changed, 4 insertions(+)
> > > >=20
> > > > diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.r=
st b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > > > index 415fbf6d6..5474e154f 100644
> > > > --- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > > > +++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > > > @@ -1381,6 +1381,10 @@ To make use of this technique, you need the =
following things in place:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 To call your modified version of the=
 function as defined in your recipe,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 call it as ``do_foo``.
> > > > =C2=A0=C2=A0=20
> > > > +=C2=A0=C2=A0 .. note::
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Conditional expression using ``[[ s=
omecondition ]]`` is not supported.
> > > > +
> > >=20
> > > Do you know what the reason is for that limitation?
> > >=20
> > > The example above this git context is not really implying `[[
> > > somecondition ]]` would be valid though.
> > >=20
> > > If I remember correctly, the shell functions are run by /bin/sh
> > > interpreter, so it depends on which shell you have configured by defa=
ult
> > > in your system. Is it possible this is due to you being used to devel=
op
> > > with bash where this is possible and having your Yocto build run with=
 a
> > > different shell (e.g. dash, which doesn't seem to support that? c.f.
> > > https://manned.org/dash.1)?
> > >=20
> > > I think we should recommend people write POSIX-compliant shell functi=
ons
> > > and tasks rather no?
> >=20
> > Bitbake parses the shell functions and our shell parser can't cope with
> > certain syntax unfortunately.
> >=20
>=20
> Ah, I see. This happens before the shell even runs the code. Do we=20
> happen to have a list of things/syntax we cannot parse?

There are open bugs. I did recently run into backgrounding not working
in the pseudo reproducer so I just used a separate script. Not sure we
want to support background processes though.

> I think it therefore deserves a bigger place than a small note, maybe
> e.g. a sub(sub...)section of limitations?

Patches welcome!

Cheers,

Richard

