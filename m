Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB53D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:46:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16220.1764337582935970779
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 05:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lW1pwcIm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0A0E81A1DFF;
	Fri, 28 Nov 2025 13:46:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE74760706;
	Fri, 28 Nov 2025 13:46:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F79A10B01EDC;
	Fri, 28 Nov 2025 14:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764337580; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IDdEuMtYKa3hulLfcxF/JlBTz+j5x710PIR95rPBwGM=;
	b=lW1pwcImDvh/rwaX7l30c7TjbyGkft2DQm7p536U4yurqWRg4EorGpRd9r8Fqn0W/VhgiM
	c37VTtU1z+ApfuqF4gDmxnHbxRaov3jMxp9nKwkqB9KMTQi44yUmUmWsIAKNj3oQLokMED
	D96V2x0gn9sGHdMXk3Pjz0+WKBIMp8pOah0bNzK9MicoYF6d3QGkXbpFKhMFHq67LDw/Gv
	TGsbx67ehGf3VUjO1KjoC4oU/mcKDS3kAKM2221wMjoE7kuPRz/h6Z5DxHE4wiuBwSRjcn
	2gtrS1DLW6UhvgiMsttf0NW/R1L6g4iK8W/vqi7p722s81W/ds8jXUbZFuXsdw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 14:46:18 +0100
Message-Id: <DEKDH2B5L1HA.1TTPB0U4MFRJA@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 3/3] brief-yoctoprojectqs/index.rst: switch shell
 block to to console lexer
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
 <20251127-bitbake-setup-updates-v1-3-75ac1e490a40@bootlin.com>
 <1d128f7c-1af4-4e11-9ce9-b72cecff0485@cherry.de>
 <DEKCQCLV0UHY.2TD6EXECC6FA6@bootlin.com>
 <83cdb96c-fbf6-4a5c-a2a7-97f748a3ba1b@cherry.de>
In-Reply-To: <83cdb96c-fbf6-4a5c-a2a7-97f748a3ba1b@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 13:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8162

Hi,

On Fri Nov 28, 2025 at 2:30 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/28/25 2:11 PM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Thu Nov 27, 2025 at 5:47 PM CET, Quentin Schulz via lists.yoctoprojec=
t.org wrote:
>> [...]
>>>>    #. Choose a configuration (for example, ``poky-master``):
>>>>   =20
>>>> -   .. code-block:: shell
>>>> +   .. code-block:: console
>>>>   =20
>>>
>>> Neither shell nor console. I would suggest to simply use a literal bloc=
k
>>> (::), c.f.
>>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html=
#rst-literal-blocks
>>=20
>> Thanks, I'll change that.
>>=20
>> I just noticed but I think the default lexer for literal blocks is Pytho=
n unless
>> you explicitly set it to something else in the global configuration[1]. =
I think
>
> Ah, and I had missed that. I changed it to shell for my company's user=20
> manuals but I didn't know it was Python by default (well some sort of=20
> Python).
>
>> it makes sense to change it to "text" as the rendering looks odd in most=
 places
>> where it thinks it's Python code, whereas most of the time it's either t=
ext
>> snippets or bitbake assignments.
>>=20
> I would recommend picking a sensible default. Since there doesn't exist=
=20
> a BitBake lexer (and I don't see a MR for that in pygments) yet, I guess=
=20
> going for "text" or "none" will do. Good catch!
>
> This though will get rid of highlights where it is (to me) somewhat=20
> useful, see most blocks in=20
> https://docs.yoctoproject.org/ref-manual/variables.html. Maybe it isn't=
=20
> *that* worth it. Up to you.

Yes, re-reading some of the docs I also noticed it would get rid of some us=
eful
highlighting, so I think for text blocks we should use .. code-block:: text=
 when
we think about it. I'll use that for the quick start guide.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


