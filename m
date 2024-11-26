Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459F4D59D9C
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 11:00:32 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.43346.1732618822430967859
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 03:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DVBFJyVr;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso62650291fa.0
        for <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 03:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732618820; x=1733223620; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ATxbsL5TPiF3ngwW/hiZl+HKNoJVxEcuPrOzP/UClg=;
        b=DVBFJyVrb9UzdnGJ5CMETjDZf2ijSROe2PlSKlKbjLVMMBMk7HiGn/DABH/kRItQFW
         5r6pMQh97JvBb6VAMNGdMPRp2YAuAZIky7G571dMfOQMJsWFKb4agak/lDMeKq+gtIUG
         H8n5OBw54bDj/1TUZd4D7BHL/lia7ft6pXmii2SaWfNtCLES4YCsZ6WtKdkEsYdV/t8+
         BGeh7UTjV1hKML+5nvWK8ZfG2hz7q4C61sJLlay/KpxK2U7o1KVs7QwsthJOYgKJsI+T
         HJkWG783TfSH1pLod0CoktbBZM06JeHJUCBgZvIZ7GsO2OKm88+SHOowRpeceF6fUYwg
         NgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732618820; x=1733223620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ATxbsL5TPiF3ngwW/hiZl+HKNoJVxEcuPrOzP/UClg=;
        b=nJyJEsL0upk3LnuAaZnrJ8aCV3mzMFn9sDQiJuJIdPGuQUk/xQMRpr6KA58RGjjJo2
         kG6w9HPe4zSavqpj0dPMvdUiHG8scrA6cBmJxju6PWPuD45FiYN7sokNx0cy1MMPZDbl
         aRwT4BJ9aWEwoymlRVf5fbdAhE//ZmohkeMvcpPSiQrKK6X4bvzC5k0ESHE6ziWBVT3N
         2j4FnTWbvW1hKaDzL4M/Agmqpr1ZwIPPZntaYCe0Ko+FEQV0r+zUzqc2oWJka3RFp6mB
         iGDuX/T0oz6tc8S8qD5RDaDd/uPE7uMfJH2r3YqN1LRiP/1ij8TJquxJTOa0IdqtMEM6
         sPCg==
X-Gm-Message-State: AOJu0Yxxw08I+qIQiRlzTlxFaUQtU3VLLDPSTSOQwdsAtav/aKmHjJxv
	no4leEvgxPGVVCrn9arlRVcsuWCWGYIfv65YrB46r6wnAzoBDQawQauqZPhIjwE=
X-Gm-Gg: ASbGncua2cldpguQMRMGO/zPSPmVlfgivMIZ0Pyeq9uJvNd0M4YDPBPzjmIaRYh9X3k
	5WnPjcLrqpfqnAPFulq2BICzljAtsv4j0z4T0yjR+R16wV0ikyifDYPBasodmckVDoSWhKy3CrI
	x7YdOtJ/3PgSeuUs1ZPKO/OoxlflpbWaUOX4eVi/NcnN/zuVRWSbD6MJaIB22vEgJckKRYYk0R/
	fbRo7E5YULQQMta0b6WAtKqIlgIznCOvXukGzQHfV34wLVETYIjsKfQjAZGRayDIvVzp5As+Q2n
	9WDr1RRIpc2WAkRvUQ==
X-Google-Smtp-Source: AGHT+IFiLKPDi2qZGqJysli+/znihpvhUWLo1vcZgKmw3PsLHAqQESIc9VK0owr0WxyUKD2Q027I0g==
X-Received: by 2002:a2e:bccd:0:b0:2ff:9494:969b with SMTP id 38308e7fff4ca-2ffa6d20bebmr80589251fa.0.1732618820457;
        Tue, 26 Nov 2024 03:00:20 -0800 (PST)
