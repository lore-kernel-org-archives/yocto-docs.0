Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205C9C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 20:23:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.34709.1700684609072835872
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Nov 2023 12:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=otjs06Xj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 821D31C0008;
	Wed, 22 Nov 2023 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700684606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4QRGHLiarzMNpwSOHqL2yRkfQAYgOqlML8Vq1rAJI58=;
	b=otjs06XjtnvylZE3YeIgIq+/g7cTWnbbrmT4618X/HjSNuWQNi0pzlZfJuIyq904kmjpGh
	g3Cvr+FIT77zlhxLUFLf5ZxPuo+dBntWXGUvwQKffqICThchU3LD8BqOiNDGctuBr28O5q
	YLHciqvMyUl4pxFMaN4Nmkp5xUNzZdu9uLgOYUkh16vk4e9nuWGWETi2aIJ6qFAzwi3wkb
	h+gud5L99Ge5tVgebw/pJRnXjynJvHiddCmRkK1ItsXDNCplccJUcDzI7K5iqbSWLda44g
	w1h454jIT59R65if72k1e6OUtpWjK+YNTCiTRc439sBiP7rG/F4dq2Zsr/q9gQ==
Message-ID: <1ac621f7-085d-4e05-9a13-4fa183e2bcb0@bootlin.com>
Date: Wed, 22 Nov 2023 21:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] contributor-guide: add License-Update tag
Content-Language: en-US
To: Justin Bronder <jsbronder@cold-front.org>
References: <20231121195854.27968-1-jsbronder@cold-front.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231121195854.27968-1-jsbronder@cold-front.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Nov 2023 20:23:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4645

Hi Justin,

Many thanks for this improvement to the docs.

On 21.11.23 at 20:58, Justin Bronder wrote:
> Porting from the old wiki
> https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935#Describing_license_changes
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>   .../contributor-guide/recipe-style-guide.rst          | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> index a005aa324..bb8f6980e 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -250,6 +250,17 @@ Recipes need to define both the :term:`LICENSE` and
>      correct string that you can substitute into the recipe file for a
>      subsequent build.
>   
> +License Updates
> ++++++++++++++++

I just replaced "++++..." by "~~~~..." as recommended in 
documentation/README and used in other parts of the manual, though the 
result looks the same to create a subsection.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


