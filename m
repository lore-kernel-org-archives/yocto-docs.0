Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55EF1098782
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:56:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11971.1774011401169196395
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 05:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IftKJUhG;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b44c0bcdbso1778793f8f.1
        for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 05:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774011399; x=1774616199; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3S2t/Br/aSsstG8zUNA1PnEVuiUPdINknBsGztElP6c=;
        b=IftKJUhGcaryh2bWSXYvzvgwcCPL72oCamWrrSgV1yjoxHFqqHVVS0YtwC2bjhZJ+/
         T1eFpmHrZ2EwcBl+4HkCtMi6ZSZW+hB2Qp/2vRTHjzYzVNO45nGr6+zIHpVsVpSnh0Mg
         CyZ+TfDzqs/AyH7LFRn19t4v916N/NKLNsMhFkrSzEQX6ekuvajxVUVL4Stgsp5Zb4PS
         3alCMhpgjN3CL35d5J10TF7jlLfM1wgLWIw0pq0rdkcKa1iRPM6qknwusNNqhpTP6i0R
         Z4VWKMdmt1xnctyY7hJzTXX7eIS8KgoHJT9qEg5G/tx7BDrULwbJPI32/efE8vGj/iy+
         V/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774011399; x=1774616199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3S2t/Br/aSsstG8zUNA1PnEVuiUPdINknBsGztElP6c=;
        b=YA5eLY9+pf6nR3/JMZlKH4e0BRAim+sUrdSHLdfe3sHCan7EwHwojKAA2Gbdm6fU4g
         LrNAn/xdYFZDj9jaBTff6VCi3idNdYivApuxB6N/fayBKMpGr+SDe+FLAPNG8g+zVgV1
         lB+DVH8YiS8fiW2c2IZWPoUPMlw23gtyE8ISz8CzIWnlDApJDwOoO8OzhfREpWaXHjpi
         mRa0K7/I25KJnsCuFr1GJP8+vyWicqI1yqR2RB0ehPdWkMo+PpbaRMyi00/rtuNrkrTx
         ik+ZFBdJi7Zn6TX0InE5pPjLHaqjZ877Nvdbkhdezt+5UhuVbidLMtJf4hPIAM+zQkCn
         SNuw==
X-Gm-Message-State: AOJu0YwBcUTUKzi9hO+xBUBk/9hssXJ7yJ+pfsS4plF1pbO7LE7a6K02
	yfDRtDL+Dx777316R/SqVmn9HXwagz1m6DolEJ0z+QCmmrOih4j80YIzWrdivg==
X-Gm-Gg: ATEYQzzYszzXX8KHc8gsXJbZUM9aUGD3Mur4bAwTox7z91kaMlvYlpJ64kQHW8XHdIl
	VAlLUxvBcLYQTAo1ovFMSAS5MkAGKMMkW8Y0jlSMnv3Itoc5s6tf6AasbVE4SVIvHrvdAttcSTn
	w9b948DAjr/KWYTmpbAk2aoobGQ3mEZ7HghIDfSYDtlG2ELqOcuG1PKtokRCSe8uZtxbIom8NHe
	KuKPgjVu84/rWSms3G6NY9VThQFJf28sTSXYVGKutVtUMOES/iPP73MH6+drGm/FwuHesK9wOvG
	5aO4HT0S5cX0OAh3uai3ecXom0iDk/NdFrft86X0h9G83zFsyn7Qy21zz+ZYSH/E+v2Yj/j7N//
	fx+Kb3ExDx3+WPDNMmTfn7nOuB+xjn19BoADo1KSrS2F0hj4gtSQ94kIeKagSnFP/58oTextnyD
	XJCH/bpGfEWE34TVYmCzeXyiyr9YztTZaV0KA=
X-Received: by 2002:a05:600c:888b:b0:485:353f:c651 with SMTP id 5b1f17b1804b1-486fee08886mr33484835e9.22.1774011398788;
        Fri, 20 Mar 2026 05:56:38 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1dd9f1sm22157915e9.8.2026.03.20.05.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:56:37 -0700 (PDT)
From: stondo@gmail.com
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v2] ref-manual/dev-manual: document new SPDX variables and capabilities
Date: Fri, 20 Mar 2026 13:56:31 +0100
Message-ID: <20260320125636.65856-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317085735.32664-1-stondo@gmail.com>
References: <20260317085735.32664-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 12:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9112

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Document the new variables and features introduced by the SPDX
enrichment patch series merged in OE-Core:

