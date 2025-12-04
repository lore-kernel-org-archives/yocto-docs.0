Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD81D2068B
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:19:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43524.1764854348638084365
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 05:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=q84u9G3n;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 78828C1784C;
	Thu,  4 Dec 2025 13:18:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C657C6068C;
	Thu,  4 Dec 2025 13:19:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADA201192257A;
	Thu,  4 Dec 2025 14:19:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764854346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OnGr4Y4HEZnLLrCii3+FZM533SfBy4MgFrZGsbeayt8=;
	b=q84u9G3nZZZkQk2DdzE+pD7d+RktM1ebCtrR0w7P3Zr+JyAwOixeWWcdkcfwsn59cYE4th
	LQhVd2Qh1MOA5NcFO7vZ3z9PCFFCzVEMu9eGVn4fGTK+xsRRupXpt/Je7Dlr6JHAFMQ2CU
	LzL+ng0jqaUU/yHLT39VgaRkgH7EQClUc8DyuFyEMAStFnxGRK6X5dOSFcEV+ItHSECAXT
	x3zO0T1tILicORXF85NEKxlaYZHlx87cu5NJC63v1Kxz7OXsSJcagKJbiFas5XmRKjOg+I
	WgBidHquaAVT4XBrJgLtJHPscagGKvPebQquHsNHil5uYbUsRwLTVK+NiO/fPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 14:19:05 +0100
Message-Id: <DEPGNHLWMQOT.34GARJV2FPEU@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/4] ref-manual/svg/releases.svg: mark whinlatter
 as current release
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
 <20251202-release-updates-v1-2-889513ccc384@bootlin.com>
 <4bffea56-31b8-4a6f-b65a-337cdf10ed33@cherry.de>
In-Reply-To: <4bffea56-31b8-4a6f-b65a-337cdf10ed33@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 13:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8214

Hi,

On Wed Dec 3, 2025 at 3:57 PM CET, Quentin Schulz via lists.yoctoproject.or=
g wrote:
> Hi Antonin,
>
> On 12/2/25 5:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Whinlatter is the new current Yocto Project release, mark it as an
>> active one.
>>=20
>
> Still in the final stages though, but I guess we want that in so it's=20
> up-to-date for the Whinlatter doc release?

Yes, this is planning in advance.

> Whinlatter will be released a bit later this month I guess, so we should=
=20
> probably move its rectangle to the right to align with December.

Oh good catch, I'll adjust that in the v2.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


