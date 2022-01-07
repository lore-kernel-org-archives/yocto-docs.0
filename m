Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F56C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 19:06:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10986.1641582404740913320
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Jan 2022 11:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 01BF7240002
	for <docs@lists.yoctoproject.org>; Fri,  7 Jan 2022 19:06:42 +0000 (UTC)
Subject: Re: [docs] [PATCH V2] overview-manual: document hash equivalence
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
References: <16C811E821D97886.9212@lists.yoctoproject.org>
 <16C811FB08B20A3C.11018@lists.yoctoproject.org>
 <16C8122AE7EB3669.17821@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <e4bc7c50-ebae-14c9-fee1-b8f57c9b959e@bootlin.com>
Date: Fri, 7 Jan 2022 20:06:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16C8122AE7EB3669.17821@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Jan 2022 19:06:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2359


On 1/7/22 8:00 PM, Michael Opdenacker wrote:
>
> I realized that my previous explanations were assuming the modified task
> output was identical to the last generated output. Actually, any
> previously recorded output is fine, and can be retrieved from sstate.


Oops, forget my V2. I forgot to commit my changes. A V3 is coming right
away.
Lesson: don't try to get too many things done on a Friday evening!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


