Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0A3EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 19:57:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.21336.1687463821761816078
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 12:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jAm2IEcF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687463819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ezG25BG/7MVknM1OWIJ2OLavgHaUw+p5/i6yVWVU3VU=;
	b=jAm2IEcFBCzESeRoA8xMc1CK90FEmzLSEHvvlvdKRB8zs7OvgZdpihuATjdL1e+oZFKGK8
	n90/tg4YWJEYtnKA7gRwmcK1Kj/KI/6TyLLb3MOEDUsBIakBQKX08JG+/jYprOvoGix7qz
	jbVCJA/+VbP0o9TOnvIXfjvaHOZlYIWYiS9qVvllSVyNG4awCt5A8AJQSItjPiXGcd9MEc
	ANZl7csufIGbjy+YsaQ2a1z53l3ja88My2Cg5jmaYRL831S/QRb30eOYO02Dy6PJ38bF3p
	UYoaB+bjajjdLg7iQ/mAPc5LiJSWEC5JcNvkRkN5KtavW5EhL47UgK27bTJ8sQ==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22933FF807;
	Thu, 22 Jun 2023 19:56:59 +0000 (UTC)
Message-ID: <07fc2302-5757-f997-e068-61dac1d3a250@bootlin.com>
Date: Thu, 22 Jun 2023 21:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual: variables.rst: explicit variables
 accepting colon separated lists
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com, docs@lists.yoctoproject.org
References: <20230621091758.1164139-1-michael.opdenacker@bootlin.com>
 <c31ef3ef-f940-10cf-b965-83f5a64ca3a5@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <c31ef3ef-f940-10cf-b965-83f5a64ca3a5@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 19:57:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4033

Hi Quentin,

On 22.06.23 at 18:21, Quentin Schulz via lists.yoctoproject.org wrote:
>
> nit: (since it's not coming from this patch). I believe it's supposed 
> to be "SoC" (c.f. https://en.wikipedia.org/wiki/System_on_a_chip).

Correct, that was not too late to fix that while still in master-next.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


