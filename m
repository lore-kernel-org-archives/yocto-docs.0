Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6A1C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 14:34:06 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21563.1789396438338013321
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 07:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iJusjvB7;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso16066485e9.3
        for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 07:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789396436; x=1790001236; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RxkfF0KbpbMo2v8tPVl7iDAAmJlkjGexa4oWvPkVSpU=;
        b=iJusjvB7JlPpZnsW9zhab6godZyzZ2g60Jd8xMayE0T3EDDAYw2ysSvRvlqSdZVWu3
         r+LN8ZISYz+nGVdtL7RXyzyg55wJQ8EXRtb+qLfr/mNGwsP0eVPwYO8vLs9/S2XJBFlR
         ov5sSyaRU14FBHknzSUwtw2jlXsOfpIiEf5aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396436; x=1790001236;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxkfF0KbpbMo2v8tPVl7iDAAmJlkjGexa4oWvPkVSpU=;
        b=f8Qt2sEgaO5wh+QhJUxrrhOssx8A+uVKOwwrZygfL1mKZ2yy1ojOk/LNREglE2igrx
         NTCyJvsmYPF8/OaR16rgEoGV4N6LWQh/km7l9QZ6Nuyq4vcRe547nSpHriUXNEoMUHii
         8kPXbcpdKsFf4T3+/QlkDOC5FGC42sDg0gAXPa4PQ55Qbqj0/288btBtgxS85smNDPKJ
         GFN8tDnwB5gsYA9d+HN2dpkPXS/UvNlteTJcRGplmTsrA0A4B7OE+1xdmrdpcQ1xQc/a
         hkf8gAhztqwJlQILeXovX0nuYjSik8dXNDaaItuefSbHNpZTDhsk4mp/aknalVYc/BdZ
         UP8A==
X-Gm-Message-State: AFuF++mRWEM3tesyF/V63ewZEDN2pqSTweRVubTorzw36ksvSvIGro6B
	uIBhjl0nvubYQeSfjH+czFU3c8W4H5G1x0Y7FCA0qYVrzoK5qbzyNkIKX0mmG+Au9k8=
X-Gm-Gg: AYBFou1AvFtfXae5DIJM0f6EGPMHkhkbu06ykRK+XshppNl+YVaZ9HHE4m4B5rMkvQO
	mgD/lboz5extvgXOSPIfu8kRD27rpyc/S/THGZrybBsWDcZS48lX37qGXNFT/shpNMaQ7vAXUrS
	YV+V3frOIG/UHd/xbwMU2duunwLsCiu0rv4WH2ijywLWZvsKv0yAy3rOFIu722eSkhASI0/fc1v
	DXLyMYT/o2fOcKFkWV5r8FscwSD03IcYcP51IPOfWv0rO6KuSo4pdGrBAPCDi5wEA43OZI8cMPV
	iIubcriT12FWWA6a5yKLXkacNaiIl8+m0c5THisefWIEK7awlNZCaeS6HYvj0kenIv2JUM1vaPQ
	25ZcKgTU3xbJrmkcLJhjU08xwX2yZJAD0K56DLfwcgijvnIlwb4zna0l7SsjNas2kGBExgtSpsm
	ye3dObDsmWC6Jcepgw0cipVA8xb7kTldPwA5ht7fua/jnUVzHaPyyM/DQGIVNY4SFk3YURsmY1G
	bwNvAxlpoCtMEDYNY0zE+cjD2Doz7WkYbYsYqREzKfQfKEqV4PsP9UiiKybwEG6
X-Received: by 2002:a05:600c:3583:b0:49e:645e:2616 with SMTP id 5b1f17b1804b1-49e7a637631mr46994465e9.5.1789396436465;
        Mon, 14 Sep 2026 07:33:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e738:2a19:1746:7e8c? ([2001:8b0:aba:5f3c:e738:2a19:1746:7e8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm482966855e9.14.2026.09.14.07.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:33:55 -0700 (PDT)
Message-ID: <f90a94a1719d52ad8188706757114f5631e7e497.camel@linuxfoundation.org>
Subject: Re: [docs] how should one update "dual, six-core Xeons"?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Antonin Godard
	 <antonin.godard@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 14 Sep 2026 15:33:55 +0100
In-Reply-To: <5cbbde75-6821-a4e5-f44e-8290522cf53c@crashcourse.ca>
References: <b13f1dcb-14aa-8063-e9da-96817167a9aa@crashcourse.ca>
	 <DLEWHJ0DKML4.2ITSSJJ00H3ZG@bootlin.com>
	 <5f70fb6ea6d2c9a4a24f476f463ab1adf02aa7e5.camel@linuxfoundation.org>
	 <ffbce176-bd78-f316-dd71-dda8ae2dd8f1@crashcourse.ca>
	 <DLF1KOQ6EK65.32CUFMXM5545U@bootlin.com>
	 <5cbbde75-6821-a4e5-f44e-8290522cf53c@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 14:34:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10493

On Mon, 2026-09-14 at 09:01 -0400, Robert P. J. Day wrote:
> On Mon, 14 Sep 2026, Antonin Godard wrote:
> > On Mon Sep 14, 2026 at 11:46 AM CEST, Robert P. J. Day wrote:
> > > On Mon, 14 Sep 2026, Richard Purdie wrote:
> > > > On Mon, 2026-09-14 at 10:36 +0200, Antonin Godard via
> > > > lists.yoctoproject.org wrote:
> > > > > On Fri Sep 11, 2026 at 8:08 PM CEST, Robert P. J. Day wrote:
> > > > > >=20
> > > > > > here:
> > > > > >=20
> > > > > > https://docs.yoctoproject.org/dev/dev-manual/start.html
> > > > > >=20
> > > > > > it's amusing to read, "These systems, in general, should be
> > > > > > high
> > > > > > performance (e.g. dual, six-core Xeons with 24 Gbytes of
> > > > > > RAM and
> > > > > > plenty of disk space)."
> > > > > >=20
> > > > > > would someone like to suggest a more modern configuration,
> > > > > > and i'll
> > > > > > submit a patch.
> > > > >=20
> > > > > We could simply say: "&MIN_RAM; Gbytes of RAM, at least
> > > > > &MIN_DISK_SPACE; disk
> > > > > space".
> > > > >=20
> > > > > Those are replaced by our poky.yaml.in replacements when
> > > > > building.
> > > > >=20
> > > > > Not sure we need to mention a processor model here, as it
> > > > > would become obsolete
> > > > > in the future.
> > > >=20
> > > > I think the key is to mention multi cored system, "ideally with
> > > > at least 16 cores"?
> > >=20
> > > =C2=A0 i can submit a v2 with that info, but would that be hard-coded
> > > since
> > > there is no variable in poky.yaml.in that relates to that.
> >=20
> > Right, I think we could hold this value next to MIN_RAM and
> > MIN_DISK_SPACE, so
> > we keep all of them in sync.
> >=20
> > I think we should add MIN_CPU_CORES in a patch, then use this value
> > next to
> > where MIN_DISK_SPACE and MIN_RAM are used in the docs.
>=20
> =C2=A0 we can do this in two steps, and someone else higher up the food
> chain can peruse poky.yaml.in and decide if there are any other
> variables that can be added that would be useful in the docs, after
> which i'll submit a patch to take care of my little issue and others
> can think where else those new variables can be used.

Can you not just send some patches helping to fix the various issues?
Do we need "someone else higher up in the food chain"?

What you're doing here is creating work for others :/

Cheers,

Richard

