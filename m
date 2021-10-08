Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F412DC433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 08:10:19 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.6189.1633680616301012658
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Oct 2021 01:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id B34C920000E;
	Fri,  8 Oct 2021 08:10:13 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: introduce 'yocto_sstate' extlink
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20211007094438.989124-1-michael.opdenacker@bootlin.com>
 <20211007105906.feddo47g2sq57ksi@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <7aec8d91-3da2-76e8-a638-05f87d1fa9ab@bootlin.com>
Date: Fri, 8 Oct 2021 10:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007105906.feddo47g2sq57ksi@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Oct 2021 08:10:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1964

Hi Quentin,

On 10/7/21 12:59 PM, Quentin Schulz wrote:
> Hi Michael,
>
> On Thu, Oct 07, 2021 at 11:44:38AM +0200, Michael Opdenacker wrote:
>> ---
> Does ^^^^ this not break the patch when applied?


Oops, you're right. Thanks!

>
> Otherwise, same thoughts as you, not sure it's really a big improvement
> :)
>
> At the same time, we could think of enforcing all yoctoproject URL to
> have their own extlink?


As long as they are used in the documentation. Well, let's see if we
have similar needs.
Thanks for the review!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


