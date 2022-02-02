Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC22EC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 10:12:21 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.61925.1643796740858102763
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 02:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RZAFCtwX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7CBA0E0004;
	Wed,  2 Feb 2022 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1643796738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ss/Bm07H2N/4MrrJbDa6TSMu52kBndiEJsJq/P+3g7A=;
	b=RZAFCtwXlWW/h/MXlPF2G/fW0BEhppaMxdqbbqKCYgqFc2p0+X0UVwofrdhcaoXLbP1jLo
	+urss0E+zUXOJcoLlVwb1gUzJ5RnIn1XG6cq0Q7/SGIYrYixhB3WQ+EkMPggRaK2JkZr1Y
	sJZthz9YIKoduqZYzcz+YKtwsBpdM96yb30irHgEB6Mv5tnPFMw+6RUU5Q8ah51paPOpXt
	VlmprjahCo0rCSblv4AGUW/F35wacFYWEKBZiZPOl62InWwv2V9bBmc+BPYpmYpv9jWg3k
	uFt5j1NqPxivHp0icKnSbTzlrbg3wLkXKDpiHycIAKzSweD55CSn+SwcrzOY7A==
Message-ID: <21e39886-fe27-f37b-bdb6-fd59d61a0836@bootlin.com>
Date: Wed, 2 Feb 2022 11:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] documentation: Add multiconfig initramfs
 configuration:
Content-Language: en-US
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
 docs@lists.yoctoproject.org
References: <20220130013135.231200-1-alhe@linux.microsoft.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220130013135.231200-1-alhe@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Feb 2022 10:12:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2459

Hi Alejandro

Many thanks for this very nice contribution to our documentation!

On 1/30/22 02:31, Alejandro Hernandez Samaniego wrote:
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
> index ed6b1446f..f19b55395 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -3919,6 +3919,48 @@ Follow these steps to create an initramfs image:
>     :term:`INITRAMFS_IMAGE_BUNDLE`
>     variable described earlier.
>  
> +Bundling an initramfs Image from a separate multiconfig
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Actually, a rule in English seems to capitalize important words in a
title. According to https://titlecaseconverter.com/, this should be:
"BundlinganInitramfsImageFromaSeparateMulticonfig"

> +
> +There may be a case where we want to build an initramfs image which does not
> +inherit the same distro policy as our main image, for example, we may want
> +our main image to use ``TCLIBC="glibc"``, but to use ``TCLIBC="musl"`` in our initramfs
> +image to keep a smaller footprint. However, by performing the steps mentioned
> +above the initramfs image will inherit ``TCLIBC="glibc"`` without us being able
> +to override it.


"without allowing us to override it"?
Just proposing something that sounds more natural to me.

> +
> +To achieve this, you need to perform some additional steps:
> +
> +1. *Create a multiconfig for your initramfs image:* You can perform the steps
> +   on ":ref:`dev-manual/common-tasks:building images for multiple targets using multiple configurations`" to create a separate multiconfig, for the sake of simplicity lets

s/lets/let's/

I'd also suggest to break the sentence in two: "... multiconfig. For the
sake..."

> +   assume such multiconfig is called: ``initramfscfg.conf`` and contains the
> +   variables::
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


Would it be possible to replace "${TOPDIR}/tmp-initramfscfg" by "${TMPDIR}"?

> +
> +   The variables :term:`INITRAMFS_MULTICONFIG` and :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
> +   are used to create a multiconfig dependency from the kernel to the :term:`INITRAMFS_IMAGE`
> +   to be built coming from the ``initramfscfg`` multiconfig, and to let the
> +   buildsystem know where the :term:`INITRAMFS_IMAGE` will be located.
> +
> +   Building a system with such configuration will build the kernel using the
> +   main configuration but the task ``do_bundle_initramfs`` will grab the


"but the ``do_bundle_initramfs`` task"?
> +   selected :term:`INITRAMFS_IMAGE` from :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
> +   instead, resulting in a musl based initramfs image bundled in the kernel
> +   but a glibc based main image.
> +
> +   The same is applicable to avoid inheriting :term:`DISTRO_FEATURES` on :term:`INITRAMFS_IMAGE`
> +   or build a different :term:`DISTRO` for it such as ``poky-tiny``.


"or to build"

> +
> +
>  Building a Tiny System
>  ----------------------
>  
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index b0621168a..9c1da3b5e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3556,6 +3556,13 @@ system and gives an overview of their function and contents.
>           even if the toolchain's binaries are strippable, there are other files
>           needed for the build that are not strippable.
>  
> +   :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
> +      Indicates the deploy directory used by ``do_bundle_initramfs`` where the
> +      :term:`INITRAMFS_IMAGE` will be fetched from.
> +      This variable is set by default to ``${DEPLOY_DIR_IMAGE}`` in the
> +      :ref:`kernel <ref-classes-kernel>` class and its only meant to be changed


s/its/is/

> +      when building an initramfs image from a separate multiconfig via :term:`INITRAMFS_MULTICONFIG`.
> +
>     :term:`INITRAMFS_FSTYPES`
>        Defines the format for the output image of an initial RAM filesystem
>        (initramfs), which is used during boot. Supported formats are the
> @@ -3675,6 +3682,16 @@ system and gives an overview of their function and contents.
>        See the :term:`MACHINE` variable for additional
>        information.
>  
> +   :term:`INITRAMFS_MULTICONFIG`
> +      Defines the multiconfig to create a multiconfig dependency to by the :ref:`kernel <ref-classes-kernel>` class.

s/to by the/to be used by the/ ?
> +
> +      This allows the kernel to bundle an :term:`INITRAMFS_IMAGE` coming from
> +      a separate multiconfig, this is meant to be used in addition to :term:`INITRAMFS_DEPLOY_DIR_IMAGE`.
> +
> +      For more information on how to bundle an initramfs image from a separate
> +      multiconfig see ":ref:`dev-manual/common-tasks:bundling an initramfs image from a separate multiconfig`"
> +      section in the Yocto Project Development Tasks Manual.


Add "the" before ":ref:" and capitalize the section title there too.

Thanks again, and thanks in advance for these updates!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


