Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257AFF4610F
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:32:05 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17598.1774272713071361967
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 06:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SBSmbYBC;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439d8df7620so2729450f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 06:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272711; x=1774877511; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oy5d9H93/ULY4gl5tlbBAursfZcf62l59PlVCsZxOW0=;
        b=SBSmbYBCHatW+hCW+L30gk5K55fe5ALnaA7V8N5/b36IBxNz0hdJ1Uxn8FC9eUoGMF
         PZNHt+Z/pZaeZqKLuTYXC7Huajl8HiOc5BAQqCvZoJRTWZRcyheHKeerBxvO3KHPL7NM
         Ruk9oXbZPeYBxI7UID3dQpV7jrAxLEcTHv0snMYGJ+UREeBN9hy1UhnYhFg11sxj4GHb
         CaQQKYPxnc+j/RfL9kLTOSOEmQmACeb1JcNK8qx80aHrgvJONRa3pam6WJzPuz0yjMLz
         zwD7UnEPrGGtP0PtmCDKD326j+SFM3sCMk1ffvb1XwNo+nJKsxq7tNF1ul06GC8EhBTi
         mpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272711; x=1774877511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oy5d9H93/ULY4gl5tlbBAursfZcf62l59PlVCsZxOW0=;
        b=SvxIQWUIt8J2uKMaY2CIbesvgwFHkPmEE/fl5BjUWNq6kbXS4/zR15NVVw50YS2ZBz
         8/Q+GuNPHpJsq9zGI0S5ueyA2iYugfTd9kPO203oL2rzXePe7LfGmBQbgytQD+/5foww
         c0OKN4yiulx8Rposi7ZyGD6MgJDQaKJd2347xcA3YV+9lWHMT/lVEkIPsWFG6BpM8xd7
         Jl7KzGQrUyXS44Lv5LCa7/HWG9bujwEKXumjLptzH2Ix8PJIfYhbYQM32OJoeKI0dyCx
         ULCLykthUNKDhimxNADr8Y9VSnAXleI82dfGmKdOTP2RJfKEf3qErvvNfg1izJzBpw+e
         doMA==
X-Gm-Message-State: AOJu0Yz4UcMgYSZCWt2qnyW7sZWAZb/XJl92LBZaowOVMgPS0yX1f1Tf
	P9JO/QpwGJD/VCcyPFThhAJZ35Px0F7KD0Bj4vYzq9rnCTXtS4clbDSlYF3SOQ==
X-Gm-Gg: ATEYQzxO9ly0OMt0wJxy/zB6kXKW9CP1swV+F/XS0gjGrc3OY0A8Y7+lZxycA6bq1lD
	HqRsETwiGq+XPoAlflhlqcLtgFcmflwwLu7knFjkl6asyCo6wEDaSEGMpEK8lfkBEUsfursx9zn
	qJMdl8TLbNLYsp8a7ill2GShZ35Qkx6gBn6SGxRtorI8WCOy2GvlzOOA1cM0EBRroJ2m7jXvVx4
	U5ISNk/UWWhI4lAEw3kj2ozuOaLD572gd3tix139l6T170mtSuHy4p/QAEgf2DWpsoIbp+mErCT
	WTXeosbZceO3nHfnCdPYZyDRJPI9H+A8aWqQv9AqPD2gTQ/2t6YX08M+Igf6nrahF3EolFu+T8D
	8UYs7sgZT4mkgFoV0qOyWIbDC+3SngA5k0Oo4kPOtxT99YcgMiwSiUH7z5rVHIvBApcYjhcNwRM
	lw+YX3yarTgIf7PGCDlIsVYYD2KiaXcNH6fFZVSMdaUhmdQLnnj5weD8JPun9AxEI=
X-Received: by 2002:a05:6000:3104:b0:43b:3cdc:9414 with SMTP id ffacd0b85a97d-43b6423d93amr19553318f8f.10.1774272710812;
        Mon, 23 Mar 2026 06:31:50 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae16fsm30649042f8f.8.2026.03.23.06.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:31:49 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v3 1/1] ref-manual/dev-manual: document new SPDX variables and capabilities
