Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FF3C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 12:19:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6672.1743596336861174600
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 05:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RVlM5lKZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCB6B44253;
	Wed,  2 Apr 2025 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743596335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3QN0YryVfS/NQDf7+oBCddKO+i9YcM2A2pJQNpNJ+U=;
	b=RVlM5lKZdurbw4DoQbVwl7fMjSVb2Py2vIHEHk7UZYCtIjPsbhkS5YYL9ybUVMlF/jx1f3
	f0l6H/2v7dqy/fKqM0m+pThngLloroeew5dv61wlysLF4fIer55BkLmdeEVTGPuPlzdh/w
	H+Uqcp4yE11B67xjYoysVJ51WqLUNWWfvk1fQGp4/yunQ/JmYIOk+DYzn03ZSpUTDYcDgM
	ifF7jSAMVOJ3aanmFgl6Gr1spDyGJDTdVQ20rM1QaVhPV1c7ThzWVGinYdVUtQfy5QYubY
	1lnZhA2PftHAo3/Ap56t96byLQJajcq1twEJQLn2zBpdCIJc+SHoGUDQPDpNzA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Apr 2025 14:18:54 +0200
Message-Id: <D8W5BE1Q1UQR.20MVHMVVVH0K4@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/2] migration-guides: add release notes for
 5.1.4
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250402041036.1025002-1-chee.yang.lee@intel.com>
In-Reply-To: <20250402041036.1025002-1-chee.yang.lee@intel.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeelteekvedtffeggfelueevheeikeevfeelgefhgeegfeetuddvgffhkeefhfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheptghhvggvrdihrghnghdrlhgvvgesihhnthgvlhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Apr 2025 12:19:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6697

Hi,

On Wed Apr 2, 2025 at 6:10 AM CEST, Lee Chee Yang via lists.yoctoproject.or=
g wrote:
[...]
> +-  binutils: Fix :cve_mitre:`2025-0840`

Should we use :cve_mitre: instead of :cve_nist: now? I wondering about the
reason for that change.

Not sure you can answer to that, but I'm wondering if it'd be good to chang=
e the
value globally in the documentation.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

