Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C49C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 18:55:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.10848.1641581752244997401
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Jan 2022 10:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0A8CDFF806;
	Fri,  7 Jan 2022 18:55:43 +0000 (UTC)
Subject: Re: [docs] [PATCH] overview-manual: add details about hash
 equivalence
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20211217171859.54664-1-michael.opdenacker@bootlin.com>
 <0d8e444ff5127484ecde2e04a7ef3b67d4b449c9.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <09fc6d45-d36b-0af5-7877-5b0310684f5d@bootlin.com>
Date: Fri, 7 Jan 2022 19:55:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <0d8e444ff5127484ecde2e04a7ef3b67d4b449c9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Jan 2022 18:55:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2356

Hi Richard,

On 1/7/22 12:11 PM, Richard Purdie wrote:
> These paragraphs are reversed and this is an important detail to get right. The
> output hash is always computed for a task that runs and the output hash is
> queried on the hash equivalence server.
>
> If the output hash is known, the unihash is updated to match the original input
> hash that generated that output. If the output hash is unknown, a new entry is
> created on the hash equivalence server matching that task hash to that output.
>
> The unihash would therefore be unchanged for a new output hash and would update
> if the output hash matched some other value already there.


Many thanks for this important correction.
I knew I could use a review!

I'll post a new version right away.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


