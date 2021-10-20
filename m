Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D415C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 18:03:16 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.1000.1634752994438773242
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 11:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 82F7740004
	for <docs@lists.yoctoproject.org>; Wed, 20 Oct 2021 18:03:12 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: poky.yaml: updates for 3.4
To: docs@lists.yoctoproject.org
References: <16AFCEEA45EF71BE.31449@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <38369c21-fcdd-7380-1c64-97bd2a31db23@bootlin.com>
Date: Wed, 20 Oct 2021 20:03:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16AFCEEA45EF71BE.31449@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Oct 2021 18:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2017

Greetings,

On 10/20/21 7:58 PM, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/poky.yaml | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 50d1f9c4aa..6dab21b985 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,12 +1,12 @@
> -DISTRO : "3.3.3"
> -DISTRO_NAME_NO_CAP : "hardknott"
> -DISTRO_NAME : "Hardknott"
> -DISTRO_NAME_NO_CAP_MINUS_ONE : "gatesgarth"
> +DISTRO : "3.4"
> +DISTRO_NAME_NO_CAP : "honister"
> +DISTRO_NAME : "Honister"
> +DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
>  DISTRO_NAME_NO_CAP_LTS : "dunfell"
> -YOCTO_DOC_VERSION : "3.3.3"
> -YOCTO_DOC_VERSION_MINUS_ONE : "3.2.4"
> -DISTRO_REL_TAG : "yocto-3.3.3"
> -POKYVERSION : "25.0.3"
> +YOCTO_DOC_VERSION : "3.4"
> +YOCTO_DOC_VERSION_MINUS_ONE : "3.3.3"
> +DISTRO_REL_TAG : "yocto-3.4"
> +POKYVERSION : "26.0.0"
>  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


What about the last lines in poky.yaml?

MIN_PYTHON_VERSION : "3.6.0"
MIN_TAR_VERSION : "1.28"
MIN_GIT_VERSION : "1.8.3.1"
MIN_GCC_VERSION : "5.0"

How do we know they're not out of date ? gcc 5.0 is pretty old (2015)
and I'm not sure we run our autotests with it.
Thanks in advance,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


