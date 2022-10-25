Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78FFC38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 08:34:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.4826.1666686881820989960
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 01:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dsaNf9zi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 976CB1C0008;
	Tue, 25 Oct 2022 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666686879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2NTxPlIG0+HS4xKMcG3rmDnfrf6kAwd1a2HCTDNnWfk=;
	b=dsaNf9zigXyykywRM4WPPQk7QVA1n8b8DoY7HI/RIwYT1OP4D9sWIShi3qLtnkE6FB9jbY
	vJIE9sN8wHZFmjmv5PA8K/ujGRU3VZWnoBkUKZ0oB+YI8Hx29HO/UHipHuR6XiISzJySqg
	QXZF4nW8y9nzIKoqcio05GMOLVUrcLPY//tqgDF59HIUUI16wyDJY6XX0kO0J+Bo4ySdPZ
	3uFgIQvXXGE7nFj3WbtLs1MgzZE7tqDoNoGq2cFCj3TWNe+ZuK/HYKFzzJ4WKl7Py5h0ox
	eiVZN8vLk55dTbfzYA6ZpAx+kH5mSeq64xQgnFK5rprtBOcNql+6bxlujTbLhA==
Message-ID: <6b9bdcaf-4d14-cd42-4001-55001ec94354@bootlin.com>
Date: Tue, 25 Oct 2022 10:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [RFC] [PATCH] docs: add support for langdale (4.1) release
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>
References: <20221025-langdale-v1-0-f953d47d02c9@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221025-langdale-v1-0-f953d47d02c9@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 08:34:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3400

Hi Quentin

Thanks for the patch!

On 10/25/22 10:31, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> This adds support for the Langdale (4.1) release and update the current
> dev branch to Mickledore.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>
> RFC because not tested
>
> ---
>   documentation/poky.yaml.in    | 14 +++++++-------
>   documentation/set_versions.py |  6 ++++--
>   2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 6b942f095..5639f3ca7 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -1,10 +1,10 @@
> -DISTRO : "4.0"
> -DISTRO_NAME_NO_CAP : "kirkstone"
> -DISTRO_NAME : "Kirkstone"
> -DISTRO_NAME_NO_CAP_MINUS_ONE : "honister"
> -DISTRO_NAME_NO_CAP_LTS : "dunfell"
> -YOCTO_DOC_VERSION : "4.0"
> -DISTRO_REL_TAG : "yocto-4.0"
> +DISTRO : "4.1"
> +DISTRO_NAME_NO_CAP : "langdale"
> +DISTRO_NAME : "Langdale"
> +DISTRO_NAME_NO_CAP_MINUS_ONE : "kirkstone"
> +DISTRO_NAME_NO_CAP_LTS : "kirkstone"
> +YOCTO_DOC_VERSION : "4.1"
> +DISTRO_REL_TAG : "yocto-4.1"
>   DOCCONF_VERSION : "dev"
>   BITBAKE_SERIES : ""
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> index ddf70851c..efaebe43b 100755
> --- a/documentation/set_versions.py
> +++ b/documentation/set_versions.py
> @@ -26,8 +26,8 @@ ourversion = None
>   if len(sys.argv) == 2:
>       ourversion = sys.argv[1]
>   
> -activereleases = ["kirkstone", "dunfell"]
> -devbranch = "langdale"
> +activereleases = ["langdale", "kirkstone", "dunfell"]
> +devbranch = "mickledore"
>   ltsseries = ["kirkstone", "dunfell"]
>   
>   # used by run-docs-builds to get the default page
> @@ -36,6 +36,7 @@ if ourversion == "getlatest":
>       sys.exit(0)
>   
>   release_series = collections.OrderedDict()
> +release_series["mickledore"] = "4.2"
>   release_series["langdale"] = "4.1"
>   release_series["kirkstone"] = "4.0"
>   release_series["honister"] = "3.4"
> @@ -65,6 +66,7 @@ release_series["laverne"] = "0.9"
>   
>   
>   bitbake_mapping = {
> +    "mickledore" : "2.4",
>       "langdale" : "2.2",
>       "kirkstone" : "2.0",
>       "honister" : "1.52",
>
> ---
> base-commit: 0f088df1027b38a47f4161fe0910150ff42c1861
> change-id: 20221025-langdale-91e387889ed0
>
> Best regards,


30 seconds later, and I was sending my own patch, similar to yours :-D
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


