Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A60C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 15:23:02 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.19825.1710343372175751219
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 08:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UDAL9i2I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 012656000C;
	Wed, 13 Mar 2024 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710343370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z5uDp6WrdZXInxD2ZcHD6m/gSLVqk1NW4PnYpS9J1So=;
	b=UDAL9i2IhUl0LgOWOeaajGkU6I2wM8j7dJU8NiJ7WJYLrGJpdkLoG77LFYVJ8FTqVeYdko
	wIBj91rKugX3rsXD25L3ATnGX58aK/gx46ytKZMJ6poBuhQGHGP5ESBIq14TN3dXZjbWs7
	tPbPMs7tU4L7J6CHzYNyhwUjU+zQ0EOzg6zafHRB8+JrPd4VB1at8ODn32gG2eD1HoieNe
	A4/eposivU97s4EJPSf88aeChZwa9P2xem1iPddMitN/1XO76dxFnotyMAN1yi3akNdtao
	lG5CPfphA9/TwHXWDqqemzZCPZcrj2oHoPbS3UbjW5vP1eOc6plD+g1PLuCYtw==
Message-ID: <317244b3-e8f5-445c-b859-c3d7273793f4@bootlin.com>
Date: Wed, 13 Mar 2024 16:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] manuals: add initial stylechecks with Vale
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20240312210345.8832-1-michael.opdenacker@bootlin.com>
 <CB05F1E2-1F4B-4D7F-8920-D8914CB93E3D@0leil.net>
 <33bd7200-85c6-44f4-8b20-09045ec36566@bootlin.com>
 <16b6e7ad-e7f1-4e6a-8fb0-c5e3fee61fcd@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16b6e7ad-e7f1-4e6a-8fb0-c5e3fee61fcd@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Mar 2024 15:23:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4952

Hi Quentin,

On 3/13/24 at 16:09, Quentin Schulz wrote:

> 
> So I can say I found the following:
> - sphinx-lint (https://github.com/sphinx-contrib/sphinx-lint). This 
> mainly complained about tabs being used, but maybe it would find some 
> interesting things in the YP docs?

Thanks for sharing. This one may indeed be interesting to enforce our 
"syntax style" preferences.

My time is limited at the moment, but don't hesitate to try it
by yourself on the Yocto docs too.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


