Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F906C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 10:50:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.95339.1709549411457326133
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 02:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xj3HwKar;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6527DFF810;
	Mon,  4 Mar 2024 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709549409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sluiPspl+BNGHy02Cs7jIQ6y9R0G9H2Jr4TtPA8th0c=;
	b=Xj3HwKargU3LgFS9ft0bthYGQhPsF1BD0NHGPCqdk9p2g6DgpMIK8Lss8bmraVcA6VfoUo
	4XzSNUZlWfhaAHcenQy/yI7TD1sVFNPECS9wvak2QN9aWjLbl897cXUrqWd4kP0mgs9syA
	uQYLA2mxL/WVyo6qO2A9ts9uxXKp0yIH8F/nHfrV5yN84T6FnJEGi0TdRRwg7cBn1bq8c8
	UDJ0LEHqSsG1grBCv1u0AGQos2ZiI9nWuU5uQfE2SOdEo3+tngUhDAq/UmK8wXzFzVF4Pv
	X4w8DcEpz6bUoc7WAhWVZ2NG39k0JBsoMeSpjIrv89x6Oa/PugJy9xgyHyw4yQ==
Message-ID: <16fc31e1-ec00-4400-a458-215509c1f778@bootlin.com>
Date: Mon, 4 Mar 2024 11:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] strange wording to explain BB_ENV_PASSTHROUGH?
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <b74ee0e8-5f40-293f-7da2-b66a8c167317@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <b74ee0e8-5f40-293f-7da2-b66a8c167317@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Mar 2024 10:50:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4923

Hi Robert

On 3/3/24 at 13:19, Robert P. J. Day wrote:
>    reading this:
>
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-BB_ENV_PASSTHROUGH
>
> it seems visually odd that that variable, if not "specified", is
> defined in terms of a list of variables that includes itself.
>
>    but the text before that also reads weirdly:
>
> "If the value of this variable is not specified (which is the
> default)..."
>
>    Does this mean, if the variable does not have a value? Or that you
> haven't specified it? Or what? The wording seems confusing.


Thanks for reporting this issue. Good catch!
Actually, there could be an issue in the code.

Looking at 
https://git.openembedded.org/bitbake/tree/lib/bb/utils.py#n664, it seems 
that when the variable is not set in the environment, 
approved_variables() takes a value that contains BB_ENV_PASSTHROUGH 
(https://git.openembedded.org/bitbake/tree/lib/bb/utils.py#n607)!

I also checked on a possible default value for BB_ENV_PASSTHROUGH when 
it is not set in the environment, and got nothing:

$ bitbake-getvar -r core-image-full-cmdline BB_ENV_PASSTHROUGH
The variable 'BB_ENV_PASSTHROUGH' is not defined

I feel like submitting a patch as a way to confirm that 
BB_ENV_PASSTHROUGH can be removed from the code mentioned above.
This will help to fix this part of the docs.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


