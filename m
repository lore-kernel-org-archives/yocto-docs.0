Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919D5C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 15:42:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.11665.1651246967039533638
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 08:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FaM1Ak0O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3DD0F1C0006;
	Fri, 29 Apr 2022 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651246964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CanZoKE2xXGjefFIOGTQE9KZjHDv9eBXZNnUiumqI4M=;
	b=FaM1Ak0O0AYqO/Ljsq/u2BgVExrGzu9j3fah7jfv3JbDmkzYkkBKLYoRKEKIOK97csSz3u
	5UHABnwRWuwPNVXK33TI1b2xZDWT4jjsz9v1WgIrkn/Ir55fpBHuy993WM+xnEg5LXibAD
	P9fnKuXtKv4RKgPN1SA7mYHnqJEI/PAjlREOhL8e3f6wZ3Hp6XEIISiKULiYi0zlR9JcOW
	F6TH5Pt6hZBs1flNoQ2CtKzSUMM4XrK7PRIQg4UG0RQQ+mlCHo1+U2IPcfaCQ8S7LvzGEv
	YDT1pK6rPDgeEN108UHGw89iTRNgUgIwMB+X/W4k5zZbVO4cNiv1wztH/PrA/g==
Message-ID: <982a8b48-27e0-f331-eaad-d1f936ad3c13@bootlin.com>
Date: Fri, 29 Apr 2022 17:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [honister][PATCH] documentation: update for 3.4.4 release
Content-Language: en-US
To: Anuj Mittal <anuj.mittal@intel.com>, docs@lists.yoctoproject.org
References: <20220429142324.10143-1-anuj.mittal@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220429142324.10143-1-anuj.mittal@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Apr 2022 15:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2903

Hi Anuj,

On 4/29/22 16:23, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  documentation/poky.yaml | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index d8ee000c0..fc7ec9ec3 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,14 +1,14 @@
> -DISTRO : "3.4.3"
> +DISTRO : "3.4.4"
>  DISTRO_NAME_NO_CAP : "honister"
>  DISTRO_NAME : "Honister"
>  DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
>  DISTRO_NAME_NO_CAP_LTS : "dunfell"
> -YOCTO_DOC_VERSION : "3.4.3"
> -YOCTO_DOC_VERSION_MINUS_ONE : "3.3.5"
> -DISTRO_REL_TAG : "yocto-3.4.3"
> -DOCCONF_VERSION : "3.4.3"
> +YOCTO_DOC_VERSION : "3.4.4"
> +YOCTO_DOC_VERSION_MINUS_ONE : "3.3.6"
> +DISTRO_REL_TAG : "yocto-3.4.4"
> +DOCCONF_VERSION : "3.4.4"
>  BITBAKE_SERIES : "1.52"
> -POKYVERSION : "26.0.3"
> +POKYVERSION : "26.0.4"
>  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Thanks for the patch.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into the "honister" branch.

Cheers
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


