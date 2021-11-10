Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9175C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 08:47:24 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.9455.1636534043025010301
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 00:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5EBEA200006;
	Wed, 10 Nov 2021 08:47:20 +0000 (UTC)
Cc: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Subject: Re: Fwd: Re: [bitbake-devel] [oe-core][PATCH 1/2] devtools: Initial
 recipe for repo 2.17.3
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs <docs@lists.yoctoproject.org>,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: <a82b048c5f9f164696b1dd1e3e6c4997ede4f5ad.camel@iris-sensing.com>
 <45438478b288da1880e92bb1ccc246732a24abc9.camel@linuxfoundation.org>
 <ab0450c7-8f2f-9822-1ef7-61712cc45f6e@bootlin.com>
Organization: Bootlin
Message-ID: <61ce3cac-70fe-5325-d92e-037d7f365b93@bootlin.com>
Date: Wed, 10 Nov 2021 09:47:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ab0450c7-8f2f-9822-1ef7-61712cc45f6e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 08:47:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2111


On 11/9/21 11:40 AM, Michael Opdenacker wrote:
> Richard, Jasper,
>
> On 11/8/21 1:48 PM, Richard Purdie wrote:
>> Hi Michael and Michael,
>>
>> This sounds like something we should prioritise fixing?
> Good catch, thanks!
>
> I agree,
> https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html
> should also redirect to https://docs.yoctoproject.org/singleindex.html
>
> I'll ask Michael H. to change this.

Michael H. took care of this.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


