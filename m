Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC55CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 13:46:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.28028.1697723175399118678
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 06:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AnFDYjYb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 718FEC0003;
	Thu, 19 Oct 2023 13:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697723172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxIp0cCDhnY0kDB1DF67atSfVlHfsfIL+9dIZcu0wDM=;
	b=AnFDYjYbse2NGK0YeigdjbZc87wzJoCen7cxFh9dKRmyMQdmPuh/Jb0PxUstv07h+OdKb6
	WrvBhgJ3oOp2DmQPKwm92yY4fiIFN52ce7Kn2w85zhfme6G9MZrv7+9GqqIiyQPkp83gl7
	zwakPZZySYCcoYoFF1LBWlgppYYG3heB+YrSHYGJRXB8ggV/gseA3jgmw0ahH9cCTlPG2Y
	xUIbmNDiPcktt53sp9QSnVav3Gd+ssV6Q1j1J+Pzx/kJK0dNvR0O5ZIbKLyLjeYOncwpRF
	OMTJ7i9ZBXJKZuJAx5vXSGacViUwDrcCAPWcBDva1RD04A9LIQp+zq6ASRFR3g==
Message-ID: <cfb10d45-0b9e-42c7-b7aa-5a9ee2c80331@bootlin.com>
Date: Thu, 19 Oct 2023 15:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Subject: Re: [docs] [PATCH v3] ref-manual: Add documentation for the
 unimplemented-ptest QA warning
Content-Language: en-US
To: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
References: <20231010135139.3995226-1-yoann.congal@smile.fr>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231010135139.3995226-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 13:46:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4423

Yoann, Jérémy,
On 10.10.23 at 15:51, Yoann Congal wrote:
> From: Jérémy Rosen <jeremy.rosen@smile.fr>
>
> Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> Note: The code documented here has been sent to ML there:
> https://lists.openembedded.org/g/openembedded-core/message/188892
>
>
>   documentation/ref-manual/classes.rst   |  3 +++
>   documentation/ref-manual/qa-checks.rst | 11 +++++++++++
>   2 files changed, 14 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 3f0d4844e..c7a5e9a63 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1480,6 +1480,9 @@ Here are the tests you can list with the :term:`WARN_QA` and
>      also inherits :ref:`ref-classes-features_check` in order for the
>      requirement to actually work.
>   
> +-  ``unimplemented-ptest:`` Checks that ptests are implemented for upstream
> +   tests.
> +
>   -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
>      for a package are also declared on the recipe level (i.e. any license
>      in ``LICENSE:*`` should appear in :term:`LICENSE`).
> diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
> index 4a02e7206..63b2ecdc4 100644
> --- a/documentation/ref-manual/qa-checks.rst
> +++ b/documentation/ref-manual/qa-checks.rst
> @@ -789,6 +789,17 @@ Errors and Warnings
>       use a relative path rather than an absolute one, or to pick up the path from
>       runtime configuration or environment variables.
>   
> +.. _qa-check-unimplemented-ptest:
> +
> +- ``<tool> tests detected [unimplemented-ptest]``
> +
> +    This check will detect if the source of the package contains some upstream-
> +    provided tests and, if so, that ptests are implemented for this recipe.

Here I put "upstream-provided" on the same line, to avoid having a space 
between the two words.

> +    See the ":ref:`dev-manual/packages:testing packages with ptest`"
> +    section in the Yocto Project Development Tasks Manual. See also the
> +    ":ref:`ref-classes-ptest`" section.


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


