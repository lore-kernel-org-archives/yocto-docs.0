Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF2CC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 08:48:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.15656.1682585326138808041
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 01:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EurjK+1V;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C9C60FF808;
	Thu, 27 Apr 2023 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682585324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6NQu0YhZfor0wCe6iW5penM4UiCyuKgKeylAt6w+Hfo=;
	b=EurjK+1VzQ6QWumAAmkVi7/7Wyo9/Qp8ow5aumHT6s76FCQM1cMOHXboFqAWXMt6Ejg8j1
	bohPvR38PSkk6or8nr3w+Q75f3DD1He0NdW7/RPwJCFWTXlZtBq5xhJ9Q2bm9hxoZocVZT
	JiSFbHEJ1yIM5QQ4g7STlYtBN75vJExLZbZSOf28BAH6hme0I5rcL/txxPEav4JGBAox+I
	eutYITBhrDvTZD1yJoCz2Ac8SfsiiOT5Rg8D3tRZzah9N11PHdBR8kRMwAVfXlLfQCewWt
	92/i/1BekeiQvLYfwIbsgZbitlRvA/ozZDfkwbspnyLM68yrBDXdShodBQZncg==
Message-ID: <036f9f52-c44d-6451-d926-34baf3cfe877@bootlin.com>
Date: Thu, 27 Apr 2023 10:48:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release-notes for 4.0.9
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230422024051.2758644-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230422024051.2758644-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Apr 2023 08:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3871

Hi Lee

On 22.04.23 at 04:40, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.9.rst  | 247 ++++++++++++++++++
>   2 files changed, 248 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.9.rst
>
> diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
> index 2294265a4..1fc74a0f6 100644
> --- a/documentation/migration-guides/release-4.0.rst
> +++ b/documentation/migration-guides/release-4.0.rst
> @@ -15,3 +15,4 @@ Release 4.0 (kirkstone)
>      release-notes-4.0.6
>      release-notes-4.0.7
>      release-notes-4.0.8
> +   release-notes-4.0.9
> diff --git a/documentation/migration-guides/release-notes-4.0.9.rst b/documentation/migration-guides/release-notes-4.0.9.rst
> new file mode 100644
> index 000000000..883514e68
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-4.0.9.rst
> @@ -0,0 +1,247 @@
> +Release notes for Yocto-4.0.9 (Kirkstone)
> +-----------------------------------------


Many thanks for the release notes!
You just forgot to add license information at the beginning.

I'll send an additional patch, as your changes have already been merged.
Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


