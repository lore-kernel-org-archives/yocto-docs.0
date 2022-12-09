Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749B0C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 16:02:44 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.5259.1670601762800737798
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 08:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OmqgxH1x;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 93A9CE0017;
	Fri,  9 Dec 2022 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670601761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCuqA6IehY2F2KETI0Cux11sYteQHgDyuffqEsql/IE=;
	b=OmqgxH1xpb8ZQj1lFxYYlR00r2FFsWUgbmAGAXocwt4kTcr5M4/XhgAeLvHhrbmK7mJYnf
	N22hJtvD+u2xqxbc5npVNirCv36/jX07nqQ8+H+Koa5BMz2P18SKJsddHt6yBn6NB8Q2os
	Gnc+JcngP6dJxP9CiJi4NPxLutzCdbGQC/r95q+pwfWTeL9xy3UEJXIMzLWTQipCDofu8K
	KkwcE0z0FHnmnQowTjjEMfjA18Uj0hWNiTp1qTnSXCXegduSm6PZNyf8VdbTc//n6DMvOk
	5ZCchGKA4Yqq0pyy4Xb+FywKQRCmnFyvuRTeNkF5ox+Efg6wCiTsRV8OGlAxTg==
Message-ID: <73159423-2862-08e1-30b1-5ddd4a24c73a@bootlin.com>
Date: Fri, 9 Dec 2022 17:02:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual/images.rst: fix unnumbered list
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20221208142038.14325-1-michael.opdenacker@bootlin.com>
 <f2f93de3-57ea-1631-e390-785d164f13d0@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <f2f93de3-57ea-1631-e390-785d164f13d0@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 16:02:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3540

Hi Quentin,

Thanks for the review!

Am 09.12.22 um 10:59 schrieb Quentin Schulz via lists.yoctoproject.org:
> Hi Michael,
>
> On 12/8/22 15:20, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/ref-manual/images.rst | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/documentation/ref-manual/images.rst 
>> b/documentation/ref-manual/images.rst
>> index d52b39f3cf..bbbbb55d73 100644
>> --- a/documentation/ref-manual/images.rst
>> +++ b/documentation/ref-manual/images.rst
>> @@ -18,11 +18,10 @@ image you want.
>>      are going to build an image using non-GPLv3 and similarly licensed
>>      components, you must make the following changes in the 
>> ``local.conf``
>>      file before using the BitBake command to build the minimal or base
>> -   image::
>> -
>> -           1. Comment out the EXTRA_IMAGE_FEATURES line
>> -           2. Set INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0* AGPL-3.0*"
>> +   image:
>>   +   1. Comment out the :term:`EXTRA_IMAGE_FEATURES` line
>> +   2. Set :term:`INCOMPATIBLE_LICENSE` to "GPL-3.0* LGPL-3.0* 
>> AGPL-3.0*"
>
> I believe you can even use:
> #.
> so that it's automatically numbered properly.


Hey, this sounds great, and indeed it works.
I'll look for other opportunities to use this syntax.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


