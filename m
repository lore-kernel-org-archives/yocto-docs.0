Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE559C61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:01:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25530.1788166913368345620
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 02:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aaRIYV53;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 468AB1A18EE;
	Mon, 31 Aug 2026 09:01:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E6D76054B;
	Mon, 31 Aug 2026 09:01:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62FCE11C78AE3;
	Mon, 31 Aug 2026 11:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788166906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QsbG7MdClZAaxJeyf6ZOmXA//vqEVDQvfA9znOVgd4c=;
	b=aaRIYV53+GWuN5tGU14ZLoK0ZAu1VRpv3UF17QbOzuf4KRUHWyFaPG0rS4y/3UofxK/22A
	iKHre2WeBLR/FdyEFHbuf8ndziy2kdAZy1LUjGa99tJiXOEKz6C3b6ioTyb4dUazy7nEEJ
	8UG8VHFk+//pCUXdGi+McfydInCO3847QJ3gE5/RkMdQdJSbJl+TMXxas2TmflhxBsilCG
	3Odo5A1Wa/LsHnwJDAiQvLKDdGXq6wm2CFpapfPuLi+Av7Kpd22LJGwZd+5d9fIAOdpaCU
	N+1TJqENM14yPEs5ob0D6SplrLXw38LzqIukh2z7ZQJvhNutgXNxNghO02XYgw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 11:01:44 +0200
Message-Id: <DL309JI7KO5S.31U2Y9LIHSH9Q@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Trevor Woerner"
 <twoerner@gmail.com>
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
Cc: <docs@lists.yoctoproject.org>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <ao7pU4NN4uuZDzS1@localhost.localdomain>
 <66624f77-ae0d-4670-bd99-c6ea9d2b2a54@cherry.de>
 <ao9E-I2EAyMrtlIR@localhost.localdomain>
 <121fe43e-bdec-4f2b-9f54-e92dfa887e33@cherry.de>
In-Reply-To: <121fe43e-bdec-4f2b-9f54-e92dfa887e33@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 09:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10417

Hi Quentin, Trevor,

After having thought about this a bit more, I think there are pros and cons=
 to
both approaches, but I'm leaning towards Quentin's approach. The other appr=
oach
may feel "safe", and doesn't leave room to errors, but I'm afraid that 1. m=
ost
contributors will forget about it and 2. it might make the process more pai=
nful
for them.

So here what we should do:

- set `hightlight_language =3D "bitbake"` in conf.py.

- remove file-wide lexer enforcing (.. highlight:: directive at the top of =
the
  file) (in a separate patch)

- use the appropriate lexer for each code-block that is _not_ bitbake code.

- fix any parsing error from the bitbake lexer (I did have some when trying=
 it).
  If this happens, use "none" and *add a identifiable comment* above it to
  explain that there's an issue with the lexer. This way we can track them =
and
  fix them when Pygments gets an update.

- document this way of proceeding in standards.md.

If you think of anything else we should do here, please share your thoughts=
 :)

Trevor, if you want to send another version of your series, please rebase o=
n
*master-next* as it contains cleanups to the conf.py file at the moment (+ =
some
possible additional code-blocks).

Thanks both for sharing your thoughts on this!

Antonin

