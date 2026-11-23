Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50159.1795423736109300886
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2026 00:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NBuOaF4k;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 515CB1A17B1
	for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:48:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 219285FAEB;
	Mon, 23 Nov 2026 08:48:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A26E11E681B3;
	Mon, 23 Nov 2026 09:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795423733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m5fWuV3WAHcGCEA6AyZRIoyEDnrsd/OY6VpHx6pmYeU=;
	b=NBuOaF4k2lU3tpOKyGpR3sILjOtm67mgDNiWNrz77swelakZvqpu6gUrYKvPUtDnJibq/d
	S/D25dLUEmkB6Vl6PHEMUZUnvQ+PdQmVE/Yrc43rQmVqxMTGFqznx3x0dL05kVcPEzw1s5
	ZPCODhtduAvAtesQEa9AbX+pjTZOcAy5n4BgFBeVxUTJQk339/ZRu5kbj7dYK/CGHzYfM/
	6/HUapAwOPWgCquPU/dJetciivgU8dTNzIoWzEeDKYGpkin05r3SX1oWo3SeqLfrNufuOn
	F1X0iwfGgj/pWTtHGMzk/T4xcJNQLy7zmK/b1K1eubw2eramv8FnW6nKzjLN1g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 09:48:53 +0100
Message-Id: <DN2GLGFNM93D.14XTI4TCPERBO@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/8] tools/host_packages_scripts/pip3_docs.sh:
 update for sphinx-tags
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
 <20261028-tags-v1-2-d5ad01019eae@bootlin.com>
 <a4c205b4-f4b7-4307-b01b-9ce9d950b9da@cherry.de>
In-Reply-To: <a4c205b4-f4b7-4307-b01b-9ce9d950b9da@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:49:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10824

Hi,

On Fri Nov 20, 2026 at 6:26 PM CET, Quentin Schulz via docs wrote:
> Hi Antonin,
>
> On 10/28/26 9:04 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> To prepare for the sphinx-tags addition, update the container build
>> scripts and add sphinx-tag, as well as sphinx-design which is a
>> dependency of sphinx-tags.
>>=20
>
> I was wondering why we need to make the dependency explicit if it's=20
> truly a dependency. It's only an *optional* dependency, hence why we=20
> need to explicitly install it, it'd have been nice to say that in the=20
> commit log and what we plan on using sphinx-design for.

Indeed, I forgot to detail why: sphinx-tags picks sphinx-design when it is
installed and uses it to generate badges in CSS. It isn't used for anything=
 else
so I didn't add it as part of the extensions.

> Same remark for the Pipfile patch before. I would actually just squash=20
> patch 1 and 2 together as they really are for the same purpose. Possibly=
=20
> even patch 3 as 1+2 don't make sense without 3.

Yeah, that makes sense, will squash and amend to detail why we have
sphinx-design.

Antonin
