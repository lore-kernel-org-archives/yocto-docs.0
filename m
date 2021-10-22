Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E16C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 17:24:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.512.1634923470398436872
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 10:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 767B540007;
	Fri, 22 Oct 2021 17:24:15 +0000 (UTC)
Cc: docs@lists.yoctoproject.org, nicolas.dechesne@linaro.org,
 mhalstead@linuxfoundation.org
Subject: Re: [docs] [PATCH] [yocto-3.3] conf: update for release 3.3
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20211001153924.93354-1-quentin.schulz@theobroma-systems.com>
 <20211021083834.k2rkz5robufkdkyn@fedora>
 <a22eb2f4ecea883343735481dfe42f28c17f1e38.camel@linuxfoundation.org>
 <20211022083818.o54tshvgiashqivd@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d24ffa61-c464-ddca-63f1-201b39add478@bootlin.com>
Date: Fri, 22 Oct 2021 19:24:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022083818.o54tshvgiashqivd@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 17:24:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2047


On 10/22/21 10:38 AM, Quentin Schulz wrote:
>
> On a side note, switchers.js is not up-to-date on docs.yoctoproject.org.
> It should be showing dev (3.4) instead of dev (3.3).


I do see "dev (3.4)", but https://docs.yoctoproject.org is experiencing
trouble (showing a directory listing instead of the normal front page),
most probably because "master" currently fails to compile. That's my
fault (insufficient testing). A fix is in the pull-request has been sent
to Richard, but until it is merged, Michael Halstead has to apply manual
fixes regularly.

My apologies for this trouble.
Kind regards,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


