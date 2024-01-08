Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6F9C47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:23:38 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.1138.1704731012496150306
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 08:23:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Fw7NmHdy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 222F9240003;
	Mon,  8 Jan 2024 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704731010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0Ung+nacte+gYKDiOwgcl5v64PgTAOFyHMqUJncZtM=;
	b=Fw7NmHdyTuyr9psklKfhrHqbQ+g/6tTEFMC9HgGW76FAeqNDLszwHVszH+ofrCo0CBQRIJ
	02jWFju0gsvZ1ttWNsiDpn5M6kLlr/t80YE+RY/097dLKKrjrnaKeN0FcEh/WY5t6oFGpQ
	el+LZc9m1pK86JvUo88r6gey/KrwlZTX+uJHZAY0NLxeJAfhWwy8qU0bQ5d7XhGCoYrwRr
	KEvKbBUeojXOTWeU/BxDQ3zRyAZ2g/GQSQqF3OR8MBdzfHegIKTcC28iH/mhDPjp8z8uF+
	Efi0k65am6C0hNRtEHI+58eqYhS1ZDtE5EX8zfycgARiNzGWob9VOiMClSeYGA==
Message-ID: <d770bd10-d5c7-494d-89db-74e24207d426@bootlin.com>
Date: Mon, 8 Jan 2024 17:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: document cmake-qemu class
Content-Language: en-US
To: Adrian Freihofer <adrian.freihofer@gmail.com>
References: <20231231154843.1418654-1-adrian.freihofer@siemens.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231231154843.1418654-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 16:23:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4748

Hi Adrian

On 31.12.23 at 16:48, Adrian Freihofer wrote:
> (From yocto-docs rev: d7c05e4eed4ed436f2ce961df46f9654af83ffec)
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/ref-manual/classes.rst | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index a8afe9f2dcb..c9bc0f08c6c 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -377,6 +377,33 @@ If you need to install custom CMake toolchain files supplied by the application
>   being built, you should install them (during :ref:`ref-tasks-install`) to the
>   preferred CMake Module directory: ``${D}${datadir}/cmake/modules/``.
>   
> +.. _ref-classes-cmake-qemu:
> +
> +``cmake-qemu``
> +==============
> +
> +The :ref:`ref-classes-cmake-qemu` class might be used instead of the
> +:ref:`ref-classes-cmake` class. In addition to the features provided by the
> +:ref:`ref-classes-cmake` class the :ref:`ref-classes-cmake-qemu` class passes
> +the ``CMAKE_CROSSCOMPILING_EMULATOR`` setting to ``cmake``. This allows to use
> +qemu-usermode for the execution of cross-compiled binaries on the host machine.
> +For more information about ``CMAKE_CROSSCOMPILING_EMULATOR`` please refer to
> +the `related section of the CMake documentation <https://cmake.org/cmake/help/latest/variable/CMAKE_CROSSCOMPILING_EMULATOR.html>`__.
> +
> +Not all platforms are supported by Qemu. This class only works for machines with
> +the ``qemu-usermode`` in the :ref:`ref-features-machine`. Using qemu-usermode therefore
> +involves a certain risk, which is also the reason why this feature is not part of
> +the main cmake class by default.
> +
> +One use case is the execution of cross-compiled unit tests with CTest on the build
> +machine. If ``CMAKE_CROSSCOMPILING_EMULATOR`` is configured::
> +
> +   cmake --build --target test
> +
> +works transparently with qemu-usermode.
> +If the CMake project is developed with this use case in mind this works very nicely
> +also out of an IDE configured to use cmake-native for cross compiling.


Many thanks for this update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I just made a few formatting and styling updates, which you can check on 
https://git.yoctoproject.org/yocto-docs/commit/?h=master-next&id=b2e396bd970ea8f27ba575b49c1489e2181442b8
Not to late to correct me if I misunderstood what you meant.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


