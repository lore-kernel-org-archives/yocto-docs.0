Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0781AD5CC8C
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 10:34:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.11747.1730284462470334298
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 03:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GlxO8U9M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70096E0008;
	Wed, 30 Oct 2024 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730284460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U0KHFu9tAbknScMvpbwh+3a/WFPxg4sXVgxO/8srmw0=;
	b=GlxO8U9M5D3L6LROdqOyDZ1J5qirvkmHuayI2RoGZsUBE85R/8/wQtsG1a5pzqD3R1ni39
	Rsx16FAcwA0fozYZCp7NdhkYHfrcysSyg5VJX9cbvUSB1DVCgClAAVxDf9xWtQkeviTDES
	EGUvyP4Wutnr6dL3kGxw8k65v7DuDAL1CXTzUjZUui9AMFC5/ggoYhWGChzr2us96uwuv9
	t24QfQt5S6RT1emyFKWNdhbR6mXGEdz8VTB84Su0VEhAJ1AIcWqC74WSLJ6eKCeb3S68vT
	lqp72SzAu0ao6bLkv90G70tFVqRn4KFG9eQWjwzHWvXxNQ3AvRgu4YZmv1nvnw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Oct 2024 11:34:20 +0100
Message-Id: <D592NFHOBEBO.2TOYMPBB82G3G@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [PATCH 0/2] Improve release process section
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241030-update-releases-svg-v1-0-1cafebd6c6d9@bootlin.com>
 <7b38ecbb-9dac-4746-b542-30972cadf07c@cherry.de>
In-Reply-To: <7b38ecbb-9dac-4746-b542-30972cadf07c@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 10:34:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5620

Hi Quentin,

On Wed Oct 30, 2024 at 11:23 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/30/24 11:07 AM, Antonin Godard wrote:
>> Following some discussion about the releases.svg file, timestamp the svg
>> with the month it was edited last, and refer to the release the doc was
>> built for using &DISTRO_NAME.
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> Good enough for now, maybe we'll come up with something better in the
> future.
>
> For the whole series:
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Thanks!
> Quentin

Thank you!
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

