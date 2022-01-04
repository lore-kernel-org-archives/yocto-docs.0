Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B39C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 19:16:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.497.1641323760816177481
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 11:16:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BF0CF20004;
	Tue,  4 Jan 2022 19:15:58 +0000 (UTC)
Subject: Re: [docs] [PATCH] doc: bitbake-user-manual: conf.py: add more
 extlinks
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <20211215162227.2001656-1-michael.opdenacker@bootlin.com>
 <76d1f61a-da64-1485-7912-1debe0f64c40@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f40da77d-4d69-2907-f48d-57dc1b6006f3@bootlin.com>
Date: Tue, 4 Jan 2022 20:15:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <76d1f61a-da64-1485-7912-1debe0f64c40@theobroma-systems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Jan 2022 19:16:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2345

Hi Quentin

Thanks for the review.

On 1/3/22 10:17 AM, Quentin Schulz wrote:
> Hi Michael,
>
> Could we have the new entries alphabetically sorted? i.e. oe_git first
> in the list of oe extlinks and oe_wiki last?

Sure, this makes sense.
>
> Also, is there any plan of using those new extlinks? I only see one
> patch in this thread, hence the question.


Well, my first need was to use the "oe_git" macro to provide links to
source code, for example for bitbake-hashserv.
Thinking this over, I realize it probably makes sense to just add the
macros when I actually need them.
I'll just to that.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


