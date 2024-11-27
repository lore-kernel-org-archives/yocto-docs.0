Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD2CD609D9
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 11:20:49 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.69934.1732706444461691720
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 03:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=l9BKW32U;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53de880c77eso2469781e87.1
        for <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 03:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732706443; x=1733311243; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CTCJhUsgHxqWndcN2DySWJoG8eNvGHjfiAnPhybRi1s=;
        b=l9BKW32UDEMAco0R2n8BUYTBndS40j8/c9SJe6jsamfmG2YJJ0b6WbrZ4dMsvm8jOe
         94QJJx6/GZGtAeOBFjpSyCSlK9XjMYTru2Urdez2koRdxafWUM9ZgbRF3WE/4SWxiiur
         FMtRpgK9QODkGMmdumhFaOt1u4RYXza4O8sk1J1eKaZURxCUwuyTZGf+4k1yYpv0/IvB
         7D/1/0/SSjf9gxNNIQY7NcnFDCxk50v/az9cbHFztBQkraEGsRaRcN1hoTwliGSUc+XE
         ZzAO89Q/UpmL+/XbPFhzEGMwPOki69ljrgRd1KIuOETcQpUWE/coPedjbZc//MrqfOjK
         hk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706443; x=1733311243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTCJhUsgHxqWndcN2DySWJoG8eNvGHjfiAnPhybRi1s=;
        b=V5DS890oJB8A7a9ahZh4wANBKoF4K/2+EMGr/p8sUdh/wFhwyGjicG2vRNVbr4Apqz
         aXiQISycfhIDy7hI72OcGUDh7z8qewJOkXgsuTfZL7xbp5afEIkvZuUC8CWFRyG9p7G7
         k3+suKzZbVGG/mS9byRnkdzHwuuwmpZa5ZVhnoeTXMg2WDh/wkcgf232Zxj29Ypf86OM
         4TkFhF8l3hq/DNNAzhC1Fap5ZtwNS8lOaDdyo/YkId4AfNhMdEKYhY33kCVg+KFsOoQz
         KFt7aA2gOY35HCgzlb8nci0qHyR2i4nalWhkY9H4uW63qs5Q2x3cltWlor81F1nGfbPp
         1bNg==
X-Gm-Message-State: AOJu0YxfXX+9U9e73+50tIbvh0HBw06zGyjGvF3zWKQ56Zx9rocPvzUA
	lHxoHfen83F09SYWLJAgSghHlmpkwa9nIAqcpqQvJMZEWAYYJxF1RgsJu2aR0a4=
X-Gm-Gg: ASbGncthyTyjoe16FvZJef9B2pqqle0igFogVZivlXTU6/zmWnr421W2npbKUSGkL6F
	4V0dPGh6cXrnWtcAOd78avx8oDLc46TgbWv4ANrRhtj8bzoGRIgvXtOv81JDj8rb2kNxGAbzKUg
	7L1Djp2ig5YcoRgtC7ztdYZQLJayun4v8W88ozlzjde90mV1yhxh3vcT89nYVKHLm9arIzmVLzZ
	+PolMMfC7jZb+GS7aSLL7IiK3MwMa4dnerEKzXfoQj/Zr/fvo38NHvZkd+hz8eWYWHAL/Xp0sqS
	B0lNAl3HZ2Ggdh9tpA==
X-Google-Smtp-Source: AGHT+IFp0Dx2fT5wWaWrK7/mDgWwtgNi1ckcc6A2wNCtvk60YiIEcSMnSO/S6FU+0sE0AVZfiL2fhA==
X-Received: by 2002:a05:6512:12cb:b0:53d:d417:c08e with SMTP id 2adb3069b0e04-53df00aa017mr1463264e87.8.1732706442488;
        Wed, 27 Nov 2024 03:20:42 -0800 (PST)
