Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C537C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:52:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.4304.1637254347242028381
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 08:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id F0A411BF205;
	Thu, 18 Nov 2021 16:52:23 +0000 (UTC)
Subject: Re: [Automated-testing] Stop testing on Ubuntu 16.04
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 automated-testing@lists.yoctoproject.org,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <68f334d7-a94d-e8ad-71e7-5b398e5188ee@bootlin.com>
 <37d05c4b3a148f8bda5718a71a12e031e981b01d.camel@linuxfoundation.org>
 <16B8B1C4AECC9EC4.8779@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <c6345ae2-faab-0d00-3151-ae2e48d5a60e@bootlin.com>
Date: Thu, 18 Nov 2021 17:52:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16B8B1C4AECC9EC4.8779@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Nov 2021 16:52:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2162

On 11/18/21 5:45 PM, Michael Opdenacker wrote:
> On 11/18/21 12:56 PM, Richard Purdie wrote:
>  We can drop it
> from the docs list I guess as we'd not recommend it any more.
>
> You guessed my next question. I'll post updates to the docs. :-)
> This way, when it's removed from the tester list, we'll have nothing to
> do on the documentation side.


Hey, what about Dunfell? I'm not sure about it. Ubuntu 16.04 was still
supported when Dunfell was released. Would it make sense to say that we
don't support Ubuntu 16.04, at least in the Dunfell updates?

Thanks in advance for your advice.
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


