Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98899C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 16:51:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.77765.1673283070994408294
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 08:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nmTDI6b0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 799BA4000A;
	Mon,  9 Jan 2023 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673283068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTXkTWls6ZsxEHF/OzbRjVgngmCjOX3xvt4L8tYDOww=;
	b=nmTDI6b0YnwxQQX+idy1SgcdDOoZn+vxWVN7IXByUYnGKqYPjshDWw6YJXg1YD4DrsDnh5
	iCszAcvAlX4EyxBFjo+PnfLoBr1DE7qvAgAs9lasIcQ8uRIauoLr1BLuhC8adSeo7vi3KV
	j9fsRnTfoxFCa3vcQ5f3Wvpu/iPOMADF8laOmbuedQzwYJCsWRdGiokLvTGxrXMKrlUtr0
	MPXGKaak5yR9IWlvq44UU5SgLh7hrK/FY7vaNnm2vk9dKIxqQMaBetcD31bYona5to51Y4
	NorKy3xRMYssGj0aYKUEjV0/5uyaE9Q1q6+WUzYkZt3/DrJR5HEXhrZtbu3Ztw==
Message-ID: <f4ce4654-6a7f-e776-02b3-d6d3a5f9f7b4@bootlin.com>
Date: Mon, 9 Jan 2023 17:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.22
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1673280960.git.steve@sakoman.com>
 <9ab652500f969639f0153ba5f325c2f269804d22.1673280960.git.steve@sakoman.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <9ab652500f969639f0153ba5f325c2f269804d22.1673280960.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Jan 2023 16:51:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3601

Hi Steve,

On 09.01.23 at 17:16, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 2cadb6989..2fb917cae 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.21"
> +DISTRO : "3.1.22"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.21"
> +YOCTO_DOC_VERSION : "3.1.22"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.21"
> -DOCCONF_VERSION : "3.1.21"
> +DISTRO_REL_TAG : "yocto-3.1.22"
> +DOCCONF_VERSION : "3.1.22"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.21"
> +POKYVERSION : "23.0.22"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Many thanks for the update.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into the "dunfell" branch.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


