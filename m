Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC912C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 11:01:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.30207.1701169303406736417
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Nov 2023 03:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IdSryBGE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EB95240003;
	Tue, 28 Nov 2023 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701169301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fiWgUam5Nq4Jhzi4uGDQEZR6BrHa/Kjp5MfSRoSzeQ0=;
	b=IdSryBGEjXTgX/Kfnz0NLKX6IDQNvPazS1kdVlBp5yWVaxenpOqope6AphmYXGQJ7YbluL
	N3wnlBwdGQ5Hdjd4ryocHnM+rUnf7Kei21o70wjbPui80Zj9KNnCUljOi/9sY5p0G3VMgY
	dkACNJuCWKdNscTWi1FU9kIS6XqAEBZi22uM4vAC4isXoP36zpkOIwvEP2yF/8qvEzSKwJ
	6rxEOv4dkeo20P084EIUCwaaaVPTdc5velZDHIlZHleshfjQy1kCocgwO6ZnUv6oA9YEE5
	9OEvFqVscRJxddVeST8EEbpZCPWGGnnJsSwpH/LnwpBAbO/ekQmy7XUEnFAZNw==
Message-ID: <62fb1e4d-2983-49f4-8135-3e8d5a98de1f@bootlin.com>
Date: Tue, 28 Nov 2023 12:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.3.1
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20231128065058.1858790-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231128065058.1858790-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Nov 2023 11:01:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4648

Hi Lee

Many thanks for the release notes!
See my comments below...

On 28.11.23 at 07:50, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.3.rst          |   1 +
>   .../migration-guides/release-notes-4.3.1.rst  | 236 ++++++++++++++++++
>   2 files changed, 237 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.3.1.rst
>
> diff --git a/documentation/migration-guides/release-4.3.rst b/documentation/migration-guides/release-4.3.rst
> index 92516ae8f..5b651a2ef 100644
> --- a/documentation/migration-guides/release-4.3.rst
> +++ b/documentation/migration-guides/release-4.3.rst
> @@ -7,3 +7,4 @@ Release 4.3 (nanbield)
>   
>      migration-4.3
>      release-notes-4.3
> +   release-notes-4.3.1
> diff --git a/documentation/migration-guides/release-notes-4.3.1.rst b/documentation/migration-guides/release-notes-4.3.1.rst
> new file mode 100644
> index 000000000..a9ebcee9d
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-4.3.1.rst
> @@ -0,0 +1,236 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for Yocto-4.3.1 (Nanbield)
> +----------------------------------------
> +
> +Security Fixes in Yocto-4.3.1
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  libsndfile1: Fix :cve:`2022-33065`
> +-  libxml2: Ignore :cve:`2023-45322`
> +-  linux-yocto: Ignore :cve:`2020-27418`, :cve:`2020-27418`,


Oops, you mentioned 2020-27418 twice. Fixed, but if you meant another 
one instead, let me know.

All the rest looks good, thanks!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


