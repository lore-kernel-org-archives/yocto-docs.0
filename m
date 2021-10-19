Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17746C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 18:33:50 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.14217.1634668428107733343
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 11:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 16BC5200004;
	Tue, 19 Oct 2021 18:33:45 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/3] Improve reproducible build documentation
To: Scott Murray <scott.murray@konsulko.com>
References: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
 <a4697ab-c28-93f7-8479-64b3f21683e@spiteful.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <517a0133-3444-0166-1e80-0242701b1536@bootlin.com>
Date: Tue, 19 Oct 2021 20:33:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a4697ab-c28-93f7-8479-64b3f21683e@spiteful.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Oct 2021 18:33:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2006

Hi Scott,

On 10/19/21 8:18 PM, Scott Murray wrote:
> On Tue, 19 Oct 2021, Michael Opdenacker wrote:
>
>> This adds documentation for the BUILD_REPRODUCIBLE_BINARIES (mentioned
>> in the 3.4 migration notes) and SOURCE_DATE_EPOCH variables,
>> as well as for the "reproducible_build" class.
>>
>> Let me know if you wish to extend the description of SOURCE_DATE_EPOCH
>> to give more details about how the value is computed by reproducible_build.bbclass.
>> Should we extract the comments from reproducible_build.bbclass?
>>
>> I could also mention REPRODUCIBLE_TIMESTAMP_ROOTFS, but since it's not
>> overriden in any recipe in Poky, my first choice is not to mention it,
>> not to add to many details to the documentation.
>>
>> Your opinion?
> Richard just enabled the behavior by default in master, so the bbclass and
> BUILD_REPRODUCIBLE_BINARIES variable are gone there.  It likely makes
> sense to still document them for honister (and potentially earlier).


Oops, bad timing then. Good that this can be useful at least for
Honister. I'll submit this on honister-next (coming soon). I though my
version of Poky was recent enough, I missed the latest commits. I'll pay
extra attention to the patches then.
Many thanks!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


