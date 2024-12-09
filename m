Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAE0E77182
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:02:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.107080.1733763733559927290
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 09:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e8yaLiX2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85B0040002;
	Mon,  9 Dec 2024 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733763731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nz9680bP22WLQEZPN2w8BIePPEJfqaQpSHqfLiYCfYs=;
	b=e8yaLiX2YsIGN9psWz88tWzfUKynrQIB8/3slM3dAqy4eErWCIoi9TsX5VQEHEjN/IgtU0
	OnYbZUkrRne5axHC3UVrXWAQr2y8DvysOOr+ZvKC3orB2bQ1+Pf+ch5yeK/83ScJq3ZyjG
	ZMRC6DHLUFReEQgw+LdxQKBORecvYqgpvg+PjsDfbPG1P6VXvzh075+hhNdmVKZSWMAm4z
	Apgph7CTf4FJGAGxskWVD2ryhedhZb84HtoD6NqIoPRtHfPU/pV2Khwk3msBzXDwzszGOJ
	rZ29THsNBcjYENO3hhyNpp4C531Yh2AivQutPkPd3cWmOEECqSMtM9O00nyo/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Dec 2024 18:02:11 +0100
Message-Id: <D67BY6MY256H.2XQGZF5AGJM19@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto-docs PATCH v2 2/6] poky.yaml.in: replace inkscape
 dependency by librsvg2-bin
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-2-1d9b4063476f@bootlin.com>
 <0fc67e83-4c38-4274-bb38-905f0db1a4d1@cherry.de>
In-Reply-To: <0fc67e83-4c38-4274-bb38-905f0db1a4d1@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 17:02:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5904

Hi Quentin,

On Fri Dec 6, 2024 at 2:56 PM CET, Quentin Schulz via lists.yoctoproject.or=
g wrote:
> Hi Antonin,
>
> On 12/4/24 1:23 PM, Antonin Godard wrote:
>> inkscape used to be a requirement to convert SVG images to PNGs/PDFs,
>> but we replaced it recently by rsvg-convert.
>>=20
>> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> I would recommend to order the commits differently.
>
> I believe patch 1/6 and 6/6 can be backported to earlier releases. But=20
> by having 2/6 modify the same part of the code, it is possible that 6/6=
=20
> won't cleanly apply when backporting. If we were to reorder the patches=
=20
> and have 6/6 before 2/6, this should not happen.
>
> It's anyway you that would experience the pain of backporting and=20
> resolving conflicts, if there's any, so up to you :)

True, true! Thanks for thinking about this, I'll re-order. :)


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

