Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968B7D10F56
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 14:00:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13430.1764165651140269434
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 06:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UTGEMZ5a;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so71442555e9.2
        for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 06:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764165649; x=1764770449; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nkXum5eECwxOloHUby47P4NTsLqGtBjC7lzjhuhCcFE=;
        b=UTGEMZ5a460tx8bS5Nl8zMvTdfYVc+882zHYwfEpEgRLJz4c9IpKPSIIFPLQFHPFXR
         OqLdycGtErn4oP4LHN90L5MswAOQgbmL8IJ6gIVHGradmy53JGV4UtAqUl0D7XwlH6Mt
         wCteoaID0chcJBOo/ObBcgFmxlVxhftEFb0iO17qveFzFVDKE1NjYuN0ODegw2WLIweh
         E52cITKUOFsgLXG1+lel6heS0ZPY2vNvn8ZAYdTtSPdSKuwZ0sVYG9ZS9g0KbYNgqDOE
         7yvhAvMtvsWnGwyLcOdntZFzMae0QDR+F2TCcfa9JpoYXKZm8iFc/CO7FMHNz4CV3x2U
         ijRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165649; x=1764770449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkXum5eECwxOloHUby47P4NTsLqGtBjC7lzjhuhCcFE=;
        b=EJuDOAd29abw+7Pkl3oeCejNDompNC2D4BV4eCXrNQruUQ99W6QiXvW5qdYbrUvbf2
         fVX5bSC3Ut41ekGsv9+XM3GCfw8nQG0BiafgbsumVEMDwt5j9QvNRdr9OMvc5vf/G8Fe
         xeL0DvZ3nv5j5Aby9RNiYrve5ko+uSVmHpKqAWo9dv/L/NOpEGJqy2Dq8FVDGdWTZOSH
         587FusJcBhNRuqYJXcGwun0SOClHZYvqtkOUov43+Z3tQ2vQUfXlMxMxIxrKqnBZb+6A
         zVawyNG94Mwk78QZgZ4qsUkEwcBmj6w5u7/BwuX2VFyJxMQtyZIWT6caFTaJoswZPvgz
         VYLw==
X-Gm-Message-State: AOJu0Yx+YH+C2HG766JOQ00shcB1BeY2ETRtjNH1jP6EFfORehUWA2kY
	Vg/2OeYBtzaaZorCPFHomd4QRdi87oxNFubyXExg+HXQgNaBHnLYsmtZ7ESnY5oQ
X-Gm-Gg: ASbGncsRi5q4qTobe0LpR9+7dXPEd8DyFmg+tGCYtTvpDjCqOw8IOjN4EbQkJaV3Mr9
	0P5AWqqDQFcn2ED1XEu+U9z5OyLhicmUbFLJO2fQwH5r4zdOjwA5KjO7f544P5Boha1F3CrsXaB
	Qbx/18WzFVulL8NfDDF7IwF3AkbkX7E7bZbswPecWgsUlbTLjPzkjdxm8HJcu4hEcTxGNPrOSYA
	CbC2Oi+nyL5hkXOboMQaE13mBcR2yl2Ig2X5rLVlYW6HlN6CtzgsrWFJ+A8+8aZ1n/bDY6QV1Nu
	iQ/vBPD+OXHBQTb2cCTcz2AgGqSmNGd/lJgiqX25JEeWTV0e68Sb457xx0EXPBhvTocqtQ+WrVy
	wyTfH7fueNTYgAbXHqL2EToADOwtuGY3K/2xVrZ+8iEHiE+SDs95UMwq8Y5FDVEZTfJSuG/ncf9
	DGAjaomzhi+nBspAFB5vUk5dM=
X-Google-Smtp-Source: AGHT+IHwt6vk8VmzesHqupc9CWtGIpRXFgWrjzbkfViQaduNu7BwQIYBBHFIzzm/6t6eTQZdIdcfQQ==
X-Received: by 2002:a05:600c:c83:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-47904aed270mr73050685e9.12.1764165648812;
        Wed, 26 Nov 2025 06:00:48 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4790add608bsm46676255e9.5.2025.11.26.06.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:00:48 -0800 (PST)
From: stondo@gmail.com
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH v8] ref-manual: Document SPDX 3.0.1 variables
Date: Wed, 26 Nov 2025 15:00:43 +0100
Message-ID: <20251126140043.65629-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 14:00:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8146

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
 documentation/ref-manual/variables.rst | 54 +++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f0a99aafb..e022d6381 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9000,10 +9000,18 @@ system and gives an overview of their function and contents.
 
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
 
    :term:`SPDX_INCLUDE_SOURCES`
       This option allows to add a description of the source files used to build
@@ -9017,7 +9025,7 @@ system and gives an overview of their function and contents.
 
          SPDX_INCLUDE_SOURCES = "1"
 
-      According to our tests on release 4.1 "langdale", building
+      For SPDX 2.2 format (release 4.1 "langdale"), building
       ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
       this option multiplied the total size of the ``tmp/deploy/spdx``
       directory by a factor of 3  (+291 MiB for this image),
@@ -9026,6 +9034,33 @@ system and gives an overview of their function and contents.
       image), compared to just using the :ref:`ref-classes-create-spdx` class
       with no option.
 
+      With SPDX 3.0.1 JSON format, including source files significantly
+      increases the SBOM size (potentially by several gigabytes for typical
+      images).
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
@@ -9053,6 +9088,15 @@ system and gives an overview of their function and contents.
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


