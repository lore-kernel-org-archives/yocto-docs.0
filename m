Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76B3EB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 17:45:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.25270.1686851102499622923
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 10:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TUlzs3h2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686851099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6UKDK5Dg1YqCOtBvvRzTv5zrlBaaMBmPkuEOHUQG2U=;
	b=TUlzs3h2enRbm6/ZsPOLdGUaZqbz1DrTx4eRQU9RuoOzqM4swNRWXD8kO7U/HevdXm7jVc
	VePNp5ehxgwWVQ+tPgYyHSPtyqMmBhmesmftjdv94sQ9I6ECBrvHE7u+JXFUnIFCHwOy9P
	IIYJmDITIkVb8lILTOK3K5DNfc+z+YDkoRq7PN0kJGN27NIlS5XlZkgyeBFxPBtRi/DrNQ
	pG309aYtTd1nTAoAtpkqUrZWSW4a6xU4sx81podQ1RBCCJFKatgJx9Hjc4DnTVkchGrAWl
	VuAbv+cg/3uI61NVekI/Mkjz0xUnE0VcWfHZ30x48v1fmbWZZ2IngJoE5DoBIA==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 277ACFF802;
	Thu, 15 Jun 2023 17:44:59 +0000 (UTC)
Message-ID: <06e6ff0f-c70d-bd6c-1ba6-47bdbe3247d0@bootlin.com>
Date: Thu, 15 Jun 2023 19:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] reproducible-builds.rst: document
 OEQA_REPRODUCIBLE_TEST_TARGET and OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20230615112633.3702207-1-mikko.rapeli@linaro.org>
 <20230615112633.3702207-2-mikko.rapeli@linaro.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230615112633.3702207-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Jun 2023 17:45:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3999

Hi again Mikko

On 15.06.23 at 13:26, Mikko Rapeli wrote:
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> They are used to fine tune build reproducibility test for
> different build targets than "bitbake world" and to define
> which recipes can be rebuild using sstate cache.
>
> These are useful when ramping up build reproducibility in complex
> build configurations where "bitbake world" has too many failures.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/test-manual/reproducible-builds.rst | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
> index 50256fb197..28feb78391 100644
> --- a/documentation/test-manual/reproducible-builds.rst
> +++ b/documentation/test-manual/reproducible-builds.rst
> @@ -103,10 +103,12 @@ run::
>      oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
>   
>   This defaults to including a ``world`` build so, if other layers are added, it would
> -also run the tests for recipes in the additional layers. The first build will be
> -run using :ref:`Shared State <overview-manual/concepts:Shared State>` if
> +also run the tests for recipes in the additional layers. Different build targets
> +can be defined using ``OEQA_REPRODUCIBLE_TEST_TARGET`` variable in ``local.conf``.
/s/using ``OEQA_REPRODUCIBLE_TEST_TARGET``/using the 
:term:`OEQA_REPRODUCIBLE_TEST_TARGET`/
> +The first build will be run using :ref:`Shared State <overview-manual/concepts:Shared State>` if
>   available, the second build explicitly disables
> -:ref:`Shared State <overview-manual/concepts:Shared State>` and builds on the
> +:ref:`Shared State <overview-manual/concepts:Shared State>` except for recipes defined in
> +``OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`` variable, and builds on the

Same comment. I will fix both.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged both commits into master-next.

Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


