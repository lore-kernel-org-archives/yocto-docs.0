Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0039C433EF
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 16:12:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.34193.1643645574728269508
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Jan 2022 08:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g42pw4fv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8AB9824000F;
	Mon, 31 Jan 2022 16:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1643645572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dexenVV0vgkXXd4lH9uow1znOHhtcxPM5kw0MCFJh0U=;
	b=g42pw4fv/mVpgdbjsjwvB9RU3o5N9PzygCCfst/ANrkbyDI40MYmnXlvcJgqFRhqcBBHXY
	TCkidEr+HR8aJRjho02nTrMT0oZqzZIwSMkzol1qdsoF477S+YMYW9dfaDTL660LWuaoG9
	RmIEXTNpJ+yZCHuqXtJVr11gcMvCcLlIM7N/DApQW2sWjAkeasjcpJjdBA0SiJBk+SDevx
	HzZnEal86E3Gb53ew9z1lsGQcm8+ZzuvpRSIg+YXlUWkuVoK8iDVZbyku51IrcVe6U0G11
	FvdsA+GMvJX4NMDcyRCQ6Jn8/Epg+iCCc7wY+MPTx+6Jm0bvn0cGdWj4IRVADA==
Message-ID: <4b7fb4b0-0b8b-4ee4-2e61-bdd31125e4da@bootlin.com>
Date: Mon, 31 Jan 2022 17:12:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH 2/2] test-manual: Correct two references to
 BB_SKIP_NETTESTS
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>, docs@lists.yoctoproject.org
References: <20220129022602.17304-1-pkj@axis.com>
 <20220129022602.17304-2-pkj@axis.com>
 <af2022f8-aa08-9bd6-5769-d92e43871522@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <af2022f8-aa08-9bd6-5769-d92e43871522@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Jan 2022 16:12:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2456

Peter, Quentin,

On 1/31/22 10:21, Quentin Schulz wrote:
> Hi Peter,
>
> On 1/29/22 03:26, Peter Kjellerstedt wrote:
>> The environment variable used to disable network tests when running
>> bitbake-selftest was incorrectly referred to as BB_SKIP_NETTEST.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>
> Nice catch!
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Thanks for the patch and review.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Merged into master-next.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


