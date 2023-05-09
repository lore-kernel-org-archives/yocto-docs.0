Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC04C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 14:40:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.34387.1683643204888999209
 for <docs@lists.yoctoproject.org>;
 Tue, 09 May 2023 07:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JtUZzO08;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 66C806000F;
	Tue,  9 May 2023 14:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683643203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTUQbQQjwnQ3K7ulqPC/jeGu+a2gzAMandB+yMARhKE=;
	b=JtUZzO08v+rM1av4yYd00BBw0U4/V75vwWeeMHOEivFrjMGIUbEBSovgkZgmH6VO2EgWPb
	FIdohjUx1u0sOgvvGq9kcTKDXglwWZ1AGCcgIv4i4onSvA2EIzOz6vaMQeaSpzX1yFUHRZ
	VQjCdgHZmhNx4gyQnfWTmMPJKrrDZlYv0GXt5o4XYIe+SHeSVd7hOZ9SxnfHSGQmA97jqJ
	vjX2BZP4xkeNT5LHr7haQAYuo5OzSIdkVdsaFkgoROON2jQpYr+ldTkw6VIVokogSog1pi
	4kZxfXLziejP9yJGUtIQ5S5P6V/J6zXE9p0ajIRnVVKL+di46ZaqoyVLGDw2gg==
Message-ID: <7b976264-9fa1-dc23-679c-77016c57daf2@bootlin.com>
Date: Tue, 9 May 2023 16:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: document devicetree class variables
Content-Language: en-US
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
References: <20230509140358.89640-1-kubiznak@2n.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230509140358.89640-1-kubiznak@2n.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 May 2023 14:40:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3930

Hello Petr,

Many thanks for the patch!

On 09.05.23 at 16:03, Petr Kubizňák wrote:
> Document the newly added DT_FILES variable and closely related
> DT_FILES_PATH. Also add DT_PADDING_SIZE to the glossary.
>
> Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
> ---
>   documentation/ref-manual/classes.rst   |  9 +++++++--
>   documentation/ref-manual/variables.rst | 22 ++++++++++++++++++++++
>   2 files changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index ab1628401..94b6a3ebd 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -607,10 +607,15 @@ subdirectory. This avoids clashes with the :ref:`ref-classes-kernel-devicetree`
>   output. Additionally, the device trees are populated into the sysroot for
>   access via the sysroot from within other recipes.
>   
> +By default, all device tree sources located in :term:`DT_FILES_PATH` directory
> +are compiled. To select only particular sources, set :term:`DT_FILES` to
> +a space-separated list of files (relative to :term:`DT_FILES_PATH`). For
> +convenience, both ``.dts`` and ``.dtb`` extensions can be used.
> +
>   An extra padding is appended to non-overlay device trees binaries. This
>   can typically be used as extra space for adding extra properties at boot time.
> -The padding size can be modified by setting ``DT_PADDING_SIZE`` to the desired
> -size, in bytes.
> +The padding size can be modified by setting :term:`DT_PADDING_SIZE`
> +to the desired size, in bytes.
>   
>   See :oe_git:`devicetree.bbclass sources
>   </openembedded-core/tree/meta/classes-recipe/devicetree.bbclass>`
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 6ee65e178..4b69843d4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2247,6 +2247,28 @@ system and gives an overview of their function and contents.
>         For information on policies and on how to use this variable, see the
>         comments in the ``meta/classes-recipe/compress_doc.bbclass`` file.
>   
> +   :term:`DT_FILES`
> +      Space-separated list of device tree source files to compile using
> +      a recipe that inherits the :ref:`ref-classes-devicetree` class. These
> +      are relative to the :term:`DT_FILES_PATH`.
> +
> +      For convenience, both ``.dts`` and ``.dtb`` extensions can be used.
> +
> +      Use an empty string (default) to build all device tree sources within
> +      the :term:`DT_FILES_PATH` directory.
> +
> +   :term:`DT_FILES_PATH`
> +      When compiling out-of-tree device tree sources using a recipe that
> +      inherits the :ref:`ref-classes-devicetree` class, this variable specifies
> +      the path to the directory containing dts files to build.
> +
> +      Defaults to the :term:`S` directory.
> +
> +   :term:`DT_PADDING_SIZE`
> +      When inheriting the :ref:`ref-classes-devicetree` class, this variable
> +      specifies the size of padding appended to the device tree blob, used as
> +      extra space typically for additional properties during boot.
> +
>      :term:`EFI_PROVIDER`
>         When building bootable images (i.e. where ``hddimg``, ``iso``, or
>         ``wic.vmdk`` is in :term:`IMAGE_FSTYPES`), the


Everything looks good, thanks again!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next" (not too late to take further comments 
into account, though).

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


