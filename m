Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B47EC3600C
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 08:01:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.45056.1743062497990364273
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 01:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c5PNy9CQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA89F442AD;
	Thu, 27 Mar 2025 08:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743062496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xL8AOK+8zgd/109A8ifUqq7Q849kXWqI/b9YgHAodnI=;
	b=c5PNy9CQtG9bXduolJdpTxMTBR3kywYAiqnq7oYE7Hn7NaWvXpn5iLNjtuFloCJFqBv/ng
	j1fUo7TC7Y/QMkih5Ny/jfoDmkasAjBgQQhzvLEmOoVv+efNmOQ7WDHOCq7fWnbrSMOxQ/
	7QNNTVkQfXxAZTdVr2f5GcpgVlzBDVLVWR+3Ro5HN8wOQYLyVFKn4CPNw7cenZnhIZ5JNz
	I1dZsULDLVQdkyAmG4HXOHSTiv0s4ss8tnUBUK/Qi634ORCDgdFPlso2KG2//IyQnYhgT6
	RRRhyDpL1tgnCjLbt1qYaiM94llnWy3JD4cyorQ+fOxLhJHufCGu6AhI/tumSA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Mar 2025 09:01:35 +0100
Message-Id: <D8QW344VM2VY.3CURBHRGGRBZ6@bootlin.com>
Subject: Re: [docs] [PATCH v2 3/6] ref-manual/variables.rst: add missing
 documentation for BUILD_* variables
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <antonin.godard@bootlin.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-42-g7f7db0373f6c
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
 <20250326-cc-vars-v2-3-36b80c64c4a9@bootlin.com>
 <309afe89-8112-4189-8789-f07446a89eac@cherry.de>
In-Reply-To: <309afe89-8112-4189-8789-f07446a89eac@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieejkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhedtteetheefgfejleeiledvieevleduffejgeeufedujeeufeefjeefveegudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguo
 hgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Mar 2025 08:01:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6645

Hi Quentin,

On Wed Mar 26, 2025 at 4:11 PM CET, Quentin Schulz wrote:
[...]
>> +      The :term:`BUILD_AR` variable should not be set manually, and sho=
uld not
>> +      be used in recipes directly since :term:`AR` will hold the correc=
t value
>> +      depending on the context.
>> +
>
> I think we came to the conclusion this is wrong, the user may have to=20
> use BUILD_AR in some cases?
>
> Maybe something like:
>
> """and is seldom used in recipes as :term:`AR` contains the appropriate=
=20
> value depending on the context (native or target recipes). Exception be=
=20
> made for target recipes that need to use the :manpage:`archiver <ar(1)>`=
=20
> from the build host at some point during the build.
> """

I'm good with that!

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

