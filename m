Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19ACC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 12:33:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.11009.1633609992760992337
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 05:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 001504001A;
	Thu,  7 Oct 2021 12:33:10 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/4] Makefile: allow epub and latexpdf outputs to
 use diagrams from SVG sources
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <16834414503E8A25.21857@lists.yoctoproject.org>
 <20211006122238.959343-1-michael.opdenacker@bootlin.com>
 <20211007110541.3di4bkym6jj47un3@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3928e202-1cd3-44ea-0fff-90c3962cf829@bootlin.com>
Date: Thu, 7 Oct 2021 14:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007110541.3di4bkym6jj47un3@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 12:33:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1947

Hi Quentin,

Thanks for the review!

On 10/7/21 1:05 PM, Quentin Schulz wrote:
> Hi Michael,
>
> Your patch series is missing patch 3/4, can you fix that (send the
> missing one or renumber them :) )?

Weird, maybe a (very short... between 2/4 and 4/4) issue between the
mailing list and your end.
https://lists.yoctoproject.org/g/docs/message/1928
>
>>   $ pip3 install sphinx sphinx_rtd_theme pyyaml
>>  
>> +Also install the "inkscape" package from your distribution.
>> +
> This is needed only to build epub or pdf, might want to specify that?

Good idea. I'll add it.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