New variables in ref-manual/variables.rst:
- SPDX_FILE_EXCLUDE_PATTERNS: regex-based file exclusion from SBOM
- SPDX_INCLUDE_BITBAKE_PARENT_BUILD: enable parent build tracking
- SPDX_IMAGE_SUPPLIER: supplier agent for image SBOMs
- SPDX_SDK_SUPPLIER: supplier agent for SDK SBOMs
- SPDX_PACKAGE_SUPPLIER: supplier agent for individual packages
- SPDX_INVOKED_BY: agent that invoked the build
- SPDX_ON_BEHALF_OF: agent on whose behalf the build runs

Updated dev-manual/sbom.rst:
- Add bullet points for file exclusion patterns, supplier
  information, ecosystem-specific PURL enrichment via bbclasses
  (cargo_common, go-mod, pypi, npm, cpan), and build invocation
  traceability (SPDX_INVOKED_BY/SPDX_ON_BEHALF_OF)

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
Changes in v2:
- SPDX_FILE_EXCLUDE_PATTERNS: clarify it only applies when
  SPDX_INCLUDE_SOURCES is enabled (Antonin)
- SPDX_INCLUDE_BITBAKE_PARENT_BUILD: add new glossary entry (Antonin)
- SPDX_IMAGE_SUPPLIER: rewrite to explain the agent PREFIX mechanism
  clearly, add shared-prefix example, state where to set it (Antonin)
- SPDX_INVOKED_BY: use :term: reference for SPDX_INCLUDE_BITBAKE_PARENT_BUILD,
  add CI pipeline example, convert note to warning (Antonin)
- SPDX_ON_BEHALF_OF: add full example, convert note to warning (Antonin)
- SPDX_PACKAGE_SUPPLIER: state where to set it (local.conf / recipe) (Antonin)
- SPDX_SDK_SUPPLIER: clarify it applies to both populate_sdk and
  meta-toolchain (Antonin)
- dev-manual/sbom.rst: add bullet for build invocation traceability (Antonin)

 documentation/dev-manual/sbom.rst      |  18 +++
 documentation/ref-manual/variables.rst | 163 +++++++++++++++++++++++++
 2 files changed, 181 insertions(+)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index 95303ed..e0c3ed6 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -64,6 +64,24 @@ more information in the output :term:`SPDX` data:
 
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
index 9e0c5b0..84715af 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9063,6 +9063,41 @@ system and gives an overview of their function and contents.
            }
          ],
 
