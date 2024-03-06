Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4884C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:24:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.14516.1709738641430403535
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 07:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fcolaztn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 746AEFF806;
	Wed,  6 Mar 2024 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709738639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kvfr9vF6GhhBOPEVqurjRWBJO/s/gU2x8ztGBPwuocU=;
	b=fcolaztnjmZSXcc1cSa//3+dUPQSR0nYzv4S6Zv2HHAqy8T+sX3hC9HtY+trAOxaftqa9/
	z2HwbtcfyO6fdt7Od6SQppIWduHwh6VTKEFgjfo6z3BeBy1sZ0DK8blV5tXlkSU6NUOIYx
	C3+lszIFsZRy6Yuh7DwPT4fV4c+6Pp58xVvzOlXH9kzurW7+4D8cpCywGBRep2p3xDh+SL
	Gnkd63yCTp0+2P0N2C2xfwrj9MygtE042vbEWPzQtjqeuxRTMDxWttk7wZamzOW1JpGPDD
	myiuy+rjau1orwGJpe93ozJ2o/x2fJ/nXhNnB77KaExlD1Yr3V+CMj/Yltq0+g==
Message-ID: <1d9a5834-d8d5-4c52-9f3d-ca28317e37fb@bootlin.com>
Date: Wed, 6 Mar 2024 16:23:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] bmaptool: rename
Content-Language: en-US
To: Trevor Woerner <twoerner@gmail.com>
References: <20240305220749.4742-1-twoerner@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240305220749.4742-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Mar 2024 15:24:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4941

Hi Trevor

Thanks for the patch and for taking care of bmaptool!

On 3/5/24 at 23:07, Trevor Woerner wrote:
> What was previously known variously as Bmaptool, bmaptools, bmap-tool,
> and/or bmap-tools has been updated to the singular name: bmaptool. Update
> all references to suit.
>
> Since we are not in charge of debian's package naming policy, any
> references that relate to debian package(s) will stay as "bmap-tools".
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next"
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


