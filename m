Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920A2D6ACD9
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 13:59:50 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.72386.1732715981807131648
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 05:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=L9vqEfWd;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53de8ecafeeso2256697e87.1
        for <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 05:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732715980; x=1733320780; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JPYgeEEtFVsj2Qvktm+auIxtB2FnfXmPK4uwoLEnD0=;
        b=L9vqEfWdhmk/OnqS3dgG62ARvGNq0jcGEWjKelKN21imaAxhlIxDl2NKvMzd7uPW6Y
         omNT41jzVKTjBJN06jjcvKt0shhjvDcQ4NYcmBdMCMjStroSuaTNiyu/osSgqakpSrVN
         jPxlD8Lb7Xc8oETP0TmIpKRnAi9pJiFUMNijFGGCHorunM3x/TEsigf94PyLJD5bKM0g
         jFaqWoAVIasSa1GpPNhYXb2oP0jXWh9nfA9Zbhdo6tqH+B7hX7ZYk1sWscGQeEdxCdEg
         iNdbX4+3VyXpsFNMBtACcVs+ttMl/HFfAYxq5ylykCm8COOkiGHBUgLbaO0ZxQBZDePJ
         ltbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732715980; x=1733320780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JPYgeEEtFVsj2Qvktm+auIxtB2FnfXmPK4uwoLEnD0=;
        b=rPQUU88jjzNYSfqwwzMsesikBjGnROmC1MeOE5Yee+3lqK3KsdcLFHH96VhxyAVy2L
         ShopERHGIg5ah34tkUR4yjrPcg2k/0AnkgsDoK7T5wqN5IoprkJ7A/xDz2i5h9bquenW
         Trf8/ACKuwmuA5YRc6MRUg8rlYwmiqexgSveEJ2hV0isGl0na+S+e5urQNFy3meII1ih
         bdNDoFbdPG/ILzHv1+0bvy5KOU3u8n67ClevQuK3T9DaisgqWJxkOSKi6ZbqT1H7nlvi
         gJYPlvdfO3PL8rLIc2Km32dxxyoH00zsbwgtKjguT78kSe0iUMmCh8nm10vS5Ca37dTY
         J45g==
X-Gm-Message-State: AOJu0Yz0N3rdzokS3udqNCrspsh8dG1qw01r3WE4Gvrp2YV7vp86NE0E
	5ajqNbSEvOJrSgXySF+CuTHStM0/rTb5epRv46TKWWTZNw7Hhjc/mdsSiyZrITzxWQC396Xvc7O
	k
X-Gm-Gg: ASbGncveay2HP7zZHZsPAeh/nr9UnECI+7OlcbUItef2pdtuf2/cFpTY8fDin9LTq/l
	iw+/vfMfmTkfGDCHrMlfKZhy3NcaMnPovorlOtKK8kCAdT1WLmBkmfuo8uD4nP6TH9gl34209vU
	98V15OW9zNlGyNiHvoqZnPNqQKzdp7/xNeouGEupQH1FvhCyh0arCn1vKmViAGEW1ORxc/He/Mv
	10F9VCjjrjMwZcceKoyrJz9rJ45l1bCQp7V2l45duqtMnOSSgmMSKg2FUJlId9mdTcstBsScikq
	bUnxOEaY2uMLL+ios+wB/o96W2OOJm9gV+f0cQ==
X-Google-Smtp-Source: AGHT+IEbCG8zR5e/Ji94D5jLPdUWxk4wRCCWAf1vIcd9XKZiDoesmZ4PwawMwO/SieBB/Sp8vPYloA==
X-Received: by 2002:a05:6512:3ba3:b0:53d:cf93:8072 with SMTP id 2adb3069b0e04-53df00ff250mr1759211e87.38.1732715979929;
        Wed, 27 Nov 2024 05:59:39 -0800 (PST)
Received: from localhost.localdomain (82-209-143-194.cust.bredband2.com. [82.209.143.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2297254e87.228.2024.11.27.05.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:59:38 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5] classes.rst variables.rst: add documentation for uki.bbclass
Date: Wed, 27 Nov 2024 15:59:21 +0200
Message-ID: <20241127135921.3056-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 13:59:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5833

Documentation for the new class.

[YOCTO #15650]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/classes.rst   | 50 ++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst | 42 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b92f4e4f20..33e1a4b435 100644
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
+:term:`Initramfs`, ``systemd-boot`` as boot menu provider and have UEFI support
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


