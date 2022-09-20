Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F336C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 13:36:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.12140.1663681005735106577
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 06:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lF3S/tYJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9FA554000F;
	Tue, 20 Sep 2022 13:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663681004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GNA55wumGUknjvY/3dhmElTGAlmrLfLLaWCm9eyg0gQ=;
	b=lF3S/tYJiyPMQhqjoDxN6z1rnIN6bPXs6ermCtIrGgCEw1lNf9vL7M9mAI9uewS+Tho3fL
	5PmDnKDS+hY7vXCs7/F7kN6Zg5yhiE4xfc1FI74RJuLciwBjodJ76A2z1nFS2M+HTZAznC
	MqXh1/C+2RXrZbkHs7r+P5kLIFdoeGHnqtMAkI3x3g5b+9jYvDLEte0+ysKr8+0rCzrXep
	qWH8jbfnTbYTkKoJyI+ciBJlVhYtsISprnx8SQrizzI/nukgIRqkw7mSyl/CYlvojcApdz
	Ty31fgDdInpARYZ39/I7L89x/CifiH2TEnC6fHPlQTP6xm4NYWtK6Mo5Khb8zg==
Message-ID: <f2fe2a45-0c9a-a75a-d7a8-6afbf416843d@bootlin.com>
Date: Tue, 20 Sep 2022 14:36:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/5] ref-manual: correct the location of default
 configuration template
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20220911172608.2542076-1-alex@linutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220911172608.2542076-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 13:36:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3186

Hi Alex,

On 9/11/22 18:26, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/ref-manual/structure.rst | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index bdcffc194..6c6f52e79 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -189,7 +189,7 @@ Directory named ``mybuilds/`` that is outside of the :term:`Source Directory`::
>      $ source oe-init-build-env ~/mybuilds
>   
>   The OpenEmbedded build system uses the template configuration files, which
> -are found by default in the ``meta-poky/conf/`` directory in the Source
> +are found by default in the ``meta-poky/conf/templates/default`` directory in the Source
>   Directory. See the
>   ":ref:`dev-manual/common-tasks:creating a custom template configuration directory`"
>   section in the Yocto Project Development Tasks Manual for more
> @@ -261,15 +261,15 @@ OpenEmbedded build system creates it from ``local.conf.sample`` when you
>   :ref:`structure-core-script`.
>   
>   The source ``local.conf.sample`` file used depends on the
> -:term:`TEMPLATECONF` script variable, which defaults to ``meta-poky/conf/``
> +:term:`TEMPLATECONF` script variable, which defaults to ``meta-poky/conf/templates/default``
>   when you are building from the Yocto Project development environment,
> -and to ``meta/conf/`` when you are building from the OpenEmbedded-Core
> +and to ``meta/conf/templates/default`` when you are building from the OpenEmbedded-Core
>   environment. Because the script variable points to the source of the
>   ``local.conf.sample`` file, this implies that you can configure your
>   build environment from any layer by setting the variable in the
>   top-level build environment setup script as follows::
>   
> -   TEMPLATECONF=your_layer/conf
> +   TEMPLATECONF=your_layer/conf/templates/your_template_name
>   
>   Once the build process gets the sample
>   file, it uses ``sed`` to substitute final
> @@ -281,7 +281,7 @@ file, it uses ``sed`` to substitute final
>      You can see how the :term:`TEMPLATECONF` variable is used by looking at the
>      ``scripts/oe-setup-builddir`` script in the :term:`Source Directory`.
>      You can find the Yocto Project version of the ``local.conf.sample`` file in
> -   the ``meta-poky/conf`` directory.
> +   the ``meta-poky/conf/templates/default`` directory.
>   
>   .. _structure-build-conf-bblayers.conf:
>   
> @@ -301,14 +301,14 @@ you ``source`` the top-level build environment setup script (i.e.
>   
>   As with the ``local.conf`` file, the source ``bblayers.conf.sample``
>   file used depends on the :term:`TEMPLATECONF` script variable, which
> -defaults to ``meta-poky/conf/`` when you are building from the Yocto
> -Project development environment, and to ``meta/conf/`` when you are
> +defaults to ``meta-poky/conf/templates/default`` when you are building from the Yocto
> +Project development environment, and to ``meta/conf/templates/default`` when you are
>   building from the OpenEmbedded-Core environment. Because the script
>   variable points to the source of the ``bblayers.conf.sample`` file, this
>   implies that you can base your build from any layer by setting the
>   variable in the top-level build environment setup script as follows::
>   
> -   TEMPLATECONF=your_layer/conf
> +   TEMPLATECONF=your_layer/conf/templates/your_template_name
>   
>   Once the build process gets the sample file, it uses ``sed`` to substitute final
>   ``${``\ :term:`OEROOT`\ ``}`` values for all ``##OEROOT##`` values.
> @@ -317,7 +317,7 @@ Once the build process gets the sample file, it uses ``sed`` to substitute final
>   
>      You can see how the :term:`TEMPLATECONF` variable is defined by the ``scripts/oe-setup-builddir``
>      script in the :term:`Source Directory`. You can find the Yocto Project
> -   version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/``
> +   version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/templates/default``
>      directory.
>   
>   .. _structure-build-conf-sanity_info:


Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


