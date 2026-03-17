Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673A3F3381B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:57:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71420.1773737865793888946
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 01:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gTsPXliI;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so2001639f8f.3
        for <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 01:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773737864; x=1774342664; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xCl5gVhMpdHVZOQf5YVlDljAzS+iaSAMCaSzbVBr1cU=;
        b=gTsPXliIZSiVsKW2kYlHx9Nnfksp4iinPFlN2V/VgGtZY4ZmeCzYvaZmraAPdov3tZ
         HBCWDnyJlxd4d25xBPJ2nbweP6ZmIYYjh97K+MRZ6VAJzwqu2poDtCcA+1VYp0tjLpg/
         YmMy6Z1Wk9LgcFsSznN5iytwG5F/D6ptDX6+R+W2g01AGfwIhHj3ZfSRELyn39twjGF3
         Jk7CGWlfgINPWgQA1xPtesOSIXZ9+jFF58Q0RyNT+y5ia5RmrhjbYFJVJFLlFSOf5NCy
         8/jvW2n0AtystXb+BgSUJ3j2UZmxYMMY90hBA2GtShVHk0KjyCKbWOoc7J7sYKYMkRfo
         vr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737864; x=1774342664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCl5gVhMpdHVZOQf5YVlDljAzS+iaSAMCaSzbVBr1cU=;
        b=gysQ6PfuW/sw6rZLmIBCkSjXL6G+XNFfEZG5B9HDR91meCsWBN7zYkPAmB2IU5XGPW
         XLnYQsxpsYNmkhTijvJApp0yDMeQedW8NoO90217hpXVGm6TwLZJFQsrwodqHSDb5bBx
         y80r0dIhciQtTsPSTXfjCLxco3NckmAhdloOPWKRVh8E8FjbOU4mdajOLCgxCzli27aj
         ctv4dYaEXrWQEawFi/Q4Efi8q70sHn0IxzfR8GS2iO1Eps7z0vm8uRcskQFWzEJMbO/N
         SZ261VCTAWJ+l03ZyXvFOrq7n1unO1eCJOSjJ44xNKit8mdyPWlPKNihAwXtRnOdOit5
         lPBg==
X-Gm-Message-State: AOJu0YwmOAdOlyEc/5SP0sRcN3niEeeun6rMSv2ye1y2drV2I3XVvQs6
	Wlw/SGni95S5gl5Z295tmLkDt0Hboav7ZHEwXjxRtjnUMZ9Fg1HSTK1QjjKKwg==
X-Gm-Gg: ATEYQzxhfkofNykDEoeHFMXfrEKgw/PsTo4aa11gydlSCwyBBM3C7G6Z7zg/8mivgrJ
	Awap+gN5ZcrcAEJfrzvhPrhL5rt8V1PQan28kauaOJFv3slZ0zj02RbJIK8+MvAaw/btYv5pE5N
	heYttzRGFkCZBW2CPtj/yQG99/XROaMF/a2ibanhMmq8rD7wB896c5fEDBnE6c6dpGcaR8J1Jpl
	xcKQOLxzJ3a1dAdInNtNhiLy6+L2/Sd5Xv7fmZI4iHsZJjuTz3H+BqR9d074f1iYO8Dp1jZBTcD
	gtGFeDHunqulxxb8rY5swiR1De36+9tfwb105loqrL2FL6tLCWIMFZ4jsHZ04lL0CZGI62M9XFB
	aKyihWa2x2GhVP7WiP2j3YV4gIsJ/Jj2asFINvbCjeAZbvFeA4iC01rZemKbyD1Kv0TkOUZG5rW
	2oNgYq7Ln/BQszhHDM7Tx+2Q5gjaSZ/fmWOyQDVjL7ScxHDz0G+U4qFIDqC8vboC9eseD8nTCgV
	mXNwfnL
