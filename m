Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EB0C05027
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 17:57:25 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.60765.1675706238227555429
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Feb 2023 09:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JXXIHwrQ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0BB3C100004;
	Mon,  6 Feb 2023 17:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675706236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jTpO9j0D1upLsdnH//rkyM2O8dBupch6LJwOLOalMWk=;
	b=JXXIHwrQ3uID1IWpQF6bl4/MDDvSN4Sv1caPrh/xlJNgmwVyky+DDM3mK29PsE949UytEi
	+DSfWzy/E97rvHS9az5wJlUvytWWph5kViTSF5rqL3Nr9K/fxfTjfhF0fFLtjmRwdDOQcL
	wO2Y3nqmGIwA9KDvQjEi/mUaq0qqj1F7f/0T1iXY1F0IWzw7uNiwl39n+OluCztuxVn0i3
	oUZOcdouG2TViX/k3Xiu9yOpge56oHw8wa26oCezIYL+9dOYYJE1j1RPaZvr7uuj5KFe/E
	neKv9gHY+lSuPMECfD0Ih2buejue367DQ48cIxdlS4n6aBWCkdqITg69DRX8DA==
Message-ID: <382a889b-971a-a41d-2f73-3589c83f594d@bootlin.com>
Date: Mon, 6 Feb 2023 18:57:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.23
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1675704607.git.steve@sakoman.com>
 <59a206b093160127f82352f04031c7190c36ab5c.1675704607.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <59a206b093160127f82352f04031c7190c36ab5c.1675704607.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Feb 2023 17:57:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3639

Hi Steve,

On 06.02.23 at 18:31, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 2fb917cae..d33ea2712 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.22"
> +DISTRO : "3.1.23"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.22"
> +YOCTO_DOC_VERSION : "3.1.23"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.22"
> -DOCCONF_VERSION : "3.1.22"
> +DISTRO_REL_TAG : "yocto-3.1.23"
> +DOCCONF_VERSION : "3.1.23"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.22"
> +POKYVERSION : "23.0.23"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into the "dunfell" branch.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


