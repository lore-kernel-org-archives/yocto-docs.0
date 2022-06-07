Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FE6CCA47C
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 08:53:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.10063.1654592006009080829
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 01:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WbdQnxvz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9CA4A24000A;
	Tue,  7 Jun 2022 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654592004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvQoSRwg4a6kp0IIbBiqvmMQa8eW7D80D8PUORuc730=;
	b=WbdQnxvzt0FgF8T08FPv5DsoV5uwRZnACMQKwx/xs3hRTDjIH5yjjpjho8qN8zOZXkJOpk
	BWw7TfbZWx0sCFi/whl+QN5MJ2muLWYhiLie2AIk5o2hfDpK2m4dk8arZc9jMpSzgQ7Taz
	yfpx3hDdSetB3kD+DDVJDEulUj4DVh7U4hfKQyku15FTQeKbtrlUXMgrhP2Vq7Va0AkEAH
	7X3f2aV5ClzwwQggj4u6Df6mqZfQZWt4BFM21SN/z1SypxYdD/8rTHjjzi/wq9I5C0OVgM
	CUK6hmBcoFf3bSNq3JVKTgeGviLhIHnHbahpsHX1BJ/8fzsrUSNoY27/esMBfw==
Message-ID: <d5a7a74d-ff38-8270-acb5-5a6fea861180@bootlin.com>
Date: Tue, 7 Jun 2022 10:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [yocto] [PATCH v2 2/2] manuals: SYSTEMD_SERVICE overrides depend
 on SYSTEMD_PACKAGES
Content-Language: en-US
To: Paulo Neves <ptsneves@gmail.com>, yocto@lists.yoctoproject.org
References: <20220603163521.146659-1-ptsneves@gmail.com>
 <20220607084254.2694011-1-ptsneves@gmail.com>
 <20220607084254.2694011-2-ptsneves@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220607084254.2694011-2-ptsneves@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Jun 2022 08:53:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2966

Hi Paulo

On 6/7/22 10:42, Paulo Neves wrote:
> Add detail that package overrides are only available if
> specified in SYSTEMD_PACKAGES.
>
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 42178d556..e31f0ed88 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7664,6 +7664,10 @@ system and gives an overview of their function and contents.
>  
>           SYSTEMD_SERVICE:${PN} = "connman.service"
>  
> +      The package overrides that can be specified are directly related to the value of
> +      term:`SYSTEMD_PACKAGES`. Overrides not included in term:`SYSTEMD_PACKAGES`
> +      will be silently ignored.
> +
>     :term:`SYSVINIT_ENABLED_GETTYS`
>        When using
>        :ref:`SysVinit <dev-manual/common-tasks:enabling system services>`,

Thanks for the patch. Merged into yocto-docs' master-next

Don't forget to copy the docs@lists.yoctoproject.org mailing list next time.

Thanks again

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


