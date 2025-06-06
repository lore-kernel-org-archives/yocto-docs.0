Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4F4C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 08:07:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.28823.1749197272566771709
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 01:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YRgQzmce;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 772A944414;
	Fri,  6 Jun 2025 08:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749197270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEncTTz6i0xALCY87h/VTQpR/CC7YaEf1jaXzTwO3WU=;
	b=YRgQzmce9lFH/zGoqzzIjRilCI98tP6PDCZPzqzPJCSnVKFR4nwbIV14YspuFy2cCP+j1E
	scn5juDbsCZvsxNR2rVwdTbEBBOnYf2XaNGjvo4oqUIlxu7GRSS+ydpcHub4NfBE3k9/JV
	S2vSTGP8EWO9eMluzgEwGZTALHqa++fFqywQ92wtdjgDqoqwkNsxYxoJtj+CrLKK5NmD5t
	lTvO7zklqbNYrO0oGiygJHYcLxg+eAN9CnEne3WptbS54s7UjGzCtsDs+9xHR/tJJJBQ2M
	EKWSrgv88OpB1ogby5RDHPT0FSvkZKx4Zc45TceXUCfL9B/t4g2wfSkIApFsuA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 10:07:49 +0200
Message-Id: <DAFAOKE2FWFD.DPMX3RYZP4XR@bootlin.com>
Subject: Re: [docs] [PATCH 1/1] documentation: add doc for
 KERNEL_SPLIT_MODULES
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dixitparmar19@gmail.com>, <docs@lists.yoctoproject.org>
References: <DADJFKGJ4XZ5.19V8LUYOXBG4S@bootlin.com>
 <12982.1749125890901991398@lists.yoctoproject.org>
In-Reply-To: <12982.1749125890901991398@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtudfggfelvdejiefhgeevvddutdeggeegjeffhfdtkedtvdeiuefgvedtuedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeguihigihhtphgrrhhmrghrudelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 08:07:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7012

On Thu Jun 5, 2025 at 2:18 PM CEST, Dixit Parmar via lists.yoctoproject.org=
 wrote:
> Thank you for guidance.
> My idea was to have documentation for KERNEL_SPLIT_MODULES in the
> meta/conf/documentation.conf similar to KERNEL_MODULE_AUTOLOAD,
> KERNEL_MODULE_PROBECONF etc is there in this file. Not sure if that is co=
rrect
> understanding. Can you please suggest if we need KERNEL_SPLIT_MODULES in =
the
> meta/conf/documentation.conf or not apart from having it in the
> variable-glossary.
>
> I'd really appreciate if you could point me to correct mailing list &
> prefix(if needed) for variable glossary.

If you modify meta/conf/documentation.conf, the patch needs to be sent to
openembedded-core@lists.openembedded.org, because that file is part of
openembedded-core.

If you modify the yocto-docs repository, the patch needs to be sent to
docs@lists.yoctoproject.org.

Thanks for contributing!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


