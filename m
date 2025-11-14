Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F998CE8D40
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 15:21:05 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.195.1763133659884434181
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 07:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UxngI7ov;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: stondo@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b736ffc531fso102851166b.1
        for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763133658; x=1763738458; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87chftUnLMQo1mIgTLuYVnz8edTxG/kmBNCmo5eRzX4=;
        b=UxngI7ovR5btzIxxysqXer4/q4UhSJYpCIK5hjD6F0rSwDFGcRC82+BsAA7ptxZDlM
         T1/XZsifu1umKiUb8dLIZUSde+Q27RirkYPmDEwmr9G35y1i6Y+ea9N1EgaZG0vQ24b5
         Sc35fcpwrdLEUNXQoHQsaAfSUfanPPKhI2SC76g5TEKOARuTkxCxl1PczVEbn+QQupBM
         Hz9GDmhoup7R6ZIMtzOmAwlYZheOxYi0aMDcmqegaBHls9PN1kGu0suXZP9zOZuY6N+/
         AQHL81j6j7lorPz71AOUmk3j8XLWp6OG1F2bjnsyOu/6SN/LfLsW/fC1ijED18AgOhSJ
         Pecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763133658; x=1763738458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=87chftUnLMQo1mIgTLuYVnz8edTxG/kmBNCmo5eRzX4=;
        b=NBq5Nh50h1r1CClvAKF8+ipwmUlKMwzEhizOG/Kkic5WykLPRsQvlE+Z+ERxO2/5Uc
         KA38FLCfK36XMGu7H5ZGoHzj4W6Xia56yiYN0kDBDh/Wz9OBbpmJQEINdS4ZrZRio2Me
         IJVQzDimlek2VKOAb+ZwtGLYcpEe4EKe/arWj3waKNPtEJhrX2vi2DWwli6zAsBVSUUw
         2KtHuk/Y+3NdvY/GZCCXHAnDYjUVrvY0sKwNj5B/YUpitKky8009tliavVgfCaJN/KA9
         2BmUxY/2f7bn29izVPmcapGEzBfh5w5+zFqS/92AepfA1YGMUM3Dp5alrwnVfXly61vY
         APEA==
X-Gm-Message-State: AOJu0YwYI52/bDGgzTVBf04aufGOYjMl8qCCRhlgAs/2NepmmLiHFDNh
	TOP0b0WVzUnqtZ/YdO6mbL12UGzcWP19z+jEo3i8UUfMVyZOtBJ1f0qFjrErM39o
X-Gm-Gg: ASbGncuQobuCeqdjw5onBhHsFF+r7zAyX3nn2/STowJV1Zt9gLJioToo5OJPA3zg8pk
	/WOdta77EkQVCps1h4HfP5HG10QJwytjemnBsFYh6nY/K/IliH5D0bBQX5Nm1ijWRQl5KJ831yy
	EdWoudq7zI21697+0EMfaEiHkPVLtKXB+MCiHxYNkZ6+c9FXjHVcswUhj4ua319j95XOoNhuWcq
	DsExmuo8H8cKRRCMHWiraFdudoiUg3iP1IWqyu2ny6PWPZcGtVOIvEkJDrVG2GOomOfcceWsn1m
	CkzHrzm+6oF/9fjcLXkWTszrCFi2LQyPyyZuAwpoELlMebKzNh/IQAGrS8WEz+ZjDhq+dT3tsPi
	UL3YZQSUIB2ysjxjVITI9WRwO/ccNsg4aaOcYZoHhFFHl8IXfGDy/l7VlIDgDStECl1ezxi5tZX
	T9CQ6K8xsI7nhzLXL7BCS0C/o=
X-Google-Smtp-Source: AGHT+IFncSWo4prLFi+RYM0IhRW2jyre8jzuUHPKSDefHerPaUuJdnxqNCtz/qPZ5QSAwpON9QTAgg==
X-Received: by 2002:a17:907:72d3:b0:b73:16fe:92d0 with SMTP id a640c23a62f3a-b736780d5fcmr372447866b.18.1763133178885;
        Fri, 14 Nov 2025 07:12:58 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b734fdaf30dsm399456966b.60.2025.11.14.07.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 07:12:58 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Stefano Tondo <stefano.tondo.ext@siemens.com>,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [docs][PATCH v2] ref-manual: Document SPDX 3.0.1 variables
Date: Fri, 14 Nov 2025 16:12:50 +0100
Message-ID: <20251114151255.74797-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114145220.71823-1-stondo@gmail.com>
References: <20251114145220.71823-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 15:21:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8044

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

Changes in v2:
- Fixed unintended removal of non-SPDX variables (CCACHE_DISABLE,
  IMAGE_EXTRA_PARTITION_FILES, REQUIRED_*_FEATURES)
- Fixed unintended change to LAYERDEPENDS description
- Only SPDX-related variables are now modified

 documentation/ref-manual/variables.rst | 72 +++++++++++++++++++++++---
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a80ef364e..c098227f2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8962,10 +8962,21 @@ system and gives an overview of their function and contents.
 
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
@@ -8979,8 +8990,8 @@ system and gives an overview of their function and contents.
 
          SPDX_INCLUDE_SOURCES = "1"
 
-      According to our tests on release 4.1 "langdale", building
-      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      According to our tests on release 4.1 "langdale" (SPDX 2.2 format),
+      building ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
       this option multiplied the total size of the ``tmp/deploy/spdx``
       directory by a factor of 3  (+291 MiB for this image),
       and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
@@ -8988,6 +8999,42 @@ system and gives an overview of their function and contents.
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
@@ -9015,6 +9062,19 @@ system and gives an overview of their function and contents.
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


