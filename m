Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1DCCE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:44:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.33897.1695203052925348203
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 02:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZfgOWbAg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91B81FF806;
	Wed, 20 Sep 2023 09:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695203051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lcmSqjaJ/llticSIRvpz+w2dwgKQHnIIYb5cmX6+HPE=;
	b=ZfgOWbAg7ib39cofhD0wWJdDmQXPue52J4kHWoFd5MyE/fUJanfdXRR9PJRA0DCUUOGiMq
	0UM3JugMK91eYO45KjII04Ntet5Zu1+nHoHj4u33VwFfrWqA6nLUMMmFfyMw8ig7uFQM1E
	E4NSuCHwL7/RFfGQ9XDYP3rvVO9jIG+dFVdQoafc97u2dkiotWwfxE7LGY1fWnGmdWXiuT
	8f6YTCiW0z6w+19qgjIwZdWyPzdR0YR4wW7oZDRMCmYOp0a4WNtpOG0qmJu2/OsSuNjUnM
	BMDjqeOtPUgYe2bD+BRDBGebrVuUoTXvRa6fLeSU0aMTu4fn1+YGQtA53Vsrfw==
Message-ID: <21d27c4a-50b4-2f95-cad6-b7ca844b611e@bootlin.com>
Date: Wed, 20 Sep 2023 11:44:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RESEND] [PATCH] contributor-guide: add docs for
 Upstream-Status patch headers
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>
References: <20230919125757.1571746-1-rhi@pengutronix.de>
 <20230919125757.1571746-2-rhi@pengutronix.de>
 <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com>
 <20230920085637.ypa3jr676bdqocf5@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230920085637.ypa3jr676bdqocf5@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 09:44:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4259

Hi Roland

On 20.09.23 at 10:56, Roland Hieber wrote:
> I resent them because apparently my first submission did not appear on
> the web archive (maybe because I was not yet subscribed to the group,
> but got auto-subscribed after the submission…?) and I wanted to make
> sure they made it through.
>
>> However, I see that the version on master-next
>> (https://docs.yoctoproject.org/next/) doesn't cover CVE tags yet, and your
>> patch did. Would you be interested in sending an update against master-next
>> if necessary, knowing that there is also documentation on https://docs.yoctoproject.org/dev-manual/vulnerabilities.html#fixing-vulnerabilities-in-recipes?
> Ah, I didn't see the master-next version yet! I'll rework my patches and
> send a new version for the one patch that was not applied yet.

Great, thanks! The changes are in master now, by the way :)

>
>> I'd also like to more details about the "Inappropriate" reasons. For
>> example, I don't have a clue what "native" would mean. Why would be patch be
>> rejected upstream because it only applies to the x86 host platform?
>>
>> Last but not least, we'd need to deprecate the "Accepted" reason and
>> recommend "Backport" instead (see https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes).
> Phew… I have the same questions as you… I only ported the existing
> text from the wiki… :D But I think what Alexander wrote in the other
> message in the thread seems reasonable, I'll keep that in mind for v2.


Perfect, thanks!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


