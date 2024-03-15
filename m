Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B983C54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 12:52:20 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.21556.1710507130866235983
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Mar 2024 05:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dY/hE/SG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A57720007;
	Fri, 15 Mar 2024 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710507128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s2gopYc+jBLaVAhY/KwaOP2M4Kc7MEdpmw/qzsD7Xkg=;
	b=dY/hE/SG7/7PTgajRELWsU3YOZWg6Jcxqn/ofpLAkAVpmW/W0P05BNVzhQVjuuWtjliDXl
	7uoNjlw2Su64rYGjVTN1aSFV8FQf/T/QKgLlRyfqfUGP5OYNjqVlXTyt/xWVB8dGfWiTAN
	EH4c5k9KBhdQi67diuZ4RmlD41qivfWiL2vel/GeqbtGXIEj5bYfjfCrpENYvcIA1k1UCj
	si/A6xo7gW8ocnhaC4g99Pc9XX0nNTyTAbW1vxxMW1HX2pFtAPR/JDqeK/lsERKzc4mDsf
	f0EDmJB5ydRgJ0M8qepI5HvvLNwKS4WW4d8jE6faUKsWwO7QgErzeSzrYb31hg==
Message-ID: <b1f5d4bd-b030-444e-982d-2cdc9841374b@bootlin.com>
Date: Fri, 15 Mar 2024 13:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.0.17
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240315100915.1662074-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240315100915.1662074-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 15 Mar 2024 12:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4980

Hi Lee

On 3/15/24 at 11:09, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.17.rst | 238 ++++++++++++++++++
>   2 files changed, 239 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.17.rst
>
> diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
> index dfe5e186e..685799e26 100644
> --- a/documentation/migration-guides/release-4.0.rst
> +++ b/documentation/migration-guides/release-4.0.rst
> @@ -23,3 +23,4 @@ Release 4.0 (kirkstone)
>      release-notes-4.0.14
>      release-notes-4.0.15
>      release-notes-4.0.16
> +   release-notes-4.0.17


Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