Date: Mon, 23 Mar 2026 14:31:43 +0100
Message-ID: <20260323133143.1185958-2-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323133143.1185958-1-stefano.tondo.ext@siemens.com>
References: <20260323133143.1185958-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 13:32:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9126

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 documentation/dev-manual/sbom.rst      |  18 +++
 documentation/ref-manual/variables.rst | 177 +++++++++++++++++++++++++
 2 files changed, 195 insertions(+)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index 8452fb12b..76ab9e051 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -58,6 +58,24 @@ more information in the output :term:`SPDX` data:
 
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
+-  Record which agent invoked the build and on whose behalf it ran, enabling
+   CI/CD traceability in the SBOM
+   (:term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`, :term:`SPDX_INVOKED_BY`,
+   :term:`SPDX_ON_BEHALF_OF`).
+
 Though the toplevel :term:`SPDX` output is available in
 ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
 generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such as:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4d8a35473..e4e5a930b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8981,6 +8981,22 @@ system and gives an overview of their function and contents.
       (+ 0.07\% with the tested image), compared to just enabling
       :term:`SPDX_INCLUDE_SOURCES`.
 
+   :term:`SPDX_BUILD_HOST`
+      The base variable name describing the build host on which the build is
+      running. The value must name a key from ``SPDX_IMPORTS``, allowing
+      the generated SPDX to reference externally defined host identity data.
+
+      Requires :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD` to be set to ``"1"``.
+
+      .. warning::
+
+         Setting this variable will result in non-reproducible SPDX output,
+         because the build host identity may vary across builds.
+
+      See also :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`,
+      ``SPDX_IMPORTS``, :term:`SPDX_INVOKED_BY`,
+      and :term:`SPDX_ON_BEHALF_OF`.
+
    :term:`SPDX_CUSTOM_ANNOTATION_VARS`
       This option allows to associate `SPDX annotations
       <https://spdx.github.io/spdx-spec/v2.3/annotations/>`__ to a recipe,
@@ -9007,6 +9023,78 @@ system and gives an overview of their function and contents.
            }
          ],
 
