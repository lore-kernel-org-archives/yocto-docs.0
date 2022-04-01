Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337F4C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:30:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10678.1648819819117703747
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 06:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MO5c9z2r;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C441A1BF205;
	Fri,  1 Apr 2022 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648819817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIDLyrAdLarjexjOq/goAQyiy/MWly+5Vq0rogwNrsg=;
	b=MO5c9z2rv4Vs1PbQFhWGhRtfukWxn80XlAHXgcIcCqaxM6huJ+gZfwAsMDvlr90N5WYn0m
	4SCTTiYN/l9EUmzaApeLJmH3xaQ9LGfYxJJr/rtzP84YjanbaXARoLIw0ylv8PmHlLOROf
	ff2b2d8Ykizw+Z8sMxZj5bPSk3HurYnd4Ne1DzT0fFoGPfHGfoWiMTKGGiLs3i5Cqd5z/K
	kwlalS35QdI/dg4aBp/R/5mUE30gUurM0+jCryy+JWjXAabLQiYrtE6Q/kZ3YdL+7t4J1S
	ojZB6YaLuRuLpPHJV+Pjvpms7lJapUsc0OkeoWJq7nVnYMIE5rYP3R1punLwrQ==
Message-ID: <9d0eeb70-a2b0-42e7-8b64-486ae0df6bd8@bootlin.com>
Date: Fri, 1 Apr 2022 15:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [hardknott][PATCH] documentation: prepare for 3.3.6
 release
Content-Language: en-US
To: Anuj Mittal <anuj.mittal@intel.com>, docs@lists.yoctoproject.org
References: <20220401022955.5447-1-anuj.mittal@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220401022955.5447-1-anuj.mittal@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Apr 2022 13:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2744

Hi Anuj

On 4/1/22 04:29, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  documentation/conf.py      | 2 +-
>  documentation/poky.yaml    | 8 ++++----
>  documentation/releases.rst | 5 ++++-
>  3 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index fc064bf32..e7c2e502f 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -16,7 +16,7 @@ import os
>  import sys
>  import datetime
>  
> -current_version = "3.3.5"
> +current_version = "3.3.6"
>  bitbake_version = "1.50"
>  
>  # String used in sidebar
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 32849bc70..769a981b6 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,12 +1,12 @@
> -DISTRO : "3.3.5"
> +DISTRO : "3.3.6"
>  DISTRO_NAME_NO_CAP : "hardknott"
>  DISTRO_NAME : "Hardknott"
>  DISTRO_NAME_NO_CAP_MINUS_ONE : "gatesgarth"
>  DISTRO_NAME_NO_CAP_LTS : "gatesgarth"
> -YOCTO_DOC_VERSION : "3.3.5"
> +YOCTO_DOC_VERSION : "3.3.6"
>  YOCTO_DOC_VERSION_MINUS_ONE : "3.2.4"
> -DISTRO_REL_TAG : "yocto-3.3.5"
> -POKYVERSION : "25.0.5"
> +DISTRO_REL_TAG : "yocto-3.3.6"
> +POKYVERSION : "25.0.6"
>  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
> diff --git a/documentation/releases.rst b/documentation/releases.rst
> index 1fb6054bc..233448c68 100644
> --- a/documentation/releases.rst
> +++ b/documentation/releases.rst
> @@ -10,7 +10,8 @@
>  
>  - :yocto_docs:`3.4 Documentation </3.4>`
>  - :yocto_docs:`3.4.1 Documentation </3.4.1>`
> -- :yocto_docs:`3.4.1 Documentation </3.4.2>`
> +- :yocto_docs:`3.4.2 Documentation </3.4.2>`
> +- :yocto_docs:`3.4.3 Documentation </3.4.3>`
>  
>  *******************************
>  3.3 'hardknott' Release Series
> @@ -22,6 +23,7 @@
>  - :yocto_docs:`3.3.3 Documentation </3.3.3>`
>  - :yocto_docs:`3.3.4 Documentation </3.3.4>`
>  - :yocto_docs:`3.3.5 Documentation </3.3.5>`
> +- :yocto_docs:`3.3.6 Documentation </3.3.6>`
>  
>  ****************************
>  3.1 'dunfell' Release Series
> @@ -42,6 +44,7 @@
>  - :yocto_docs:`3.1.12 Documentation </3.1.12>`
>  - :yocto_docs:`3.1.13 Documentation </3.1.13>`
>  - :yocto_docs:`3.1.14 Documentation </3.1.14>`
> +- :yocto_docs:`3.1.15 Documentation </3.1.15>`
>  
>  ==========================
>   Previous Release Manuals


Thanks for the update.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into the hardknott branch.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


