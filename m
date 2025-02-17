Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209EDC021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 10:12:39 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web11.47963.1739787155620525709
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 02:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=YWlKe/En;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tjy76-000611-4B; Mon, 17 Feb 2025 05:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:References:In-Reply-To:Subject:To:
	From; bh=qMya4lvRPdRwue3vqEr7OCro20Q7wHVHU4T2wdgKg1Q=; b=YWlKe/EnEG2tbYWpZ/OR
	2JsBy/FlJ2xvyxHjzUIgzfrxBamRhs0rBiYzFfqwS3m4Bn/a44HjethFTJ+p5nxPi2BRrPk9mFKjh
	uHIGtRGxVaDub0EE+PdvUgxs5tH1u+Q+/LhZjxr9EhmOypc9FaXShLWUtNJRhbCPdRPtzCX/pVRKt
	WiEYnusJ/YJoQ0BWn8n331hnB5Sb60ltjbf4talCuBGqmiv6vWxjG/oxViuTbX65S/3MagNLviyHQ
	b2rCJBss7osVS+Im/Vy7YasQqvJ2KRqsvgFD19BYucDaT2maWVojTq2pvt2ru+PqyW8Bo4jgeO3Sd
	4UL29wH3GwskrA==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: "Antonin Godard" <antonin.godard@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v3 0/2] Document the PACKAGE_KEEP_DEBUG_FRAME variable
In-Reply-To: <D7ULJGLDCLNM.2F5SN59SUVGYR@bootlin.com> (Antonin Godard's
	message of "Mon, 17 Feb 2025 10:00:26 +0100")
References: <20250211161239.5396-1-othacehe@gnu.org>
	<D7ULJGLDCLNM.2F5SN59SUVGYR@bootlin.com>
Date: Mon, 17 Feb 2025 11:12:28 +0100
Message-ID: <87v7t8swvn.fsf@gnu.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 10:12:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6375


Hello Antonin,

>> poky: https://git.yoctoproject.org/poky/commit/?h=master-next&id=10448200b63bdc45b39504ebcddd85b5f274f0c4
>
> This link does not work for me. Could you give me a new link with your
> commits, on master? I couldn't find them.

Not sure why that one broke, here's a new one:

https://git.yoctoproject.org/poky/commit/?h=master-next&id=df2c9e884066aafb0dfb60521a4809c5ba4cfd5d

Thanks,

Mathieu

