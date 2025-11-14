Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F96CCE8D44
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 15:23:35 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.336.1763133805868264280
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 07:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YXzTbOit;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: stondo@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37b9728a353so20115601fa.0
        for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 07:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763133803; x=1763738603; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=65HAi9UfX4mUyFm7qzJHCO3rGTqQy/FwPHFB6g6P15I=;
        b=YXzTbOitvZYbjhBrQyN9xKtSSPsnxqdxCMIGinL2jWtb3OQbeQrqUECE74NjxK/xOM
         jxERTYR6AqJx6DMhOxzHHNYjZanFIQAlbmpcNM0j3Yn9EHX9ATGEZrSCS3Izw3/VwLmr
         Z+EipEPVgiB7XLCCBR0gKA9fqBiCLMFzvAH2d+pG7yi5psRayh+W0M5Wj8QtL63w3PrF
         cmV5Ch+ShVDtEWejtYQx9h2ORoFHTTTyD5fSmImlj4Ou6fdAFi4xuaEwrkDQjLZhvif4
         BXn7CaxxHs861Q7cWg/qCw5aZrnvLJsBFfAcmNwYkVdAOCg82LaiWjEPu1BAEjjAxXU2
         gHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763133803; x=1763738603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65HAi9UfX4mUyFm7qzJHCO3rGTqQy/FwPHFB6g6P15I=;
        b=rPBAd6eb360jfRrfRC1VRElwm7WG5vkOC0j5VYkKq0oowp20AqSJxRSp1JwdH7X0Em
         pziW1Gjo0f2b3rqNHQETznX3fTojHc7I/D7/gtRQLZ2ifwCjRhYsEnBkkKXJaoAAlCAn
         T41t91SCgInluKiNBtYyYBX++Wp5yaUQEN2drKQWTP9NMfSItmafImIr6cvtxKkTn1LN
         3XZ1B2UrHxjHEnC4WbxGeCo+/2Yh77Os63O+bVtAtEzfYDTlVIvVlDQFFZoj9DvbHNiy
         EQAFXo4T1lTdTEheizZguKda/Gbbifr+GXYcRIuScJm1pli2JNBKjiMT9vfgHPXBmRWs
         BQcQ==
X-Gm-Message-State: AOJu0YzSmmB55yCsqqWO4CFm21DZdUUKrXnEEAwwhZeYF+oO68WnV+xy
	ssUnYNdbBXWmtRuSxgTol3eMa4UY3sY6MNo5Uodj0a00Sj4o6b+G4Z8DqvIN4xij
X-Gm-Gg: ASbGnct6sKQZfW4V8SoBmTQBlkKTunwH79nn1mPOtUuGv2v+EwyEaI/cKAHedAQIw7I
	9t+vIVeFIyp47RD/3lD6yVBwWvAIgR7pXYhKbDDBYHVmR++Aromsavo26o9y9JVT9pYkps+u89N
	rr3/zYQaJ+50ZSgfTMLmvu3+KVhuizyh/93jxGQpAgEhjaL+dWpKwvBBq1r9s41o6nVttiNJlNK
	Ir3HvHE734IyU3gdyht17lE0kqADo6ZyadiZEkvKReF3zy+tFirEO9r/lXh2pAZvqHtaChSPAMD
	ZgHiJ+381L7KKkp3Y4ZPt/3Gv9FDOk815UQ/SrnurCu0lN62qju41n7nmg8bGENEgpbyWgtNMVy
	rrpvofNVV55hmuvbF05UZZqWh4OA860RRACoLjTxl3jKwIvnRpGrbsC9AcGtTP+lAP18ChAbjuq
	/EUKkNwldxUrxIDSkuxibVR7A=
X-Google-Smtp-Source: AGHT+IFnWYWHNvJ63GAUs//0f3TBNxhYoGXrzMrkENMePGgvCp0YwXjrlGkXIBvSznIbJ2uYLMuKLA==
X-Received: by 2002:a17:907:6e90:b0:b70:e15b:286a with SMTP id a640c23a62f3a-b7367c2938amr345339866b.57.1763131944713;
        Fri, 14 Nov 2025 06:52:24 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b734fda8bc8sm402985566b.49.2025.11.14.06.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:52:24 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Stefano Tondo <stefano.tondo.ext@siemens.com>,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [docs] ref-manual: Document SPDX 3.0.1 variables
