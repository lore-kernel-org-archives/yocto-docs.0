Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA81CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 13:40:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web01.22323.1761831648895875754
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 06:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rJ1A2yPD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EB46D4E413F9
	for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 13:40:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1C226068C;
	Thu, 30 Oct 2025 13:40:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 657FD11808A75;
	Thu, 30 Oct 2025 14:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761831646; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jh8lmHm0tKeDyp4d4WfygGc5IiDW7WhOTCiJeF6UwKE=;
	b=rJ1A2yPD3ONMF5zHBSEZjREoumjFGK+PrTZiU+DL3QekNB5SEouGbjGv4701IxZrmUANon
	O773vhmUt80OlBkqRQMM8nsg0HSOmuOx7UaGSM6LT0PxrfVwzU0efK8c/3rUYt9MQ2ZPo3
	DUey0+QIqdCSTxFUgQMhFyEvoTFP3iEC4I4S01ck9svO3XQ/SMZ3jCj4uLpSXB/tMqrOTg
	7N8QTzje3Ui/+xXx/AogT8ccB+KDYU3JEtcLM+xFfjWtFIxrsq1xrwUtrFFP0hOfUu+9up
	5yWdOkshXMnagIv3UvJ+8t4Rb9FC1YNNeWDLYSc/uLAqHSChY5r0soFOrvhr5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 14:40:44 +0100
Message-Id: <DDVP6ZXVWUM1.2ROQPCUL4S66V@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: cover new
 FIT_KERNEL variables
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
References: <20251029213029.2480507-1-adrian.freihofer@siemens.com>
In-Reply-To: <20251029213029.2480507-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 13:40:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7918

Hi,

On Wed Oct 29, 2025 at 10:30 PM CET, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Document the new variables:
> - FIT_KERNEL_SIGN_ENABLE
> - FIT_KERNEL_SIGN_KEYNAME
> - FIT_KERNEL_SIGN_KEYDIR
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 67 ++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 591c03028ce..86117dd3a93 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3414,6 +3414,47 @@ system and gives an overview of their function and=
 contents.
>        set :term:`FIT_KERNEL_COMP_ALG` to "lzo", you may want to set this
>        variable to ".lzo".
> =20
> +   :term:`FIT_KERNEL_SIGN_ENABLE`
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` c=
lass
> +      to enable or disable signing of the FIT image.
> +      The default value of :term:`FIT_KERNEL_SIGN_ENABLE` is the value o=
f
> +      :term:`UBOOT_SIGN_ENABLE`, which means that when U-Boot FIT image =
signing
> +      is enabled, the FIT image will also be signed at build-time and U-=
Boot
> +      will verify the FIT image signature at run-time.
> +
> +      If this variable is set to "1", the FIT image will be signed using=
 the
> +      key specified by :term:`FIT_KERNEL_SIGN_KEYNAME` from the director=
y
> +      :term:`FIT_KERNEL_SIGN_KEYDIR`.
> +
> +      If this variable is overridden, the :term:`FIT_KERNEL_SIGN_KEYDIR`=
 and
> +      :term:`FIT_KERNEL_SIGN_KEYNAME` variables should also be set appro=
priately.
> +
> +   :term:`FIT_KERNEL_SIGN_KEYDIR`
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` c=
lass.
> +      The default value of :term:`FIT_KERNEL_SIGN_KEYDIR` is the value o=
f
> +      :term:`UBOOT_SIGN_KEYDIR`, which means the kernel is signed at bui=
ld-time
> +      with a private key found in :term:`UBOOT_SIGN_KEYDIR` and U-Boot g=
ets the
> +      public key from the same directory injected into its DTB for the
> +      on-target verification of the FIT image.
> +
> +      If this variable is overridden, the :term:`FIT_KERNEL_SIGN_ENABLE`=
 and
> +      :term:`FIT_KERNEL_SIGN_KEYNAME` variables should also be set appro=
priately.
> +
> +   :term:`FIT_KERNEL_SIGN_KEYNAME`
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` c=
lass.
> +      The default value of :term:`FIT_KERNEL_SIGN_KEYNAME` is the value =
of
> +      :term:`UBOOT_SIGN_KEYNAME`, which means the kernel is signed at
> +      build-time with a private key named according to
> +      :term:`FIT_KERNEL_SIGN_KEYDIR` and U-Boot gets the public key with

"named according to :term:`FIT_KERNEL_SIGN_KEYDIR`"

Not sure I understand. You mean according to UBOOT_SIGN_KEYNAME? It that's =
it I
can make the change locally, let me know.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