Received: from nuoska (82-209-143-214.cust.bredband2.com. [82.209.143.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd244595esm2282051e87.2.2024.11.27.03.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:20:40 -0800 (PST)
Date: Wed, 27 Nov 2024 13:20:38 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v3] classes.rst variables.rst: add documentation
 for uki.bbclass
Message-ID: <Z0cAhu22sQhs5p6L@nuoska>
References: <20241126110247.307766-1-mikko.rapeli@linaro.org>
 <D5WW10P1OC2V.DDSW38USN1F@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D5WW10P1OC2V.DDSW38USN1F@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 11:20:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5824

Hi,

On Wed, Nov 27, 2024 at 11:26:56AM +0100, Antonin Godard wrote:
> Hi Mikko,
> 
> Thanks for taking the time to document your class. In general it looks very good
> to me.
> 
> A nitpick from the documentation/standards.md of the doc is that we prefer
> wrapping the lines to 80 chars, as is done in the rest of the document. Could
> you do this?

Done

> Otherwise my comments are below.
> 
> On Tue Nov 26, 2024 at 12:02 PM CET, Mikko Rapeli via lists.yoctoproject.org wrote:
> > Documentation for the new class.
> >
> > [YOCTO #15650]
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  documentation/ref-manual/classes.rst   | 34 ++++++++++++++++++++++++++
> >  documentation/ref-manual/variables.rst | 32 ++++++++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> >
> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> > index b92f4e4f20..d2b2469552 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -3345,6 +3345,40 @@ and the `signature process
> >  See also the description of :ref:`ref-classes-kernel-fitimage` class, which this class
> >  imitates.
> >  
> > +.. _ref-classes-uki:
> > +
> > +``uki``
> > +=======
> > +
> > +The :ref:`ref-classes-uki` class provides support for `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__
> > +format. UKIs combine kernel, :term:`Initramfs`, signatures, metadata etc to a single UEFI firmware
> > +compatible binary. The class is intended to be inherited by rootfs image recipes. The build configuration
> > +should also use an initramfs, ``systemd-boot`` as boot menu provider and have UEFI support on target
> > +HW. Using ``systemd`` as init is recommended. Image builds should create an ESP partition
> 
> s/HW/hardware/

Done

> > +for UEFI firmware and copy ``systemd-boot`` and UKI files there. Sample configuration for Wic
> > +images is provided in :oe_git:`scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in <openembedded-core/tree/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in>`.
> > +UKIs are generated using ``systemd`` reference implementation `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__.
> > +This class uses a number of variables but tries to find sensible defaults for them.
> > +
> > +The variables used by this class are:
> > +
> > +-  :term:`EFI_ARCH`: architecture name within EFI standard, set in :oe_git:`meta/conf/image-uefi.conf <openembedded-core/tree/meta/conf/image-uefi.conf>`
> 
> We are missing `EFI_ARCH` from variables.rst, so this :term: won't work. Is that
> something you could add to variables.rst? Since you briefly document it here it
> should be a small addition.

Done

> > +-  :term:`IMAGE_EFI_BOOT_FILES`: files to install to EFI boot partition created by ``bootimg-efi`` Wic tool
> 
> s/by ``bootimg-efi``/by the ``bootimg-efi``/
> 
> It is a plugin rather than a tool, I think? s/Wic tool/Wic plugin/

Done

> > +-  :term:`INITRAMFS_IMAGE`: initramfs recipe name
> > +-  :term:`INITRD_ARCHIVE`: initramfs image file name
> 
> Same for this variable, :term: doesn't work here. Since this variable is local
> to this file, I'm not sure it should be part of variables.rst, unless overriding
> it makes sense (I see ?= is used for it).

Done, removed. It can be overwritten if needed but is internal to the file.

> > +-  :term:`KERNEL_DEVICETREE`: optional devicetree files to embed into UKI
> > +-  :term:`UKIFY_CMD`: `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build UKI image
> 
> s/build/build the/

Done

> > +-  :term:`UKI_CMDLINE`: kernel command line to use with UKI
> > +-  :term:`UKI_CONFIG_FILE`: optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__
> > +-  :term:`UKI_FILENAME`: output file name for UKI image
> 
> s/for/for the/

Done

> > +-  :term:`UKI_KERNEL_FILENAME`: kernel image file name
> > +-  :term:`UKI_SB_CERT`: optional UEFI secureboot certificate mathing the private key
> 
> s/mathing/matching/

Done

> > +-  :term:`UKI_SB_KEY`: optional UEFI secureboot private key to sign UKI with
> > +
> > +For examples on how to use this class see oeqa selftest :oe_git:`meta/lib/oeqa/selftest/cases/uki.py <openembedded-core/tree/meta/lib/oeqa/selftest/cases/uki.py>`.
> > +Also an oeqa runtime test ``uki`` is provided which verifies that the target system
> 
> Add a link to meta/lib/oeqa/runtime/cases/uki.py, I guess that's the one?

Done

> > +booted the same UKI binary as was set at buildtime via :term:`UKI_FILENAME`.
> > +
> >  .. _ref-classes-uninative:
> >  
> >  ``uninative``
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index ec4d7ab73f..65fea43a1e 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -9846,6 +9846,38 @@ system and gives an overview of their function and contents.
> >        passes and uses "all" for the target during the U-Boot building
> >        process.
> >  
> > +   :term:`UKIFY_CMD`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build
> > +      `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> > +      Defaults to ``ukify build``.
> > +
> > +   :term:`UKI_CMDLINE`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      the kernel command line to use when booting the `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> > +      Defaults to ``rootwait root=LABEL=root console=${KERNEL_CONSOLE}``.
> > +
> > +   :term:`UKI_CONFIG_FILE`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      an optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command.
> 
> s/for/for the/

Done

> > +   :term:`UKI_FILENAME`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      the output file name for generated `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> 
> s/for/for the/

Done

> > +      Defaults to ``uki.efi``.
> > +
> > +   :term:`UKI_KERNEL_FILENAME`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      the kernel image file name to use as input. Defaults to :term:`KERNEL_IMAGETYPE`.
> > +
> > +   :term:`UKI_SB_CERT`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      optional UEFI secureboot certificate matching the private key in :term:`UKI_SB_KEY`.
> > +
> > +   :term:`UKI_SB_KEY`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      optional UEFI secureboot private key to sign `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> 
> s/sign/sign the/

Done

Will send a v4.

Cheers,

-Mikko

