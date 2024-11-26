Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5086FD59D9D
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 11:03:12 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.43386.1732618985713525983
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 03:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gGkBA8HF;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so4597954e87.2
        for <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 03:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732618984; x=1733223784; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8hIwXoLM40VJBg55UIV4w8W1zXGrciFZymXOxW2CVno=;
        b=gGkBA8HF/udodiaX2/BBt8UQT7Go97YaKp027kwEID68oUJtXEMH+KbDGk1KZrsymJ
         FjUnkJ3CAE8YAlb2eiW7GLXmhnnGalIP+DoqVDsmqxk368RpGvWbkFLbPiKg8sSsKvc4
         uiEr4tc94Ayb0vOxPpI2UUVe1NcgxvkdPK3WSVdsQ9A4eNDvpVkDFtx2pi0KfvPG1SBm
         Up9a42ZykUgNT5FLaD0Cd54iShOajusxRkTtQBqELLAkXtINVXDeRYDB/sRdKYSHgoHt
         SccEWPE9OEHChz7yYFE//VwbCoxkJTrCZhm1CJ4hxnsudvPp9ZA/STHZHvMutV+ax36n
         mtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732618984; x=1733223784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8hIwXoLM40VJBg55UIV4w8W1zXGrciFZymXOxW2CVno=;
        b=ECUZmzCH8b9BZkNy078fzpsFE5Ejvc2uRKFNDv8AcKYbrlQOOwEFWDGkF1P72vPHhU
         KiHCPcEO8PMP9+BR3B11N0TjOL7Q2416V6C1AIUl6dRnRaXyADGSGrZumgPF6oqfQ/Fb
         KjeulzvEfp9cxKW9D3bUHI2JuF5h9olRjo8KR/hrqG/UzVF+gkCpm6yuEmrbKEby6sIl
         6Z0FxvXLMHimNm3vXewepQtJJvxnsYEQvmX6f5jZYFeUHFnlnwjv3Jq4qV9gsu8/9luo
         6HZ/k1LDvCZF+fGZE+tcrRyNR9Fo7gcnttIqhIlydto5XPKIA/pFzlgctsodwTioq3SF
         4zgQ==
X-Gm-Message-State: AOJu0YwisLCXNZyfb6DO5t40673D+bxVf7902+eGp4fWLV4Ah7rW/cIz
	QVSJL1zEBLdeffn44aoDmgqppyKbOt565Uqhq9OqfBQnbU9OVPgiwj3VTIeSkm0H+9FVunCatKw
	Z
X-Gm-Gg: ASbGncu/cny3uh1tf9Tww15EpWAVbg+TERgjLPseiSUESgKLuMNxZwEwF7uDGP6ycFb
	Qca7E7A7oCoGqxYyu8tU5USb/ZrO03PiFiMPtAsQTZzrs3fwaY95vDA1b1zirz1J8MFtgnQ9o0t
	7fz2iSojUgxsgK5jglnWUzLh8ti7Mt24Sgi11La6cBEkcCqpZ1YObhy7la6E0YqCVzL0TNKnpqM
	ItWamOQW0WW1U0z+aqibbB02QIP0rEQDh+I7NLeMuh6FeifYs5vRk15O/SrSs5/33OQ/2ZovL3f
	WeEh7KnHpDHzKdlzP3Wrq2UE/gQLBajygr2FPA==
X-Google-Smtp-Source: AGHT+IEezfCYW/MeWUVks3FD4EXn4WIPhZ3Cz50s5itfKYVvVdPRTFSlhg/FX/NvDy0rZMXLDuijtw==
X-Received: by 2002:a05:6512:238a:b0:53b:4bc0:72aa with SMTP id 2adb3069b0e04-53dd389df5dmr5971642e87.34.1732618983761;
        Tue, 26 Nov 2024 03:03:03 -0800 (PST)
