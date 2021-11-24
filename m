Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4A0C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 16:58:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.713.1637773116713805886
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 08:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1CBFC1BF20A;
	Wed, 24 Nov 2021 16:58:33 +0000 (UTC)
Cc: Anuj Mittal <anuj.mittal@intel.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] releases.rst: move gatesgarth to outdated releases
 section
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20211124144934.8908-1-anuj.mittal@intel.com>
 <f64d94ae-7171-7e8d-2e10-e81a04cc160e@bootlin.com>
 <20211124154529.fwxjw6qgjuaypjrp@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9c1e5d8e-ecfd-9a81-771e-af769b6be38c@bootlin.com>
Date: Wed, 24 Nov 2021 17:58:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211124154529.fwxjw6qgjuaypjrp@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 16:58:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2191

Hi Quentin,

On 11/24/21 4:45 PM, Quentin Schulz wrote:
>
> Slightly off topic but we should actually have the same release.rst for
> all versions of the docs. No idea how to pull this off but we'll
> eventually need to.

Thanks for the reminder. This makes me realize that the file in
"master-next" is out of date and is missing the Honister release
completely. Apologies if I missed a patch!

To have the same release.rst for all versions, could we tweak
scripts/run-docs-build in the yocto-autobuilder-helper repo to copy
release.rst to copy the version from master?

What do you think? Another thing is the tagging of releases, which I
still do not quite grasp... Anyway, it seems we haven't found a working
solution yet.

Cheers
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


