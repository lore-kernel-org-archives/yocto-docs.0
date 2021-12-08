Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECAAC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 17:27:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.16665.1638984474097138878
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 09:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8EFA020007;
	Wed,  8 Dec 2021 17:27:45 +0000 (UTC)
Cc: yocto@lists.yoctoproject.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 make all versions list releases known to master
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20211201134931.193455-1-michael.opdenacker@bootlin.com>
 <20211203093400.gzqddyn3vbrm256a@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1e09381f-6650-9b99-748a-477f19642970@bootlin.com>
Date: Wed, 8 Dec 2021 18:27:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211203093400.gzqddyn3vbrm256a@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 17:27:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2235

Hi Quentin,

Thanks for the review and for your suggestions.

On 12/3/21 10:34 AM, Quentin Schulz wrote:
> Hi Michael,
>
> On Wed, Dec 01, 2021 at 02:49:31PM +0100, Michael Opdenacker wrote:
>> This allows all versions of Bitbake and Yocto Project manuals
>> to see the manuals for the latest versions.
>>
>> This also simplifies the release process, not having to update the
>> releases.rst file for all releases every time a new release is made.
>>
>> Note that such synchronization is already done for the
>> switchers.js file (but in a different way). This way, advertised
>> releases are in sync with switchers.js.
>>
> Why don't we migrate this different method (find) to the one you
> implement in this commit too?
>
> I could see a variable storing all "force-latest" files or someting like
> that to make it obvious why they have a specific handling.


I tried, but I stumble on the need to copy the latest switchers.js from
yocto-docs to the Bitbake branches too.

And since the Bitbake branches need to be checked out and processed
first, I hesitate to add a special extra step to checkout the yocto-docs
repo before. Possible but adding complexity.

So, if I don't use this way for the Bitbake branches, I still need a
find command at the end...

If you don't think about any better idea, I'd propose to stick to this
version of the patch.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