Received: from localhost.localdomain (82-209-143-214.cust.bredband2.com. [82.209.143.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53de8b3f4cfsm245131e87.210.2024.11.26.03.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 03:03:02 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3] classes.rst variables.rst: add documentation for uki.bbclass
Date: Tue, 26 Nov 2024 13:02:46 +0200
Message-ID: <20241126110247.307766-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 11:03:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5818

Documentation for the new class.

[YOCTO #15650]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/classes.rst   | 34 ++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst | 32 ++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b92f4e4f20..d2b2469552 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3345,6 +3345,40 @@ and the `signature process
 See also the description of :ref:`ref-classes-kernel-fitimage` class, which this class
 imitates.
 
+.. _ref-classes-uki:
+
+``uki``
+=======
+
+The :ref:`ref-classes-uki` class provides support for `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__
+format. UKIs combine kernel, :term:`Initramfs`, signatures, metadata etc to a single UEFI firmware
+compatible binary. The class is intended to be inherited by rootfs image recipes. The build configuration
+should also use an initramfs, ``systemd-boot`` as boot menu provider and have UEFI support on target
+HW. Using ``systemd`` as init is recommended. Image builds should create an ESP partition
+for UEFI firmware and copy ``systemd-boot`` and UKI files there. Sample configuration for Wic
+images is provided in :oe_git:`scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in <openembedded-core/tree/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in>`.
+UKIs are generated using ``systemd`` reference implementation `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__.
+This class uses a number of variables but tries to find sensible defaults for them.
+
+The variables used by this class are:
+
+-  :term:`EFI_ARCH`: architecture name within EFI standard, set in :oe_git:`meta/conf/image-uefi.conf <openembedded-core/tree/meta/conf/image-uefi.conf>`
+-  :term:`IMAGE_EFI_BOOT_FILES`: files to install to EFI boot partition created by ``bootimg-efi`` Wic tool
+-  :term:`INITRAMFS_IMAGE`: initramfs recipe name
+-  :term:`INITRD_ARCHIVE`: initramfs image file name
+-  :term:`KERNEL_DEVICETREE`: optional devicetree files to embed into UKI
+-  :term:`UKIFY_CMD`: `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build UKI image
+-  :term:`UKI_CMDLINE`: kernel command line to use with UKI
+-  :term:`UKI_CONFIG_FILE`: optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__
+-  :term:`UKI_FILENAME`: output file name for UKI image
+-  :term:`UKI_KERNEL_FILENAME`: kernel image file name
+-  :term:`UKI_SB_CERT`: optional UEFI secureboot certificate mathing the private key
+-  :term:`UKI_SB_KEY`: optional UEFI secureboot private key to sign UKI with
+
+For examples on how to use this class see oeqa selftest :oe_git:`meta/lib/oeqa/selftest/cases/uki.py <openembedded-core/tree/meta/lib/oeqa/selftest/cases/uki.py>`.
+Also an oeqa runtime test ``uki`` is provided which verifies that the target system
+booted the same UKI binary as was set at buildtime via :term:`UKI_FILENAME`.
+
 .. _ref-classes-uninative:
 
 ``uninative``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ec4d7ab73f..65fea43a1e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9846,6 +9846,38 @@ system and gives an overview of their function and contents.
       passes and uses "all" for the target during the U-Boot building
       process.
 
+   :term:`UKIFY_CMD`
+      When inheriting the :ref:`ref-classes-uki` class,
+      `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build
+      `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``ukify build``.
+
+   :term:`UKI_CMDLINE`
+      When inheriting the :ref:`ref-classes-uki` class,
+      the kernel command line to use when booting the `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``rootwait root=LABEL=root console=${KERNEL_CONSOLE}``.
+
+   :term:`UKI_CONFIG_FILE`
+      When inheriting the :ref:`ref-classes-uki` class,
+      an optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command.
+
+   :term:`UKI_FILENAME`
+      When inheriting the :ref:`ref-classes-uki` class,
+      the output file name for generated `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``uki.efi``.
+
+   :term:`UKI_KERNEL_FILENAME`
+      When inheriting the :ref:`ref-classes-uki` class,
+      the kernel image file name to use as input. Defaults to :term:`KERNEL_IMAGETYPE`.
+
+   :term:`UKI_SB_CERT`
+      When inheriting the :ref:`ref-classes-uki` class,
+      optional UEFI secureboot certificate matching the private key in :term:`UKI_SB_KEY`.
+
+   :term:`UKI_SB_KEY`
+      When inheriting the :ref:`ref-classes-uki` class,
+      optional UEFI secureboot private key to sign `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+
    :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
       Specifies a list of options that, if reported by the configure script
       as being invalid, should not generate a warning during the
-- 
2.43.0


