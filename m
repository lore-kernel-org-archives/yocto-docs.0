Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25ABDC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 15:51:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.1537.1645113104161606196
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 07:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EO8sQY+c;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2A25BE0003;
	Thu, 17 Feb 2022 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645113101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mg8PEB89XxGXn+N7j0rXKej/gBqn7pmymsTGbhdYWHs=;
	b=EO8sQY+cAHahSkMAypqGI8isuN3pvBFIDkJa/D3P7tmx3ubny1+1nLgFOdJ4Mx8ih2WNIl
	6SMrrXnLYSSVz+V51nHLAT2gF+7gMj2va/tsKTqONsVXLdjGy2SXpW2CAwrnAj+Yz3PqqR
	pmw6S8vIWzbxx+5WNxp6qPhuC8S0dKwRnTHdj9j/N2VsWVoWwZ00Y7UZLNoc2ERY/rTV2J
	seOnUoP8k8kx/qpOyspUitkPavkcWQ6P0lkM7ik6Rpgm4a29F4+yBZ6KVcrhQRLMY4Urds
	Qt9ktcMHibP2zRpRZFJdg0YKzg+Rwd5DffqcGSd9kTmiN4i0hjShDcWRirfw3Q==
Message-ID: <609d2cd6-3721-8bb7-0910-ee426c7b96b4@bootlin.com>
Date: Thu, 17 Feb 2022 16:51:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH v2] documentation: Add multiconfig initramfs
 configuration:
Content-Language: en-US
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
 docs@lists.yoctoproject.org
References: <20220216201731.2699414-1-alhe@linux.microsoft.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220216201731.2699414-1-alhe@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Feb 2022 15:51:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2474

Hi Alejandro,

On 2/16/22 21:17, Alejandro Hernandez Samaniego wrote:
> dev-manual/common-tasks.rst: Add section to create an initramfs
> image from a separate multiconfig.
>
> ref-manual/variables.rst: Add new variable definitions for
> INITRAMFS_DEPLOY_DIR_IMAGE and INITRAMFS_MULTICONFIG
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 42 +++++++++++++++++++++++
>  documentation/ref-manual/variables.rst    | 17 +++++++++
>  2 files changed, 59 insertions(+)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index d35b590ee..dec44d378 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -3919,6 +3919,48 @@ Follow these steps to create an initramfs image:
>     :term:`INITRAMFS_IMAGE_BUNDLE`
>     variable described earlier.
>  
> +Bundling an Initramfs Image From a Separate Multiconfig
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +There may be a case where we want to build an initramfs image which does not
> +inherit the same distro policy as our main image, for example, we may want
> +our main image to use ``TCLIBC="glibc"``, but to use ``TCLIBC="musl"`` in our initramfs
> +image to keep a smaller footprint. However, by performing the steps mentioned
> +above the initramfs image will inherit ``TCLIBC="glibc"`` without allowing us
> +to override it.
> +
> +To achieve this, you need to perform some additional steps:
> +
> +1. *Create a multiconfig for your initramfs image:* You can perform the steps
> +   on ":ref:`dev-manual/common-tasks:building images for multiple targets using multiple configurations`" to create a separate multiconfig.
> +   For the sake of simplicity let's assume such multiconfig is called: ``initramfscfg.conf`` and
> +   contains the variables::
> +
> +      TMPDIR="${TOPDIR}/tmp-initramfscfg"
> +      TCLIBC="musl"
> +
> +2. *Set additional initramfs variables on your main configuration:*
> +   Additionally, on your main configuration (``local.conf``) you need to set the
> +   variables::
> +
> +     INITRAMFS_MULTICONFIG = "initramfscfg"
> +     INITRAMFS_DEPLOY_DIR_IMAGE = "${TOPDIR}/tmp-initramfscfg/deploy/images/${MACHINE}"
> +
> +   The variables :term:`INITRAMFS_MULTICONFIG` and :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
> +   are used to create a multiconfig dependency from the kernel to the :term:`INITRAMFS_IMAGE`
> +   to be built coming from the ``initramfscfg`` multiconfig, and to let the
> +   buildsystem know where the :term:`INITRAMFS_IMAGE` will be located.
> +
> +   Building a system with such configuration will build the kernel using the
> +   main configuration but the ``do_bundle_initramfs`` task will grab the
> +   selected :term:`INITRAMFS_IMAGE` from :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
> +   instead, resulting in a musl based initramfs image bundled in the kernel
> +   but a glibc based main image.
> +
> +   The same is applicable to avoid inheriting :term:`DISTRO_FEATURES` on :term:`INITRAMFS_IMAGE`
> +   or to build a different :term:`DISTRO` for it such as ``poky-tiny``.
> +
> +
>  Building a Tiny System
>  ----------------------
>  
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d4f40b692..caa971393 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3554,6 +3554,13 @@ system and gives an overview of their function and contents.
>           even if the toolchain's binaries are strippable, there are other files
>           needed for the build that are not strippable.
>  
> +   :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
> +      Indicates the deploy directory used by ``do_bundle_initramfs`` where the
> +      :term:`INITRAMFS_IMAGE` will be fetched from.
> +      This variable is set by default to ``${DEPLOY_DIR_IMAGE}`` in the
> +      :ref:`kernel <ref-classes-kernel>` class and it's only meant to be changed
> +      when building an initramfs image from a separate multiconfig via :term:`INITRAMFS_MULTICONFIG`.
> +
>     :term:`INITRAMFS_FSTYPES`
>        Defines the format for the output image of an initial RAM filesystem
>        (initramfs), which is used during boot. Supported formats are the
> @@ -3673,6 +3680,16 @@ system and gives an overview of their function and contents.
>        See the :term:`MACHINE` variable for additional
>        information.
>  
> +   :term:`INITRAMFS_MULTICONFIG`
> +      Defines the multiconfig to create a multiconfig dependency to be used by the :ref:`kernel <ref-classes-kernel>` class.
> +
> +      This allows the kernel to bundle an :term:`INITRAMFS_IMAGE` coming from
> +      a separate multiconfig, this is meant to be used in addition to :term:`INITRAMFS_DEPLOY_DIR_IMAGE`.
> +
> +      For more information on how to bundle an initramfs image from a separate
> +      multiconfig see the ":ref:`dev-manual/common-tasks:Bundling an Initramfs Image From a Separate Multiconfig`"
> +      section in the Yocto Project Development Tasks Manual.
> +
>     :term:`INITRAMFS_NAME`
>        The base name of the initial RAM filesystem image. This variable is
>        set in the ``meta/classes/kernel-artifact-names.bbclass`` file as

Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

... and merged into the "master-next" branch of yocto-docs.


Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


