Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A0AC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 08:38:49 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.12143.1716453524716308804
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 01:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ezDs/DoE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1710860002;
	Thu, 23 May 2024 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716453522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l//rTxmvWmLLEB0GpWnJpVlRp4R4PmK2zWUrPjClXEo=;
	b=ezDs/DoEGEnbC67x/ELpe1hWRXHiMsSPR7WZALpEvwrxsc0f2oqpLEkmp8lt3Wh9wymNTN
	KyCF+1Zh2rfyto8WgvI15Q2diKxjrxe5DIYAUp+G3v69quJT3BKkxQqrA8SEIoczNC8GUH
	RCdy2jdQnJ3e5mqFstWKK3pgjpkTcazHzgj3ntORiQw69ZOupt1jOsH3SwRZHAY/szRve1
	U8Qt13rt4DHE/1p/yg6SNJYD3+uQpD3Cy3j532DkE+1IrcRhY88QRYaSUSwmGVJdxtKOda
	8Ha+6kzeIbEKW+cpOPk1cSxob+SlZdOgYm4r7dP91IqZZ9eqPfdNy0V4NYC0PA==
Message-ID: <dd2488e7-e201-4017-b54c-4dd1e7b68aba@bootlin.com>
Date: Thu, 23 May 2024 10:38:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] ref-manual: classes: add new image-bootfiles
 class
To: Marcus Folkesson <marcus.folkesson@gmail.com>
References: <20240523073938.2135-1-marcus.folkesson@gmail.com>
 <20240523073938.2135-2-marcus.folkesson@gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240523073938.2135-2-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 08:38:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5233

Hi Marcus

Thanks for the documentation patch!

On 5/23/24 at 13:09, Marcus Folkesson wrote:
> Describe the newly introduced image-bootfiles class.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   documentation/ref-manual/classes.rst | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 9520d0bf7c..53b3697bee 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1169,6 +1169,20 @@ Yocto Project Overview and Concepts Manual.
>   
>   .. _ref-classes-image-buildinfo:
>   
> +``image-bootfiles``
> +===================
> +
> +The :ref:`ref-classes-image-buildinfo` class copies over files listed
> +in :ref:`IMAGE_BOOT_FILES` to the /boot directory of the root filesystem.
> +
> +This can be useful if no separate boot partition is used but all boot files
> +should be included into the rootfs image.
> +
> +:ref:`IMAGE_BOOT_FILES` is the same space-separated list of files used
> +by the ``bootimg-partition`` source plugin to populate the boot partition.
> +
> +.. _ref-classes-image_types:
> +
>   ``image-buildinfo``
>   ===================

There are issues though...

cd documentation
make html

reading sources... [100%] releases
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:1206: 
WARNING: Duplicate explicit target name: "ref-classes-image_types".
looking for now-outdated files... none found
pickling environment... done
checking consistency... done
preparing documents... done
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:1175: 
WARNING: undefined label: 'image_boot_files'
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:1181: 
WARNING: undefined label: 'image_boot_files'
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:1211: 
WARNING: undefined label: 'ref-classes-image_types'
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:1217: 
WARNING: undefined label: 'ref-classes-image_types'
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:1234: 
WARNING: undefined label: 'ref-classes-image_types'

You should actually add the new class documentation before " .. 
_ref-classes-image-buildinfo:" and have your own ".. 
_ref-classes-image-bootfiles" definition.

Thanks in advance. You may wait for your class to be merged before 
submitting a V2 of the documentation (though early documentation is 
always useful!), as I won't be able to merge the documentation changes 
before this happens.
Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


