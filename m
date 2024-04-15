Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B36C00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 13:44:08 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.21479.1713188640765603267
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 06:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JANCXL48;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABDCB240003;
	Mon, 15 Apr 2024 13:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713188639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QcOP7Ttm3I93vCyCdZxEIjBQV7l/XakIxjihhvRwTBQ=;
	b=JANCXL48/4REbou0R0KyiWKjLbeb5wjwum2R+ct7A8l5Usjtm0wHiJPq6lJLN7cWERfGkM
	Ecygo0kgHE1aCAAvnTEa1O+1pmNxTy04jucVvm8lGDZGI/H6ivzHQa8BAUNuoJBf33GpyQ
	lKTh60dx0IR8T3VQ15xncnsR7mV7hoM8zXC5nZ+sNxkvxq88b74PASujTcHd1cFd7IvGz8
	VST6qRSDJo4hIKxJtFKfj6Jyj0TuXpcQRljAzHmAj5mVxGe461QJTVmF090oXyzNe4wfx2
	yv26n7IuqItcBj3cP4xCc9TDwAZRC5RtwGP7cFINTOt7YVi2Pi4eJT6lOBc6Ng==
Message-ID: <a605d20f-44ca-4e75-8b9a-ee44587b0b82@bootlin.com>
Date: Mon, 15 Apr 2024 15:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 2/9] ref-manual: add new python classes
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
 <1fb3884b4272884ba85be9fb71ca8cc03b9be014.1713127068.git.bluelightning@bluelightning.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1fb3884b4272884ba85be9fb71ca8cc03b9be014.1713127068.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 13:44:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5152

Hi Paul

Many thanks for these additions to the release notes.

On 4/14/24 at 22:43, Paul Eggleton wrote:
> Add brief documentation of python_maturin and python_mesonpy classes
> that were added in 5.0.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   documentation/ref-manual/classes.rst | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 296347edb7..1f816e0457 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -2380,6 +2380,24 @@ Python modules built with ``flit_core.buildapi`` are pure Python (no
>   
>   Internally this uses the :ref:`ref-classes-python_pep517` class.
>   
> +.. _ref-classes-python_maturin:
> +
> +``python_maturin``
> +==================
> +
> +The :ref:`ref-classes-python_maturin` class provides support for python-maturin, a replacement
> +for setuptools_rust and another "backend" for building python wheels.


s/python wheels/Python Wheels/
Fixed

> +
> +.. _ref-classes-python_mesonpy:
> +
> +``python_mesonpy``
> +==================
> +
> +The :ref:`ref-classes-python_mesonpy` class enables building Python modules which use the
> +meson-python build system.
> +
> +Internally this uses the :ref:`ref-classes-python_pep517` class.


Everything all right here, though all these project names caused me to 
submit a way of highlighting the project names, to distinguish them from 
command names and common words. See 
https://lore.kernel.org/yocto-docs/20240415124735.1060654-1-michael.opdenacker@bootlin.com/T/#u

So, when this is accepted, I'll probably replace "Python Wheels" by 
"`Python Wheels`". :-)

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


