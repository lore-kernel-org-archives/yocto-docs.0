Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66747C02190
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 16:01:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.16084.1738166480814392866
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jan 2025 08:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fFJKdyTF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95EDC44296;
	Wed, 29 Jan 2025 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738166478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I7zhZdakoQeDwHvoyo9yJmdoBmcCgDlZRUx0d6TJ50s=;
	b=fFJKdyTFoq691q7ZJT6ui18A4jFg6TeElydRFNADCUflKhHh2jLKUs90s9b2YaLlJ6FXaH
	rPvT5t7fIqpjszdhN96zgpLqVmaTx6lKNdgysSnYC0V2p449p1cOKTokeep8NZD9icr1vZ
	Vw5jQtXsYpFnNoYfPRSyC80gOMl84owa2T3+JmeBJuS/QYt2tGY4a0Q+p+8v5DtdwA8n7F
	Ve6Ao1pYU5oMguEpYKuqpOE1FHec9qX/Jr1s2K9vZ/N9X1/yCkmIZOBWWBuMjNoPc2w0T5
	cQ9HfPI9/2yHAA7CA+qeq0uv4h+NsTy9VFE9FEHHyVLhQBMip+d37BC0czWuqQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 17:01:17 +0100
Message-Id: <D7EOLC4ZK19U.2LTX3ECHEWQCN@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <zboszor@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/2] release-notes-5.2: add information about rpm
 and sequoia
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250129141849.838672-1-zboszor@gmail.com>
 <20250129141849.838672-2-zboszor@gmail.com>
In-Reply-To: <20250129141849.838672-2-zboszor@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhveehhefhgeejkeegudeuiefgudeuuddvtdevvdejtdefveeiudeihfehgfdvkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepiigsohhsiihorhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgp
 dhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jan 2025 16:01:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6213

On Wed Jan 29, 2025 at 3:18 PM CET, Zoltan Boszormenyi via lists.yoctoproje=
ct.org wrote:
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  documentation/migration-guides/release-notes-5.2.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/docum=
entation/migration-guides/release-notes-5.2.rst
> index 06dce8d17..b0e538700 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -226,6 +226,9 @@ New Features / Enhancements in |yocto-ver|
>     -  ``package_rpm``: restrict RPM packaging to 4 threads to improve
>        the compression speed.
> =20
> +   -  ``sign_rpm``: ``rpm`` needs the ``sequoia`` :term:`PACKAGECONFIG`
> +      config set to be able to generate signed packages.
> +
>  -  LLVM related changes:
> =20
>  -  SPDX-related changes:
> @@ -300,6 +303,7 @@ New Features / Enhancements in |yocto-ver|
>        -  ``gdk-pixbuf``: ``gif``, ``others``
>        -  ``libpam``: ``selinux``
>        -  ``libsecret``: ``pam``
> +      -  ``rpm``: ``sequoia``
> =20
>  -  Miscellaneous changes:
> =20

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

