Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AFDC433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 15:45:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.9938.1634744706008008698
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 08:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E8842E0016;
	Wed, 20 Oct 2021 15:45:03 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: Document the EXTERNALSRC_EXTENSIONS
 variable
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 docs@lists.yoctoproject.org
References: <20211019170434.18700-1-pkj@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <4e9e35b6-8ce2-f91e-d9c6-642f93b52c42@bootlin.com>
Date: Wed, 20 Oct 2021 17:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019170434.18700-1-pkj@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Oct 2021 15:45:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2008

Hi Peter,

Thanks for the documentation patch!

On 10/19/21 7:04 PM, Peter Kjellerstedt wrote:
> EXTERNALSRC_EXTENSIONS is used to specify additional classes to inherit
> when externalsrc is inherited.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Waiting for your patch to be accepted in OE-core before merging in
master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


