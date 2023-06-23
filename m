Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0809CEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 08:48:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.38017.1687510129749989042
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jun 2023 01:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kvAohcib;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687510127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNkvPiHsiSmTNKv3OT88E664MfYlIVQskYojJAp3I88=;
	b=kvAohcibR23x1ay2hfV9zxYQIlrfIOBpPJND0QNFakqvBMwdlx7dBYfO//GhgChLpu53i0
	oyIExPOgF1j+hYQFMIqgfeOWjohVGGFZhdB/zwMuWJ+72uTdVx2RuT7GeIHdx7cNVf7QE8
	r9swOM5HUZcB8GzOgjrYJs2kA8+ZR9YOam9gknenAyeu89mm5jOgkxDzA9+3LkjBjqY8BF
	75DcQ5gqqGK7i6sGFd/z/xH/W7hO+jJcnlpEeGMCamxpwJ1OtPCSElXRKKaBBnlLfViGLc
	FjSj85f7Kpjsr3A7+KMNFoschSp5iavkl2EJjXFn3ZH2VkK0qZm9+vQKQjYYhA==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2402E0008;
	Fri, 23 Jun 2023 08:48:46 +0000 (UTC)
Message-ID: <bad660a1-2b9f-c3b2-9d7a-532f8c618b2c@bootlin.com>
Date: Fri, 23 Jun 2023 10:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: classes: devicetree: fix sentence
 saying the same thing twice
Content-Language: en-US
To: luca.ceresoli@bootlin.com
References: <20230623080603.3249960-1-luca.ceresoli@bootlin.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230623080603.3249960-1-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jun 2023 08:48:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4037

Luca, Quentin,

Thanks for the correction and review!

On 23.06.23 at 10:06, Luca Ceresoli via lists.yoctoproject.org wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> This sentence was originally written based on the comments in the .bbclass
> file, but further editing led to saying the same thing twice. Remove the
> duplication and also reword it to make it generally better.
>
> Fixes: f65816f5ea62 ("ref-manual: classes.rst: document devicetree.bbclass")
> Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 11e70006e5ac..e555a80b5af9 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -600,12 +600,12 @@ The :ref:`ref-tasks-compile` task will compile two kinds of files:
>   - Device tree overlays, detected from the presence of the ``/plugin/;``
>     string in the file contents.
>   
> -This class behaves in a similar way as the :ref:`ref-classes-kernel-devicetree`
> -class, also deploying output files into ``/boot/devicetree``. However, this
> -class stores the deployed device tree binaries into the ``devicetree``
> -subdirectory. This avoids clashes with the :ref:`ref-classes-kernel-devicetree`
> -output. Additionally, the device trees are populated into the sysroot for
> -access via the sysroot from within other recipes.
> +This class deploys the generated device tree binaries into
> +``${``\ :term:`DEPLOY_DIR_IMAGE`\ ``}/devicetree/``.  This is similar to
> +what the :ref:`ref-classes-kernel-devicetree` class does, with the added
> +``devicetree`` subdirectory to avoid name clashes. Additionally, the device
> +trees are populated into the sysroot for access via the sysroot from within
> +other recipes.
>   
>   By default, all device tree sources located in :term:`DT_FILES_PATH` directory
>   are compiled. To select only particular sources, set :term:`DT_FILES` to


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next" (for my own convenience).

Not too late for further changes and reviews :)
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