Received: from nuoska (82-209-143-214.cust.bredband2.com. [82.209.143.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffccb9be93sm2216061fa.69.2024.11.26.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 03:00:18 -0800 (PST)
Date: Tue, 26 Nov 2024 13:00:15 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] classes.rst: add documentation for uki.bbclass
Message-ID: <Z0WqP1uub8mvHRbV@nuoska>
References: <20241125153415.282847-1-mikko.rapeli@linaro.org>
 <010f00b9-36d1-48be-abfd-6f520909c5e9@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010f00b9-36d1-48be-abfd-6f520909c5e9@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 11:00:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5817

Hi,

On Tue, Nov 26, 2024 at 11:12:20AM +0100, Quentin Schulz wrote:
> Hi Mikko,
> 
> On 11/25/24 4:34 PM, Mikko Rapeli via lists.yoctoproject.org wrote:
> > Documentation for the new class.
> > 
> > [YOCTO #15650]
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >   documentation/ref-manual/classes.rst | 34 ++++++++++++++++++++++++++++
> >   1 file changed, 34 insertions(+)
> > 
> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> > index b92f4e4f20..901d455f09 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -3345,6 +3345,40 @@ and the `signature process
> >   See also the description of :ref:`ref-classes-kernel-fitimage` class, which this class
> >   imitates.
> > +.. _ref-classes-uki:
> > +
> > +``uki``
> > +=======
> > +
> > +The :ref:`ref-classes-uki` class provides support for `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__
> > +format. UKIs combine kernel, initramfs, signatures, metadata etc to a single UEFI firmware
> 
> s/initramfs/:term:`Initramfs`/

Done

> > +compatible binary. The class is intended to be inherited by rootfs image recipes. The build configuration
> > +should also use an initramfs, systemd-boot as boot menu provider and have UEFI support on target
> 
> s/systemd-boot/:ref:`ref-classes-systemd-boot`/
> 
> or
> 
> s/systemd-boot/``systemd-boot``/
> as we're talking about the binary and not the class.

Done

> > +HW. Using systemd as init is recommended. Image builds should create an ESP partition
> 
> s/systemd/``systemd``/

Done
 
> > +for UEFI firmware and copy systemd-boot and UKI files there. Sample configuration for Wic
> > +images is provided in ``scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in``.
> 
> Provide a link to it, c.f.
> 
> :oe_git:`scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
> <openembedded-core/tree/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in>`
> 
> maybe?

Done

> > +UKIs are generated using systemd reference implementation `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__.
> 
> s/systemd/``systemd``/

Done

> > +This class uses a number of variables but tries to find sensible defaults for them.
> > +
> > +The variables used by this class are:
> > +
> > +-  :term:`INITRAMFS_IMAGE`: initramfs recipe name
> > +-  :term:`INITRD_ARCHIVE`: initramfs image file name
> > +-  :term:`UKIFY_CMD`: `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build UKI image
> > +-  :term:`UKI_CONFIG_FILE`: optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__
> > +-  :term:`UKI_FILENAME`: output file name for UKI image
> > +-  :term:`UKI_KERNEL_FILENAME`: kernel image file name
> > +-  :term:`UKI_CMDLINE`: kernel command line to use with UKI
> > +-  :term:`UKI_SB_KEY`: optional UEFI secureboot private key to sign UKI with
> > +-  :term:`UKI_SB_CERT`: optional UEFI secureboot certificate mathing the private key
> 
> You cannot use those here as they aren't defined yet. You have a circular
> dependency between this patch defining the class and the other one defining
> the variables, just merge both into one to get rid of it.

Done

> > +-  :term:`IMAGE_EFI_BOOT_FILES`: files to install to EFI boot partition created by ``bootimg-efi`` Wic tool
> > +-  :term:`EFI_ARCH`: architecture name within EFI standard, set in ``meta/conf/image-uefi.conf``
> 
> Provide a link to the file?

Done

> > +-  :term:`KERNEL_DEVICETREE`: optional devicetree files to embed into UKI
> > +
> > +For examples how to use this class see oeqa selftest ``meta/lib/oeqa/selftest/cases/uki.py``.
> 
> Provide a link to the uki.py.
> 
> s/For examples/For examples on/ ?

Done

Will send a v3.

Cheers,

-Mikko

