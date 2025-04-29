Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C98C369CB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 06:26:44 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.10641.1745908000961314084
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Apr 2025 23:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZbY+LFMv;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54998f865b8so5703538e87.3
        for <docs@lists.yoctoproject.org>; Mon, 28 Apr 2025 23:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907999; x=1746512799; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0KEDqoXnzwygIcY8teY0kzui1IdpRMWQSgl2zj3Xxls=;
        b=ZbY+LFMvydKOJg3tSixpzEao38O+ZW73pkBGMymvfV0xrWPZBM+R+mK2QBQa/88LyQ
         mQMJONvwHQx0dwxiTVA9XBqGJ7eW9pF/hXcz3YIbQiOEQ1ndyoi3kZam+pX/HAvoLBEi
         pRzDLdO/1HUT1jK9JRQVN+Sus2E3aXxWaiQfuYKNgPXPl+7w4gU54ABXIOQSJmzr+IS9
         XYTzP2/Lvn7wEnuZOq1eXVQCLo4fPNas6M8sDwtQOoTXV5d/9LTC+Fu/MZfSNuHDm0ju
         QFn4V2Jqj65M15BBQC3XyxGD+7iuPeA/tez2M9LwsaOx4QsfUVe2mdibln0yNjuHKDwz
         C0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907999; x=1746512799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KEDqoXnzwygIcY8teY0kzui1IdpRMWQSgl2zj3Xxls=;
        b=J64UXxXBXLcLHYdj2eNKcQ2vZWPhJx0VH8zcMK01ZNAk9VEFntvUNo7fb5CZ+zPG2u
         DdMPXwaUDmUJVcb5DtTu+oT2u6Weqn7vioQSGhVm5VrXWEqp+SV/JzHQHE5sl0fb/y1p
         zH97qS7quiJxaQfXlgAt84QOjwW1h9xPyVIku76PGKx7Gc7cBn+8Qu1g1aoVLnYO6KXO
         9xW4bJ2xvwtGXkn4tJRQ5y7e6luJaRopvJfqRq6a3jsbV18fv3uZbV5Sj5CepiJcLa3N
         q8YAcYvSFU5AsW33yDQ9mrfFxm9hjZJAzDiAWLU8C35dSo9Q+DPr46WtPFTMIyTQ1pzF
         27pw==
X-Gm-Message-State: AOJu0YyMp77wT/Yu4x89RtMHsXxla/KLxGjDiPv5vdbSIw0i8nNt/NEO
	rtLZ2/xRkV8j8F4+sNDOoV9dR+zPHG6QafT7Se2Y3JDKNzf8cFADxEoRoylkgY4=
X-Gm-Gg: ASbGnctemcvaiNx24qiTcg1KNkNQ306AC1GINEB7nJI3xbQmCXnfyJhPMK59WY2TtFS
	i1L+gvf5PPX9IBAW5PoB2lMnoEPONdJW6+CnQsID6CNZ9BP7fultsESSB/P9iSn85WYpL1mvrDI
	FmIGT8wZ9/EsOa4uMUkPj1/aNSKXI9ibSkJi5NnfOIlbgGgSN6da/ubwtx3GCsYJ88jbV2jG2ob
	YvKzrTeVYmBpTuErARybUAyPSofrFF4Fc82/TsD7qWsxGzJ/pnyX7T6N7yr6pxiRDxZy3jaQXcn
	UN/OI08tmrFjJKoEkkCoofkKiYSaC88h4z7Bj0+ubSu8lKMuE/QMOEu7X6T9ZEHTxgmAiQ==
X-Google-Smtp-Source: AGHT+IHTFRbiDoCMy8ydbFy/Wv2OTzLj8Jr3kYD3Fe/FL9z/XrH659iUD+Q6Qehh2OUc0Eyq/Pc+UA==
X-Received: by 2002:a05:6512:31d1:b0:549:8f4a:6baa with SMTP id 2adb3069b0e04-54e9e543cc4mr382663e87.27.1745907998980;
        Mon, 28 Apr 2025 23:26:38 -0700 (PDT)
Received: from nuoska (2001-14ba-48e-3a00--198.rev.dnainternet.fi. [2001:14ba:48e:3a00::198])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e956c1783sm812085e87.153.2025.04.28.23.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:26:38 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:26:36 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: gavrosc@yahoo.com
Cc: docs@lists.yoctoproject.org, Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
Message-ID: <aBBxHNAS4Jj1G0C_@nuoska>
References: <20250428154103.5792-1-gavrosc.ref@yahoo.com>
 <20250428154103.5792-1-gavrosc@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428154103.5792-1-gavrosc@yahoo.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Apr 2025 06:26:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6787