X-Received: by 2002:a05:6000:26d1:b0:439:cc06:e134 with SMTP id ffacd0b85a97d-43a04d8ccc6mr30021964f8f.24.1773737863520;
        Tue, 17 Mar 2026 01:57:43 -0700 (PDT)
Received: from fedora (mob-194-230-148-238.cgn.sunrise.net. [194.230.148.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bb90sm51624993f8f.19.2026.03.17.01.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:57:42 -0700 (PDT)
From: stondo@gmail.com
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com
Subject: [docs][PATCH] ref-manual/dev-manual: document new SPDX variables and capabilities
Date: Tue, 17 Mar 2026 09:57:28 +0100
Message-ID: <20260317085735.32664-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 08:57:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9083

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Document the new variables and features introduced by the SPDX
enrichment patch series merged in OE-Core:

New variables in ref-manual/variables.rst:
- SPDX_FILE_EXCLUDE_PATTERNS: regex-based file exclusion from SBOM
- SPDX_IMAGE_SUPPLIER: supplier agent for image SBOMs
- SPDX_SDK_SUPPLIER: supplier agent for SDK SBOMs
- SPDX_PACKAGE_SUPPLIER: supplier agent for individual packages
- SPDX_INVOKED_BY: agent that invoked the build
- SPDX_ON_BEHALF_OF: agent on whose behalf the build runs

Updated dev-manual/sbom.rst:
- Add bullet points for file exclusion patterns, supplier
  information, and ecosystem-specific PURL enrichment via
  bbclasses (cargo_common, go-mod, pypi, npm, cpan)

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 documentation/dev-manual/sbom.rst      | 13 +++++
 documentation/ref-manual/variables.rst | 78 ++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index 95303ed..6aa771e 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -64,6 +64,19 @@ more information in the output :term:`SPDX` data:
 
 -  Add archives of these source files themselves (:term:`SPDX_ARCHIVE_SOURCES`).
 
+-  Exclude specific files from the SPDX output using Python regular expressions
+   (:term:`SPDX_FILE_EXCLUDE_PATTERNS`).
+
+-  Attach supplier information to the image SBOM, SDK SBOM, or individual
+   packages (:term:`SPDX_IMAGE_SUPPLIER`, :term:`SPDX_SDK_SUPPLIER`,
+   :term:`SPDX_PACKAGE_SUPPLIER`).
+
+-  Enrich source downloads with ecosystem-specific Package URLs (PURLs), using
+   the :ref:`ref-classes-cargo_common`, :ref:`ref-classes-go-mod`,
+   :ref:`ref-classes-pypi`, :ref:`ref-classes-npm`, and
+   :ref:`ref-classes-cpan` classes to automatically populate PURL identifiers
+   for the corresponding language ecosystems.
+
 Though the toplevel :term:`SPDX` output is available in
 ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
 generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such as:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9e0c5b0..6f1b5a9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9063,6 +9063,19 @@ system and gives an overview of their function and contents.
            }
          ],
 
+   :term:`SPDX_FILE_EXCLUDE_PATTERNS`
+      A space-separated list of Python regular expressions used to exclude files
+      from the SPDX output. Files whose paths match any of the patterns (via
+      ``re.search``) will be filtered out from the generated SBOM.
+
+      By default this variable is empty, meaning no files are excluded.
+
+      Example usage::
+
+         SPDX_FILE_EXCLUDE_PATTERNS = "\.patch$ \.diff$ /test/ \.pyc$ \.o$"
+
+      See also :term:`SPDX_INCLUDE_SOURCES`.
+
    :term:`SPDX_INCLUDE_COMPILED_SOURCES`
       This option allows the same as :term:`SPDX_INCLUDE_SOURCES` but including
       only the sources used to compile the host tools and the target packages.
@@ -9161,6 +9174,41 @@ system and gives an overview of their function and contents.
       increases the SBOM size (potentially by several gigabytes for typical
       images).
 
