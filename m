Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32A3C54EBE
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 09:00:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.10991.1674032441202009616
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 01:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LdRhZd5b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 288021C001E;
	Wed, 18 Jan 2023 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674032438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nc2ejxPESYNGwH83+QdtzD5YWY63AuhvLnglSh2GyxA=;
	b=LdRhZd5bEuwJ1VrGmJHACfsU+4wKSQK3KiFELUvt2r5dsmpTGJIXVR8Z8VhjGZXmIBeTUI
	xzG3s4PEzIN7E4FxPGllbL578KoHtlR4WnKsTn6LTknIZtkVoiST/NNHzZJ5Jaoh/C9GhC
	1SS/gWitzDV8/ZMtSPBxCP73E8QkYlQBZ9WtvDc6AUB68QATPH2cPq2V+l+LxfYRpV/PO0
	djbkIQmXoKEt2EIWx0gBLjKir116IATxM0X6xg8Sxipt9DmSouHEHpLW21t6nYjCfG4JgM
	+XCD8tmRuQW/eEc1onXzGuMs6x9Fpe9plvt8w/QoZcSVdz/0OaW6WVU+8BooyQ==
Message-ID: <d222436a-baca-6289-1d40-f37549eabf17@bootlin.com>
Date: Wed, 18 Jan 2023 10:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: fix typo in the MLPREFIX description
To: luca.ceresoli@bootlin.com
References: <20230117171016.733760-1-luca.ceresoli@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230117171016.733760-1-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jan 2023 09:00:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3617

Hi Luca

On 17.01.23 at 18:10, Luca Ceresoli via lists.yoctoproject.org wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index f2decd713ba1..652f08c71202 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5101,7 +5101,7 @@ system and gives an overview of their function and contents.
>         Specifies a prefix has been added to :term:`PN` to create a
>         special version of a recipe or package (i.e. a Multilib version). The
>         variable is used in places where the prefix needs to be added to or
> -      removed from a the name (e.g. the :term:`BPN` variable).
> +      removed from a name (e.g. the :term:`BPN` variable).
>         :term:`MLPREFIX` gets set when a prefix has been added to :term:`PN`.


Good catch. Thanks for the patch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into the "master-next" branch.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


