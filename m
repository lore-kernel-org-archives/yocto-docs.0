Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C31CC43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 16:04:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.165.1656000296050963117
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 09:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=laHJt9wM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DB55EC0014;
	Thu, 23 Jun 2022 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656000294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=44S/iRp+8HhHvfm+o+/OaLXQofbc6a3ODOMLHaaQk3I=;
	b=laHJt9wMTDvkmIMybK9V7E67hyRS+XVLADcnU0b6OgYcgfn+d0o8u/uAgewiW58z+lgp3A
	00NmRfAuay3r+1qDTxJ+Ro38EFzVZmjUg/pTZDxCHd5R53eBXEkZ4QHwZzT6+K5AIU5Mca
	VyOeOQeTlZZPzuhWoEhx+M49vEC2vf3debcdem730FT8ZKgzwMDk3wYD0Wa6iWYkBwipvQ
	IzkX59X5qjI95fyv61GWdXkEkxW3VZyjAX9bADGoTT1vb4szH6PzdqnDWbQmzy/6TPJCpM
	ZRD7Kb71WSsXIvHqUH6pPuu0EHMkV2/aWw7hCF7q+nPpowiiiac6Zc8M62B+uQ==
Message-ID: <d75a3a41-48e9-2cb6-e5db-76992c49df7b@bootlin.com>
Date: Thu, 23 Jun 2022 18:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] docs: make DISTRO_FEATURES examples more explicit
Content-Language: en-US
To: aatir <aatrapps@gmail.com>, docs@lists.yoctoproject.org
References: <20220623131543.46899-1-aatrapps@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220623131543.46899-1-aatrapps@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jun 2022 16:04:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3027

Hi Aatir,

Many thanks for the patch!
Here are my comments...

On 6/23/22 15:15, aatir wrote:
> Make DISTRO_FEATURES example more explicit by specifying
> that DISTRO_FEATURES alone can't select build configurations,
> and need mechanisms like PACKAGECONFIG setup to take care of
> selecting build configurations.

I would talk about "DISTRO_FEATURES example" but instead 
"DISTRO_FEATURES description" here.

>
> Signed-off-by Aatir Manzur <aatrapps@gmail.com>
> ---
>   documentation/ref-manual/features.rst  | 4 +++-
>   documentation/ref-manual/variables.rst | 5 ++++-
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index a8d0dac99..6f9edf1a1 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -100,7 +100,9 @@ packages, and they can go beyond simply controlling the installation of
>   a package or packages. In most cases, the presence or absence of a
>   feature translates to the appropriate option supplied to the configure
>   script during the :ref:`ref-tasks-configure` task for
> -the recipes that optionally support the feature.
> +the recipes that optionally support the feature. Appropriate options
> +must be supplied, and enabling/disabling :term `PACKAGECONFIG` for the


Oops, there should be no space between ":term:" and "`PACKAGECONFIG`", 
otherwise Sphinx doesn't create a reference. You have multiple instances 
of this issue.

> +concerned packages is one way of supplying such options.
>   
>   Some distro features are also machine features. These select features
>   make sense to be controlled both at the machine and distribution
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 28267101d..48bdf3810 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1873,7 +1873,10 @@ system and gives an overview of their function and contents.
>         optionally support the feature. For example, specifying "x11" in
>         :term:`DISTRO_FEATURES`, causes every piece of software built for the
>         target that can optionally support X11 to have its X11 support
> -      enabled.
> +      enabled. Note: just enabling :term: `DISTRO_FEATURES` alone doesn't
> +      enable feature support for packages, mechanisms such as making


Same issue here

> +      :term `PACKAGECONFIG` track :iterm: `DISTRO_FEATURES` are used
> +      to enable/disbale package features.

s/:iterm:/:term:/

Would you mind sending an updated patch, please?
Thanks again
Michael

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