Date: Fri, 14 Nov 2025 15:52:17 +0100
Message-ID: <20251114145220.71823-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 15:23:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8045

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add comprehensive documentation for SPDX-related variables in the
Yocto reference manual. This includes documenting previously
undocumented variables and updating existing documentation with
SPDX 3.0.1 specific information.

Variables documented:
- SPDX_INCLUDE_SOURCES: Control source file inclusion in SBOM
  Updated with concrete SPDX 3.0.1 size data (~260 MB without sources,
  ~2.5-2.6 GB with sources)
- SPDX_INCLUDE_COMPILED_SOURCES: Control compiled source inclusion
- SPDX_UUID_NAMESPACE: Namespace for UUID generation in SPDX documents
- SPDX_NAMESPACE_PREFIX: URI prefix for SPDX documents
- SPDX_PRETTY: JSON output formatting control
- SPDX_LICENSES: Path to SPDX license identifier mapping file
- SPDX_CUSTOM_ANNOTATION_VARS: Custom annotation variables
- SPDX_MULTILIB_SSTATE_ARCHS: Architecture list for dependency collection

These variables are defined in meta/classes/spdx-common.bbclass and
are now properly documented in the reference manual with detailed
descriptions and practical usage information.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 documentation/ref-manual/variables.rst | 186 ++++---------------------
 1 file changed, 30 insertions(+), 156 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a80ef364e..6a4472531 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1526,11 +1526,6 @@ system and gives an overview of their function and contents.
    :term:`CC`
       The minimal command and arguments used to run the C compiler.
 
-   :term:`CCACHE_DISABLE`
-      When inheriting the :ref:`ref-classes-ccache` class, the
-      :term:`CCACHE_DISABLE` variable can be set to "1" in a recipe to disable
-      `Ccache` support. This is useful when the recipe is known to not support it.
-
    :term:`CCLD`
       The minimal command and arguments used to run the linker when the C
       compiler is being used as the linker.
@@ -3961,70 +3956,6 @@ system and gives an overview of their function and contents.
       material for Wic is located in the
       ":doc:`/ref-manual/kickstart`" chapter.
 
-   :term:`IMAGE_EXTRA_PARTITION_FILES`
-      A space-separated list of files installed into the extra partition(s)
-      when preparing an image using the Wic tool with the
-      ``extra_partition`` source plugin. By default,
-      the files are
-      installed under the same name as the source files. To change the
-      installed name, separate it from the original name with a semi-colon
-      (;). Source files need to be located in
-      :term:`DEPLOY_DIR_IMAGE`. Here is an
-      example::
-
-         IMAGE_EXTRA_PARTITION_FILES = "foobar file.conf;config"
-
-      In the above example, the file ``foobar`` is installed with its original name
-      ``foobar``, while the file ``file.conf`` is installed and renamed to ``config``.
-
-      Alternatively, source files can be picked up using a glob pattern.
-      However, hidden files are ignored, and the pattern is non-recursive
-      (subdirectories are ignored).
-      The destination file will have the same name as the base
-      name of the source file path. To install files into a renamed directory
-      within the target location, pass its name after a semi-colon (;).
-      Here are two examples::
-
-         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
-         IMAGE_EXTRA_PARTITION_FILES = "foo/*;bar/"
-
-      The first line in this example
-      installs all files from ``foo`` directory
-      into the root of the target partition. The second line in this example installs
-      the same files into a ``bar`` directory within the target partition.
-      The ``bar/`` directory is automatically created if it does not exist.
-
-      You can also specify the target by label, UUID or partition name if multiple
-      extra partitions coexist. Let's take the following example. This would be
-      the WKS file for the image currently being built::
-
-         part --source extra_partition --fstype=ext4 --label foo
-         part --source extra_partition --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d
-         part --source extra_partition --fstype=ext4 --part-name config
-
-      And the following configuration::
-
-         IMAGE_EXTRA_PARTITION_FILES_label-foo = "foo/*"
-         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "foo/*;bar/"
-         IMAGE_EXTRA_PARTITION_FILES_part-name-config = "config"
-
-      Then:
-
-      -  The partition labeled "foo" would get all files from the ``foo``
-         directory.
-
-      -  The partition whose UUID is "e7d0824e-cda3-4bed-9f54-9ef5312d105d"
-         would get all files from the ``foo`` directory, installed into a
-         ``bar`` directory.
-
-      -  The partition named "config" would get the file ``config``.
-
-      You can find information on how to use the Wic tool in the
-      ":ref:`dev-manual/wic:creating partitioned images using wic`"
-      section of the Yocto Project Development Tasks Manual. Reference
-      material for Wic is located in the
-      ":doc:`/ref-manual/kickstart`" chapter.
-
    :term:`IMAGE_FEATURES`
       The primary list of features to include in an image. Typically, you
       configure this variable in an image recipe. Although you can use this
