Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E21C02199
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 13:48:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.69544.1738936080802910493
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 05:48:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E3Pnzprf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5886F4427D;
	Fri,  7 Feb 2025 13:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738936078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=79J7HOuaChoZTcXETPp9ZEzhkckn3PkaMNp+Q1vA6lI=;
	b=E3PnzprfWiFfNYLprj2DPuGh8p/rP3IdUyuU8HOXfH0KnNtKXBI+LOFcn4vG3setdoceA7
	XAXoo/EXumowb0l/ix+tqU8hT/3FeYwNGfKZ1/ZhUN3rBj08r8OT4ToG2HLI0UMufUOXw3
	mot6cJW1nC3T2yj6mAEYjNMIIEPLXepb8W2DfB11dxHYYxL8DsWHgVB1aOg4/51K09oj5n
	wGI0mZhRtUahmi5ifdEuff2yjGvc+qtZF7zM8VyCJABtQ7/OGZM4m36q4bYUP12yGj22wn
	cltox/AzE1sTaRox6yq5jnLKGbGVpTeGLJkHTj2L0hian21OtEKfLyQoMQCMtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 14:47:57 +0100
Message-Id: <D7M9E5V344EE.1K4CNWX9E62XB@bootlin.com>
Subject: Re: [docs] [PATCH v3 0/2] add script for containers building the
 documentation
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, "Quentin Schulz"
 <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250127-instructions-shell-container-v3-0-9373d3f156f5@cherry.de>
In-Reply-To: <20250127-instructions-shell-container-v3-0-9373d3f156f5@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekhfevvdduleehvdekgeduffdthfekfffgvedthfeiudduleejveehgeeuffetgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehfohhsshestdhlvghilhdrnhgvthdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghto
 hhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 13:48:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6297

Hi Quentin,

On Mon Jan 27, 2025 at 7:37 PM CET, Quentin Schulz wrote:
> Based on initial work done by Antonin Godard[1].
>
> This does two things:
> - move all the installation steps to fulfil the system requirements for
>   each distro into separate files,
> - add a script for using those separate files for building a container
>   which allows to build the documentation within,
>
[...]

For the two patches:

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
Tested-by: Antonin Godard <antonin.godard@bootlin.com>

Thanks again, I will use these quite a lot.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

