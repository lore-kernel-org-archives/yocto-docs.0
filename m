Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2054CFD37A
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 10:01:38 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13746.1764064890984706989
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 02:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3hVfWXn;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42bb288c219so4540108f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 02:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764064889; x=1764669689; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lNhmmPWKpX7Bg8xxFl/m/WxM+9rrPb5KNg/zYq3i7k=;
        b=b3hVfWXnTkostgXGYhD4GQGis/VBTueBEHLkl1RdORvhYBbfj/aYiT4koFE3Xb7WD1
         EQ2BHqnv2IjumllzBkmPukValbL4rrJ+HtNijsX+ht++BG1ReKUdJjlsxHn+zViEyFcF
         F2VM0yrXGKKkIxBjJVC+/oi+EcWuaQlAX0rXFz1sB9rshsphnLvHApH1R5WK00tjgOBU
         Yv1inwJQu/pR2rMcEyTWBW/LLTg2MVb4Df1PWUIV+keoVIBajEZOk0SvTM5FZ54/A/Wu
         4tas073s8mApSOvWDfGzW6B0JAClW5zGHZBroLOdiN7Nx9B+UKX2WP+KhbeoEPGt1BzG
         1GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064889; x=1764669689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lNhmmPWKpX7Bg8xxFl/m/WxM+9rrPb5KNg/zYq3i7k=;
        b=J0EHssFTpNDMHgfrifleUZ00gCBjkW976ebf0Ivn/gW/jz5hxR3UjdwK/3A0JomgK9
         E3dhdap8vrfon2c/IoazWJfhDgtZ/a4jTVSfqfArwTCFo1PVZ2GciXFDuumJzTVYu4Tv
         aQ77qhyK8i3DfZFUxCsLgG9puOyvBLUThjZan0BJxzLfZqDBE5zS+rbvPedtNQvNsAxZ
         XaCx5rX8wsDER8/wbdv9fdt4oX7+55kWDzVBc+XHpJtcMTqxj7xRpFFHYBaowA1LkSW/
         BFOA39CiM35lq7XGRBonra85gdn/ahHA8z+QbPJ/9IGQv5Q+iKWGPm9boMHmDX0AMSDX
         EhDA==
X-Gm-Message-State: AOJu0Yzxf+BLfGcA4V1hnuUXA+onUkr88iqOKHeTB6eVnPVsk4sCdlFD
	iiyW6+cM3vrSeXpKj1kLF0vflC7Dbf6BbQBd67M5d+QccI/kDTpMu44XT9QL68h6a38=
X-Gm-Gg: ASbGncs2prUfXTDjbn3ux5ZS0Le1XlPwn9kIy+ShxSdYK8mZnvynpQ1PZVsMNUQsZrl
	ZVMQeKtj1KSXSFo6HI518F3mxiyG3lvnBG6qAEKY0wKbCfCLAzqO8eyjrODjMfhCpblbUfy1GLU
	WoaPY/dfWMn6DOizEIi65AMANxWZXQlaMgiF5K9/yFJ8gB69hq3pEVVl2Op1ARBDApX8qyp/Q1A
	zYCqGOSovRY+d2qYOYI6kJZIe+n2SX9cuPhxfWqGfld/qNi7f5EvjBNJfzswmHEgDS9mv0SqxFI
	ok9FK7CWYrD0d+qwOvADBeHQTJO8RLuvSOAKXVmBr4YN5F8mome8hTwcE16SRs5oRcRlTGQRqkt
	9TYPbS4QzoiYyVdccNyQqILLJYsEt3VUaMfLcjXNq0sTotOCsh4zFR46ELV28H1CVqh+Dlt4K5C
	GNLQXfAjsjFrWPmm6HP4PpnJ91NgPTcFWKUsJtKyzo8cMSSKRibGpKuAz+A2HK1icyFy4x
X-Google-Smtp-Source: AGHT+IENqu/QeztmZq3evX0MbLAhl64a7m+GObYPeaLdqLit/PEjhcA5WWF0B6xy9ptEj1iGSO2QRw==
X-Received: by 2002:a05:6000:2585:b0:42b:2ee0:569f with SMTP id ffacd0b85a97d-42cc1d0cf1emr16763641f8f.33.1764064888856;
        Tue, 25 Nov 2025 02:01:28 -0800 (PST)
Received: from fedora (mob-194-230-144-230.cgn.sunrise.net. [194.230.144.230])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fa35c2sm32115935f8f.25.2025.11.25.02.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 02:01:28 -0800 (PST)
From: stondo@gmail.com
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v5] ref-manual: Document SPDX 3.0.1 variables
Date: Tue, 25 Nov 2025 11:01:14 +0100
Message-ID: <20251125100114.24243-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 10:01:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8112

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
- SPDX_INCLUDE_SOURCES: Added SPDX 3.0.1 distributed architecture info
  (rootfs SBOM: 5-6 MB regardless of source inclusion settings)
- SPDX_INCLUDE_COMPILED_SOURCES: Updated with SPDX 3.0.1 format information

Key architectural difference in SPDX 3.0.1:
The rootfs SBOM (tmp/deploy/images/) contains only relationships and metadata,
while per-package SPDX documents are stored in tmp/deploy/spdx/. This
distributed approach means source inclusion settings have minimal impact on
rootfs SBOM size, unlike the monolithic SPDX 2.2 format.

Tested with core-image-minimal on qemux86-64 (Yocto 5.3).

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


