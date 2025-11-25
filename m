Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD015CFD37A
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:58:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13680.1764064713481628986
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 01:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mUDAnb1e;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47774d3536dso40933595e9.0
        for <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 01:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764064711; x=1764669511; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl97uhdxg86km3ZrdWB919N+5SKuFhiZchV/0leW2VY=;
        b=mUDAnb1e5kMUtR3wfl6tBAKsCLNmHO+tfvY2DP5zDsYKcL4cbX+SAQLrQYDfc+LFDV
         PAYT9ALJyDDALc2og7fYfBi0BgFmL3ONVJ0ZkVeCZic8iodORr5Uu5podApun+lv9M5F
         3w77FyfCXTHh1uVeO65ekgc9UUn6+JNEKsMu9KskeS0b+tif88Aox7wRHN1wCsg9IVmO
         hNRK2p3ZtKjJQlyKBO7u3/O7cBKgv3wT32RqHvxp1Pdm8/kqAqog23QCMDfu/fQVrqJB
         3EgwjNTcU3FGb6L9dl+VTfG2mCzJcOu3uTkIHrKIbat1nE/+i9R6YMD4qiwmujkxNehr
         KPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064711; x=1764669511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vl97uhdxg86km3ZrdWB919N+5SKuFhiZchV/0leW2VY=;
        b=dBBHoasvwc16H8oB1K6yQBcQvrAbnE3YheXi1kHL0OLRq73RutQSYzNLQU1iMQGc7Y
         dJh9hHhlc9rGWpBBmpT16mXXxLF/s+GkoIOZfjrJNUDoG9g28o6UzYlMwn0ToLimCmTS
         lKg08W4MOddAxwnD3Wi+u6FsOaooAOgAUNm2gtYlZ25ZPQerCfb6+hhEkuIYCpdbGyxv
         3hI5QQBeF9jHaDk+2VKP14K9Z3YVZP0pewwNUQft5F6jewaf6tIIHUXJ7R5YC2NGEpZt
         JTctFvCwuTIP+qFlw69eaS71cN9iTIzFgsZr9OLYryqZ8L/qbVsnf8IXEiUlEClVw6d/
         mFoA==
X-Gm-Message-State: AOJu0Yy3aUhP4EYku4l9bPCjxfECTcq7GKtWp1V/IUz9rcEPoXZx8mF+
	qetLyfRpzMHoZU3x0t2MwBvTFWquOjDqaNQaT0F01AFHO70IGH5IwfMU8WaljhxC5eA=
X-Gm-Gg: ASbGncvg9Yr53sQpDV9LRrbXD+7UEU6Af6W6mCUPFbnkDtNkJE6WCy0PniJU48d/TVI
	rFuQ7qs7+2VUJKoy0rmawNR7XLX/vEKahcT0JUhdEye3yjqDGajCayEg5OCOhUQ4Mimm1kEWwgC
	f5jMKB0rqdiCVLv95Aj/dWFJpslU4R2uo3YsSo7K3CYx5Q7oTg6S5iKAkDelRwCRAhXSidMPs3q
	9/v2hocWQNpxCqv1oIgQNL5bC74DzEgzJ9GpEjdvBeXd0C8Be5vk+hnWtsipF/4XgHjwX4W6zwt
	Qibn4ZLqcg/peKcCUu71cm0M/22jg3/GJQnKdMDtfFaMQxpm+r6vauBojJSKDhiBGipUxCgJqGs
	OUJfH8yQ94C6E0tGpSROZp638JxEJBVkkW5ImKtI15XHl/tdjaTP/2cASvnFPEVS+qkBvnvi/ug
	mYyvF4aj52jDUcisk/2+HN0Z9grChIwB1f1SW/RDFJbB6+z0ir3OobG6KYbgH1cFwTG9VK
X-Google-Smtp-Source: AGHT+IG1/3uDzWzlJKuZdRJt2J/DJiY1cgjBn+SipGmpR/oEOxQzZ0fYVzzp/IwgWDXUv4hUvyX1eQ==
X-Received: by 2002:a05:600c:628f:b0:477:bf1:8c82 with SMTP id 5b1f17b1804b1-477c053c90amr162481585e9.15.1764064711243;
        Tue, 25 Nov 2025 01:58:31 -0800 (PST)
