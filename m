Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6E1E7C4E6
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 17:14:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.25085.1696439646574641022
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 10:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oyh3VfT5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D601C1BF207;
	Wed,  4 Oct 2023 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696439644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GTHjICP7d3ESTrhipdrXHDVuaML7tl0dtaFfK9oe9wQ=;
	b=oyh3VfT5uUmfRwGnAqbS2MC67W3acjKqxV57v1pYlWcmzWip9fB+udfXyQuImuY4nJ1mL9
	UmNX85uoplc+Em1VijphYvoswwJqmJb55KtrJQIuc9jCFzIzYRVOSanTMWKtdnxD2gdkkU
	LXdo8VaaVqJEvF5I/tDehxixRGCfTOPLSG+Xg1DV4Z36XBcIWSdLmz+4KkvrJfrb6friJd
	3BvSOOZWlSJUEWm6kJhc76xMs4ry5VgreMpKS/g799ZkxRxbdIBAukaEt8sRL3uztZ+LR2
	UTHKslqFnd80odOsJ6/HtvtLOSLw5EbwM7dXVYsytRiN0y2nhNVwKbwHLaKeFQ==
Message-ID: <ae397d71-220a-e86e-e087-55ea6000dece@bootlin.com>
Date: Wed, 4 Oct 2023 19:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] ref-manual: Add documentation for the
 unimplemented-ptest QA warning
Content-Language: en-US
To: Yoann Congal <yoann.congal@smile.fr>
References: <20231004143651.1796870-1-yoann.congal@smile.fr>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231004143651.1796870-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Oct 2023 17:14:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4307

Yoann, Jérémy,

Thanks for the documentation patch!

On 04.10.23 at 16:36, Yoann Congal wrote:
> From: Jérémy Rosen <jeremy.rosen@smile.fr>
>
> Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> This is the v2 for the doc of this series:
> https://lists.openembedded.org/g/openembedded-core/message/188680
>
> v1->v2:
> * Fix shortlog tag
>
>   documentation/ref-manual/classes.rst   |  3 +++
>   documentation/ref-manual/qa-checks.rst | 11 +++++++++++
>   2 files changed, 14 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 3f0d4844e..3eede8c7b 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1480,6 +1480,9 @@ Here are the tests you can list with the :term:`WARN_QA` and
>      also inherits :ref:`ref-classes-features_check` in order for the
>      requirement to actually work.
>   
> +-  ``unimplemented-ptest:`` Checks that ptest are implemented for upstream
> +   tests.

Shouldn't it be "ptests" instead of "ptest"?

> +
>   -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
>      for a package are also declared on the recipe level (i.e. any license
>      in ``LICENSE:*`` should appear in :term:`LICENSE`).
> diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
> index 4a02e7206..cc9afeb7c 100644
> --- a/documentation/ref-manual/qa-checks.rst
> +++ b/documentation/ref-manual/qa-checks.rst
> @@ -789,6 +789,17 @@ Errors and Warnings
>       use a relative path rather than an absolute one, or to pick up the path from
>       runtime configuration or environment variables.
>   
> +.. _qa-check-unimplemented-ptest:
> +
> +- ``<tool> tests detected [unimpemented-ptest]``

s/unimpemented/unimplemented/

> +
> +    This check will detect if the source of the package contains some upstream-
> +    provided tests and, if such tests are detected, that ptests are implemented
s/if such tests are detected/if so/
> +    for this recipe.  see the ":ref:`dev-manual/packages:testing packages with ptest`"


s/see/See/

Looks good to me otherwise.
Thanks in advance for a quick V3 ;-)
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


