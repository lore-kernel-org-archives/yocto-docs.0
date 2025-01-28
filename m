Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7BEC0218D
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 07:54:06 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.12931.1738050832454917658
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 23:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AtD1SU8g;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: simon.eu@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so9085714a12.3
        for <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 23:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738050830; x=1738655630; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWeBxSC2oBo/xFr0vLJq6rcR1I2O9HfNnWc9irniwb4=;
        b=AtD1SU8gznx8sIyCMTF/tHmpGPSNs4qduJq3n22O8psmk4omNMmjDyCFvKLS3pXuYU
         v5BBvt/z+6bf/+Xq+IL3DK2yfVKglzNvEodvwloMRIQHRPt5A+4HVaYbA4N4n1G5dcdQ
         zuHSXxd0FPnUz59VZo5/Mi75RgvCfizQoYfyokZLxNBz6vGbSHh7QHq2KlkghrCmGJlv
         zXjCgT0g30dZf5jUzaC2wcs11w5VbhrTVW9DQSB7GgRtdH9uFfJ3K8MOwFZTlWlRpBTH
         l+bRimKleUuuSGzT/grJk93QhgpTdb9qzLkYvbCtd4bLZ18l98aDeyEMpG8Dm9SKyVBd
         BHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738050830; x=1738655630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWeBxSC2oBo/xFr0vLJq6rcR1I2O9HfNnWc9irniwb4=;
        b=sP8TJ1EjzkQxG9FVFEgUPkOqrZ5EdKsb93v0OmtEI2Dd2DoEzDnujtq1Ou1qGPvMcv
         WG6W/URCv0Lw9ygq7O2Bfc2kdrGeSoWEDihMIIH6bnAytwol+7mA3SGE6cqQBFlohh/Z
         wMTpe82buUYNdtirW8PsXEnPjVgVZj+yWQs4ksVVe+iUw27vBayIq2CyyI/MyyEZYnn5
         D/Dj5t85eOK9YXJ5V2v85akHlnzvPUKH4Q62YCinIkwIpqY7q2GFU9r7rePgPbuzaN8Y
         ggPrzgApSHYuHO8F8RkHsXxAQ7QpUlQvqhmYfJenTAFUPUtGqd3EklOTKPngLa0eHRyE
         +i/A==
X-Gm-Message-State: AOJu0YwTM2kqG99PfIPUvD+f7ySpBo0/KQL7c+V4ZoWOwdHJKq2hHHOk
	t0zfxKm1pe/SC9n0aHKn/DS8d32WkO/tDNdM127ZJ3or+I21uSrlSrj0OA==
X-Gm-Gg: ASbGncu8yxsDYeL9YYz6DFMqKMbPc3Urunxb4aefiX3b7MVBnWFmamJsSlS0ox0niak
	bxftyDjym0pLhGCfcKWUVd9DMgy2C41/hJ+qYQhusWaz90C4KU+LD9oskZ9TTxQZ05vTBQSIZTA
	+anZLMWh4qTbftbTqhrgjDyhpN1dcUS1NSWbZQyaTG4xs3lgpVKACvG0ZjJDoKse5dCjp6udlhZ
	2t9VbEHeQ7f1+ISwSuAf+oY7OSTJokFmjNOeUfxoxDv/1CT822HQS8jWFJ5+Cjz5beoYnrj6LON
	qEc5C1lTXL1JC0XG3ug=
X-Google-Smtp-Source: AGHT+IExEWVs/yj8NoHHTA0yaaNRcepSZLiwogvv8Q332oQbnbg0y4Uo63RqjMcPjo7LiUkH6Sc52g==
X-Received: by 2002:a05:6402:2711:b0:5d9:f042:dab with SMTP id 4fb4d7f45d1cf-5db7d318cd3mr44742178a12.18.1738050830237;
        Mon, 27 Jan 2025 23:53:50 -0800 (PST)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1862838esm6726054a12.19.2025.01.27.23.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 23:53:48 -0800 (PST)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	"Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH v2] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
Date: Tue, 28 Jan 2025 08:53:28 +0100
Message-ID: <20250128075328.20912-1-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jan 2025 07:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6202

This patch describes how to use overrides for grub-efi-cfg because that
is otherwise only clear after reading the .bbclass file. It also adds
a description for GRUB_TITLE.

Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
---
 documentation/ref-manual/classes.rst   | 16 ++++++++++++++++
 documentation/ref-manual/variables.rst |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 761be7b545..1de362e864 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -991,6 +991,7 @@ This class supports several variables:
 
 -  :term:`INITRD`: Indicates list of filesystem images to
    concatenate and use as an initial RAM disk (initrd) (optional).
+   Can be specified for each ``LABEL``.
 
 -  :term:`ROOTFS`: Indicates a filesystem image to include
    as the root filesystem (optional).
@@ -1004,6 +1005,9 @@ This class supports several variables:
 -  :term:`APPEND`: An override list of append strings for
    each ``LABEL``.
 
+-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
+   Defaults to ``LABEL`` if it is not defined.
+
 -  :term:`GRUB_OPTS`: Additional options to add to the
    configuration (optional). Options are delimited using semi-colon
    characters (``;``).
@@ -1011,6 +1015,18 @@ This class supports several variables:
 -  :term:`GRUB_TIMEOUT`: Timeout before executing
    the default ``LABEL`` (optional).
 
+Each ``LABEL`` defined in the ``LABELS`` variable creates a GRUB boot entry,
+and some variables can be defined individually per ``LABEL``. The label
+specific override names are defined as ``grub_LABEL``.
+
+For example, for a label ``factory``, the override name would be
+``grub_factory``. A custom GRUB menu entry titled "Factory Install" with the
+additional parameter ``factory=yes`` can be achieved as follows::
+
+   LABELS:append = " factory"
+   APPEND:grub_factory = "factory=yes"
+   GRUB_TITLE:grub_factory = "Factory Install"
+
 .. _ref-classes-gsettings:
 
 ``gsettings``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0c5c7aab97..16ffbf0e85 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3320,6 +3320,11 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-grub-efi` class for more information
       on how this variable is used.
 
+   :term:`GRUB_TITLE`
+      Specifies custom titles for GRUB labels defined in  :ref:`LABELS`. See
+      the :ref:`ref-classes-grub-efi` class for more information on how this
+      variable is used.
+
    :term:`GTKIMMODULES_PACKAGES`
       When inheriting the :ref:`ref-classes-gtk-immodules-cache` class,
       this variable specifies the packages that contain the GTK+ input
-- 
2.43.0