Received: from fedora (mob-194-230-144-230.cgn.sunrise.net. [194.230.144.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf1e872esm241419975e9.5.2025.11.25.01.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:58:30 -0800 (PST)
From: stondo@gmail.com
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v4] ref-manual: Document SPDX 3.0.1 variables
Date: Tue, 25 Nov 2025 10:58:19 +0100
Message-ID: <20251125095819.23589-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 09:58:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8111

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add comprehensive documentation for SPDX-related variables in the
Yocto reference manual. This includes documenting previously
undocumented variables and updating existing documentation with
SPDX 3.0.1 specific information.

New variables documented:
- SPDX_LICENSES: Path to SPDX license identifier mapping file
- SPDX_MULTILIB_SSTATE_ARCHS: Architecture list for dependency collection
- SPDX_UUID_NAMESPACE: Namespace for UUID generation in SPDX documents

Updated existing variables with SPDX 3.0.1 data:
- SPDX_INCLUDE_SOURCES: Added concrete SPDX 3.0.1 size data
  (~260 MB without sources, ~2.5-2.6 GB with sources)
- SPDX_INCLUDE_COMPILED_SOURCES: Updated with SPDX 3.0.1 format information

The size information is based on building core-image-minimal for
qemux86-64 with SPDX 3.0.1 JSON-LD format. The uncompressed SBOM
file is approximately 260 MB without sources and increases to
~2.5-2.6 GB when sources are included (approximately 10x increase).

Note: SPDX 3.0.1 uses uncompressed JSON-LD format by default,
unlike the tar.zst compression used in SPDX 2.2.

These variables are defined in meta/classes/spdx-common.bbclass.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 documentation/ref-manual/variables.rst | 72 +++++++++++++++++++++++---
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f0a99aafb..0f5ab2d5e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9000,10 +9000,21 @@ system and gives an overview of their function and contents.
 
          SPDX_INCLUDE_COMPILED_SOURCES = "1"
 
-      According to our tests, building ``core-image-minimal`` for the
-      ``qemux86-64`` machine, enabling this option compared with the
-      :term:`SPDX_INCLUDE_SOURCES` reduces the size of the  ``tmp/deploy/spdx``
-      directory from 2GB to 1.6GB.
+      According to our tests on release 4.1 "langdale" (SPDX 2.2 format), building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling this
+      option compared with the :term:`SPDX_INCLUDE_SOURCES` reduced the size
+      of the ``tmp/deploy/spdx`` directory from 2GB to 1.6GB.
+
+      With SPDX 3.0.1 JSON-LD format, the uncompressed image SBOM file
+      (``core-image-minimal-qemux86-64.rootfs.spdx.json``) is approximately
+      **260 MB without sources** (``SPDX_INCLUDE_SOURCES = "0"``), and increases to
+      **~2.5-2.6 GB when sources are included** (either ``SPDX_INCLUDE_SOURCES = "1"``
+      or ``SPDX_INCLUDE_COMPILED_SOURCES = "1"``). This represents approximately
+      a **10x size increase** when including source files.
+
+      Note: SPDX 3.0.1 JSON-LD files are not compressed by default, unlike the
+      tar.zst format used in SPDX 2.2. Compression (e.g. zstd) can significantly
+      reduce the file size.
 
    :term:`SPDX_INCLUDE_SOURCES`
       This option allows to add a description of the source files used to build
@@ -9017,8 +9028,8 @@ system and gives an overview of their function and contents.
 
          SPDX_INCLUDE_SOURCES = "1"
 
-      According to our tests on release 4.1 "langdale", building
-      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      According to our tests on release 4.1 "langdale" (SPDX 2.2 format),
+      building ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
       this option multiplied the total size of the ``tmp/deploy/spdx``
       directory by a factor of 3  (+291 MiB for this image),
       and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
@@ -9026,6 +9037,42 @@ system and gives an overview of their function and contents.
       image), compared to just using the :ref:`ref-classes-create-spdx` class
       with no option.
 
+      With SPDX 3.0.1 JSON-LD format, the uncompressed image SBOM file
+      (``core-image-minimal-qemux86-64.rootfs.spdx.json``) is approximately
+      **260 MB without sources** (default: ``SPDX_INCLUDE_SOURCES = "0"``),
+      and increases to **~2.5-2.6 GB when sources are included**
+      (``SPDX_INCLUDE_SOURCES = "1"``). This represents approximately a
+      **10x size increase** when including source files.
+
+      Note: SPDX 3.0.1 JSON-LD files are not compressed by default, unlike the
+      tar.zst format used in SPDX 2.2. Compression (e.g. zstd) can significantly
+      reduce the file size.
+
+   :term:`SPDX_LICENSES`
+      Path to the JSON file containing SPDX license identifier mappings. This
+      file maps common license names to official SPDX license identifiers used
+      during SBOM generation.
+
+      The default value is::
+
+         SPDX_LICENSES = "${COREBASE}/meta/files/spdx-licenses.json"
+
+      You can override this variable to use a custom license mapping file if
+      your organization uses different license naming conventions.
+
+   :term:`SPDX_MULTILIB_SSTATE_ARCHS`
+      The list of sstate architectures to consider when collecting SPDX
+      dependencies. This includes multilib architectures when multilib is
+      enabled.
+
+      The default value is::
+
+         SPDX_MULTILIB_SSTATE_ARCHS = "${SSTATE_ARCHS}"
+
+      This variable is used internally by the SPDX generation classes to
+      ensure all relevant dependencies are included in the SBOM, regardless
+      of whether multilib is enabled or not.
+
    :term:`SPDX_NAMESPACE_PREFIX`
       This option could be used in order to change the prefix of ``spdxDocument``
       and the prefix of ``documentNamespace``. It is set by default to
@@ -9053,6 +9100,19 @@ system and gives an overview of their function and contents.
       this option is recommended if you want to inspect the SPDX
       output files with a text editor.
 
+   :term:`SPDX_UUID_NAMESPACE`
+      The namespace used for generating UUIDs in SPDX documents. This should
+      be a domain name or unique identifier for your organization to ensure
+      globally unique SPDX IDs across different builds and organizations.
+
+      The default value is::
+
+         SPDX_UUID_NAMESPACE = "sbom.openembedded.org"
+
+      You can override this variable to use your organization's domain::
+
+         SPDX_UUID_NAMESPACE = "sbom.example.com"
+
    :term:`SPDXLICENSEMAP`
       Maps commonly used license names to their SPDX counterparts found in
       ``meta/files/common-licenses/``. For the default :term:`SPDXLICENSEMAP`
-- 
2.51.1


