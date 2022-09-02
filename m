Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BEFC6FA82
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 20:31:18 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.3463.1662150669628792751
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 13:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NL3XQ+RT;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 58774100004;
	Fri,  2 Sep 2022 20:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662150667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+QSqEDrHE/vBaQ3SgJfh50Dd/0EFpg5hJ0USDVh/l8=;
	b=NL3XQ+RT9UK2ZeEoCqoSrAnhpm9fYx2oNG9EZbQLOhl3s/X4S/Sf0/h2csv0VMmV7Ixvpo
	5Qm790VIugpnfMFnkktnnMmVLQcSq9dktdRmhtfFXqL69hgkRqPWuU9ak4Zjyy1Hf1iSvr
	qcY1NjDiwYvGszrDn1J4ZWpEr5aEh4bI1FmfLO+Tj7+fg8B1Wkd9MobhcZUyJD4kwHGlw+
	6Nmzt8hNodP+Gx1YOZ9EX23d2AloC/LRlkrtYi4BbiRltPB3RMaJrRF/hSUci2bVDPOfva
	vk4KmYbBTuDRD3RGSsEURc8QPKO6iFCO7wgQL0wLE7CogILhkhJpUL6AIsAVPQ==
Message-ID: <1d26f4ca-372f-bc45-6baa-873a024bbd0c@bootlin.com>
Date: Fri, 2 Sep 2022 22:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: remove obsolete product listing from
 FAQ
Content-Language: en-US
To: "yocto-advocacy@lists.yoctoproject.org"
 <yocto-advocacy@lists.yoctoproject.org>
References: <1711247857DEC2A1.15579@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1711247857DEC2A1.15579@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Sep 2022 20:31:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3137

Greetings advocacy group,

On 9/2/22 22:17, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> This removes the single reference to a product built with OE.
> The URL for this product doesn't refer to OE any more
> and this FAQ is problably not the best place to highlight
> products built with OE.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/faq.rst | 10 ----------
>   1 file changed, 10 deletions(-)
>
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
> index 61049523a0..9e489991fd 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -52,16 +52,6 @@ section in the Yocto Project Development Tasks Manual and the
>   Usually, if the board is not completely exotic, adding support in the
>   Yocto Project is fairly straightforward.
>   
> -**Q:** Are there any products built using the OpenEmbedded build system?
> -
> -**A:** The software running on the `Vernier
> -LabQuest <https://vernier.com/labquest/>`__ is built using the
> -OpenEmbedded build system. See the `Vernier
> -LabQuest <https://www.vernier.com/products/interfaces/labq/>`__ website
> -for more information. There are a number of pre-production devices using
> -the OpenEmbedded build system and the Yocto Project team announces them
> -as soon as they are released.
> -
>   **Q:** What does the OpenEmbedded build system produce as output?
>   
>   **A:** Because you can use the same set of recipes to create output of


Following this proposed update to the manual, removing an obsolete 
reference, I'm surprised not to find any page listing success stories of 
products built using the OpenEmbedded build system. Don't we have this 
anywhere?

I guess this can be sensitive information for some product or platforms 
vendors, but I guess some others could be proud to put forward their use 
of OE / Yocto to build their products.

Of course, I guess it's complicated to promote some users / contributors 
and not some others. Maybe an informal page on the wiki would work 
better than an official list on the project website.

Any thoughts?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


