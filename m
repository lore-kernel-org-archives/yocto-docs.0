Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EF2D58D5E
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 15:34:55 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.21280.1732548894337097381
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 07:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Nvw1ZxTQ;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53de7321675so730370e87.2
        for <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 07:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732548892; x=1733153692; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KrbMqI73LvbkKjq99Nu4voCmR6y8mdgdfuzJoSLygjw=;
        b=Nvw1ZxTQrYEOEb9zobct7KNbq3NM27co6Aj+IVgTTMN+kAZ/fgTVT8JXhvUuij4zZS
         T5QgULB8VOi9w0NUK/Lqeac+el1Rotk3bMPr69dT7Eh6NhaCyneP6shlf76V18cYsyWr
         QyoSqHC3c3yifBlb3nagkI/FqV1heN57TtddX4+bTR7CqAZsOYTFyhkCUaZmYVb4KHxD
         EQPWGM1wAPwVjKDaZQkGiMRshfTsjtznscb6IelXX+llo+Jcq06zIMIPpovJXbBv4acW
         E1YprVgZ19T36nqQyZEAHjq8chg/a4URMyHiRC5pw4ApLsDtdzSgpkcILRg18mnVCjwe
         U4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732548892; x=1733153692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrbMqI73LvbkKjq99Nu4voCmR6y8mdgdfuzJoSLygjw=;
        b=nhrD8ieWJKUlXhxen3Xv4qFpLwHjWv8naoziSyq97Zo/12afGQtEM2//4IMwJgUvzt
         ++QM3fRMXOvaJrLHLYi9oQlAzqQ20rcmTTMFUvuoWm1joxsk3yN5i35aZuBeB3X4lGZe
         kzCiacoO3mxfKJI9/1a7+RNzOxqFSWZF9XwqJAj4qG3q40fgMRYUx4v0fJMh23BpbTvf
         dI4Qy+Tpz2CwNC9gWFTdiwmEwBXSuB8w5syOdxQHqtOmr+ckKbxQ7mb8kScKWdTQD7S3
         cfkSYqZq68ApvAfIqn1YKc/0JqxkyPfbhq9SY52aZdv1bhvW3PBlfpUtXpXhEzOWZv3h
         0Gsw==
X-Gm-Message-State: AOJu0Yy0zrJwsIPaZ+/xiPVIRNkGK20TdcRd5/GwyLpVPXSoRAlLRvt8
	BtY+/zS7e5mTucYU+m1oA68UfA//ZBqz1dasxnXS/YQP7zR4//Tp/hhAqmYBx3xfWlxwise4ink
	3
X-Gm-Gg: ASbGncv5uw4a4yIkcoRCdQn/tl0v9b0Jw/bEo5A67PcZ8cY79X5PGPNsH0uD9tY3Kh4
	TJOBjt2cph7kLNfbo3H5gF9tHsaXSYLZeCiZYZhGF5Std4YcNuT49jzXHooKxft04LKr2BgPhU/
	B7oUok3r1X/+40pQv9VUQ4wXILB3sv5SXwKqSvUuGAMPOvxr9J99xf1iR+noJwrfS15aMDsdaNv
	Wz6UUsHyPlEtPk3DaDTSf2u1+T49cRQ8/Yno9JCEJQYnfs+HngPox6XBmQLiygooCewzyauRhF5
	8cBBjTvhVYFgNagx8gTWP2tZsPUfPs4fV0rxjQ==
X-Google-Smtp-Source: AGHT+IGtMs73bUv/sRSYe69yPbSZz9Qdy28EO0rWseEyUVP33CbHwfSYpYbNEhdGhxba5Ze3oLfrvg==
X-Received: by 2002:a05:6512:3a87:b0:53d:e5f7:267e with SMTP id 2adb3069b0e04-53de5f728camr1455941e87.40.1732548892332;
        Mon, 25 Nov 2024 07:34:52 -0800 (PST)
Received: from localhost.localdomain (82-209-143-214.cust.bredband2.com. [82.209.143.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd7022fdfsm1466642e87.146.2024.11.25.07.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 07:34:50 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] classes.rst: add documentation for uki.bbclass
Date: Mon, 25 Nov 2024 17:34:15 +0200
Message-ID: <20241125153415.282847-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 15:34:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5800

Documentation for the new class.

[YOCTO #15650]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/classes.rst | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b92f4e4f20..901d455f09 100644
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
+format. UKIs combine kernel, initramfs, signatures, metadata etc to a single UEFI firmware
+compatible binary. The class is intended to be inherited by rootfs image recipes. The build configuration
+should also use an initramfs, systemd-boot as boot menu provider and have UEFI support on target
+HW. Using systemd as init is recommended. Image builds should create an ESP partition
+for UEFI firmware and copy systemd-boot and UKI files there. Sample configuration for Wic
+images is provided in ``scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in``.
+UKIs are generated using systemd reference implementation `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__.
+This class uses a number of variables but tries to find sensible defaults for them.
+
+The variables used by this class are:
+
+-  :term:`INITRAMFS_IMAGE`: initramfs recipe name
+-  :term:`INITRD_ARCHIVE`: initramfs image file name
+-  :term:`UKIFY_CMD`: `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build UKI image
+-  :term:`UKI_CONFIG_FILE`: optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__
+-  :term:`UKI_FILENAME`: output file name for UKI image
+-  :term:`UKI_KERNEL_FILENAME`: kernel image file name
+-  :term:`UKI_CMDLINE`: kernel command line to use with UKI
+-  :term:`UKI_SB_KEY`: optional UEFI secureboot private key to sign UKI with
+-  :term:`UKI_SB_CERT`: optional UEFI secureboot certificate mathing the private key
+-  :term:`IMAGE_EFI_BOOT_FILES`: files to install to EFI boot partition created by ``bootimg-efi`` Wic tool
+-  :term:`EFI_ARCH`: architecture name within EFI standard, set in ``meta/conf/image-uefi.conf``
+-  :term:`KERNEL_DEVICETREE`: optional devicetree files to embed into UKI
+
+For examples how to use this class see oeqa selftest ``meta/lib/oeqa/selftest/cases/uki.py``.
+Also an oeqa runtime test ``uki`` is provided which verifies that the target system
+booted the same UKI binary as was set at buildtime via :term:`UKI_FILENAME`.
+
 .. _ref-classes-uninative:
 
 ``uninative``
-- 
2.43.0