+   :term:`SPDX_FILE_EXCLUDE_PATTERNS`
+      A space-separated list of Python regular expressions used to exclude files
+      from the SPDX output when :term:`SPDX_INCLUDE_SOURCES` is enabled.
+      Files whose paths match any of the patterns (via ``re.search``) will be
+      filtered out from the generated SBOM.
+
+      By default this variable is empty, meaning no files are excluded.
+
+      Example usage::
+
+         SPDX_FILE_EXCLUDE_PATTERNS = "\.patch$ \.diff$ /test/ \.pyc$ \.o$"
+
+      See also :term:`SPDX_INCLUDE_SOURCES`.
+
+   :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`
+      When set to ``"1"``, the SPDX output will include a :term:`Build` object
+      representing the parent bitbake invocation. This allows consumers of the
+      SBOM to trace which CI/CD job or orchestration system triggered the build.
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
+      See also :term:`SPDX_INVOKED_BY`, :term:`SPDX_ON_BEHALF_OF`,
+      :term:`SPDX_BUILD_HOST`.
+
    :term:`SPDX_INCLUDE_COMPILED_SOURCES`
       This option allows the same as :term:`SPDX_INCLUDE_SOURCES` but including
       only the sources used to compile the host tools and the target packages.
@@ -9161,6 +9196,72 @@ system and gives an overview of their function and contents.
       increases the SBOM size (potentially by several gigabytes for typical
       images).
 
+   :term:`SPDX_IMAGE_SUPPLIER`
+      The name of an agent variable prefix describing the organization or
+      person who supplies the image SBOM. When set, the supplier is attached
+      to all root elements of the image SBOM using the ``suppliedBy`` property.
+
+      The value of this variable is the BASE PREFIX used to look up the
+      agent's details. The following sub-variables are read using that prefix:
+
+      - ``<PREFIX>_name`` — display name of the supplier (required)
+      - ``<PREFIX>_type`` — agent type: ``organization``, ``person``,
+        ``software``, or ``agent`` (optional, defaults to ``agent``)
+      - ``<PREFIX>_comment`` — free-text comment (optional)
+      - ``<PREFIX>_id_email`` — contact e-mail address (optional)
+
+      The simplest approach is to use the variable itself as its own prefix
+      (set it to its own name), so that the sub-variable names follow
+      directly from ``SPDX_IMAGE_SUPPLIER``:
+
+      Example (set in the image recipe or in ``local.conf``):: 
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
+         SPDX_SDK_SUPPLIER   = "MY_COMPANY"
+
+      Typically set in the image recipe or in ``local.conf`` to apply it to
+      all images.
+
+      If not set, no supplier information is added to the image SBOM.
+
+      See also :term:`SPDX_PACKAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIER`.
+
+   :term:`SPDX_INVOKED_BY`
+      The base variable name describing the Agent that invoked the build.
+      Each Build object in the SPDX output will be linked to this agent
+      with an ``invokedBy`` relationship. Requires
+      :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD` to be set to ``"1"``.
+
+      The sub-variables follow the same agent prefix convention as
+      :term:`SPDX_IMAGE_SUPPLIER`:
+
+      - ``SPDX_INVOKED_BY_name`` — display name of the invoking agent
+      - ``SPDX_INVOKED_BY_type`` — agent type (e.g. ``software`` for a CI system)
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
+         output, because the invoking agent identity will vary across builds.
+
+      See also :term:`SPDX_ON_BEHALF_OF`,
+      :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`.
+
    :term:`SPDX_LICENSES`
       Path to the JSON file containing SPDX license identifier mappings.
       This file maps common license names to official SPDX license
@@ -9189,12 +9290,58 @@ system and gives an overview of their function and contents.
       and the prefix of ``documentNamespace``. It is set by default to
       ``http://spdx.org/spdxdoc``.
 
+   :term:`SPDX_ON_BEHALF_OF`
+      The base variable name describing the Agent on whose behalf the invoking
+      agent (:term:`SPDX_INVOKED_BY`) is running the build. Requires
+      :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD` to be set to ``"1"``.
+      Has no effect if :term:`SPDX_INVOKED_BY` is not also set.
+
+      The sub-variables follow the same agent prefix convention as
+      :term:`SPDX_IMAGE_SUPPLIER`:
+
+      - ``SPDX_ON_BEHALF_OF_name`` — display name of the commissioning agent
+      - ``SPDX_ON_BEHALF_OF_type`` — agent type (e.g. ``organization``)
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
+         output, because the agent identity will vary across builds.
+
+      See also :term:`SPDX_INVOKED_BY`,
+      :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`.
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
+      Typically set in ``local.conf`` to apply globally to all packages, or
+      in a specific software recipe (or a ``.bbappend``) to apply only to
+      packages of that recipe. Recipe-level overrides (``SPDX_PACKAGE_SUPPLIER:pn-<recipe>``) are also supported::
+
+         # local.conf — apply to all packages
+         SPDX_PACKAGE_SUPPLIER = "SPDX_PACKAGE_SUPPLIER"
+         SPDX_PACKAGE_SUPPLIER_name = "Acme Corp"
+         SPDX_PACKAGE_SUPPLIER_type = "organization"
+
+      See also :term:`SPDX_IMAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIER`.
+
    :term:`SPDX_PACKAGE_VERSION`
       This variable controls the package version as seen in the SPDX 3.0 JSON
       output (``software_packageVersion``). The default value for this variable
@@ -9211,6 +9358,22 @@ system and gives an overview of their function and contents.
       this option is recommended if you want to inspect the SPDX
       output files with a text editor.
 
+   :term:`SPDX_SDK_SUPPLIER`
+      The base variable name describing the Agent who supplies the SDK SBOM.
+      When set, the supplier is attached to all root elements of the SDK
+      SBOM using the ``suppliedBy`` property.
+
+      Works identically to :term:`SPDX_IMAGE_SUPPLIER` but applies to SDK
+      builds. This includes image-based SDKs produced by
+      ``bitbake <image> -c populate_sdk`` as well as toolchain SDKs produced
+      by ``bitbake meta-toolchain``.
+
+      Typically set in the image recipe or in ``local.conf``.
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


