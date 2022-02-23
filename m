Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5428C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:31:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.7624.1645623084322930407
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 05:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pkvLgQB+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0CAA11BF208;
	Wed, 23 Feb 2022 13:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645623082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dEMR6djK13WDSG1P6LN/S2NllAktiEa01GJZmN3LPks=;
	b=pkvLgQB+tj2/0eAcjwRIBTLILfFc0H5H5y6FnY9otVA0jrNNpCFpd0EoCdZX8/Ht2ti8SN
	cVSXeWPREB8dfZBt85tcCTJunaqPbe+XTPV6JTAxyJW4O+IraU3v3hEZegwUDTJyPz0TPE
	XvSco8RADFpTSbOneEL0D3ODpelbJNsAsu1cyC0PPlWpABPZ6CEMZHu2bnFjY2bEqDLvuL
	EmTdmx3kIT792sj65sDAj5a6phdxzi14XgzvgL87u1+2TwLNlziYYyFGhKRpnl+LyiFDMZ
	StELz4ZiicSYxlYLeMtqgCEG+VonYcI5fWNj02dKhblgKbzb9JYstu4pobD96A==
Message-ID: <5dccf02f-2d7f-fa33-bee2-83f7427aa452@bootlin.com>
Date: Wed, 23 Feb 2022 14:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH 2/2] docs: point to renamed BB_BASEHASH_IGNORE_VARS
 variable
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20220223105206.2766014-1-foss+yocto@0leil.net>
 <20220223105206.2766014-2-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220223105206.2766014-2-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Feb 2022 13:31:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2492

Hi Quentin,

On 2/23/22 11:52, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> Since commit 98b3ed1b2e11 "meta/scripts: Handle bitbake variable
> renaming", the new name of the variable is BB_BASEHASH_IGNORE_VARS
> so let's update it so that Sphinx can resolve the Bitbake reference.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 2 +-
>  documentation/ref-manual/variables.rst    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index fd394c3ae..c111355cc 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -9474,7 +9474,7 @@ BitBake has determined by doing the following:
>  
>     The output of ``bitbake-dumpsig`` also includes the value each
>     variable had, a list of dependencies for each variable, and
> -   :term:`BB_HASHBASE_WHITELIST`
> +   :term:`BB_BASEHASH_IGNORE_VARS`
>     information.
>  
>  There is also a ``bitbake-diffsigs`` command for comparing two
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 25a874f83..ecb2b60c7 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -763,7 +763,7 @@ system and gives an overview of their function and contents.
>  
>           export BBSERVER=localhost:$port
>  
> -      By default, :term:`BBSERVER` also appears in :term:`BB_HASHBASE_WHITELIST`.
> +      By default, :term:`BBSERVER` also appears in :term:`BB_BASEHASH_IGNORE_VARS`.
>        Consequently, :term:`BBSERVER` is excluded from checksum and dependency
>        data.
>  
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into master-next.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


