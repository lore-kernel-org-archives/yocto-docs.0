Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA67D10F4D
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:46:06 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13083.1764164757929148314
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cCh+dxWk;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so3788215f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 05:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764164756; x=1764769556; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jklwU1+z2UU+pVE7qyJk7L+WPS9uiijxCNDKrsaU+gI=;
        b=cCh+dxWkejvwvZguM1Z8wCXyGy5f5QMSKuUW71ths0nbk0F2LMSOiQXCkN00xREOFb
         d9/cmh08pcIu5yTbDmhY0Rxisf+aIgMuhGkh7qwIURuhHzu7wIzaWQRHsDvKzgvVxIDL
         Kn7iIDzS3qrDA7AUbXPHWhKtPgy4CkpZ4c765aQaBLcZqyOAzKALjtbnmgx6iklDH3NT
         3oyGunLnk1cKeCPw1llRe2DrnsR7jveQxffknDmbJt3o0xwFn2y2eJTZ3D8IKMgzt2ji
         SAyQhtVVF4fkh8nhppEue5/bM0eZIPJoC/SwEe6od4qsGh7hHXCxysh3K2YLPJFH1wWH
         jIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164756; x=1764769556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jklwU1+z2UU+pVE7qyJk7L+WPS9uiijxCNDKrsaU+gI=;
        b=RcOah1qeT+4kPtP38sD/VdiBVytltepU3raqs6gYnglrVxDlC8il0QgojQ5I/4uTRK
         TieTZlmb2TyXZSDhVc20JaDNJqhhRSwNWEM3FBI3t21au5t7K1/Zx2XnzB1OkO9L1OZy
         S7uDFxzA20It2aXhMf5Pmais160ffUy7sG8UK7pRMm2ypBfVdLLS6H+ZGyzwztL7+9xD
         X2+HpS/tvTPc/lyVwkK8Y827Lps3DH29eoRGScNso9Vb0FsOQyyXOPKj/VoDSY5pFS1H
         mwr56ktfMgb+QOdxqu+ldppYseOyzgEVOQV7GqQGJds8LaNNQsajy+RGUWq+SMCh3cxs
         o0iQ==
X-Gm-Message-State: AOJu0Yy3iD8d+kIK2bTHH8Lq6hnKa+cJ8N98Cr3/0MSYlZVDc8AcgPjr
	kyTu37YNxbXL7CmYJEavcGSrJyUIudsyZNq22iA0f4GtYpxuUuV9+V7/ROLhADx1
X-Gm-Gg: ASbGnctDnpbGxhoo1lXG47lgbh0MWNgRQxh/jdi9Q3SlycvqMFHru9Zj0nOJlhyC2QS
	jvPx/VIhDSEUVSXKLCcEP6E6LUXnIKDAdbGgPCEbcrr37U8SzosNvcU8LtN4X75ZjPSvrrNuGCJ
	pvNoYtYVDj69SQygK5Pgat9LmQEILjWTuxWZ1/nR98uXi/VjXqEjw/N5KDh/jTQ92TMsgcFfKuH
	sqPJdzGvpXugMbgV1JxgzB9zkj/obViiJ+tffI+fWQB2G/8pYLwexirBMbJmbE1bcHF5F8jlKZw
	EZxVtjw92y47VreUTK6GIDFeWixD168OA0qNwHmlLUUFbnpYmCzIyhg4QvTQZHPpRuk/9BUxI7R
	69HehesdbPUAmxHgB2YWiOSZ1mPuDctOSMnM9Q2buz1+dX1vRaeoplMxF/1GdYsK4cdaAETpzSf
	PBq2QZA2FJVcjj4JEdWeBOBhk=
X-Google-Smtp-Source: AGHT+IEmUNllPk2EM5avtgrkEAy52v2IJdXfpeWBsq/GnemF0CmWOki5RKVdG/JcgSiNioPUOa8WAw==
X-Received: by 2002:a05:6000:1787:b0:42b:3ed2:c08b with SMTP id ffacd0b85a97d-42cc1d52636mr21273941f8f.51.1764164755608;
        Wed, 26 Nov 2025 05:45:55 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm39317253f8f.21.2025.11.26.05.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 05:45:54 -0800 (PST)
From: stondo@gmail.com
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH v7] ref-manual: Document SPDX 3.0.1 variables
Date: Wed, 26 Nov 2025 14:45:46 +0100
Message-ID: <20251126134546.63941-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8143

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
 documentation/ref-manual/variables.rst | 74 ++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f0a99aafb..610090bcc 100644
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
@@ -9026,6 +9044,43 @@ system and gives an overview of their function and contents.
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
@@ -9053,6 +9108,15 @@ system and gives an overview of their function and contents.
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


