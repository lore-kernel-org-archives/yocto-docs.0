Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1A6C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 08:16:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.28916.1749197815782791393
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 01:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B70JKclG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7797543254;
	Fri,  6 Jun 2025 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749197814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ua/Dy4KFKpYbbP11GSxj8uVAh/y/cDkMam+KnYIHxw=;
	b=B70JKclGidJGXlIa0UboAVnhoi0LxplZF+Y3eXr492DKsp79Z4PIkiP5vSLd9sRz4ZlKKK
	YW2xomgrSJ7SmgC8dCSV5ylaqFmnCtZyUvipnWWJmnInNQIT00Is+qa4ZMetSR93kYyFTE
	QaB3CGrnCG5oOPmNpZtAR54VZvv3lcUfCtjjhS2FwlsEsj3eMzTqu5VXkQl6U5539vSK0N
	eVGbp4b9mlKqlC0GHyGBGXGIbVyKK25NHd9iHEE4qaYl3YC2T74yLvSXgfWqDbBnuv/cmW
	HAz6CEEVStsNlKUonalVWKCee6fMC6tS7Nl8w3e7NYngT4TWuWEsBcSCDsqXaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 10:16:52 +0200
Message-Id: <DAFAVHU79BI0.UE0QNLCZ9T2I@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 KERNEL_EXTRA_FEATURES
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Alper Ak" <alperyasinak1@gmail.com>
References: <20250531154900.53941-1-alperyasinak1@gmail.com>
 <4f224337-e7c7-4ccb-a0cc-861fddcabc07@cherry.de>
 <CAGpma=4nc0DcTEddK0FFb6sj2yenN91DnZrcit2poyqOQ_jYSQ@mail.gmail.com>
 <DADKZIPNS4NH.348N34F0WS0XD@bootlin.com>
 <CAGpma=54SHk+V-+GjMMuo3Db9UBYi4LcdM56Kdayvw5GA-_kEQ@mail.gmail.com>
In-Reply-To: <CAGpma=54SHk+V-+GjMMuo3Db9UBYi4LcdM56Kdayvw5GA-_kEQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffehkeeuteetkeeufeejjeevveduuddtgfeuteeiveekjeegjeegteeuveekfedunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghlphgvrhihrghsihhnrghkudesghhmrghilhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 08:16:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7014

On Wed Jun 4, 2025 at 11:52 AM CEST, Alper Ak wrote:
> Looks like KERNEL_EXTRA_FEATURES only exists to add to KERNEL_FEATURES
> from poky.
>
> To be honest, after wrote the documentation I felt that this variable
> was unnecessary. Of course it's necessary for poky but you know what I
> mean.

No problem, I will comment the bug on bugzilla and close it.

Otherwise, thanks for taking to contribute these patches, they are really
helping!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


