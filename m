Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FF4CD1297
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 12:35:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.10049.1712320528059908236
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 05:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K6fp/xob;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C69EA1C0003;
	Fri,  5 Apr 2024 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712320526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COC0dq0jcs/vgvXn+DmiJg8Njgsrp7ka/mzks5fFr9g=;
	b=K6fp/xobQ72FBu5o4wSjfQUSLq73vNZkDYfT5HPRY8KOhu0JW3sQPvNygr8wFGwN6t29i8
	Lj1CcNU8XH08CJiITVk5fwwGAzxe6L9tVdVDAV7Tozk0gn5ty5v+8M2AYKB660y4AToef8
	skmOoxXhsuxPdafjf7vR1RvG8j3d7PVUn7w6cBaCUxS+ccjhScZYIM6RiTHxJzDE/hURnm
	3yYKmuYB407ZsmoEArJJM9qo72Bp8dqp9IFuC/dF/eCqKwABfkB8FGgYmFoOZOwXl02m7P
	PVDvxX/Kxs5qNltR1MMvwn539bBQlgMliUBelreLqSRqLbjt0Qb7GcGsqQPPXQ==
Message-ID: <50a6d7ba-ed60-4539-a9db-02515f714adf@bootlin.com>
Date: Fri, 5 Apr 2024 14:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v1 1/3] classes: document new go-vendor class
To: joaomarcos.costa@bootlin.com
References: <20240405100355.2268926-1-joaomarcos.costa@bootlin.com>
 <20240405100355.2268926-2-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240405100355.2268926-2-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 12:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5073

Hi João,

Thanks for the updates!
See my edits below...

On 4/5/24 at 12:03, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> A reference to this class in the release notes will be added in a
> follow-up commit.
>
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 8612128f7..272df0dfb 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -939,6 +939,19 @@ The :ref:`ref-classes-go-mod` class allows to use Go modules, and inherits the
>   
>   See the associated :term:`GO_WORKDIR` variable.
>   
> +.. _ref-classes-go-vendor:
> +
> +``go-vendor``
> +=============
> +
> +The :ref:`ref-classes-go-vendor` class implements support to offline builds,
s/support to/support for/
> +also known as Go vendoring. In such scenario, the module dependencias are
s/such/such a/
> +downloaded during fetch task rather than when modules are imported, thus bein
s/fetch task/the :ref:`ref-tasks-fetch` task/
Yes, we also have references to tasks :)
> g
> +coherent with Yocto's concept of fetching every source beforehand.
> +
> +The dependencies are unpacked into the modules' ``vendor`` directory, where a
> +manifest file is generated.
> +
>   .. _ref-classes-gobject-introspection:
>   
>   ``gobject-introspection``


I fixed all these by myself. Nothing to do on your side.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next"
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