+   :term:`SPDX_IMAGE_SUPPLIER`
+      The base variable name describing the Agent (organization or person) who
+      supplies the image SBOM. When set, the supplier will be attached to all
+      root elements of the image SBOM using the ``suppliedBy`` property.
+
+      This variable acts as a prefix for a group of sub-variables that together
+      describe the supplier agent. For example, setting
+      ``SPDX_IMAGE_SUPPLIER = "SPDX_IMAGE_SUPPLIER"`` enables the following
+      variables:
+
+      - ``SPDX_IMAGE_SUPPLIER_name`` — display name of the supplier
+      - ``SPDX_IMAGE_SUPPLIER_type`` — agent type (``organization`` or ``person``)
+
+      Example::
+
+         SPDX_IMAGE_SUPPLIER = "SPDX_IMAGE_SUPPLIER"
+         SPDX_IMAGE_SUPPLIER_name = "Acme Corp"
+         SPDX_IMAGE_SUPPLIER_type = "organization"
+
+      If not set, no supplier information is added to the image SBOM.
+
+      See also :term:`SPDX_PACKAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIER`.
+
+   :term:`SPDX_INVOKED_BY`
+      The base variable name describing the Agent that invoked the build.
+      Builds will be linked to this agent if specified. Requires
+      ``SPDX_INCLUDE_BITBAKE_PARENT_BUILD`` to be set.
+
+      .. note::
+
+         Setting this variable will likely result in non-reproducible SPDX
+         output, because the invoking agent identity will vary across builds.
+
+      See also :term:`SPDX_ON_BEHALF_OF`.
+
    :term:`SPDX_LICENSES`
       Path to the JSON file containing SPDX license identifier mappings.
       This file maps common license names to official SPDX license
@@ -9189,12 +9237,31 @@ system and gives an overview of their function and contents.
       and the prefix of ``documentNamespace``. It is set by default to
       ``http://spdx.org/spdxdoc``.
 
+   :term:`SPDX_ON_BEHALF_OF`
+      The base variable name describing the Agent on whose behalf the invoking
+      Agent (:term:`SPDX_INVOKED_BY`) is running the build. Requires
+      ``SPDX_INCLUDE_BITBAKE_PARENT_BUILD`` to be set.
+
+      .. note::
+
+         Setting this variable will likely result in non-reproducible SPDX
+         output.
+
+      See also :term:`SPDX_INVOKED_BY`.
+
    :term:`SPDX_PACKAGE_URL`
       Provides a place for the SPDX data creator to record the package URL
       string (``software_packageUrl``, in accordance with the Package URL
       specification) for a software Package. The default value of this variable
       is an empty string.
 
+   :term:`SPDX_PACKAGE_SUPPLIER`
+      The base variable name describing the Agent who supplies the artifacts
+      produced by the build. Works identically to :term:`SPDX_IMAGE_SUPPLIER`
+      but applies to individual packages rather than the image SBOM.
+
+      See also :term:`SPDX_IMAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIER`.
+
    :term:`SPDX_PACKAGE_VERSION`
       This variable controls the package version as seen in the SPDX 3.0 JSON
       output (``software_packageVersion``). The default value for this variable
@@ -9211,6 +9278,17 @@ system and gives an overview of their function and contents.
       this option is recommended if you want to inspect the SPDX
       output files with a text editor.
 
+   :term:`SPDX_SDK_SUPPLIER`
+      The base variable name describing the Agent who supplies the SDK SBOM.
+      When set, the supplier will be attached to all root elements of the SDK
+      SBOM using the ``suppliedBy`` property.
+
+      Works identically to :term:`SPDX_IMAGE_SUPPLIER` but for SDK builds.
+
+      If not set, no supplier information is added to the SDK SBOM.
+
+      See also :term:`SPDX_IMAGE_SUPPLIER` and :term:`SPDX_PACKAGE_SUPPLIER`.
+
    :term:`SPDX_UUID_NAMESPACE`
       The namespace used for generating UUIDs in SPDX documents. This
       should be a domain name or unique identifier for your organization
-- 
2.53.0


