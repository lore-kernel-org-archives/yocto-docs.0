Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAC0D59D8A
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 10:11:02 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.42407.1732615851510604802
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 02:10:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cvV12cRV;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53de5ec22adso2173508e87.3
        for <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 02:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732615850; x=1733220650; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KrbMqI73LvbkKjq99Nu4voCmR6y8mdgdfuzJoSLygjw=;
        b=cvV12cRVgMSX+inY1kAyeiD9G113Po/2pHy0k+azwGnvLugBkXGrGEYYwhCXUEntu+
         45WGJDiFeARGp26Ci08mvkXGsIdaYWyXMPrwfg71Hp2Gtjge1ekUgf/kisZrk3OEzSS5
         wqj2HMwwtS8xRh3gSWd0Kk2mlnANusMXPAd+AgFeZOvseJ44JaGDCvfP3cWj1fEcPclO
         URvGLA4891D/DzL9X1O/8336P7kb77C0jF3al8Gvgu3IdgbnoHdmxNszfMiCWGzXrL1P
         /d5ietl81Y7/RW9lX40JWLM2sfEW/t4klz1e019yDCeAoXB3N0IFYgqSEsbGYa/s/GK7
         km9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732615850; x=1733220650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrbMqI73LvbkKjq99Nu4voCmR6y8mdgdfuzJoSLygjw=;
        b=MaPs89gsfvg7Se3W8KbNfBzQMt5uR141Sx1i2XM2MJ9HTlxlPHVDK15f9BideI6GrU
         eX5Kd0VXyZeT2C0E/4TZ4W4L9GWftfqHQ9ewszGI1AQuxvRnCa09fF7nfSCOZwAlsnsr
         156aNhEfJJrsfD8/zY+Qk3YRjQzHWFiTnrHkBoUpAJufqq7riAVgRhtuCZH61zAr/Lxp
         x+Svi+INt2JzQO7bO0NroC1JGrHQ39dD9DUWyRoh1MFzm64sguWFBOpLe+q3GIU8DkMU
         elwcXwIhomOYl2ffQ5RCWsCmiPlCYLTqmup4xQNzG01Ut29cLgssGtz+XEibZLyHkKEk
         5x4g==
X-Gm-Message-State: AOJu0YzvPEGWhUXZLQo0gpeLt3ylW22nXidF43aDMkDtkpE+kw0PVt7G
	mbUHKlO1/UUNvjlK/uHLJBPGs9/xwUCgshfotzZhirvbzp4ZMchLXn8RmJmmKd2gMD4HmThCWpH
	9
X-Gm-Gg: ASbGnctK0p+aSE4J6AOA5SSnwZHNtPBDKKysFGNdP+N8Rsj8HsKz7p9OSh5rvzdrkXz
	3Kcs0oKiFwySX3rFNNxKrZfj/hmIWXSs1roSGDZZs7K+51yrjpa0qhsbqnTXKvzMZCW8X/cIfYS
	SJ1VpQYnXXX+ao+KEfSHUTFgbhol2WwDJ95pFBeNFE8+faxnjbqekkxe9DySF9b4GQ9UiOj3n81
	FWgFaXgC25DrlF37Exf8O0EJ/4ZzcA2GbInz4ZIh6OYCqrjCBXElXuW0mJAaN9Xdc/qoBuAY+OV
	ARzz8LQoQIe0GeFHCVFJwOe+y0vYqVElhGL81A==
X-Google-Smtp-Source: AGHT+IG1nDCP2EueeGR60iAmDknLhYhP0Y1O3rxaCOB0aVvHmsgTuyA5vY+5Zmq7RK4wAaKen69HzQ==
X-Received: by 2002:a05:6512:1283:b0:53d:e669:e7d4 with SMTP id 2adb3069b0e04-53de669f2d4mr3451299e87.16.1732615849293;
        Tue, 26 Nov 2024 02:10:49 -0800 (PST)
Received: from localhost.localdomain (82-209-143-214.cust.bredband2.com. [82.209.143.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd245183csm1956555e87.88.2024.11.26.02.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 02:10:47 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 1/2] classes.rst: add documentation for uki.bbclass
Date: Tue, 26 Nov 2024 12:10:18 +0200
Message-ID: <20241126101019.302943-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 10:11:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5813

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


