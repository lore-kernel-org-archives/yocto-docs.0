Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA642D609DA
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 11:21:29 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.69700.1732706483368620617
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 03:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uBJda84i;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53dd2fdcebcso6620712e87.0
        for <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 03:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732706481; x=1733311281; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dMpS2ehl4aoC/i21P4m3jkG306atNH2BbFR4WT7VezE=;
        b=uBJda84iKnNsbUAA5ZDjciPtRHstryEkKDozkKqEHw5TUlYh8uEEAGcriFajJn9FB/
         5zvkXUXuvOePz0j9TnT+tmfOnkTpfWS9Z7sWg9ABEPLzej3bcq6PxOO9wvpG7ZhWJhST
         rhW/1QnEGxiDsOf1dmTsTkufqEswboZem3YewfGQyMVdNy4swbEQcgNGD9iNUJg3OMly
         rqGs5lt54R+57A9+ol/re9vZGy9BnNFjT02ufUR6dK8HaBcsPL477G9o0LTkVxD01HSx
         HWi7QP2jSgTgJLArkbv3nRdJFx4nLi/8A7WcQRz/f6Xjysy+wim4vxa1LUb5/uSPjfLu
         bizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706481; x=1733311281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMpS2ehl4aoC/i21P4m3jkG306atNH2BbFR4WT7VezE=;
        b=q3SpFco6pJuKlpG/UMS190uAfgbdGTaNy+aa+vjmWJC3hTvTUv6UB43FMnMYw/LUCo
         osS1baF85YV8lee3uloOe0J/ZCdZrDJ5LtiKBRCl2gYEd5NWeD8DKcWpt7K57A7V8i6P
         yZz4r+dPf6FH8qxYtkTHVJJVs5iTwhQ7iQqsh4nyDXifwAG9VQjoYa2SsmyGgn1D8/Y0
         4InJ8wfMuFOk432vD0mw24DWgajN2blHO8ix8dSkcrH0pgOdgEoN180PCCNtMYh6CorR
         nJWwHhL2JhkzaI5g+MqE2RBRfULR0xR5/MYnJfeWprXvasAvH1d4N7n5ZsTTwGfkcd9O
         ue0Q==
X-Gm-Message-State: AOJu0YxfWXcc9FBVEtEjnz319Oj8aeIFfLsvuXRZvf7WpmbFrb+mXeWu
	cBmrZJGhz6YbKLNJPO8yIYC2NZuYG7UhipB42HpHZGubWiv+Z4/yCkKPRWLGMTnNRjKHyvO051A
	G
X-Gm-Gg: ASbGnctWQj3r2aRJfi/JmrlVYoVwOPfUjTMT1pfAsKvs4CpDFBo3+9nbFZ5CsidJr/V
	W9E22vee/c7wRj5nMlLoHz499yb8WGfhZJrVRTkCJHPdiRGc/L5OgzyyIWzhdjmURNC18U2/NFg
	47c2nm7P7zaKgB8VeoYkMCRK4u4c/gm2I5I8D1Krg01DJVxnsptSyYmHjvODRrwInePW1Vk7fXD
	YFsW4bQb+XKtO+pK0/UhSaTlT80ePu3mSJtavY3QpikzQE6qNuDs3AicG6YYyd3vY+Vs/fJMgpl
	PwDQcB5l/iFRsGftizsTQGQ/nC3aco8hsXluWA==
X-Google-Smtp-Source: AGHT+IH3g3oCJKcF++ulyPs4GZMuUYJfr9ro5IRa2ZuJEKUBJlvyrEF0rPyYvdjCjsZnUnKB9BBXQg==
X-Received: by 2002:a05:6512:3d89:b0:539:f9b9:e6d2 with SMTP id 2adb3069b0e04-53df00ff7c6mr1540332e87.35.1732706481470;
        Wed, 27 Nov 2024 03:21:21 -0800 (PST)
