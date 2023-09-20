Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35542CE79D6
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 14:19:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.40910.1695219554770747520
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 07:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HtsXMUP3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D84851BF204;
	Wed, 20 Sep 2023 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695219552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IswWHASriJP5V+8NPNmz0oqx8bAALyzmN+cehya38TM=;
	b=HtsXMUP3u0PI8B/QJpzY8FFkX8ioP2iiHOSrPrQ04r9Cr0pAkY9CviD/9njZrAJ4PsIDab
	1aRTzTO1ukIfbenaw2airhZHweste9zYFNDg6zOU90NvtBjZc61txucsygWweeAq0RLjhD
	Ja2CXrDVURQNxl+CmU9AWIUB4keq0oXGQrkVemoy1xImM47U3x//VBaq6C6OlOnj08wBL8
	s3lHPNOb3C0hBym1WS4dXVoXh2y++O3UIlKvfxHJ5jYp0h98hJlouDm/sNtqJ+v+nlKEGy
	ETaZCSfN6TwVQZAwYNaerevMQVd826qQ5e8sUo5c+lU4nKQXSUqK5KstmbGz/w==
Message-ID: <91629ad7-351b-74d2-133b-ae9805a16c46@bootlin.com>
Date: Wed, 20 Sep 2023 16:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH 3/4] contributor-guide: discourage marking patches
 as Inappropriate
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>, docs@lists.yoctoproject.org
References: <20230920100647.1038583-1-rhi@pengutronix.de>
 <20230920100647.1038583-3-rhi@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230920100647.1038583-3-rhi@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 14:19:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4272


On 20.09.23 at 12:06, Roland Hieber wrote:
> It was never really clear what all those reasons really meant, and every
> patch submitted upstream liftens the maintenance on the Yocto side.
> So remove the current list, and replace it with two reasons in which an
> upstream submission likely won't benefit the upstream project.
>
> Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
>   .../contributor-guide/recipe-style-guide.rst  | 30 +++++++++----------
>   1 file changed, 14 insertions(+), 16 deletions(-)
>
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> index 4faadcd122d8..bc14c58a9759 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -299,22 +299,20 @@ following status strings:
>   
>   ``Inappropriate [reason]``
>      The patch is not appropriate for upstream, include a brief reason on the
> -   same line enclosed with ``[]``. The reason can be:
> -
> -   -  ``not author`` (you are not the author and do not intend to upstream this,
> -      the source must be listed in the comments)
> -   -  ``native``
> -   -  ``licensing``
> -   -  ``configuration``
> -   -  ``enable feature``
> -   -  ``disable feature``
> -   -  ``bugfix`` (add bug URL here)
> -   -  ``embedded specific``
> -   -  ``other`` (give details in comments)
> -
> -The various ``Inappropriate [reason]`` status items are meant to indicate that
> -the person responsible for adding this patch to the system does not intend to
> -upstream the patch for a specific reason.
> +   same line enclosed with ``[]``. In the past, there were several different
> +   reasons not to submit patches upstream, but we have to consider that every
> +   non-upstreamed patch means a maintainance burden for recipe maintainers.
> +   Currently, the only reasons to mark patches as inappropriate for upstream
> +   submission are:
> +
> +   -  ``oe specific``: the issue is specific to how Yocto performs builds
> +      or sets things up at runtime, and can be resolved only with a patch that
> +      is not however relevant or appropriate for general upstream submission.
> +   - ``upstream ticket <link>``: the issue is not Yocto-specific and should be
> +      fixed upstream, but the patch in its current form is not suitable for
> +      merging upstream, and the author lacks sufficient expertise to develope a
> +      proper patch. Instead the issue is handled via a bug report (include
> +      link).


There is a formatting issue here: the second line (starting with "fixed 
upstream") has an extra leading space compared to the first one, and 
this messes-up the way the paragraph is rendered. Check by yourself ;-)

Otherwise, the rest looks good to me.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


