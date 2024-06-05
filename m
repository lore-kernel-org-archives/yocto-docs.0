Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B075C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 16:21:58 +0000 (UTC)
Received: from sender21-op-o11.zoho.eu (sender21-op-o11.zoho.eu [185.172.199.225])
 by mx.groups.io with SMTP id smtpd.web10.19895.1717604514057012502
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Jun 2024 09:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=iu211AzG;
 spf=pass (domain: opdenacker.org, ip: 185.172.199.225, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1717604509; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=JTez/2vIgkn32CrPlOkvzlC7ikLYq8/FtYj8TeUHqLk+GHKo9c0zGm3oKdbemdALGAzVy8qNkzLMchOMESgh+mw/6HsexO43gpRzyOEOqi4SCWBiXZLoHustbtn/RsmU/3OchOjEsXTa6zYGYXPn+xXIyEVjMbozePZ+hedH6Q8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1717604509; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2R75JlOE3KfRv2zdjHK3dSVBbwxr7PnmZQyPPKBJMug=; 
	b=aex24K5FkYklKlSTB+YRnT8jfx7wuIgm0NH9PCDAQE2kxyOci7Hy37l0epY+fa8Gbor+VJHaazIWAKDEAm0nNM3LQdF2Z1vKB2NyUgTozed9IW+4VnVxJrpaw1bvYdaDujERDGXgvxqBfYBNHjWOZiUu6cmkeXT174Nxv2LyHUk=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1717604509;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2R75JlOE3KfRv2zdjHK3dSVBbwxr7PnmZQyPPKBJMug=;
	b=iu211AzGRjbadix5hdmeBSP1U+OLHQJlU0BOLma/qsb8HMJnY9LyWkOHYvECSB/a
	h6TsK6A+4HXlei3Htjzd+8NFq8V1kptsHTaGZgSZFmFInpeBB+iX7ZOdVTUkuAWCny6
	pYk1mYpLgR0LeEq+5C+iWHLFbaa3m3eWFwBhOr08=
Received: by mx.zoho.eu with SMTPS id 1717604505945970.9293986029983;
	Wed, 5 Jun 2024 18:21:45 +0200 (CEST)
Message-ID: <00760c0e-d742-4922-911b-d88a961f1692@opdenacker.org>
Date: Wed, 5 Jun 2024 18:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] recipe style guide: add recommendation for patches
 without signature
To: Alexandre Truong <alexandre.truong@smile.fr>
Cc: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
References: <20240530134950.14465-1-alexandre.truong@smile.fr>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <20240530134950.14465-1-alexandre.truong@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Jun 2024 16:21:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5270

Hi Alexandre

Many thanks for the patch!
I just have minor improvements to suggest...

On 5/30/24 15:49, Alexandre Truong wrote:
>  From discussion [0], the presence of git version signature at the end of
> patches has been questionned. To avoid a bit more noise, the setting git
> format.signature is added to the documentation and its use is
> recommended.
> 
> [0]: https://lists.openembedded.org/g/openembedded-core/topic/106323318#msg199967
> 
> Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   .../contributor-guide/recipe-style-guide.rst         | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> index 08d8fb425..01419a17a 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -409,3 +409,15 @@ This should be the header of patch that fixes :cve:`2015-8370` in GRUB2::
>      Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2]
>      CVE: CVE-2015-8370
>      Signed-off-by: Joe Developer <joe.developer@example.com>
> +
> +Patch format
> +============
> +
> +By default, patches created with ``git format-patch`` have a git version signature at the end.

Here, you should use `Git`. See 
https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n79 
. That's a new rule, that's not enforced yet, but I will submit patches 
to make the change everywhere.

> +To avoid having a git signature at the end of generated or updated patches,
> +you can use Git configuration settings::

Same here in the above two lines.

> +
> +   git config --global format.signature ""
> +
> +.. note::
> +   Patches generated or updated by devtool are created with no signature.

Here, you should use ``devtool`` as in the rest of the docs. Here we 
consider we refer to the command name.

Thanks in advance for the update.
Cheers
Michael.

> 


