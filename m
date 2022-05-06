Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7959C433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 09:49:56 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.7469.1651830595174843939
 for <docs@lists.yoctoproject.org>;
 Fri, 06 May 2022 02:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RNegSHNZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B11F420014;
	Fri,  6 May 2022 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651830593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UGctOjI2oiKVA62PkvKzHSVlP9mRfUJ63hjRG/I1qs=;
	b=RNegSHNZmB7qGg9tm8jzDPcpmSrT/P6soy108wY6JdEiOFy6Wjg8ZUazRwqEUV0LCufZWD
	3rc5Dk/MheTQ+Q9D9qS6CxfVOuJ9kqBI7EtV+Jy7SSgtwsT5COyrgOpfiY4JGX12AUOQbb
	CRJyutDOXlyNgT4YHuI8to/CeErbhbZbw4UtrqoDORmvkfPVQjM7djjAWvcmZ0kW8Y6SDm
	WrvzUuKOUlifR8KYByVxQbuyQuayTxRNbbIQbRrDo6+XkzCWdlEtQ9pgdIlqXcvOrt4vFj
	2ckaSIuWZzhNB8791+yQGLHP/rH20rwnleEAQMTeLBOFFSJBXP8onXH4LNUE0Q==
Message-ID: <a394b80e-67ee-ef80-6b74-0c6ec07dcaa8@bootlin.com>
Date: Fri, 6 May 2022 11:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH] docs: set_versions.py: show release name in
 switchers.js
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20220505104300.446038-1-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220505104300.446038-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 May 2022 09:49:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2923

Hi Quentin,

On 5/5/22 12:43, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> Also show release names in the dropdown menu so that people have
> knowledge of both the version number and release name of whatever
> they're using or planning to use or upgrade to.
>
> This patch will make the dropdown menu show the following entries:
> Unstable (dev)
> Kirkstone (4.0)
> Honister (3.4.3)
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>


Thanks for the patch, good idea!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


