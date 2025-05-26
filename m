Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F6AC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:22:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.24047.1748244113470211850
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SntHFMmH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FA9943E23;
	Mon, 26 May 2025 07:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748244111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcZCLbbzfzb+NY/M0lznGlRF1jyGMh6Ubp3iTEtKoCI=;
	b=SntHFMmH0qyKrqKebXE9G2TnQXqbrluo0u2Bfd15tSS0UkM8CVP5pejLiN/63v6eeuCYV1
	ABC5TNjUeGGm+p8rBYnUXrZ8DVBnaSZSEtYFEZ7o6LIZHZxevrH+OQGwFnztOAvCz+O1Q7
	PjTp2UYJDRPMih1BhOp6o3eTCjy5yBuhZez/m+WEoBOb1Gs0nuZfDziZXs55Wh0G69bh0j
	4AQg6EYI5JljN8wCxVkP/7iG3shxjs/qidzY4Z3Qvjl4HNPF4q/CTqWNPE9Iki7PU1HV71
	iXX5L+a4jtGZxSnpctWPlVDienRdxFmYHfEVsrCI6Vh4zOBcSJBo/qHK9LMqag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 09:21:51 +0200
Message-Id: <DA5WTD8PTV8K.HX1N50PHE9Z5@bootlin.com>
Subject: Re: [docs] [PATCH 2/2] sphinx-lint: unbalanced inline literal
 markup
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
References: <20250524014902.35467-1-twoerner@gmail.com>
 <20250524014902.35467-2-twoerner@gmail.com>
In-Reply-To: <20250524014902.35467-2-twoerner@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieeludculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedttddugffgledvjeeihfegvedvuddtgeeggeejfffhtdektddvieeugfevtdeuudenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:22:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6904

On Sat May 24, 2025 at 3:49 AM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
> Fix as many instances of unbalanced-inline-literals-delimiters as reporte=
d
> by 'make sphinx-lint' as possible. Sphinx and/or its linter seem to get
> tripped up randomly when references contain links to a heading which
> contain literals enclosed in double-back-tics; especially in the cases
> where a heading either contains multiple literals or when the literal is
> not at the end of the heading. Not all of them can be "fixed" to pass bot=
h
> building and linting.

Thanks! I also think it renders a bit better as hyperlinks.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


