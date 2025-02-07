Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C7FC02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 10:30:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.66478.1738924242393971314
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 02:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dOwzm+wN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436a03197b2so12601665e9.2
        for <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 02:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738924241; x=1739529041; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKLFImoHMqiyM7yCBHjfJNMh18OxqoOMIBb9M1ngORQ=;
        b=dOwzm+wNlY2okm8ptRQHs7on3NUpxpU3SveWiWbhClOAdFAZLjRASWqaigka0Xqu8+
         WRD+3Xo0Psvq1i8JrGHI5MCfw4iGy06VGo38GIvqPTFNRfbqv8eYuQKMkM8lRMHG4PRI
         6vFc9TsFXAcnEXpuDYGxvkG+EhP/QVPXAwtRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738924241; x=1739529041;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKLFImoHMqiyM7yCBHjfJNMh18OxqoOMIBb9M1ngORQ=;
        b=SiqDDU3Qnuki0Ike98V9HeQXP7bgjPkmsDEZRqC32nMhjyzA1x5LwR0D8B514zCSFd
         HTH3pur1UaETbZ/ydEs9eqb3QYscLGpCZhdLm3e8c+M1frsGuM1D3pOwfXEQ8ywu2Jjl
         /jQh7K5OlpJsT1CKkmEYOrTHLGfY9Ors/SQechwNolRC8k3EBMC5t0LLYo5IiEAW4taZ
         SN2HqDbUOMB4orjQ7zN6SrArVB/onaf2IdahZ2ZZgLCwZVrrFC9whcPn+Uw4vv4xDwOH
         pfLxXUJTS+nMn5I9ayXKDBoIk1hUZpaRmDQhB2yVWDX6LdCUJmxVEk6g7PH7ucWsXJ2f
         JyWw==
X-Forwarded-Encrypted: i=1; AJvYcCVPtG3uMcWWiFuKgcIF4VYGMrzHV9N/hrsrdNMphe/suCmP92QWqkuWXFJPnib5eJTeFtnG@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YycWMKhCFh9OGEG67sDl+FEIAvaVWz6giPvkpjoiDiPjkL2mntX
	nVd7PREMvYfksYOMWVGnQOcFNzSi4VeLmC4inyLBpw53X2mHN1xNCEh+fXLd6W8=
X-Gm-Gg: ASbGncu+SubU/s4zH3WQAN69prb8N5bokGU7EQyYve1Gp860h1NKs4pjx+8U0nuAt2z
	wu67aKjKaJyBPRRLBOLRuo50luqNnFkaBA2DPcUSRwAa2CIE53mRQ+ECBjA7smJE5pd+R7afhaK
	N1yqZF8OwPQjq9KZ3neZt/bV6Sf09eXxXkgErDvuJnb7ymg4irNh9iBAVN8gH8EGXigpU1XE2Hm
	lrBd8AgSt++HblU8NPb/2QKsMEfFBRvoMx9j4pRNAfMed6Z2wKdHAql7rxGVBjarKXHGlADYY9D
	bYBuZp9573G+R3Ts3EJNeS490VEZRTMSnL45/dwmvHCuSOLmroqlN9bOBnisP0j6rE7Eb+FaBJ5
	Kf9b1
X-Google-Smtp-Source: AGHT+IE5cmfjsIdyxNNFVE/q6H77rl9Bj+APToKTbOztNAesNYDH19g1TwiH+nGNtU07u1cFfWxcuA==
X-Received: by 2002:a05:600c:cc8:b0:434:feb1:adcf with SMTP id 5b1f17b1804b1-439249ca918mr17667395e9.25.1738924240723;
        Fri, 07 Feb 2025 02:30:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcae:28d1:c97a:4196? ([2001:8b0:aba:5f3c:dcae:28d1:c97a:4196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc888csm48860445e9.27.2025.02.07.02.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:30:39 -0800 (PST)
Message-ID: <844fefabdac140f57dc0ea9b9fd92db95cda0749.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] add basic b4 config file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, quentin.schulz@cherry.de, 
 Quentin Schulz
	 <foss@0leil.net>, docs@lists.yoctoproject.org
Date: Fri, 07 Feb 2025 10:30:39 +0000
In-Reply-To: <D7M55FM70177.BPEH6BEQMQOU@bootlin.com>
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
	 <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
	 <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
	 <1f9d3cd9c29beb5dd645eae977e34046e277b1b6.camel@linuxfoundation.org>
	 <D7M55FM70177.BPEH6BEQMQOU@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 10:30:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6293

On Fri, 2025-02-07 at 11:28 +0100, Antonin Godard wrote:
> On Fri Feb 7, 2025 at 10:53 AM CET, Richard Purdie wrote:
> > On Fri, 2025-02-07 at 10:26 +0100, Quentin Schulz via
> > lists.yoctoproject.org wrote:
> > > At the same time, I've done some shady stuff with b4 for poky where I
> > > check (rather **guess**) if the current patch is the last patch in a=
=20
> > > series. c.f.=20
> > > https://git.openembedded.org/openembedded-core/tree/scripts/b4-wrappe=
r-poky.py#n44
> > >=20
> > > > In any case we might also use your container scripts for this
> > > > (which I will get
> > > > to soon hopefully!).
> > > >=20
> > >=20
> > > That itself may be adding a lot of time to the test since we need to=
=20
> > > compile the container first. Additionally, remember that absolutely
> > > NO=20
> > > message should be output to stdout or stderr by the script otherwise
> > > the=20
> > > check is understood as a fail. I'm wondering if we couldn't add
> > > support=20
> > > for a PIPE between b4 and the scripts so that we can ask it to print=
=20
> > > stuff (e.g. "please be patient, this may take a while" and maybe even
> > > print some progress). For example, I briefly added some WIP support
> > > for=20
> > > patchtest as prep-perpatch-cmd in OE-Core, but it takes a long time=
=20
> > > before returning something, not very user-friendly :/
> >=20
> > My view is that any preflight checks should be relatively fast. We
> > could ask someone setup an autobuilder in a container and run the whole
> > AB test matrix but that would be unfair and crazy! :)
> >=20
> > I'm fine with having two levels of checks but I do think we need
> > something relatively quick by default else nobody will use it.
>=20
> After a clean build, for me it takes ~10 to 15 seconds to build the docum=
entation
> in html format. Most of the time is taken to index everything, so the out=
put
> format doesn't really matter.
>=20
> So, quite a long build from my perspective. Not sure there's much we can =
do
> about it, though.

10-15s is fine but how much setup (time / network bandwidth / disk use)
is needed so the user can actually run that?

> We do have sphinx-lint, which takes ~half a second for variables.rst (lik=
ely the
> biggest file here). So we could perhaps run that against each file the pa=
tch
> series modifies (per-commit).
> We would have to solve the existing issues, though! :)
> There are also areas of improvements for this linter, for example enforci=
ng
> three spaces for indents, etc. I'm willing to put some time into it, if t=
hat's
> an option we consider for b4 checking.

It is worth exploring, I just want to make sure we don't discourage contrib=
utions.

Cheers,

Richard

