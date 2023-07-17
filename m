Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EB9EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 16:18:02 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.751.1689610681263787399
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 09:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IGlFThKI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEFD5E000A;
	Mon, 17 Jul 2023 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689610679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqJRIVJVNUSgADjyu5k/GGirdC7lIrEwPDzV1luZazE=;
	b=IGlFThKIKQAbzgHi5Cfg03MXXe6mv69o2G/tM3vmuxTSNZLLvsrysQXSkfyDniYmB+MHN1
	a/Br2OEXs055U9cFsiXXZdtmrRRPpI1I5mIaiUCzvNcc5PQxrGEBeJyM2BCA2rPLko73UT
	rfmf41MacnlJSkEX05aGVd694AR6sgr2YUmeKaJEyDDcUpmb8qNm9UkayO+BwwAYi5gAtS
	lWEMkjl2eK5suwataZNSlnpI7TjHhEqcoQdsEcoqNIjXQSzXocnvy5CSVsKDJvmnKjJ0Hx
	DkI1hA/zKBlidWQhFA503WNCyQAVTT1TZO9TWmhVbpY3T1cDlxSLxVu7b7xbGA==
Message-ID: <9bffe951-5aa2-13cf-1ee7-2cd71f9e6e93@bootlin.com>
Date: Mon, 17 Jul 2023 18:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: yocto@pengutronix.de,
 Yocto Project Documentation <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 3/3] ref-manual: classes: kernel-fitimage:
 refine role of INITRAMFS_IMAGE_BUNDLE
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>
References: <20230714093554.2402426-1-u.oelmann@pengutronix.de>
 <20230714093554.2402426-3-u.oelmann@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230714093554.2402426-3-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Jul 2023 16:18:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4052

Hi Ulrich,

On 14.07.23 at 11:35, Ulrich Ölmann wrote:
> Although it might seem a little bit pedantic this patch describes what the class
> actually checks (see e.g. [1]) and kernel.bbclass per default sets the parameter
> INITRAMFS_IMAGE_BUNDLE to the empty string (see [2]) which already satisfies
> that check without the need of additionally explicitly setting it to '0'.
>
> [1] https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel-fitimage.bbclass?h=4.3_M1&id=cc97d775cb402df0d4122bf54eab1a5198c98471#n667
> [2] https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel.bbclass?h=4.3_M1&id=cc97d775cb402df0d4122bf54eab1a5198c98471#n37
>
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> ---
>   documentation/ref-manual/classes.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index dc30419a1e7f..4577baba3e66 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1625,7 +1625,7 @@ The address where the RAM disk image is to be loaded by U-Boot
>   is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
>   :term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to the FIT image when
>   :term:`INITRAMFS_IMAGE` is specified and requires that :term:`INITRAMFS_IMAGE_BUNDLE`
> -is set to 0.
> +is not set to 1.
>   
>   Only a single :term:`Initramfs` bundle can be added to the FIT image created by
>   :ref:`ref-classes-kernel-fitimage` and the :term:`Initramfs` bundle in FIT is optional.


Many thanks for the 3 patches, much appreciated as always.
For the 3 patches: Reviewed-by: Michael Opdenacker 
<michael.opdenacker@bootlin.com>
Merged into master-next.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


