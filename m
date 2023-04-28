Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EE4C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:26:27 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.14522.1682670381982538678
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 01:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mwKvO/BA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DDCC42000D;
	Fri, 28 Apr 2023 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682670379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBUHEacVOpOQUPp5PHlbeYODN3WdTjHSham9SCXBP4c=;
	b=mwKvO/BA4NT1Ah76fAyvu+xjajUyxWRtMMVrve7qXnL35BiAwM4lJr3j0PMCdWMmOJ7kNX
	QvkLS819FrRK87nHEA+KaqXf00oZP/f8EufTyAHX0y7pwh85wwCz+WgXXfkzjMEPAvm4EK
	XwH+hjqbzZSQ5gA+JDJemyDK1hpkOfa+FJMmnVLqgAdqZYQhO5OKR/bey79urlghYTBE1+
	vfGcJo/w/vm1heYY6gU83lqOxlhIyYLxfmp6cXAO42B4fOYA9i3aEiSbFgP/ZYYHK+fHO5
	IOmCMHUEoRGFPmLl9tAF49Y2yxLRiczrsILnJJx0AweLrKdSN+jgU5NO54sWvw==
Message-ID: <95f9c9fe-88e8-50dc-4118-ed9245dc837d@bootlin.com>
Date: Fri, 28 Apr 2023 10:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: Paul Eggleton <bluelightning@bluelightning.org>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: expand init manager documentation
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>
References: <20230427155308.56744-1-michael.opdenacker@bootlin.com>
 <6redo4bhk0.fsf@pengutronix.de>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <6redo4bhk0.fsf@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Apr 2023 08:26:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3878

Hi Ulrich,

Many thanks for the review!

On 28.04.23 at 09:11, Ulrich Ölmann wrote:
> here a typo probably slipped in:
>
>    s/becomes the must simpler/becomes the much simpler/


Good catch. Fixed.
Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


