Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50415C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 09:40:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.13105.1702374007726260016
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Dec 2023 01:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=og5li1V5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBDD9E0003;
	Tue, 12 Dec 2023 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702374005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzGb+97Istb9utba+4NamgcUYKn/7BBwMOTdup+Mhsg=;
	b=og5li1V5Q9HxbWVjMvytw9SOHqA517qGrBgQgBug2v2mQeqHzje9aK/tmKQNYyZkEvTRiF
	g6EcKJJkI3OLlUGVonT9C4rK7WZ8Jr2WWyvZ1Y93iWaALSq41u5RYAxtxhBtoIh0qNVOVF
	TslFxvGBUbkXwt+w/4TThQYnLkpJzXDE8V9fNpBaMTStR36mHWnw7H/mru2hCkm5et4Gu5
	cbLqUCf2iE0HpRtP2X3KkHf4WN+cVM6wPq679hRGnrXCcO122dOFaeehZTl5Q1WTbn9sPN
	j4UvDwofD4Ew8A1jLZCQy1ASFXIK60urtOBFN8nZMnZiiAqB1XNnj4yeS3CG7Q==
Message-ID: <09042827-375a-4e9f-a6a3-4bb5dea46d93@bootlin.com>
Date: Tue, 12 Dec 2023 10:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: Align order in Quick Build with default
 local.conf
Content-Language: en-US
To: simone.p.weiss@posteo.com
References: <20231210053555.11779-1-simone.p.weiss@posteo.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231210053555.11779-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Dec 2023 09:40:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4678

Hi Simone,

On 10.12.23 at 06:35, simone.p.weiss@posteo.com wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> Align the order from `BB_SIGNATURE_HANDLER` to `SSTATE_MIRRORS` in Quick Build
> with the order in the default local conf. While trivial it is easier to find,
> if the order matches.
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   documentation/brief-yoctoprojectqs/index.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index df8d75edc2..61c5cbec36 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -251,10 +251,10 @@ an entire Linux distribution, including the toolchain, from source.
>         To use such mirrors, uncomment the below lines in your ``conf/local.conf``
>         file in the :term:`Build Directory`::
>   
> -         BB_SIGNATURE_HANDLER = "OEEquivHash"
> -         BB_HASHSERVE = "auto"
>            BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
>            SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
> +         BB_HASHSERVE = "auto"
> +         BB_SIGNATURE_HANDLER = "OEEquivHash"
>   
>   #. **Start the Build:** Continue with the following command to build an OS
>      image for the target, which is ``core-image-sato`` in this example:


This makes sense. Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


