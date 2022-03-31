Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2B0C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 09:10:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.4931.1648717830457821481
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 02:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Aqugjgrd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1D017240008;
	Thu, 31 Mar 2022 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648717828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vr24LQfAHpI5Gna17bWsnzvkSNtwotMB9HIuAOyOTm4=;
	b=AqugjgrdGXCxNMuFbVM8yxa6JZDVtHByzZsHOEo003BanZIwiut8q3i6QZIPTPwirhW+f7
	G42A7GWX0XNxcq4LNlZxCAGmDAGG8lnWZKZWvLrrgxAQYBDYIICGdSDydWAD7ccJ/oylf3
	bmUpF0cy9KcCCEv4vWhcoJM+hZqqe5FG0QHvWGro4/m9jAZKipX16DBLgn2KBm3D+M8qqJ
	drVJBPZfQC0ibbZOtlXqFM51Kl2XsKrn+/IrhuiDYUh46ToNwn2rGOErRRXNa/3ozyOQdt
	VVbiIFQV4b/YvnPfAp34U1CnpGvKLHdM1teDhMD//q+JhOgh6QxZZWRd4jp/cQ==
Message-ID: <ad77b6da-9bc4-7dda-a482-b4eca5346745@bootlin.com>
Date: Thu, 31 Mar 2022 11:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Cc: Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: Re: [docs] [PATCH] doc: migration-3.5: extend the section on
 inclusive language
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>, docs@lists.yoctoproject.org
References: <20220330142053.2499701-1-rybczynska@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220330142053.2499701-1-rybczynska@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Mar 2022 09:10:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2739

Hi Marta

On 3/30/22 16:20, Marta Rybczynska wrote:
> Add the list of renamed and removed variables, show how the renaming
> script works. Also mention the change in cve-check output.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> ---
>  .../migration-guides/migration-3.5.rst        | 42 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
> index 8ce2306e4..6de7b3b0f 100644
> --- a/documentation/migration-guides/migration-3.5.rst
> +++ b/documentation/migration-guides/migration-3.5.rst
> @@ -12,10 +12,50 @@ Recipe changes
>    deleted. BitBake will stop with an error when renamed or removed variables
>    still exist in your recipes or configuration.
>  
> +  Please note that the change applies also to environmental variables, so
> +  make sure you use a fresh environment for your build.
> +
> +  The following variables have changed their names:
> +
> +  - `BB_ENV_WHITELIST` became `BB_ENV_PASSTHROUGH`
> +  - `BB_ENV_EXTRAWHITE` became `BB_ENV_PASSTHROUGH_ADDITIONS`
> +  - `BB_HASHBASE_WHITELIST` became `BB_BASEHASH_IGNORE_VARS`
> +  - `BB_HASHCONFIG_WHITELIST` became `BB_HASHCONFIG_IGNORE_VARS`
> +  - `BB_HASHTASK_WHITELIST` became `BB_TASKHASH_IGNORE_TASKS`
> +  - `BB_SETSCENE_ENFORCE_WHITELIST` became `BB_SETSCENE_ENFORCE_IGNORE_TASKS`
> +  - `CVE_CHECK_PN_WHITELIST` became `CVE_CHECK_SKIP_RECIPE`
> +  - `CVE_CHECK_WHITELIST` became `CVE_CHECK_IGNORE`
> +  - `ICECC_USER_CLASS_BL` became `ICECC_CLASS_DISABLE`
> +  - `ICECC_SYSTEM_CLASS_BL` became `ICECC_CLASS_DISABLE`
> +  - `ICECC_USER_PACKAGE_WL` became `ICECC_RECIPE_ENABLE`
> +  - `ICECC_USER_PACKAGE_BL` became `ICECC_RECIPE_DISABLE`
> +  - `ICECC_SYSTEM_PACKAGE_BL` became `ICECC_RECIPE_DISABLE`
> +  - `LICENSE_FLAGS_WHITELIST` became `LICENSE_FLAGS_ACCEPTED`
> +  - `MULTI_PROVIDER_WHITELIST` became `BB_MULTI_PROVIDER_ALLOWED`
> +  - `PNBLACKLIST` became `SKIP_RECIPE`
> +  - `SDK_LOCAL_CONF_BLACKLIST` became `ESDK_LOCALCONF_REMOVE`
> +  - `SDK_LOCAL_CONF_WHITELIST` became `ESDK_LOCALCONF_ALLOW`
> +  - `SDK_INHERIT_BLACKLIST` became `ESDK_CLASS_INHERIT_DISABLE`
> +  - `SSTATE_DUPWHITELIST` became `SSTATE_ALLOW_OVERLAP_FILES`
> +  - `SYSROOT_DIRS_BLACKLIST` became `SYSROOT_DIRS_IGNORE`
> +  - `UNKNOWN_CONFIGURE_WHITELIST` became `UNKNOWN_CONFIGURE_OPT_IGNORE`
> +
> +  In addition, `BB_STAMP_WHITELIST`, `BB_STAMP_POLICY`, `INHERIT_BLACKLIST`
> +  and `TUNEABI_WHITELIST` have been removed.
> +
> +  Many internal variable names have been also renamed accordingly.
> +
> +  In addition, in the `cve-check` output, the CVE issue status `Whitelisted`
> +  has been renamed to `Ignored`.
> +
>    A :oe_git:`convert-variable-renames.py
>    </openembedded-core/tree/scripts/contrib/convert-variable-renames.py>`
>    script is provided to convert your recipes and configuration,
> -  and also warns you about the use of problematic words.
> +  and also warns you about the use of problematic words. The script performs
> +  changes and you need to review them before committing. An example warning
> +  looks like::
> +
> +     poky/scripts/lib/devtool/upgrade.py needs further work at line 275 since it contains abort
>  
>  - Because of the uncertainty in future default branch names in git repositories,
>    it is now required to add a branch name to all URLs described


Many thanks for the update.

For your information, I modified the way you quoted the text and
variables, using ``VAR`` instead of `VAR`, and even :term:`VAR` for
documented variables.

By the way, this allowed to detect that three variables are currently
undocumented, because the ones they replace were undocumented too:
BB_TASKHASH_IGNORE_TASKS, BB_SETSCENE_ENFORCE_IGNORE_TASKS,
SSTATE_ALLOW_OVERLAP_FILES

I'll take care of those separately.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


