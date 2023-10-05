Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FBDE7C4F7
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 08:30:25 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.10867.1696494620628438457
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 01:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eHpNky01;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 814FAC000C;
	Thu,  5 Oct 2023 08:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696494618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W16eaXki4zobztIvOwl2OpL5ZEH8xNPRHu42j3yO/xU=;
	b=eHpNky01JqBfY3jIOMO2EgpduawdIHOJUVd45ZM9ggjBBQ8zPtM2qHxEiWN06hqIb2urMt
	SakuSZOwyWuiOUfMYtTd1WerUXddyGhpYiaerrys/bAENFZoQ2J2jz+OTn+1H31H9eYnyJ
	X/LThK2ztbCEsdMl4Wo8geIXFCNI6nAA3PKFOtvHmpRaItDg37AouVHCheriskxMQ8SJbL
	GWet20ncJmcCo+HoGlOO6SA8xgHYoWoK5XXWHrtg4yTrHeP9UK4okWZL+tdVPi1yJ5HXHP
	Qm+MyYf2tMKuBWP23vDhqS4swkNv7ZRzDTUAlAF9MEf9pZxnRhWoC980264l4Q==
Message-ID: <b60f377b-523d-a5b4-b1e9-f9946b30fd60@bootlin.com>
Date: Thu, 5 Oct 2023 10:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: fix testimage usage instructions
Content-Language: en-US
To: Trevor Gamblin <tgamblin@baylibre.com>
References: <20231003151741.1255292-1-tgamblin@baylibre.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231003151741.1255292-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 08:30:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4308

Hi Trevor

On 03.10.23 at 17:17, Trevor Gamblin wrote:
> The proper way to inherit the testimage class is now
>
> IMAGE_CLASSES += "testimage"
>
> so change lines with 'INHERIT += "testimage"' to match. This makes the
> dev-manual consistent with the migration guide, which already specifies
> that the old way causes an error.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   documentation/dev-manual/runtime-testing.rst   | 4 ++--
>   documentation/dev-manual/upgrading-recipes.rst | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
> index c5c5653be..af3fe2c1d 100644
> --- a/documentation/dev-manual/runtime-testing.rst
> +++ b/documentation/dev-manual/runtime-testing.rst
> @@ -229,7 +229,7 @@ The final thing you need to do when setting :term:`TEST_TARGET` to
>      statements in your ``local.conf`` file::
>   
>         IMAGE_FSTYPES += "tar.gz"
> -      INHERIT += "testimage"
> +      IMAGE_CLASSES += "testimage"
>         TEST_TARGET = "SystemdbootTarget"
>         TEST_TARGET_IP = "192.168.2.3"
>   
> @@ -335,7 +335,7 @@ You can start the tests automatically or manually:
>      inherit the :ref:`ref-classes-testimage` class by editing your
>      ``local.conf`` file::
>   
> -      INHERIT += "testimage"
> +      IMAGE_CLASSES += "testimage"
>   
>      Next, use BitBake to run the tests::
>   
> diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
> index 947ef138a..4fac78bdf 100644
> --- a/documentation/dev-manual/upgrading-recipes.rst
> +++ b/documentation/dev-manual/upgrading-recipes.rst
> @@ -117,7 +117,7 @@ The following steps describe how to set up the AUH utility:
>         class, which is optional, you need to have the following set in
>         your ``conf/local.conf`` file::
>   
> -         INHERIT += "testimage"
> +         IMAGE_CLASSES += "testimage"
>   
>         .. note::


Many thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


