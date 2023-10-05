Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC0AE9370C
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:06:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.26025.1696536377358574586
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S5TRKhQy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93B1140003
	for <docs@lists.yoctoproject.org>; Thu,  5 Oct 2023 20:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P20ksQRCuswJca61EpHdMVNRORpPSeGgRdnBjaOcxFQ=;
	b=S5TRKhQy7lOsyASM7BE1NY0XdWJZM6wNhPGXtmAEj8FjLpz75X9zIIIqegxUqUGE82214l
	CmbBUzEVoWJxN3K1r+6ehOOuU7tUKqf8XwgKCGyUEgzy4YZdH3EyOk3pE5WFI67NGV7tfL
	r5nCwP+Y7r51z9pmk85VS2ZUGWZwScA15DaH9jnaoNf84S2ZWguRAulg2BA7OMQSMdtRjw
	yrpLrwZ/ExbsVM2SxZ1Zh3Gnvz3tjoPaJZsujtkBZ0NoTAzmIrLA/GOLo1dkcSPROwqPvK
	/QogU2SV9AcEshjYEkc37vXBHxsZ/J//mgu65ZUg4uYpH/VBONFcFf0rGO4YgA==
Message-ID: <6a4582f8-45ce-a8fc-4061-55ee5bad5b8f@bootlin.com>
Date: Thu, 5 Oct 2023 22:06:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [kirstone][PATCH 1/9] contributor-guide/style-guide: Refer to
 recipes, not packages
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <20231005200318.2873125-1-michael.opdenacker@bootlin.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231005200318.2873125-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 20:06:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4328

Apologies for "kirstone" instead of "kirkstone" in the subject line :/

On 05.10.23 at 22:03, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Whilst often referred to as packages by people we should use the more
> accurate term in documentation, 'recipe' instead of 'packages'.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   .../contributor-guide/recipe-style-guide.rst      | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> index 99105179a6..1a1c1c6ee2 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -7,17 +7,18 @@ Recipe Naming Conventions
>   =========================
>   
>   In general, most recipes should follow the naming convention
> -``recipes-category/package/packagename_version.bb``. Recipes for related
> -projects may share the same package directory. ``packagename``, ``category``,
> -and ``package`` may contain hyphens, but hyphens are not allowed in ``version``.
> +``recipes-category/recipename/recipename_version.bb``. Recipes for related
> +projects may share the same recipe directory. ``recipename`` and ``category``
> +may contain hyphens, but hyphens are not allowed in ``version``.
>   
>   If the recipe is tracking a Git revision that does not correspond to a released
> -version of the software, ``version`` may be ``git`` (e.g. ``packagename_git.bb``)
> +version of the software, ``version`` may be ``git`` (e.g. ``recipename_git.bb``)
> +and the recipe would set :term:`PV`.
>   
>   Version Policy
>   ==============
>   
> -Our versions follow the form ``<package epoch>:<package version>-<package revision>``
> +Our versions follow the form ``<epoch>:<version>-<revision>``
>   or in BitBake variable terms ${:term:`PE`}:${:term:`PV`}-${:term:`PR`}. We
>   generally follow the `Debian <https://www.debian.org/doc/debian-policy/ch-controlfields.html#version>`__
>   version policy which defines these terms.
> @@ -26,7 +27,7 @@ In most cases the version :term:`PV` will be set automatically from the recipe
>   file name. It is recommended to use released versions of software as these are
>   revisions that upstream are expecting people to use.
>   
> -Package versions should always compare and sort correctly so that upgrades work
> +Recipe versions should always compare and sort correctly so that upgrades work
>   as expected. With conventional versions such as ``1.4`` upgrading ``to 1.5``
>   this happens naturally, but some versions don't sort. For example,
>   ``1.5 Release Candidate 2`` could be written as ``1.5rc2`` but this sorts after
> @@ -62,7 +63,7 @@ Version Number Changes
>   
>   The :term:`PR` variable is used to indicate different revisions of a recipe
>   that reference the same upstream source version. It can be used to force a
> -new version of a package to be installed onto a device from a package feed.
> +new version of a recipe to be installed onto a device from a package feed.
>   These once had to be set manually but in most cases these can now be set and
>   incremented automatically by a PR Server connected with a package feed.
>   

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


