Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D402C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 09:17:24 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.55976.1716196640121538123
 for <docs@lists.yoctoproject.org>;
 Mon, 20 May 2024 02:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PxCu2JsT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2EE31C0004;
	Mon, 20 May 2024 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716196637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=et/AP6YgsTF+kenJV5N0h+RGqIupZI5TISnvxEU+zpw=;
	b=PxCu2JsT5thPEPxKdZdXh6ePCMOplHe24CwGqUc52X94fv6Se5YEaCatEFOBrXwRV0WnAg
	5VHuLBozU6Ycfw6ba6FiXwmI7pSF5bcta73WBKcK4EyoAJGpZlLZv/B0ososWrowI/P0TG
	wf5KuL3Wic3qtcQhYqUG+/ttWr2VxNhvh4RpiRqQZN7PEWvoX7RnZJ6DqdNGIDIIUWW82S
	Z4hOg7VAXb2Q+WRj0wf3csEmSBYtoseF38MmXGhhKI3VqrGbC3VqLvF6fzLtdvLLf/Ipy0
	Z8Juii2a/YWelBr7pVKrcxG5gjr9+FxLq5wZFw2IiZWSwGLE5XLN6lBJaYk1Ig==
Message-ID: <d86d63f5-29a7-47dd-a754-0cb612586094@bootlin.com>
Date: Mon, 20 May 2024 11:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] release-notes-4.0.18: specify backported license
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240513145858.89639-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240513145858.89639-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 May 2024 09:17:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5222

Hi Lee

On 5/13/24 at 20:28, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Align with finalized text-based release notes.
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   documentation/migration-guides/release-notes-4.0.18.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/migration-guides/release-notes-4.0.18.rst b/documentation/migration-guides/release-notes-4.0.18.rst
> index fc8cd83c0..d5a2a7f6c 100644
> --- a/documentation/migration-guides/release-notes-4.0.18.rst
> +++ b/documentation/migration-guides/release-notes-4.0.18.rst
> @@ -28,7 +28,7 @@ Fixes in Yocto-4.0.18
>   ~~~~~~~~~~~~~~~~~~~~~
>   
>   -  build-appliance-image: Update to kirkstone head revision
> --  common-licenses: Backport missing license
> +-  common-licenses: backport LGPL-3.0-with-zeromq-exception license
>   -  contributor-guide: add notes for tests
>   -  contributor-guide: be more specific about meta-* trees
>   -  cups: fix typo in :cve:`2023-32360` backport patch


Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