@@ -5523,7 +5454,7 @@ system and gives an overview of their function and contents.
       information on how this variable is used.
 
    :term:`LAYERDEPENDS`
-      Lists the layers, separated by spaces, on which this layer depends.
+      Lists the layers, separated by spaces, on which this recipe depends.
       Optionally, you can specify a specific layer version for a dependency
       by adding it to the end of the layer name. Here is an example::
 
@@ -7940,16 +7871,6 @@ system and gives an overview of their function and contents.
    :term:`REPODIR`
       See :term:`bitbake:REPODIR` in the BitBake manual.
 
-   :term:`REQUIRED_COMBINED_FEATURES`
-      When inheriting the :ref:`ref-classes-features_check` class, this variable
-      identifies combined features (the intersection of :term:`MACHINE_FEATURES`
-      and :term:`DISTRO_FEATURES`) that must exist in the current configuration
-      in order for the :term:`OpenEmbedded Build System` to build the recipe. In
-      other words, if the :term:`REQUIRED_COMBINED_FEATURES` variable lists a
-      feature that does not appear in :term:`COMBINED_FEATURES` within the
-      current configuration, then the recipe will be skipped, and if the build
-      system attempts to build the recipe then an error will be triggered.
-
    :term:`REQUIRED_DISTRO_FEATURES`
       When inheriting the :ref:`ref-classes-features_check`
       class, this variable identifies distribution features that must exist
@@ -7960,41 +7881,6 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
-   :term:`REQUIRED_IMAGE_FEATURES`
-      When inheriting the :ref:`ref-classes-features_check` class, this variable
-      identifies image features that must exist in the current
-      configuration in order for the :term:`OpenEmbedded Build System` to build
-      the recipe. In other words, if the :term:`REQUIRED_IMAGE_FEATURES` variable
-      lists a feature that does not appear in :term:`IMAGE_FEATURES` within the
-      current configuration, then the recipe will be skipped, and if the build
-      system attempts to build the recipe then an error will be triggered.
-
-      Compared to other ``REQUIRED_*_FEATURES`` variables, the
-      :term:`REQUIRED_IMAGE_FEATURES` varible only targets image recipes, as the
-      :term:`IMAGE_FEATURES` variable is handled by the :ref:`ref-classes-core-image`
-      class). However, the :term:`REQUIRED_IMAGE_FEATURES` varible can also be
-      set from a :term:`Configuration File`, such as a distro
-      configuration file, if the list of required image features should apply to
-      all images using this :term:`DISTRO`.
-
-   :term:`REQUIRED_MACHINE_FEATURES`
-      When inheriting the :ref:`ref-classes-features_check` class, this variable
-      identifies :term:`MACHINE_FEATURES` that must exist in the current
-      configuration in order for the :term:`OpenEmbedded Build System` to build
-      the recipe. In other words, if the :term:`REQUIRED_MACHINE_FEATURES` variable
-      lists a feature that does not appear in :term:`MACHINE_FEATURES` within the
-      current configuration, then the recipe will be skipped, and if the build
-      system attempts to build the recipe then an error will be triggered.
-
-   :term:`REQUIRED_TUNE_FEATURES`
-      When inheriting the :ref:`ref-classes-features_check` class, this variable
-      identifies tune features that must exist in the current configuration in
-      order for the :term:`OpenEmbedded Build System` to build the recipe. In
-      other words, if the :term:`REQUIRED_TUNE_FEATURES` variable lists a
-      feature that does not appear in :term:`TUNE_FEATURES` within the current
-      configuration, then the recipe will be skipped, and if the build system
-      attempts to build the recipe then an error will be triggered.
-
    :term:`REQUIRED_VERSION`
       If there are multiple versions of a recipe available, this variable
       determines which version should be given preference.