+   :term:`SPDX_FILE_EXCLUDE_PATTERNS`
+      A space-separated list of Python regular expressions used to exclude files
+      from the SPDX output when :term:`SPDX_INCLUDE_SOURCES` is enabled.
+      Files whose paths match any of the patterns, via ``re.search()``, are
+      filtered out from the generated SBOM.
+
+      By default this variable is empty, meaning no files are excluded.
+
+      Example usage::
+
+         SPDX_FILE_EXCLUDE_PATTERNS = "\\.patch$ \\.diff$ /test/ \\.pyc$ \\.o$"
+
+      See also :term:`SPDX_INCLUDE_SOURCES`.
+
+   :term:`SPDX_IMAGE_SUPPLIER`
+      The name of an agent variable prefix describing the organization or
+      person who supplies the image SBOM. When set, the supplier is attached
+      to all root elements of the image SBOM using the ``suppliedBy`` property.
+
+      The value of this variable is the base prefix used to look up the
+      agent's details. The following sub-variables are read using that prefix:
+
+      - ``<PREFIX>_name``: display name of the supplier (required)
+      - ``<PREFIX>_type``: agent type: ``organization``, ``person``,
+        ``software``, or ``agent`` (optional, defaults to ``agent``)
+      - ``<PREFIX>_comment``: free-text comment (optional)
+      - ``<PREFIX>_id_email``: contact e-mail address (optional)
+
+      The simplest approach is to use the variable itself as its own prefix,
+      so the sub-variable names follow directly from
+      ``SPDX_IMAGE_SUPPLIER``.
+
+      Example (set in the image recipe or in a :term:`configuration file`)::
+
+         SPDX_IMAGE_SUPPLIER = "SPDX_IMAGE_SUPPLIER"
+         SPDX_IMAGE_SUPPLIER_name = "Acme Corp"
+         SPDX_IMAGE_SUPPLIER_type = "organization"
+
+      Alternatively, you can use any other prefix name, which is useful for
+      sharing an agent definition across multiple supplier variables::
+
+         MY_COMPANY_name = "Acme Corp"
+         MY_COMPANY_type = "organization"
+         SPDX_IMAGE_SUPPLIER = "MY_COMPANY"
+         SPDX_SDK_SUPPLIER = "MY_COMPANY"
+
+      If not set, no supplier information is added to the image SBOM.
+
+      See also :term:`SPDX_PACKAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIER`.
+
+   :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`
+      When set to ``"1"``, the SPDX output will include a ``Build`` object
+      representing the parent :term:`BitBake` invocation. This allows consumers
+      of the SBOM to trace which CI/CD job or orchestration system triggered
+      the build.
+
+      This variable is required for :term:`SPDX_INVOKED_BY`,
+      :term:`SPDX_ON_BEHALF_OF`, and :term:`SPDX_BUILD_HOST` to have any
+      effect.
+
+      .. warning::
+
+         Enabling this variable will result in non-reproducible SPDX output,
+         because the build invocation identity changes with every run.
+
+      Enable as follows::
+
+         SPDX_INCLUDE_BITBAKE_PARENT_BUILD = "1"
+
+      See also :term:`SPDX_BUILD_HOST`, :term:`SPDX_INVOKED_BY`,
+      and :term:`SPDX_ON_BEHALF_OF`.
+
    :term:`SPDX_INCLUDE_COMPILED_SOURCES`
       This option allows the same as :term:`SPDX_INCLUDE_SOURCES` but including
       only the sources used to compile the host tools and the target packages.
@@ -9062,6 +9150,33 @@ system and gives an overview of their function and contents.
       increases the SBOM size (potentially by several gigabytes for typical
       images).
 
+   :term:`SPDX_INVOKED_BY`
+      The base variable name describing the agent that invoked the build.
+      Each ``Build`` object in the SPDX output is linked to this agent with an
+      ``invokedBy`` relationship. Requires
+      :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD` to be set to ``"1"``.
+
+      The sub-variables follow the same agent prefix convention as
+      :term:`SPDX_IMAGE_SUPPLIER`:
+
+      - ``SPDX_INVOKED_BY_name``: display name of the invoking agent
+      - ``SPDX_INVOKED_BY_type``: agent type, such as ``software`` for a CI system
+
+      Example (CI pipeline invoking the build)::
+
+         SPDX_INCLUDE_BITBAKE_PARENT_BUILD = "1"
+         SPDX_INVOKED_BY = "SPDX_INVOKED_BY"
+         SPDX_INVOKED_BY_name = "GitLab CI"
+         SPDX_INVOKED_BY_type = "software"
+
+      .. warning::
+
+         Setting this variable will likely result in non-reproducible SPDX
+         output, because the invoking agent identity varies across builds.
+
+      See also :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`,
+      :term:`SPDX_ON_BEHALF_OF`, and :term:`SPDX_BUILD_HOST`.
+
    :term:`SPDX_LICENSES`
       Path to the JSON file containing SPDX license identifier mappings.
       This file maps common license names to official SPDX license
@@ -9090,6 +9205,52 @@ system and gives an overview of their function and contents.
       and the prefix of ``documentNamespace``. It is set by default to
       ``http://spdx.org/spdxdoc``.
 
+   :term:`SPDX_ON_BEHALF_OF`
+      The base variable name describing the agent on whose behalf the invoking
+      agent (:term:`SPDX_INVOKED_BY`) is running the build. Requires
+      :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD` to be set to ``"1"``.
+      Has no effect if :term:`SPDX_INVOKED_BY` is not also set.
+
+      The sub-variables follow the same agent prefix convention as
+      :term:`SPDX_IMAGE_SUPPLIER`:
+
+      - ``SPDX_ON_BEHALF_OF_name``: display name of the commissioning agent
+      - ``SPDX_ON_BEHALF_OF_type``: agent type, such as ``organization``
+
+      Example (CI system building on behalf of a customer organization)::
+
+         SPDX_INCLUDE_BITBAKE_PARENT_BUILD = "1"
+         SPDX_INVOKED_BY = "SPDX_INVOKED_BY"
+         SPDX_INVOKED_BY_name = "GitLab CI"
+         SPDX_INVOKED_BY_type = "software"
+         SPDX_ON_BEHALF_OF = "SPDX_ON_BEHALF_OF"
+         SPDX_ON_BEHALF_OF_name = "Acme Corp"
+         SPDX_ON_BEHALF_OF_type = "organization"
+
+      .. warning::
+
+         Setting this variable will likely result in non-reproducible SPDX
+         output, because the agent identity varies across builds.
+
+      See also :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`,
+      :term:`SPDX_INVOKED_BY`, and :term:`SPDX_BUILD_HOST`.
+
+   :term:`SPDX_PACKAGE_SUPPLIER`
+      The base variable name describing the agent who supplies the artifacts
+      produced by the build. Works identically to :term:`SPDX_IMAGE_SUPPLIER`
+      but applies to individual packages rather than the image SBOM.
+
+      Typically set in a distro :term:`configuration file` to apply globally
+      to all packages, or in a specific software recipe (or a ``.bbappend``)
+      to apply only to packages of that recipe. Recipe-level overrides
+      (``SPDX_PACKAGE_SUPPLIER:pn-<recipe>``) are also supported::
+
+         SPDX_PACKAGE_SUPPLIER = "SPDX_PACKAGE_SUPPLIER"
+         SPDX_PACKAGE_SUPPLIER_name = "Acme Corp"
+         SPDX_PACKAGE_SUPPLIER_type = "organization"
+
+      See also :term:`SPDX_IMAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIER`.
+
    :term:`SPDX_PACKAGE_URL`
       Provides a place for the SPDX data creator to record the package URL
       string (``software_packageUrl``, in accordance with the Package URL
@@ -9112,6 +9273,22 @@ system and gives an overview of their function and contents.
       this option is recommended if you want to inspect the SPDX
       output files with a text editor.
 
+   :term:`SPDX_SDK_SUPPLIER`
+      The base variable name describing the agent who supplies the SDK SBOM.
+      When set, the supplier is attached to all root elements of the SDK
+      SBOM using the ``suppliedBy`` property.
+
+      Works identically to :term:`SPDX_IMAGE_SUPPLIER` but applies to SDK
+      builds. This includes image-based SDKs produced by
+      ``bitbake <image> -c populate_sdk`` as well as toolchain SDKs produced
+      by ``bitbake meta-toolchain``.
+
+      Typically set in the image recipe or in a :term:`configuration file`.
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


