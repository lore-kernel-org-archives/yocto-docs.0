Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3CAD0E6EA
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 13:52:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17432.1764078750803671887
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 05:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d6Mp0/b/;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3108f41fso3362047f8f.3
        for <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 05:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764078749; x=1764683549; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5kErcDLVnb5N8hBIwZoXSSy6VUQfXdVk3W0d/rj4mu0=;
        b=d6Mp0/b/UbhFdUTzUwumDiwAjbQXT4pAqhMOVkO+BA8iMyQYe90pyqllouMsPUWRJz
         dTYp5xE0wVwd9DlMwCYVzjCFj68NmbfcpOTTsMIIBkUcmYV7KlxrQjRt50eGx23MbMD+
         fDChlCsEqB9HrcSR/KBYt1e5aDIVm01ZavkMWEUu8wQEY2MHMGc2NtK5lfCidBFeVlOV
         +ddWhITsXzKZA92/fiBKF27HwcLgcMq2xvziKL8+80IFyzx6bNDDEWN8MVvsvnqcpavC
         zsE97qn/Vcx7qXVwWSw2VKcdiKVxcuop9c3xnfPfuliSxL0sCEsHwQmg98zmDdMEhVNh
         FNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078749; x=1764683549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kErcDLVnb5N8hBIwZoXSSy6VUQfXdVk3W0d/rj4mu0=;
        b=q3s3DpeqYYomPptjHqqc8/zK9Hee0H54a3oMFoNhAEY6xlqztfW98fv6uYgFosDhRt
         a6+fmZL8i2JyI5dtVxngMry+Zp2EG/ukuPa+9oAng01xFg2mhsFROX/VwAKTa+iZQ1Mi
         sBZ0V9S5zMMBCghQo839uhz8r1PsoCz8Ag9an7VawTIvyI82XpsaeteII98vqBbQlSaF
         596OX5/g+dH2BeSyAcuxB4OUO8Tl72hHLLe+EnrhwcOZ6Y23grvMJmd6vLm9Gv/dyG10
         uNEbQK5ze2eHfrTW1KjJPMTSs9g0pyItQjt66PLrbMf5FIW+LK+e7jNnT/c2uL2w9WqO
         bkWQ==
X-Gm-Message-State: AOJu0YwmgpKEHtpEF/4eDSmYWOylDXC5sKaDbgLQPrP/CIS7mo7rYm8D
	F4UMLj+E23Rf+3bpevcVEsNN5iBULBXAWth1PEgRmnf4NcbAX9LPs0fdUjMpTrS65f0=
X-Gm-Gg: ASbGncukrK/saV9lEUoOke7UbnETIf/D1vNOXe3b7S5G3AugIkKm6HgRUmSkRiAVZm5
	gmJuRBpZgNhHwn8xTeDfy85eM0yTOMUB6GTuE8g7esAO2AR962fFX2ab1GB+tMiVvR4UXMmb4OF
	zNYRU9wsgSJ3cAvG9IxVT6+5T+1ysSS41PfM1bIojdMkCMyVDzr+GbUPUP2rYkR35bpgPTVJ2h8
	q6RKdQh5NTIEBII0y+aArWSrIgtqspYYS0W55waeu9gi1HaF+32MGzocINbpjxsO75193TkVF0u
	APQ/dYyQnAJTr+2W53x4pvrHcItVCzLhLRkkT8kUOl3bjfPdx4nxF0CnMH45M9dVAbe4q/Zn+PN
	EQSsKkfzNbKYoZYIurzlnbVgUYdVtw4Xzi1WTPmRVCGUspxN1jZHLLsSsLhiVx24OOX5P8IFiz9
	nTCmB19g6RJjfA/kAybOfvFGnWTi6nT00rgGrpwsS3t/YQfxZ9BiMrZE33+zngNkW1lfEe
X-Google-Smtp-Source: AGHT+IG94oOMhdkdUpkQrbxyGom1dg2NREzjz4GPtnhu2C9APF0pa1BL9O+kJQ7dINOCbhvJXbvGTw==
X-Received: by 2002:a5d:64c9:0:b0:42b:47da:c313 with SMTP id ffacd0b85a97d-42cc1abdefdmr17697291f8f.3.1764078748684;
        Tue, 25 Nov 2025 05:52:28 -0800 (PST)
Received: from fedora (mob-194-230-144-230.cgn.sunrise.net. [194.230.144.230])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cbd764dbesm31254370f8f.27.2025.11.25.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:52:27 -0800 (PST)
From: stondo@gmail.com
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH v6] ref-manual: Document SPDX 3.0.1 variables
Date: Tue, 25 Nov 2025 14:52:17 +0100
Message-ID: <20251125135218.55721-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 13:52:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8117

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add comprehensive documentation for SPDX-related variables in the
Yocto reference manual. This includes documenting previously
undocumented variables and updating existing documentation with
SPDX 3.0.1 specific information.

New variables documented:
- SPDX_LICENSES: Path to SPDX license identifier mapping file
- SPDX_MULTILIB_SSTATE_ARCHS: Architecture list for dependency collection
- SPDX_UUID_NAMESPACE: Namespace for UUID generation in SPDX documents