Received: from localhost.localdomain (82-209-143-214.cust.bredband2.com. [82.209.143.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2481424sm2285158e87.133.2024.11.27.03.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:21:20 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4] classes.rst variables.rst: add documentation for uki.bbclass
Date: Wed, 27 Nov 2024 13:20:56 +0200
Message-ID: <20241127112056.361318-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 11:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5825

Documentation for the new class.

[YOCTO #15650]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/classes.rst   | 50 ++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst | 42 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b92f4e4f20..ad22511b4d 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3345,6 +3345,56 @@ and the `signature process
 See also the description of :ref:`ref-classes-kernel-fitimage` class, which this class
 imitates.
 
+.. _ref-classes-uki:
+
+``uki``
+=======
+
+The :ref:`ref-classes-uki` class provides support for `Unified Kernel Image
+(UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__
+format. UKIs combine kernel, :term:`Initramfs`, signatures, metadata etc to a
+single UEFI firmware compatible binary. The class is intended to be inherited
+by rootfs image recipes. The build configuration should also use an
+:term:`Initramfs, ``systemd-boot`` as boot menu provider and have UEFI support
+on target hardware. Using ``systemd`` as init is recommended. Image builds
+should create an ESP partition for UEFI firmware and copy ``systemd-boot`` and
+UKI files there. Sample configuration for Wic images is provided in
+:oe_git:`scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
+<openembedded-core/tree/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in>`.
+UKIs are generated using ``systemd`` reference implementation `ukify
+<https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__.
+This class uses a number of variables but tries to find sensible defaults for
+them.
+
+The variables used by this class are:
+
+-  :term:`EFI_ARCH`: architecture name within EFI standard, set in
+   :oe_git:`meta/conf/image-uefi.conf
+   <openembedded-core/tree/meta/conf/image-uefi.conf>`
+-  :term:`IMAGE_EFI_BOOT_FILES`: files to install to EFI boot partition
+   created by the ``bootimg-efi`` Wic plugin
+-  :term:`INITRAMFS_IMAGE`: initramfs recipe name
+-  :term:`KERNEL_DEVICETREE`: optional devicetree files to embed into UKI
+-  :term:`UKIFY_CMD`: `ukify
+   <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__
+   command to build the UKI image
+-  :term:`UKI_CMDLINE`: kernel command line to use with UKI
+-  :term:`UKI_CONFIG_FILE`: optional config file for `ukify
+   <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__
+-  :term:`UKI_FILENAME`: output file name for the UKI image
+-  :term:`UKI_KERNEL_FILENAME`: kernel image file name
+-  :term:`UKI_SB_CERT`: optional UEFI secureboot certificate matching the
+   private key
+-  :term:`UKI_SB_KEY`: optional UEFI secureboot private key to sign UKI with
+
+For examples on how to use this class see oeqa selftest
+:oe_git:`meta/lib/oeqa/selftest/cases/uki.py
+<openembedded-core/tree/meta/lib/oeqa/selftest/cases/uki.py>`.
+Also an oeqa runtime test :oe_git:`meta/lib/oeqa/runtime/cases/uki.py
+<openembedded-core/tree/meta/lib/oeqa/runtime/cases/uki.py>` is provided which
+verifies that the target system booted the same UKI binary as was set at
+buildtime via :term:`UKI_FILENAME`.
+
 .. _ref-classes-uninative:
 
 ``uninative``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ec4d7ab73f..1eee617d59 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2355,6 +2355,11 @@ system and gives an overview of their function and contents.
       specifies the size of padding appended to the device tree blob, used as
       extra space typically for additional properties during boot.
 
+   :term:`EFI_ARCH`
+      The CPU architecture name within EFI standard. Set in
+      :oe_git:`meta/conf/image-uefi.conf
+      <openembedded-core/tree/meta/conf/image-uefi.conf>`.
+
    :term:`EFI_PROVIDER`
       When building bootable images (i.e. where ``hddimg``, ``iso``, or
       ``wic.vmdk`` is in :term:`IMAGE_FSTYPES`), the
@@ -9846,6 +9851,43 @@ system and gives an overview of their function and contents.
       passes and uses "all" for the target during the U-Boot building
       process.
 
+   :term:`UKIFY_CMD`
+      When inheriting the :ref:`ref-classes-uki` class,
+      `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build
+      `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``ukify build``.
+
+   :term:`UKI_CMDLINE`
+      When inheriting the :ref:`ref-classes-uki` class, the kernel command line
+      to use when booting the `Unified Kernel Image (UKI)
+      <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``rootwait root=LABEL=root console=${KERNEL_CONSOLE}``.
+
+   :term:`UKI_CONFIG_FILE`
+      When inheriting the :ref:`ref-classes-uki` class, an optional config
+      file for the `ukify
+      <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__
+      command.
+
+   :term:`UKI_FILENAME`
+      When inheriting the :ref:`ref-classes-uki` class, the output file name
+      for the generated `Unified Kernel Image (UKI)
+      <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``uki.efi``.
+
+   :term:`UKI_KERNEL_FILENAME`
+      When inheriting the :ref:`ref-classes-uki` class, the kernel image file
+      name to use as input. Defaults to :term:`KERNEL_IMAGETYPE`.
+
+   :term:`UKI_SB_CERT`
+      When inheriting the :ref:`ref-classes-uki` class, optional UEFI
+      secureboot certificate matching the private key in :term:`UKI_SB_KEY`.
+
+   :term:`UKI_SB_KEY`
+      When inheriting the :ref:`ref-classes-uki` class, optional UEFI
+      secureboot private key to sign the `Unified Kernel Image (UKI)
+      <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+
    :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
       Specifies a list of options that, if reported by the configure script
       as being invalid, should not generate a warning during the
-- 
2.43.0


