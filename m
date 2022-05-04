Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADDCC433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 17:48:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.509.1651686487206979021
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 10:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hz9mNmAA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D0059FF803;
	Wed,  4 May 2022 17:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651686485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uKZkdDOnOl01kcfdWBf8AG0GDDle0aMPbX7JqzzngSE=;
	b=Hz9mNmAAImrO3cfim3TdK1aP6UBWMQpTHxltDtvEdaJGORkk1xUN6gnqHXXuhs8qdKtnwc
	PyXtGFAihX8dFrCkxph1dYxBJqGxRBiYkI+WKwk90kepUihDuW0N4E9V+A+zYtzjfFi7qa
	ap5PTgSmex6nXBI7ISaeyJ7NN68nDzdIBiA/A01E5XrLisEVGXAV532VViQbJmBSV1loJk
	faCj7DP0eCnsO6II/hakDwdtPooiKQxKS96EOwVCJBO2onlWzL4nZI5T6+ljNummpEK5OA
	JEoin2ckDKg81yxy0ZlEDuyAts2htY+529+Eoe+mQC5inScGqF5R+4EXoU0jcA==
Message-ID: <a1557d16-cbef-a06d-3490-77f551416341@bootlin.com>
Date: Wed, 4 May 2022 19:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Cc: rwmacleod@gmail.com, john.kaldas.enpj@gmail.com,
 umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com
Subject: Re: [docs][PATCH V4] Improvements for gdbserver configuration
Content-Language: en-US
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>, docs@lists.yoctoproject.org
References: <20220504173421.41167-1-sundeep.kokkonda@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220504173421.41167-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 17:48:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2919

Hi Sundeep,

On 5/4/22 19:34, Sundeep KOKKONDA wrote:
> [Yocto #13722]
> The Yocto bug reports a few improvements in the gdbserver configuration which improves the configuration of gdb more easier for novice users.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index b228c75aa..c9fc585a0 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10177,10 +10177,9 @@ debugger.
>  
>  2. *Configure the system to include gdbserver in the target filesystem:*
>  
> -   Make the following addition in either your ``local.conf`` file or in
> -   an image recipe::
> +   Make the following addition in your ``local.conf`` file::
>  
> -      IMAGE_INSTALL:append = " gdbserver"
> +      EXTRA_IMAGE_FEATURES:append = " tools-debug"
>  
>     The change makes
>     sure the ``gdbserver`` package is included.
> @@ -10227,14 +10226,14 @@ debugger.
>  
>        $ mkdir debugfs
>        $ cd debugfs
> -      $ tar xvfj build-dir/tmp-glibc/deploy/images/machine/image.rootfs.tar.bz2
> -      $ tar xvfj build-dir/tmp-glibc/deploy/images/machine/image-dbg.rootfs.tar.bz2
> +      $ tar xvfj build-dir/tmp/deploy/images/machine/image.rootfs.tar.bz2
> +      $ tar xvfj build-dir/tmp/deploy/images/machine/image-dbg.rootfs.tar.bz2
>  
>  5. *Set up GDB:*
>  
>     Install the SDK (if you built one) and then source the correct
>     environment file. Sourcing the environment file puts the SDK in your
> -   ``PATH`` environment variable.
> +   ``PATH`` environment variable and sets ``$GDB`` to the SDK's debugger.
>  
>     If you are using the build system, Gdb is located in
>     `build-dir`\ ``/tmp/sysroots/``\ `host`\ ``/usr/bin/``\ `architecture`\ ``/``\ `architecture`\ ``-gdb``

Everything looks good now.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next". This should be in "master" in a few days.

Many thanks for your patience!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


