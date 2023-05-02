Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A045C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 07:48:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.122790.1683013723956785660
 for <docs@lists.yoctoproject.org>;
 Tue, 02 May 2023 00:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eb/P3QKm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A3EE21BF20A;
	Tue,  2 May 2023 07:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683013722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crjere5VD1t6MWI1sIZkm0Y2naYjNQ4A/XhFWKfdyX4=;
	b=eb/P3QKm3qs3FHLR3fixghLMpOQommB1Pl1FbBlsh9sL38AXmFBT4ejL3BBAsb0PMKT4Yu
	5zbPtBAuUczT1bc40OVrYXU7qbNDcnlW1ErG7/pPzgt80DGtvLWcdV/mtckEoo/TVDNsuY
	BjqM/vH1ctx1/oVQo1qReTNxwCmsOclsNgJxn4JZ1v0gH+XCAgM91EsT8ckva+3RdmwiDf
	DHXWhELNxgVLohyzfAMM+sONK1tWWMhtyzsqNMAhCekX49t10ic16Izer3de39Xpgf8inP
	tNByBebVzSkUtJ5fSpbFQ4TasIFNGlqZUtjkK+TLZpVsu+xEf0d94ao7NryAxA==
Message-ID: <3e474dcb-3b54-6fdb-caf2-515fea02315a@bootlin.com>
Date: Tue, 2 May 2023 09:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.25
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1682951612.git.steve@sakoman.com>
 <eb349a63a958f3a07a16f4b41f97750ca6027a48.1682951612.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <eb349a63a958f3a07a16f4b41f97750ca6027a48.1682951612.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 May 2023 07:48:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3886

Hi Steve,

On 01.05.23 at 16:34, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 71749cc0a..62d69f9c8 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.24"
> +DISTRO : "3.1.25"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.24"
> +YOCTO_DOC_VERSION : "3.1.25"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.24"
> -DOCCONF_VERSION : "3.1.24"
> +DISTRO_REL_TAG : "yocto-3.1.25"
> +DOCCONF_VERSION : "3.1.25"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.24"
> +POKYVERSION : "23.0.25"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"

Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "dunfell".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