@@ -8962,10 +8848,21 @@ system and gives an overview of their function and contents.
 
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
@@ -8979,8 +8876,8 @@ system and gives an overview of their function and contents.
 
          SPDX_INCLUDE_SOURCES = "1"
 
-      According to our tests on release 4.1 "langdale", building
-      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      According to our tests on release 4.1 "langdale" (SPDX 2.2 format),
+      building ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
       this option multiplied the total size of the ``tmp/deploy/spdx``
       directory by a factor of 3  (+291 MiB for this image),
       and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
@@ -8988,6 +8885,17 @@ system and gives an overview of their function and contents.
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
    :term:`SPDX_NAMESPACE_PREFIX`
       This option could be used in order to change the prefix of ``spdxDocument``
       and the prefix of ``documentNamespace``. It is set by default to
@@ -10906,12 +10814,6 @@ system and gives an overview of their function and contents.
       Please see the "Selection of Processor Architecture and Board Type"
       section in the U-Boot README for valid values for this variable.
 
-   :term:`UBOOT_MAKE_OPTS`
-      The :term:`UBOOT_MAKE_OPTS` variable can be used to pass extra options to
-      ``make`` when U-Boot is configured and compiled.
-
-      See the :ref:`ref-classes-uboot-config` class for more information.
-
    :term:`UBOOT_MAKE_TARGET`
       Specifies the target called in the ``Makefile``. The default target
       is "all".
@@ -11034,22 +10936,6 @@ system and gives an overview of their function and contents.
       `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
       Defaults to ``ukify build``.
 
-   :term:`UNINATIVE_CHECKSUM`
-      When inheriting the :ref:`ref-classes-uninative` class, the
-      :term:`UNINATIVE_CHECKSUM` variable flags contain the checksums of the
-      uninative tarball as specified by the :term:`UNINATIVE_URL` variable.
-      There should be one checksum per tarballs published at
-      :term:`UNINATIVE_URL`, which match architectures. For example::
-
-         UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
-         UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
-         UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
-
-   :term:`UNINATIVE_URL`
-      When inheriting the :ref:`ref-classes-uninative` class, the
-      :term:`UNINATIVE_URL` variable contains the URL where the uninative
-      tarballs are published.
-
    :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
       Specifies a list of options that, if reported by the configure script
       as being invalid, should not generate a warning during the
@@ -11069,7 +10955,7 @@ system and gives an overview of their function and contents.
 
    :term:`UNPACKDIR`
       This variable, used by the :ref:`ref-classes-base` class,
-      specifies where fetched sources should be unpacked by the
+      specifies where fetches sources should be unpacked by the
       :ref:`ref-tasks-unpack` task.
 
    :term:`UPDATERCPN`
@@ -11145,18 +11031,6 @@ system and gives an overview of their function and contents.
       the Yocto Project Development Tasks Manual for information on how to
       use this variable.
 
-   :term:`USE_NLS`
-      Determine if language translations should be built for recipes that can
-      build them. This variable can be equal to:
-
-      -  ``yes``: translations are enabled.
-      -  ``no``: translation are disabled.
-
-      Recipes can use the value of this variable to enable language
-      translations in their build. Classes such as :ref:`ref-classes-gettext`
-      use the value of this variable to enable :wikipedia:`Gettext <Gettext>`
-      support.
-
    :term:`USE_VT`
       When using
       :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,
-- 
2.51.1


