Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F5ECDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 12:47:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.213822.1697546841279061982
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 05:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vo0/O7fT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BEC2240009;
	Tue, 17 Oct 2023 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697546838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y43PCIWuMLc0eVB260KCabL1CmKlElfGx2lZ3/Pgt9M=;
	b=Vo0/O7fTllHnkZlgOu1QadDOcqLTTgV0AzNVx9XuqqaALhtaeMH3WWL5PV3xBW9S2rGyaf
	LPrx1o69hMD5usbnhVHXqbMVbvysVWH7LCyfrqWi0mYn5lACO12DRUE1O3VpCbYIsQnFR4
	0ygL7PIqaYOO5FkNEDByFqvfifAqJIex2xwH98D2NLu3lFEBCCVZCwMlfMzeiXW280Dldo
	Donrc1aZQiQp7psTAuOjR+WILtVGx9mvlhxUps3AwwjklLIMRpaQasocJ7V6hLYpCjixK0
	o3DyIldR+AHKrAljm9GSkjpuuukgBSIKC+4TnbjjnshPqi2l/iZo6uKvEYbzFg==
Message-ID: <4d5b7227-6fcc-4a03-867a-0417b0ea115f@bootlin.com>
Date: Tue, 17 Oct 2023 14:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: layers: Add notes about layer.conf
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231017120524.3094506-1-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231017120524.3094506-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 12:47:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4399


On 17.10.23 at 14:05, BELHADJ SALEM Talel wrote:
> As discussed before with Richard Purdie, the code supports this but the documentation is not.
> Developers in general will not notice this or focus on it because they do not mess with the
> layer.conf template file, but in my opinion I think more details can help.
>
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>   documentation/dev-manual/layers.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index 2d809562d..7e83d9a3a 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -128,6 +128,17 @@ Follow these general steps to create your layer without using tools:
>         variable is a good way to indicate if your particular layer is
>         current.
>   
> +
> +   .. note::
> +
> +      A layer does not have to contain only recipes ``.bb`` or append files ``.bbappend``.
> +      Generally, developers create layers using ``bitbake-layers create-layer``, see
> +      ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`", that
> +      creates the ``layer.conf`` file from a template located in ``meta/lib/bblayers/templates/layer.conf``.
> +      In fact, all the variables set in ``layer.conf`` are not mandatory,
> +      except when :term:`BBFILE_COLLECTIONS` is present. In this case
> +      :term:`LAYERSERIES_COMPAT` and :term:`BBFILE_PATTERN` will have to be defined too.
> +
>   #. *Add Content:* Depending on the type of layer, add the content. If
>      the layer adds support for a machine, add the machine configuration
>      in a ``conf/machine/`` file within the layer. If the layer adds


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
(after a few extra minor tweaks on a couple sentences)
Merged into "master-next".

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


