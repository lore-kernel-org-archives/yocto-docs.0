Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA772C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 15:57:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.9991.1634745462779485877
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 08:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 149C84000E;
	Wed, 20 Oct 2021 15:57:33 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH] ref-manual: document TOOLCHAIN_HOST_TASK_ESDK
To: docs@lists.yoctoproject.org
References: <16AF7BF5EEE813B7.24805@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <5f04a9fe-42e8-a7b7-56d8-b9eaf29d3278@bootlin.com>
Date: Wed, 20 Oct 2021 17:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16AF7BF5EEE813B7.24805@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Oct 2021 15:57:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2009


On 10/19/21 6:37 PM, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/migration-guides/migration-3.4.rst | 2 +-
>  documentation/ref-manual/variables.rst           | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)


Merged in "master-next" and "honister-next".
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


