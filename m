Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE8CC433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 16:35:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.1079.1653064538752683536
 for <docs@lists.yoctoproject.org>;
 Fri, 20 May 2022 09:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jUeqViBr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6AC20E0002;
	Fri, 20 May 2022 16:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653064536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwIv1Y6NF8jxTGKt9SehIO2J9BM6C9vcVimK4L8aIeI=;
	b=jUeqViBrFZfKMw5q7TM9bOMxrL4bL2wtZej4/9MV3PG86Th/1de78nRJkZiBvh6VNAXnoM
	hSHU3sZ9f2kzqrTRQpAoui7fcOcobWs5Qefg3BDXgZLnWEvufwfAaRD7A1nHsBjuc690uy
	tbqn6s5kV0uXTb8wSsLCK99N41Dnh22sOP0WWwp1k+Kz1ir14W/6JGrnoQPt1oOg16RJz3
	945T8fafTwp45kEWVFnqxQFhzctcyZiZwaRGgo975jkkXRYIf/FERGp3Y/blFZ+uz7IqQh
	VyvDCsOul+iV+qZvitKO/Gykk87/+535AGi38f5NW3Smc3/6a6Uts4i6ID9l8A==
Message-ID: <52b4ff74-7281-52c3-6e4b-002b5b8c3b25@bootlin.com>
Date: Fri, 20 May 2022 18:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] PATCH for bmaptool examples
Content-Language: en-US
To: Thomas Epperson <tepperson@briskheat.com>
References: <6jIv.1653060874347710359.h4zY@lists.yoctoproject.org>
 <0d3dc5e6-78fd-037b-8805-d689cdf70dd8@bootlin.com>
 <DB9PR07MB8404AC6DC4A667C638EC55D2B8D39@DB9PR07MB8404.eurprd07.prod.outlook.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <DB9PR07MB8404AC6DC4A667C638EC55D2B8D39@DB9PR07MB8404.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 May 2022 16:35:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2940

Hi Thomas,

On 5/20/22 18:23, Thomas Epperson wrote:
> It looks like I don't have git send-email on my system. Yes, I made a typo in my patch, I have corrected it.
>
> From b6bf34d26e49ef637d73085e5fde27bbbefc2ee4 Mon Sep 17 00:00:00 2001
> From: Thomas Epperson <tepperson@briskheat.com>
> Date: Fri, 20 May 2022 11:28:15 -0400
> Subject: [PATCH] Update documentation for bmaptool usage
>
> Signed-off-by: Thomas Epperson <tepperson@briskheat.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index b228c75aa..04df750ef 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -5880,7 +5880,7 @@ Directory onto a USB stick, or whatever media for which you built your
>  image, and boot from the media. You can write the image by using
>  ``bmaptool`` or ``dd``::
>  
> -   $ oe-run-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
> +   $ oe-run-native bmap-tools-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
>  
>  or ::
>  


Thanks for the update. I just slightly modified the patch summary and
merged it into the "master-next" branch.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


