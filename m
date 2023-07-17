Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D5AEB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 15:59:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.206.1689609540095729368
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 08:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VMiQsurK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0288B240005;
	Mon, 17 Jul 2023 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689609537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2oVOQj/5OkFN9JOhbAVuw0GB05pX+2GctjWpsDPxWg=;
	b=VMiQsurKJc+1nNlwC8oC56jAxg8mYCRUVllyUg2wgnYmOJcvOE+VB1UhnK4ppHlGav0AE6
	YdDYUSRLxBfc7dXevg3QihJ/QHU9AAacp2v/S+mJ19gj4WUOclZam9XTNXXcv+iXxHiahi
	a181L+JFaT5Y4zq2vpfTkZfsultGH+lvVoEsGEJEZX1cjX9sTVJz10a56qrVzOOb57UiKC
	JuvRTLZHEU2UCbjitxtsOY4jdrp2T9l+Kf6Nzwm/Areib4H5TbYrCZKTYS5eG30o0axznO
	F+WlV3HXwhUzQY3hB2MWV4X0oLSKZxsfUr3NEFc3Dha6QX13KLUueJzsH9y2ig==
Message-ID: <8ce2d2f1-870b-96fc-23df-e754dc664aa1@bootlin.com>
Date: Mon, 17 Jul 2023 17:58:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] docs: sdk-manual: appendix-obtain: fix literal
 block content
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <176B16FDD157E15A.20970@lists.yoctoproject.org>
 <20230623175404.1933627-1-michael.opdenacker@bootlin.com>
 <0db2c074-f292-60bd-8bbe-17a27c65055f@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <0db2c074-f292-60bd-8bbe-17a27c65055f@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Jul 2023 15:59:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4051


On 26.06.23 at 08:43, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 6/23/23 19:54, michael.opdenacker@bootlin.com wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> Restore the error message as it is supposed to be issued.
>>
>> The literal block renders its content verbatim so a term role (`:term:`)
>> would appear as :term: string in there and `---` as --- string instead
>> of the expected hyphen.
>>
>> Fixes: e319b3bf4eb6 ("manuals: add missing references to SDKMACHINE 
>> and SDK_ARCH")
>> Cc: Quentin Schulz <foss+yocto@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>
> It'll teach me to send a patch in a hurry before taking a day off :)
>
> Thanks, lgtm.


Thanks Quentin. That's better than not sending the patch anyway!
Merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


