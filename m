Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BAECCA47C
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 18:08:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.320.1656007693715922872
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 11:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Daq5eAAA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 83981E0008;
	Thu, 23 Jun 2022 18:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656007691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8l/7L2lgb0/2lcQoeN0xV8R/HJf4dwHzaPrsPEUU4So=;
	b=Daq5eAAAndTCrZ2JIvQcMnMgMaxj8yGh0gJQnE/dVzbeJKM5JsK9lGRs/J1O/lg7/6k3Gn
	G+xdUiSgb1nS4MID2NnvaMX33oXw0dshjPp4LeVUPgsrTMwmCqzdoe2xs7JsGzmoBxZTUA
	ocRE11HlBessTyLs+it5WfVfJVrfsRB7Wm8mpaAjrocfe8X0GKhCK70N6V1QGUBVO7siuD
	+TctdQYo8LfUQcBrRW9FWWf3TXwzK+z6OVeSV/z/GhNRtLEVAnTn5AeY4YlKSyUGXQ1Ar1
	UsRK5bz6Avkp1elcK/Uc60SQwmlFOuQpnKKiBKbWeS5G2tBwwZNBLNuzO/nAlw==
Message-ID: <17a18728-24c8-555c-3f4e-cdc65952204f@bootlin.com>
Date: Thu, 23 Jun 2022 20:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] docs: make DISTRO_FEATURES description more
 explicit
Content-Language: en-US
To: aatir <aatrapps@gmail.com>, docs@lists.yoctoproject.org
References: <20220623173710.12957-1-aatrapps@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220623173710.12957-1-aatrapps@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jun 2022 18:08:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3029

Hi Aatir,

Thanks for the update!

On 6/23/22 19:37, aatir wrote:
> +      enabled. Note: just enabling :term: `DISTRO_FEATURES` alone doesn't

Oops, you forgot to remove the space here. I fixed that by myself.

> +      enable feature support for packages, mechanisms such as making
> +      :term:`PACKAGECONFIG` track :term:`DISTRO_FEATURES` are used
> +      to enable/disbale package features.


s/disbale/disable/
I fixed that by myself

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I leave a little of time for further reviews, but it looks good to me.
Thanks again, and don't hesitate to send us more improvements!

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


