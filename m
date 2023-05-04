Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553D0C77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 07:47:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.44184.1683186421966476591
 for <docs@lists.yoctoproject.org>;
 Thu, 04 May 2023 00:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d2zSMmVm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 36084FF80B;
	Thu,  4 May 2023 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683186419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7+SreT4RXn2oRoHUnyKYYzHpD9L8YlpvSTEA5G39xY=;
	b=d2zSMmVmiIysl/awW9jlKhUrcwxOfDE82EPqp5vfFx9Z4tQy8OuC70ud3xSgSKWdMF3ojW
	em3nxOMwwDa5eAvWBscJcw9UD9p+4F06nuP0a6/jCzak6oVdE7UphzRQnnEGoJRRGtW4pN
	qMSpLzfOJMX1szQvS+dIudVXoT6BTAPYtEOSu47UXEt0I3FBOmESmx7aKv/5R3KsJM17m8
	9HNOPRWWA8TNgaS1dCgv7SEpw5XnL64Yo4BkwOOVuMuuKb+VWMgI6J///zT87bNw3he4ME
	I40UrbmyiOLz1x7KkoE4zEHciopgDeb0yug5X5B33XdeM9oQGWyDK8TBoL/vWA==
Message-ID: <fcd085b3-44de-9dfe-a063-381de52dae5b@bootlin.com>
Date: Thu, 4 May 2023 09:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: richard.purdie@linuxfoundation.org
Subject: Re: [docs] [PATCH] docs: add support for mickledore (4.2) release
Content-Language: en-US
To: Michael Halstead <mhalstead@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20230503223456.23985-1-mhalstead@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230503223456.23985-1-mhalstead@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 May 2023 07:47:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3905

Hi Michael,

On 04.05.23 at 00:34, Michael Halstead wrote:
> This adds support for the Mickledore (4.2) release and update the
> current dev branch to Nanbield.
>
> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> ---
>   documentation/poky.yaml.in    | 12 ++++++------
>   documentation/set_versions.py |  6 ++++--
>   2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 1c072c1d0..b2b6a6330 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -1,10 +1,10 @@
> -DISTRO : "4.1"
> -DISTRO_NAME_NO_CAP : "langdale"
> -DISTRO_NAME : "Langdale"
> -DISTRO_NAME_NO_CAP_MINUS_ONE : "kirkstone"
> +DISTRO : "4.2"
> +DISTRO_NAME_NO_CAP : "mickledore"
> +DISTRO_NAME : "Mickledore"
> +DISTRO_NAME_NO_CAP_MINUS_ONE : "langdale"
>   DISTRO_NAME_NO_CAP_LTS : "kirkstone"
> -YOCTO_DOC_VERSION : "4.1"
> -DISTRO_REL_TAG : "yocto-4.1"
> +YOCTO_DOC_VERSION : "4.2"
> +DISTRO_REL_TAG : "yocto-4.2"
>   DOCCONF_VERSION : "dev"
>   BITBAKE_SERIES : ""
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> index efaebe43b..354dabe61 100755
> --- a/documentation/set_versions.py
> +++ b/documentation/set_versions.py
> @@ -26,8 +26,8 @@ ourversion = None
>   if len(sys.argv) == 2:
>       ourversion = sys.argv[1]
>   
> -activereleases = ["langdale", "kirkstone", "dunfell"]
> -devbranch = "mickledore"
> +activereleases = ["mickledore", "kirkstone", "dunfell"]
> +devbranch = "nanbield"
>   ltsseries = ["kirkstone", "dunfell"]
>   
>   # used by run-docs-builds to get the default page
> @@ -36,6 +36,7 @@ if ourversion == "getlatest":
>       sys.exit(0)
>   
>   release_series = collections.OrderedDict()
> +release_series["nanbield"] = "4.3"
>   release_series["mickledore"] = "4.2"
>   release_series["langdale"] = "4.1"
>   release_series["kirkstone"] = "4.0"
> @@ -66,6 +67,7 @@ release_series["laverne"] = "0.9"
>   
>   
>   bitbake_mapping = {
> +    "nanbield" : "2.6",
>       "mickledore" : "2.4",
>       "langdale" : "2.2",
>       "kirkstone" : "2.0",


Thanks for the update! I feel the release coming :)
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


