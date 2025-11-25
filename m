Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96780D0E6E1
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 13:12:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16720.1764076335040150172
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 05:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=elZCkgjp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8CF824E418C7;
	Tue, 25 Nov 2025 13:12:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4BC82606A1;
	Tue, 25 Nov 2025 13:12:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6366102F0812;
	Tue, 25 Nov 2025 14:12:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764076331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BG3CUe7aiA7yJtX1dTCOKTZI8O/Ekq/2Gj5zo3w3aHU=;
	b=elZCkgjpQDBWS2Us7cuPJ9MapcAjSunIMEENY0nttdQdi4tyPckej0k6k1ik/AV6JdpFA7
	9wZEMsjdSFp7ZVvYunVfRwgibPT3qDwCe6pEl8GyoerEUR+g8X0f3S4hobYP9bmWZ3boi8
	Qj0HMwmceQWmkyEgBkT71CkJwYsECZfxN5T94U49We9oB2GH4Jq9Mu3ZejxxUXI6YHN9sY
	U8375Ss5iD5CwbpIDtGi9RjkTY49+wuB1o0iR4i+cTK3pgYHpvg4jyTsdbbspPR97HXnDm
	6KBLYxCIqJk6fgfqDthH+J1EsU3WQ4ceLegzkXBgkTcwgPX/akUoifhwPlmUbA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 14:12:10 +0100
Message-Id: <DEHSVACWEQGR.3LSFE5DPMX6O8@bootlin.com>
Cc: <peter.marko@siemens.com>, <adrian.freihofer@siemens.com>,
 <stefano.tondo.ext@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <stondo@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v5] ref-manual: Document SPDX 3.0.1 variables
References: <20251125100114.24243-1-stondo@gmail.com>
In-Reply-To: <20251125100114.24243-1-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 13:12:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8115

Hi,

There's still the JSON-LD references, the default values hardcoded, etc. Ar=
e you
sure you sent the right patch version?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


