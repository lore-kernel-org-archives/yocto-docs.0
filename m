Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F05CC6FA8B
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 08:56:35 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.4983.1663836991069273601
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 01:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TcsEp+rN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CA18040006;
	Thu, 22 Sep 2022 08:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663836989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RlMuJKmrG3cfWkKpqzYHbOuhpjD3MjSWzwTwKMbbGuE=;
	b=TcsEp+rNQyefunZeWLSCOq+GelxG1ondm0HaEHpGQvJndSbDzPOgy4piUZR/HPsXUtSQqW
	RSZGEaMrjH44tjujbZmkNlqEt2Ae8lK6eAI9iv+50fJwdbG+GzSXLRJmAiu8PFfBqNlKvU
	cNmIA4Bl7cQ5Rkq/8+JBGhznTbkWMdQcLtBX4qTFUsxyvNiZ5HtAJcxa6MtIw3npPB6DRB
	1/KBsEnoQvHdcpU1iXHhVvlu1jdMuPrZyhgeFzvM1OfNKwgzm9AmKxSoPjVU0WeYU9Mzxs
	OOwjmh036pkvp3d2v4XDTeFmTUgcc823txtiOQVXijnXLAly9TSOqflRkxoCPw==
Message-ID: <35c1220f-fddb-da61-1356-e9e804955d77@bootlin.com>
Date: Thu, 22 Sep 2022 10:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: variables.rst: refer to BBPATH in the
 BitBake User Manual
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <17171FA1D41FFAAE.30869@lists.yoctoproject.org>
 <0c84794a-68a2-bcf8-51fc-721934fac761@bootlin.com>
 <f70346dd-8574-0a26-af33-812cba9ba4d0@theobroma-systems.com>
 <17172124CA895573.30869@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <17172124CA895573.30869@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Sep 2022 08:56:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3206


On 22.09.22 10:23, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Quentin
>
> Thanks for sharing your opinion.
>
> On 22.09.22 10:17, Quentin Schulz wrote:
>>
>> I would just remove the redirection, we don't have any at the moment.
>
>
> OK, I'll submit a V2 then, and will propose a link to the BitBake 
> variable index at the beginning of the Yocto one.


Oops, not as straightforward as I thought it would be.
The combined index (if possible) is a better solution anyway.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


