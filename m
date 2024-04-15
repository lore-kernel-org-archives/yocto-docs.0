Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81BCC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 16:08:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.25206.1713197305305804585
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 09:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=W/PCOTGu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2691860004;
	Mon, 15 Apr 2024 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713197303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQphCHycXr0TLFU1kt5/ROstXArHO2sfc0f/Fq923VE=;
	b=W/PCOTGutFWjhrFd2Y1Hb2ebH0jPcNA/3BgAzBxcHDaaWBRXxxfFgZwNuYS0q00kXqf2U8
	d8Yow7nWJDjnARzN8IZJ0vzPdvJ7VQ5Xa/Y/5Rmp8zhvYSZ6UsTncRT7R/yu2nfe3uBMRs
	T+fY4D9mmoo9JshZ2KVf+QtkilKyM5j2XQAGAK5UyihAfFmYjMyltpiZcoABmrEeJ8szEI
	NvkFtOmhNitVXCrc2XwV0jG+MnfVEb5fb8K8IcLmvPZB+hyOeGQJ7KVNipxTP77FOWsExT
	JxlwiWiFRR3EzMJom+d22PzDcbkua38oel9Sz4TqJhGCikjg/NuOkgNOivKziA==
Message-ID: <a9e2d8f6-9ca3-4830-87c8-013a3bd0751f@bootlin.com>
Date: Mon, 15 Apr 2024 18:08:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: Add "devtool extract/sync" explanation
To: vincent@coelebs.dev
References: <20240414184804.12111-2-vincent@coelebs.dev>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240414184804.12111-2-vincent@coelebs.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 16:08:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5159

Hi Vincent

Thanks for your patch!

On 4/14/24 at 20:48, vincent@coelebs.dev wrote:
> From: Vincent Kriek <vincent@coelebs.dev>
>
> Documentation describing the devtool extract and devtool sync commands
> were not present. This patch adds basic explanations how the commands
> work and why you could use them.
>
> Signed-off-by: Vincent Kriek <vincent@coelebs.dev>
> ---
>   .../ref-manual/devtool-reference.rst          | 36 +++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
> index 9319addc3c..fbfd038e5c 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -618,3 +618,39 @@ a match.
>   
>   When you use the ``devtool search`` command, you must supply a keyword.
>   The command uses the keyword when searching for a match.
> +
> +.. _devtool-extract-source-of-recipe:
> +
> +Extract source of recipe
> +========================
> +
> +Use the ``devtool extract`` command to extract the source of a recipe to the
> +directory specified. The extract command can extract the source of a recipe
> +with patches applied to a directory on the system, not constrained to the
> +devtool workspace.
> +
> +To extract the source of a recipe use the this command::
> +
> +        $ devtool extract recipe /path/to/extract/location
> +
> +In contrary to the ``devtool modify`` command this extracted copy will have no
> +impact on builds and can not be integrated back in to recipes by using devtool.
> +
> +.. _devtool-sync-extracted-source-of-recipe:
> +
> +Sync extracted source of recipe
> +===============================
> +
> +Use the ``devtool sync`` command to synchronize a previously extracted source
> +tree of a recipe with the latest status of the recipe.
> +
> +To synchronize the extracted source tree of a recipe use this command::
> +
> +    $ devtool sync recipe /path/to/existing/extract/location
> +
> +.. note::
> +
> +   The synchronization of ``devtool sync`` could remove work you have in your
> +   checked out tree as it will set the new head of the devtool branch to the
> +   latest commit specified by the recipe. The previous devtool branch will be
> +   copied to the devtool.bak branch


Your patch does apply, but actually, the current documentation already 
mentions "devtool extract" and "devtool sync". See 
https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/devtool-reference.rst#n224

You may have started from an older version of the documentation, or just 
overlooked  such sections.

Unless I'm mistaken, you may merge your changes with the existing 
descriptions, keeping the best of both. Could you send a new version?

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


