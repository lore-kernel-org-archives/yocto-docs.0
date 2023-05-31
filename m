Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AB2C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:23:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8357.1685517780835256085
 for <docs@lists.yoctoproject.org>;
 Wed, 31 May 2023 00:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LHdZ9Xoz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685517779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P0Vj0ehaGcTyTOVfpIGiGVMDJokOKMibarNMw8X6OPw=;
	b=LHdZ9XozMYALJIPJKRyvPEBd9/qCsWaMub7HEcMDM7RBGCbURiDAa6rzVhLSkZAFUO5R7R
	UtUu0nOVQRQ/GhI5o3YgywdV7HGTu8Yl/DdL9/xsbicIK7ONJ/Nmh7y9Ekn4qA6mCPa+gS
	+xpsQ8y2ZE0WgTzVVRaCjp+9RaGQabQlNa8Ai1ukVSyoVqv503ptz6/HSY9Fe6ZewXA1R0
	LjShoL4dUgC/J/SAXOEmzJzx5K9IQ7wONQ1+/52k0BXzfdsFs0+vPSxh5RvjM05o0VeRoa
	QLF0707zys1T9gbZJMKQD9mKFkQ8B4okSM/YCcYwa9rIZgQVKds6hrM+JLSK0Q==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BA801BF203;
	Wed, 31 May 2023 07:22:58 +0000 (UTC)
Message-ID: <5d9bda18-69e0-3b2d-7dff-f009791b4ed1@bootlin.com>
Date: Wed, 31 May 2023 09:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: yocto@pengutronix.de,
 Yocto Project Documentation <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: classes.rst: fix typo
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>
References: <20230530200804.2052179-1-u.oelmann@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230530200804.2052179-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 31 May 2023 07:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3981

Hi Ulrich

On 30.05.23 at 22:08, Ulrich Ölmann wrote:
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> ---
>   documentation/ref-manual/classes.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index e454a54537f7..11e70006e5ac 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1473,7 +1473,7 @@ Here are the tests you can list with the :term:`WARN_QA` and
>   
>   -  ``unhandled-features-check:`` check that if one of the variables that
>      the :ref:`ref-classes-features_check` class supports (e.g.
> -   :term:`REQUIRED_DISTRO_FEATURES`) is set by a recupe, then the recipe
> +   :term:`REQUIRED_DISTRO_FEATURES`) is set by a recipe, then the recipe
>      also inherits :ref:`ref-classes-features_check` in order for the
>      requirement to actually work.

Oops, good catch, thanks!
Merged into master-next.

Cheers
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


