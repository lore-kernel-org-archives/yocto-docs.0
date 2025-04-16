Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F658C369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 07:27:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.13674.1744788429746498942
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Apr 2025 00:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MQ3+tlFi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 613234389B;
	Wed, 16 Apr 2025 07:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744788427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGDDdz91A+LbUbtOlK9Dz2HOCNmX6gr2DDXHUi1ouoM=;
	b=MQ3+tlFiH42igjMG6+2W59CgKWGADc4qJoHmdS5rwyJNJeShova/hfXMH5gRzxZ0QD0kJl
	EGkyT6iOpg+dq92zC5DTbg2oTmfr1s80kz4nOKDVJuZDAAxX6e7F/EhPvITqfRoN2yn7k4
	7qB5DFHKw3i44Y0DnoVwsDYZ4Cl5+8MQyWqNHmzIyG895cCckTixnI0/kdLyWLqqq/5jd8
	Mp7Uryzf97E6QuxEegJoUvNVPYBi/BnHw7JIr7TjXJ4CUUzmAe4zs9oQi7juH540rCcuSS
	+ic7BGZRtxqez2kaAHjz46IT93+zWvHn45JdtX/4kPRdL0fsC9fJPCoEDFw+4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Apr 2025 09:27:07 +0200
Message-Id: <D97VVLZXMTW9.P853JF4BXI1F@bootlin.com>
Subject: Re: [docs] [PATCH 04/11] migration-guides/release-notes-5.2.rst:
 add security fixes
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Takayasu Ito" <ypa.takayasu.ito@gmail.com>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com> <20250328-release-note-5-2-updates-2-v1-4-c913513e9140@bootlin.com> <5fc0d33e-4ba5-4f8d-80c2-c5c87be79680@gmail.com> <D976ZCV50JQR.3B8GAANQILPQ1@bootlin.com> <a9fd9bfb-dee9-4e94-8a95-d5673a9fd18c@gmail.com>
In-Reply-To: <a9fd9bfb-dee9-4e94-8a95-d5673a9fd18c@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdehjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhedtteetheefgfejleeiledvieevleduffejgeeufedujeeufeefjeefveegudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeisgelleemvghfheegmedvtdgrfeemiehfgedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeisgelleemvghfheegmedvtdgrfeemiehfgedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeihphgrrdhtrghkrgihrghsuhdrihhtohesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhto
 hepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Apr 2025 07:27:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6752

Hi Takayasu,

On Wed Apr 16, 2025 at 12:34 AM CEST, Takayasu Ito wrote:
> Hi Antonin,
>
> I could not post the patch because I did not have the development environ=
ment with me due to machine trouble.

Okay, that's fine.

Could you please explain how you obtained these results?
It's not straightforward for me to assert the validity of your changes. I w=
ould
just need a way to reproduce the results you obtained. cve-check, maybe?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