Updated existing variables:
- SPDX_INCLUDE_SOURCES: Added SPDX 3.0.1 format information
- SPDX_INCLUDE_COMPILED_SOURCES: Clarified relationship with SPDX_INCLUDE_SOURCES

Note: The langdale (SPDX 2.2) information was already present in the
documentation. This patch adds corresponding information for SPDX 3.0.1
format based on testing with the master branch.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 documentation/ref-manual/variables.rst | 77 ++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f0a99aafb..8e2a4d8f3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9000,10 +9000,28 @@ system and gives an overview of their function and contents.
 
          SPDX_INCLUDE_COMPILED_SOURCES = "1"
 
-      According to our tests, building ``core-image-minimal`` for the
-      ``qemux86-64`` machine, enabling this option compared with the
-      :term:`SPDX_INCLUDE_SOURCES` reduces the size of the  ``tmp/deploy/spdx``
-      directory from 2GB to 1.6GB.
+      For SPDX 2.2 format (release 4.1 "langdale"), building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, this option
+      reduced the size of the ``tmp/deploy/spdx`` directory from 2GB to
+      1.6GB compared to :term:`SPDX_INCLUDE_SOURCES`, as it includes only
+      compiled objects without original source files.
+
+      With SPDX 3.0.1 JSON format, enabling this option includes both
+      compiled sources and original source files (same as
+      ``SPDX_INCLUDE_SOURCES = "1"``), which significantly increases
+      the SBOM size. For example, with ``core-image-minimal`` on
+      ``qemux86-64``, the uncompressed SBOM file can grow from hundreds
+      of megabytes to several gigabytes.
+
+      .. note::
+
+         SPDX 3.0.1 JSON files are not compressed by default, unlike the
+         tar.zst format used in SPDX 2.2. You can compress the output
+         files manually::
+
+            zstd core-image-minimal-qemux86-64.rootfs.spdx.json
+
+         This typically achieves 94-97% compression ratios.
 
    :term:`SPDX_INCLUDE_SOURCES`
       This option allows to add a description of the source files used to build
@@ -9017,7 +9035,7 @@ system and gives an overview of their function and contents.
 
          SPDX_INCLUDE_SOURCES = "1"
 
-      According to our tests on release 4.1 "langdale", building
+      For SPDX 2.2 format (release 4.1 "langdale"), building
       ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
       this option multiplied the total size of the ``tmp/deploy/spdx``
       directory by a factor of 3  (+291 MiB for this image),
@@ -9026,6 +9044,55 @@ system and gives an overview of their function and contents.
       image), compared to just using the :ref:`ref-classes-create-spdx` class
       with no option.
 
+      With SPDX 3.0.1 JSON format, including source files significantly
+      increases the SBOM size (potentially by several gigabytes for typical
+      images).
+
+      .. note::
+
+         SPDX 3.0.1 JSON files are not compressed by default, unlike the
+         tar.zst format used in SPDX 2.2. You can compress the output
+         files manually::
+
+            zstd core-image-minimal-qemux86-64.rootfs.spdx.json
+
+         This typically achieves 94-97% compression ratios.
+
+   :term:`SPDX_LICENSES`
+      Path to the JSON file containing SPDX license identifier mappings.
+      This file maps common license names to official SPDX license
+      identifiers used during SBOM generation.
+
+      The default value points to a copy of the license mappings defined
+      by SPDX (https://github.com/spdx/license-list-data) stored in
+      :term:`OpenEmbedded-Core (OE-Core)`.
+
+      You can override this variable to use a custom license mapping file
+      if your organization uses different license naming conventions.
+
+   :term:`SPDX_MULTILIB_SSTATE_ARCHS`
+      The list of sstate architectures to consider when collecting SPDX
+      dependencies. This includes multilib architectures when multilib is
+      enabled.
+
+      The default value is set to :term:`SSTATE_ARCHS`.
+
+      This variable is used internally by the SPDX generation classes to
+      ensure all relevant dependencies are included in the SBOM,
+      regardless of whether multilib is enabled or not.
+
    :term:`SPDX_NAMESPACE_PREFIX`
       This option could be used in order to change the prefix of ``spdxDocument``
       and the prefix of ``documentNamespace``. It is set by default to
@@ -9053,6 +9120,16 @@ system and gives an overview of their function and contents.
       this option is recommended if you want to inspect the SPDX
       output files with a text editor.
 
+   :term:`SPDX_UUID_NAMESPACE`
+      The namespace used for generating UUIDs in SPDX documents. This
+      should be a domain name or unique identifier for your organization
+      to ensure globally unique SPDX IDs across different builds and
+      organizations.
+
+      The default value is set to a domain managed by the OpenEmbedded
+      project. You can override this to use your organization's domain.
+
    :term:`SPDXLICENSEMAP`
       Maps commonly used license names to their SPDX counterparts found in
       ``meta/files/common-licenses/``. For the default :term:`SPDXLICENSEMAP`
-- 
2.51.1

