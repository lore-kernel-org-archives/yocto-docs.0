Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA58C25B78
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 12:09:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.59360.1716206951085695579
 for <docs@lists.yoctoproject.org>;
 Mon, 20 May 2024 05:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O5/X4jzk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83724C0005;
	Mon, 20 May 2024 12:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716206949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtGc9l2Jsg+A6XCUoY/xgUxutDRm2yEl8GeaKdHru+4=;
	b=O5/X4jzkvCHIkL2nyJXO5tiSIl2qi7ZVTZeXxubUpaNrE/ZUbvFU7MXFWKRXlTcrHAe+hV
	GBCIHgpeiIR/GDa1u0RkzetVBSZlH7Lb2ENOjToKVYybEoV+AQo5kMQkEvdPomzvQGJorG
	tWtcuVFog0Q2OD4aBBDsqnIUuvoKHnXwRfc3ITZ6VglvJvCg3QIwLFTVlVvN/UbVh1DuPC
	OWcP9dnk2wO0ZBVcfe6fbgK/K5umn0kUDYxvEJF981oPAWa0auwVUD1an5JwBgmjfoNqVR
	BNGoz//gugAUmYzrJzH6vPW5aogXxTzhK40WYdAbnEb3SGABfS19Gg5sg4a1XQ==
Message-ID: <1e014053-36d6-45a5-8721-ff4dd8bfb602@bootlin.com>
Date: Mon, 20 May 2024 14:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: document NVDCVE_API_KEY variable
To: Noe Galea <ngalea@thegoodpenguin.co.uk>
References: <20240517192724.7519-1-ngalea@thegoodpenguin.co.uk>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240517192724.7519-1-ngalea@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 May 2024 12:09:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5223

Hi Noe

On 5/17/24 at 00:57, Noe Galea wrote:
> Add brief documentation of NVDCVE_API_KEY variable, that was added
> in 4.2.3, and emphasize that its use results in lower NVD API request
> times.
>
> Signed-off-by: Noe Galea <ngalea@thegoodpenguin.co.uk>
> ---
>   documentation/dev-manual/vulnerabilities.rst |  4 ++++
>   documentation/ref-manual/variables.rst       | 15 +++++++++++++++
>   2 files changed, 19 insertions(+)


Many thanks for this update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