Hi,

On Mon, Apr 28, 2025 at 05:41:03PM +0200, Christos Gavros via lists.yoctoproject.org wrote:
> This variable specifies the maximum allowed size
> of the initramfs image in kilobytes.
> Fixes [YOCTO #15797]
> 
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> CC: Antonin Godard <antonin.godard@bootlin.com>
> CC: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
> v1->v2
> * any reference to bytes changed to kilobytes
> * description regarding default value is changed
> * add text to clarify that limit applies to the directory
> * add text to describe the calculation steps for directory size
> * add text to clarify the role of other variables in calculation steps
> ---
>  documentation/ref-manual/variables.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d17f81036..3ab9d72f3 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4708,6 +4708,27 @@ system and gives an overview of their function and contents.
>        See the :term:`MACHINE` variable for additional
>        information.
>  
> +   :term:`INITRAMFS_MAXSIZE`
> +      Defines the maximum allowed size of the initramfs image in kilobytes.
> +      The build will fail if the initramfs image size is larger than the value of this variable.
> +
> +      The initramfs image size undergoes several calculation steps before it is compared with ``INITRAMFS_MAXSIZE``.
> +      In the first step, the size of the directory pointed to by ``IMAGE_ROOTFS`` is calculated.
> +      In the second step, the result from the first step is multiplied by ``IMAGE_OVERHEAD_FACTOR``.
> +      In the third step, the result from the second step is compared with ``IMAGE_ROOTFS_SIZE``.
> +      The larger value of these is added to ``IMAGE_ROOTFS_EXTRA_SPACE``.
> +      In the fourth step, the result from the third step is checked for a decimal part. If it has one,
> +      it is rounded up to the next integer. If it does not, it is simply converted into an integer.
> +      In the fifth step, the ``IMAGE_ROOTFS_ALIGNMENT`` is added to the result from the fourth step
> +      and the value "-1" is subtracted.
> +      In the sixth step, the remainder of the division between the result from the fifth step
> +      and ``IMAGE_ROOTFS_ALIGNMENT`` is subtracted from the result of the fifth step.
> +      In this way, the result from the fourth step is rounded up to the nearest multiple of ``IMAGE_ROOTFS_ALIGNMENT``.
> +
> +      Thus, ``INITRAMFS_MAXSIZE`` is compared with the result of the above calculations
> +      and is independent of the final image type.
> +      A default value for ``INITRAMFS_MAXSIZE`` is set in ``meta/conf/bitbake.conf``.
> +
>     :term:`INITRAMFS_MULTICONFIG`
>        Defines the multiconfig to create a multiconfig dependency to be used by
>        the :ref:`ref-classes-kernel` class.

While these are all true, somewhere could be mentioned that this is the uncompressed
size of all files on the file system. Often initramfs'es are stored on disk and
flash storage as compressed cpio archives, e.g. cpio.gz, which are a lot smaller
than INITRAMFS_MAXSIZE. For example core-image-initramfs-boot on genericarm64
can have file system size reported in
buildhistory/images/genericarm64/glibc/core-image-initramfs-boot/image-info.txt

IMAGESIZE = 47432

47 Mb which is basically from "du -k" output on ext4 file system on build machine
but the cpio.gz file size only 14 Mb.

$ ls -l tmp/deploy/images/genericarm64/core-image-initramfs-boot-genericarm64*cpio.gz -h
-rw-r--r-- 2 mcfrisk mcfrisk 14M Apr 28 13:08 tmp/deploy/images/genericarm64/core-image-initramfs-boot-genericarm64-20250428130023.cpio.gz

The 47 Mb is used on target HW when the image is extracted to RAM but on
disk/flash storage only 14 Mb is used on UEFI system ESP partition or UKI
binary, or if the image is merged into kernel binary.

Depending on details, the size after cpio and compression may be important too,
or the INITRAMFS_MAXSIZE may be less important if there is plenty of storage and RAM
which is then freed when real target rootfs is booted into.

Then initramfs is usually used as read-only so the overhead things are mostly
unused and the image could be squeezed to remove all extra space...

Cheers,

-Mikko

