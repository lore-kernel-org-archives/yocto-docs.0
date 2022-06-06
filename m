Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261BDC43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 16:35:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.564.1654533307510681750
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 09:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QrOxvOxP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A1508240009;
	Mon,  6 Jun 2022 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654533305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VWcKbXeAIXrDkAfROq0BCMaTG1gDoo8IvBpiGPeHCmY=;
	b=QrOxvOxPj1mnlymnZj8TBiDBbso2OnvZyJDQMLezW1eexspqCZoGluhb7vR/KqJ7YgC0cD
	9JputB+IyHsgHjBEY1M26mhaQ7PFpylQTwI6Za62I1fbbQII+m8uJXK+C/zyhztDTlvAed
	FOqGQNAPQ0pLlB0XY8ksERB0EozwvE+A/TdWeOrkbzyiXdbiZHilgIs21t64OZK+GQJxhp
	Tew6x2wi2GHIAyGGzczZVoSxrdB5Tml8IBWlrT9Ga+7fY94JAtSHqP4yd7es3mTRkGU4EN
	etLA45LEEpP2YD/3na+SfFKNEzRwAirS3gdo3iSGMeRA84jRtEcZwF0O4vceaQ==
Message-ID: <bbd52727-f154-4e17-0331-501f40965410@bootlin.com>
Date: Mon, 6 Jun 2022 18:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [yocto] [PATCH 1/2] manuals: SYSTEMD_SERVICE allows multiple
 services
Content-Language: en-US
To: Paulo Neves <ptsneves@gmail.com>, yocto@lists.yoctoproject.org
References: <20220603163521.146659-1-ptsneves@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220603163521.146659-1-ptsneves@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Jun 2022 16:35:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2964

Hi Paulo

Thanks for the patches!

On 6/3/22 18:35, Paulo Neves wrote:
> State that SYSTEMD_SERVICE allows for multiple space
> separated systemd services
> ---
>  documentation/ref-manual/variables.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 367b4674e..ed52c3508 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7656,6 +7656,8 @@ system and gives an overview of their function and contents.
>        When inheriting the :ref:`systemd <ref-classes-systemd>` class,
>        this variable specifies the systemd service name for a package.
>  
> +      Multiple services can be specified with each one separated by a space.


I'd propose a slightly simpler sentence:
"... can be specified, each one separated ..."

Would you mind sending the patch again to docs@lists.yoctoproject.org,
and this time with "Signed-off-by" information (from "git commit -s"),
please?
I was going to accept your patch directly, but this is required.

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


