Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8278DC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 12:24:10 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.10874.1633609449464197501
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 05:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id DECFE240003;
	Thu,  7 Oct 2021 12:24:06 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: replace "apt-get" by "apt"
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20211006190319.963605-1-michael.opdenacker@bootlin.com>
 <20211007105620.ywwbf6butt324ryg@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1ce5039d-e2f3-ddfa-daf4-35e75cad907e@bootlin.com>
Date: Thu, 7 Oct 2021 14:24:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007105620.ywwbf6butt324ryg@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 12:24:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1946


On 10/7/21 12:56 PM, Quentin Schulz wrote:
> Hi Michael,
>
> On Wed, Oct 06, 2021 at 09:03:19PM +0200, Michael Opdenacker wrote:
>> Modern Debian based distros (such as Ubuntu) now
>> use "apt" instead of "apt-get"
>>
>> Also make sure "apt" is invoked with root privileges (mandatory)
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> With Richard's change,
> Reviewed-by: Quentin Schulz <foss@0leil.net>


Applied to master-next (with Richard's change).

Thanks for the review!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


