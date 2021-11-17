Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39043C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 10:05:19 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.5221.1637143517710691081
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 02:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DC2F1240012;
	Wed, 17 Nov 2021 10:05:15 +0000 (UTC)
Subject: Re: [docs] [PATCH] bitbake: doc: bitbake-user-manual: Add more
 explanations to OVERRIDES
To: "Simon A. Eugster" <simon.eu@gmail.com>, docs@lists.yoctoproject.org
References: <20211115124546.97456-1-simon.eu@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <fe161f54-aaf5-afdd-f715-0b5b9d4df916@bootlin.com>
Date: Wed, 17 Nov 2021 11:05:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115124546.97456-1-simon.eu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Nov 2021 10:05:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2158

Hi Simon,

Thank you for proposing documentation improvements!

On 11/15/21 1:45 PM, Simon A. Eugster wrote:
> Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> ---
>  bitbake/doc/README                            |  3 +-
>  .../bitbake-user-manual-metadata.rst          | 35 +++++++++++++------
>  2 files changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/bitbake/doc/README b/bitbake/doc/README
> index 16e6cdf990..84e7cb702d 100644
> --- a/bitbake/doc/README
> +++ b/bitbake/doc/README
> @@ -47,8 +47,7 @@ To install all required packages run:
>  
>  To build the documentation locally, run:
>  
> - $ cd documentation
> - $ make -f Makefile.sphinx html
> + $ make html


What version of the Bitbake manual did you create your patch from? The
above changes have already been made last year...
Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


