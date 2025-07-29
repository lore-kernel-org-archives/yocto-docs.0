Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA2EC87FCA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 11:30:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.4704.1753788611114244241
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 04:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WAPS5Nge;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AE4943885;
	Tue, 29 Jul 2025 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753788609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w61GcJq4n7hVYK8laVyczIkWfKWZ6vuOfryQIJkNFlI=;
	b=WAPS5NgeTsUbyB1ZgfPIVnukB6MYBKDnI18v55JF7eUTlHVWAYro7smjSXT9BmSTvghGLC
	iRxnyTUNrkOXK/o38nmXDWh7ElFIq3C4hiAhS4oQwZK4yWCrVzBXJfifPa7qLt56crhJ5r
	7jjePyQrQelibRf/kPEEGQpsf0p1/3MvwS6NFAVjx7E1OD0oYyowgs1v6zOG59903peedJ
	UJ5TpqUjziAkZVeHIaGqEzRflBOil9+XPKHpxOow5c0hI455AD5ap4J8kmIkZnnT6x+txW
	BP7Ix1RTPbgRNEA0PYBp6R7APH/Tb1YPWfMdyjFhElMHgpWhDmg5LtmmLAA5dg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 13:30:05 +0200
Subject: [PATCH 4/5] ref-manual/variables.rst: sort variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-variables-checks-v1-4-5ad6ca9b9386@bootlin.com>
References: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
In-Reply-To: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=27194;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=u7YrqemYQroD2QwNnpiuPH6SzXDnZLJe3v+GEzzxvmE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiLDAidtGPWIaQUgPnEM6AcfBzlDe21CUEfDf/
 A8kZyO3pkaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIiwwAAKCRDRgEFAKaOo
 NtzcEAC54+FnrqK5BoslAI/zZ9tGfYSYQKunxRaw9BNVk6w5UQrH1mHb5QIlwL1e2Iq+NyOueQz
 tR29rtJ50oiD9L3GAVvfk1K1WgNDihqO92lq9DNP0x/YrD054cvNTTPEfv2kKsRUX9NIn2mr8VE
 kkhgUODlSjQMY/MqYsgqID6/ClJS8pVdEsx9gUiANg+idoYdMNV5myEaG2esOjhV/GxZdktnwGB
 hHKkFJnqP7rfVeuOuPv2bOun5+yRAEObWy8gAaLkMSdap7dZKXCsIxYOK1kiVDlzYWGlHghE4wx
 TQ19PNPIqlxI+1Bo2eBdpRfCsQFzovOXApAH5bhDSwMiD7+OLfztDd13cNcaKnsZipo1Iz7CkQ8
 YnUy2nxcIeQtWiBH36J6OS7+r0pyB55M2l7w4aUHvLwfueUlbRJfQ3LKQh5CV70Yi9TY0lqWoip
 /lV5xm1QjO+vQoxix9Z+S4Dt5VX5HjdP5+YnRTDx77jZv4l9OjrpRwS05Cunvb7FcKtWFAcKRMX
 AvPN7T9gY2Nz8wtPj4WknGSofWgdyCUr2z/OtimKVys52IGEQWIhCuwxSoE6d1EtkyCxSKnJ/lR
 u4bvnJmCSyiPzjFDfQjg5dPxxmN7o8MmvtSXA6OA+6RyQnq+Ncy1WQdHrsnrYIK7RCZ9Bo0s40Q
 kSD/TjR5paKPyHw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -57
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnegfrhhlucfvnfffucdlqdeimdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegvdethffhkeeikedtveeiledvhfetvdeiffegjeffteekuedvueetiedttdejueenucffohhmrghinhepnhhishhtrdhgohhvpdhmvghsohhnsghuihhlugdrtghomhdprhgvphhrohguuhgtihgslhgvrdhphidpshhpugigrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgpdhurghpihdqghhrohhuphdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghru
 gessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 11:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7417

documentation/scripts/check-glossaries returns:

  WARNING: ref-manual/variables.rst: entries are not properly sorted:
  --- original_list

  +++ sorted_list

  @@ -12,8 +12,8 @@

  ASSUME_PROVIDED
  ASSUME_SHLIBS
  AUTO_LIBNAME_PKGS
  +AUTO_SYSLINUXMENU
  AUTOREV
  -AUTO_SYSLINUXMENU
  AUTOTOOLS_SCRIPT_PATH
  AVAILTUNES
  AZ_SAS
  @@ -28,8 +28,8 @@

  BB_CACHEDIR
  BB_CHECK_SSL_CERTS
  BB_CONSOLELOG
  +BB_CURRENT_MC
  BB_CURRENTTASK
  -BB_CURRENT_MC
  BB_DEFAULT_TASK
  BB_DEFAULT_UMASK
  BB_DEFER_BBCLASSES
  @@ -188,13 +188,13 @@

  CVE_CHECK_REPORT_PATCHED
  CVE_CHECK_SHOW_WARNINGS
  CVE_CHECK_SKIP_RECIPE
  +CVE_CHECK_STATUSMAP
  +CVE_CHECK_VEX_JUSTIFICATION
  CVE_DB_INCR_UPDATE_AGE_THRES
  CVE_DB_UPDATE_INTERVAL
  CVE_PRODUCT
  CVE_STATUS
  CVE_STATUS_GROUPS
  -CVE_CHECK_STATUSMAP
  -CVE_CHECK_VEX_JUSTIFICATION
  CVE_VERSION
  CVSDIR
  CXX
  @@ -254,9 +254,8 @@

  EXCLUDE_FROM_WORLD
  EXTENDPE
  EXTENDPKGV
  +EXTERNAL_KERNEL_DEVICETREE
  EXTERNAL_KERNEL_TOOLS
  -EXTERNAL_KERNEL_DEVICETREE
  -KERNEL_LOCALVERSION
  EXTERNAL_TOOLCHAIN
  EXTERNALSRC
  EXTERNALSRC_BUILD
  @@ -267,8 +266,8 @@

  EXTRA_OECMAKE
  EXTRA_OECONF
  EXTRA_OEMAKE
  +EXTRA_OEMESON
  EXTRA_OESCONS
  -EXTRA_OEMESON
  EXTRA_USERS_PARAMS
  EXTRANATIVEPATH
  FAKEROOT
  @@ -300,8 +299,8 @@

  FIT_KEY_GENRSA_ARGS
  FIT_KEY_REQ_ARGS
  FIT_KEY_SIGN_PKCS
  +FIT_PAD_ALG
  FIT_SIGN_ALG
  -FIT_PAD_ALG
  FIT_SIGN_INDIVIDUAL
  FIT_SIGN_NUMBITS
  FIT_UBOOT_ENV
  @@ -431,6 +430,7 @@

  KERNEL_IMAGE_NAME
  KERNEL_IMAGETYPE
  KERNEL_IMAGETYPES
  +KERNEL_LOCALVERSION
  KERNEL_MODULE_AUTOLOAD
  KERNEL_MODULE_PROBECONF
  KERNEL_PACKAGE_NAME
  @@ -505,15 +505,15 @@

  OBJCOPY
  OBJDUMP
  OE_BINCONFIG_EXTRA_MANGLE
  -OECMAKE_GENERATOR
  OE_INIT_ENV_SCRIPT
  OE_SHARED_UMASK
  OE_TERMINAL
  -OEROOT
  +OECMAKE_GENERATOR
  OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
  OEQA_REPRODUCIBLE_TEST_PACKAGE
  +OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS
  OEQA_REPRODUCIBLE_TEST_TARGET
  -OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS
  +OEROOT
  OLDEST_KERNEL
  OPKG_MAKE_INDEX_EXTRA_PARAMS
  OPKGBUILDCMD
  @@ -691,11 +691,11 @@

  SPDX_ARCHIVE_PACKAGED
  SPDX_ARCHIVE_SOURCES
  SPDX_CUSTOM_ANNOTATION_VARS
  +SPDX_INCLUDE_COMPILED_SOURCES
  SPDX_INCLUDE_SOURCES
  -SPDX_INCLUDE_COMPILED_SOURCES
  SPDX_NAMESPACE_PREFIX
  +SPDX_PACKAGE_URL
  SPDX_PACKAGE_VERSION
  -SPDX_PACKAGE_URL
  SPDX_PRETTY
  SPDXLICENSEMAP
  SPECIAL_PKGSUFFIX
  @@ -707,12 +707,12 @@

  SPL_SIGN_KEYNAME
  SPLASH
  SPLASH_IMAGES
  -SRCREV_FORMAT
  SRC_URI
  SRC_URI_OVERRIDES_PACKAGE_ARCH
  SRCDATE
  SRCPV
  SRCREV
  +SRCREV_FORMAT
  SRCTREECOVEREDTASKS
  SSTATE_DIR
  SSTATE_EXCLUDEDEPS_SYSROOT
  @@ -779,9 +779,9 @@

  TARGET_PREFIX
  TARGET_SYS
  TARGET_VENDOR
  +TC_CXX_RUNTIME
  TCLIBC
  TCMODE
  -TC_CXX_RUNTIME
  TEMPLATECONF
  TEST_EXPORT_DIR
  TEST_EXPORT_ONLY
  @@ -804,9 +804,9 @@

  TOOLCHAIN
  TOOLCHAIN_HOST_TASK
  TOOLCHAIN_HOST_TASK_ESDK
  +TOOLCHAIN_NATIVE
  TOOLCHAIN_OPTIONS
  TOOLCHAIN_OUTPUTNAME
  -TOOLCHAIN_NATIVE
  TOOLCHAIN_TARGET_TASK
  TOPDIR
  TRANSLATED_TARGET_ARCH
  @@ -860,13 +860,13 @@

  UBOOT_SUFFIX
  UBOOT_TARGET
  UBOOT_VERSION
  -UKIFY_CMD
  UKI_CMDLINE
  UKI_CONFIG_FILE
  UKI_FILENAME
  UKI_KERNEL_FILENAME
  UKI_SB_CERT
  UKI_SB_KEY
  +UKIFY_CMD
  UNKNOWN_CONFIGURE_OPT_IGNORE
  UNPACKDIR
  UPDATERCPN
  @@ -897,7 +897,7 @@

  WKS_FILES
  WORKDIR
  XSERVER
  +XZ_MEMLIMIT
  XZ_THREADS
  -XZ_MEMLIMIT
  ZSTD_COMPRESSION_LEVEL
  ZSTD_THREADS

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 258 ++++++++++++++++-----------------
 1 file changed, 129 insertions(+), 129 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 15ca6543a..d559899c6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -209,6 +209,11 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-debian` class to act on all packages that are
       explicitly generated by the recipe.
 
+   :term:`AUTO_SYSLINUXMENU`
+      Enables creating an automatic menu for the syslinux bootloader. You
+      must set this variable in your recipe. The
+      :ref:`ref-classes-syslinux` class checks this variable.
+
    :term:`AUTOREV`
       When :term:`SRCREV` is set to the value of this variable, it specifies to
       use the latest source revision in the repository. Here is an example::
@@ -226,11 +231,6 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/packages:automatically incrementing a package version number`"
       section in the Yocto Project Development Tasks Manual.
 
-   :term:`AUTO_SYSLINUXMENU`
-      Enables creating an automatic menu for the syslinux bootloader. You
-      must set this variable in your recipe. The
-      :ref:`ref-classes-syslinux` class checks this variable.
-
    :term:`AUTOTOOLS_SCRIPT_PATH`
       When using the :ref:`ref-classes-autotools` class, the
       :term:`AUTOTOOLS_SCRIPT_PATH` variable stores the location of the
@@ -400,12 +400,12 @@ system and gives an overview of their function and contents.
    :term:`BB_CONSOLELOG`
       See :term:`bitbake:BB_CONSOLELOG` in the BitBake manual.
 
-   :term:`BB_CURRENTTASK`
-      See :term:`bitbake:BB_CURRENTTASK` in the BitBake manual.
-
    :term:`BB_CURRENT_MC`
       See :term:`bitbake:BB_CURRENT_MC` in the BitBake manual.
 
+   :term:`BB_CURRENTTASK`
+      See :term:`bitbake:BB_CURRENTTASK` in the BitBake manual.
+
    :term:`BB_DEFAULT_TASK`
       See :term:`bitbake:BB_DEFAULT_TASK` in the BitBake manual.
 
@@ -1998,6 +1998,20 @@ system and gives an overview of their function and contents.
       The list of package names (:term:`PN`) for which
       CVEs (Common Vulnerabilities and Exposures) are ignored.
 
+   :term:`CVE_CHECK_STATUSMAP`
+      Mapping variable for all possible reasons of :term:`CVE_STATUS`:
+      ``Patched``, ``Unpatched`` and ``Ignored``.
+      See :ref:`ref-classes-cve-check` or ``meta/conf/cve-check-map.conf`` for more details::
+
+         CVE_CHECK_STATUSMAP[cpe-incorrect] = "Ignored"
+
+   :term:`CVE_CHECK_VEX_JUSTIFICATION`
+      Mapping variable for :term:`CVE_STATUS` reasons
+      (for example ``not-applicable-platform``) to :ref:`ref-classes-vex`
+      justifications. Should be set as follows::
+
+         CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] = "vulnerableCodeNotPresent"
+
    :term:`CVE_DB_INCR_UPDATE_AGE_THRES`
       Specifies the maximum age of the CVE database in seconds for an
       incremental update (instead of a full-download). Use "0" to force a
@@ -2053,20 +2067,6 @@ system and gives an overview of their function and contents.
          CVE_STATUS_PATCHED = "CVE-1234-0003 CVE-1234-0004"
          CVE_STATUS_PATCHED[status] = "fixed-version: Fixed externally"
 
-   :term:`CVE_CHECK_STATUSMAP`
-      Mapping variable for all possible reasons of :term:`CVE_STATUS`:
-      ``Patched``, ``Unpatched`` and ``Ignored``.
-      See :ref:`ref-classes-cve-check` or ``meta/conf/cve-check-map.conf`` for more details::
-
-         CVE_CHECK_STATUSMAP[cpe-incorrect] = "Ignored"
-
-   :term:`CVE_CHECK_VEX_JUSTIFICATION`
-      Mapping variable for :term:`CVE_STATUS` reasons
-      (for example ``not-applicable-platform``) to :ref:`ref-classes-vex`
-      justifications. Should be set as follows::
-
-         CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] = "vulnerableCodeNotPresent"
-
    :term:`CVE_VERSION`
       In a recipe, defines the version used to match the recipe version
       against the version in the `NIST CVE database <https://nvd.nist.gov/>`__
@@ -2816,6 +2816,13 @@ system and gives an overview of their function and contents.
       The dependency relationships are intended to force the package
       manager to upgrade these types of packages in lock-step.
 
+   :term:`EXTERNAL_KERNEL_DEVICETREE`
+      When inheriting :ref:`ref-classes-kernel-fit-image` and a
+      :term:`PREFERRED_PROVIDER` for ``virtual/dtb`` set to ``devicetree``, the
+      variable :term:`EXTERNAL_KERNEL_DEVICETREE` can be used to specify a
+      directory containing one or more compiled device tree or device tree
+      overlays to use.
+
    :term:`EXTERNAL_KERNEL_TOOLS`
       When set, the :term:`EXTERNAL_KERNEL_TOOLS` variable indicates that these
       tools are not in the source tree.
@@ -2826,23 +2833,6 @@ system and gives an overview of their function and contents.
       external tools. See the :ref:`ref-classes-kernel-yocto` class in
       ``meta/classes-recipe`` to see how the variable is used.
 
-   :term:`EXTERNAL_KERNEL_DEVICETREE`
-      When inheriting :ref:`ref-classes-kernel-fit-image` and a
-      :term:`PREFERRED_PROVIDER` for ``virtual/dtb`` set to ``devicetree``, the
-      variable :term:`EXTERNAL_KERNEL_DEVICETREE` can be used to specify a
-      directory containing one or more compiled device tree or device tree
-      overlays to use.
-
-   :term:`KERNEL_LOCALVERSION`
-      This variable allows to append a string to the version
-      of the kernel image. This corresponds to the ``CONFIG_LOCALVERSION``
-      kernel configuration parameter.
-
-      Using this variable is only useful when you are using a kernel recipe
-      inheriting the :ref:`ref-classes-kernel` class, and which doesn't
-      already set a local version. Therefore, setting this variable has no
-      impact on ``linux-yocto`` kernels.
-
    :term:`EXTERNAL_TOOLCHAIN`
       When you intend to use an
       :ref:`external toolchain <dev-manual/external-toolchain:optionally using an external toolchain>`,
@@ -2969,11 +2959,6 @@ system and gives an overview of their function and contents.
       :term:`PARALLEL_MAKEINST` also make use of
       :term:`EXTRA_OEMAKE` to pass the required flags.
 
-   :term:`EXTRA_OESCONS`
-      When inheriting the :ref:`ref-classes-scons` class, this
-      variable specifies additional configuration options you want to pass
-      to the ``scons`` command line.
-
    :term:`EXTRA_OEMESON`
       Additional `Meson <https://mesonbuild.com/>`__ options. See the
       :ref:`ref-classes-meson` class for additional information.
@@ -2988,6 +2973,11 @@ system and gives an overview of their function and contents.
       Note that any custom value for the Meson ``--buildtype`` option
       should be set through the :term:`MESON_BUILDTYPE` variable.
 
+   :term:`EXTRA_OESCONS`
+      When inheriting the :ref:`ref-classes-scons` class, this
+      variable specifies additional configuration options you want to pass
+      to the ``scons`` command line.
+
    :term:`EXTRA_USERS_PARAMS`
       When inheriting the :ref:`ref-classes-extrausers`
       class, this variable provides image level user and group operations.
@@ -3428,16 +3418,16 @@ system and gives an overview of their function and contents.
       The default value is set to "x509" by the
       :ref:`ref-classes-kernel-fit-image` class.
 
-   :term:`FIT_SIGN_ALG`
-      Specifies the signature algorithm used in creating the FIT Image.
-      This variable is set by default to "rsa2048" by the
-      :ref:`ref-classes-kernel-fit-image` class.
-
    :term:`FIT_PAD_ALG`
       Specifies the padding algorithm used in creating the FIT Image.
       The default value is set to "pkcs-1.5" by the
       :ref:`ref-classes-kernel-fit-image` class.
 
+   :term:`FIT_SIGN_ALG`
+      Specifies the signature algorithm used in creating the FIT Image.
+      This variable is set by default to "rsa2048" by the
+      :ref:`ref-classes-kernel-fit-image` class.
+
    :term:`FIT_SIGN_INDIVIDUAL`
       If set to "1", the :ref:`ref-classes-kernel-fit-image` class signs each
       image node individually, including the kernel, DTB, RAM disk, and any
@@ -5243,6 +5233,16 @@ system and gives an overview of their function and contents.
       to image type specified in :term:`KERNEL_IMAGETYPE`. Usually set by the
       machine configuration files.
 
+   :term:`KERNEL_LOCALVERSION`
+      This variable allows to append a string to the version
+      of the kernel image. This corresponds to the ``CONFIG_LOCALVERSION``
+      kernel configuration parameter.
+
+      Using this variable is only useful when you are using a kernel recipe
+      inheriting the :ref:`ref-classes-kernel` class, and which doesn't
+      already set a local version. Therefore, setting this variable has no
+      impact on ``linux-yocto`` kernels.
+
    :term:`KERNEL_MODULE_AUTOLOAD`
       Lists kernel modules that need to be auto-loaded during boot.
 
@@ -6225,16 +6225,6 @@ system and gives an overview of their function and contents.
       :term:`Source Directory` for details on how this class
       applies these additional sed command arguments.
 
-   :term:`OECMAKE_GENERATOR`
-      A variable for the :ref:`ref-classes-cmake` class, allowing to choose
-      which back-end will be generated by CMake to build an application.
-
-      By default, this variable is set to ``Ninja``, which is faster than GNU
-      make, but if building is broken with Ninja, a recipe can use this
-      variable to use GNU make instead::
-
-         OECMAKE_GENERATOR = "Unix Makefiles"
-
    :term:`OE_INIT_ENV_SCRIPT`
       The name of the build environment setup script for the purposes of
       setting up the environment within the extensible SDK. The default
@@ -6265,15 +6255,15 @@ system and gives an overview of their function and contents.
       - konsole
       - none
 
-   :term:`OEROOT`
-      The directory from which the top-level build environment setup script
-      is sourced. The Yocto Project provides a top-level build environment
-      setup script: :ref:`structure-core-script`. When you run this
-      script, the :term:`OEROOT` variable resolves to the directory that
-      contains the script.
+   :term:`OECMAKE_GENERATOR`
+      A variable for the :ref:`ref-classes-cmake` class, allowing to choose
+      which back-end will be generated by CMake to build an application.
 
-      For additional information on how this variable is used, see the
-      initialization script.
+      By default, this variable is set to ``Ninja``, which is faster than GNU
+      make, but if building is broken with Ninja, a recipe can use this
+      variable to use GNU make instead::
+
+         OECMAKE_GENERATOR = "Unix Makefiles"
 
    :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
       Set build target(s) for build reproducibility testing but activate
@@ -6287,14 +6277,24 @@ system and gives an overview of their function and contents.
       See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`
       and :doc:`/test-manual/reproducible-builds`.
 
+   :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`
+      Set build targets which can be rebuilt using :ref:`shared state <overview-manual/concepts:shared state cache>`
+      when running build reproducibility tests. See :doc:`/test-manual/reproducible-builds`.
+
    :term:`OEQA_REPRODUCIBLE_TEST_TARGET`
       Set build target for build reproducibility testing. By default
       all available recipes are compiled with "bitbake world", see also :term:`EXCLUDE_FROM_WORLD`
       and :doc:`/test-manual/reproducible-builds`.
 
-   :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`
-      Set build targets which can be rebuilt using :ref:`shared state <overview-manual/concepts:shared state cache>`
-      when running build reproducibility tests. See :doc:`/test-manual/reproducible-builds`.
+   :term:`OEROOT`
+      The directory from which the top-level build environment setup script
+      is sourced. The Yocto Project provides a top-level build environment
+      setup script: :ref:`structure-core-script`. When you run this
+      script, the :term:`OEROOT` variable resolves to the directory that
+      contains the script.
+
+      For additional information on how this variable is used, see the
+      initialization script.
 
    :term:`OLDEST_KERNEL`
       Declares the oldest version of the Linux kernel that the produced
@@ -8782,27 +8782,6 @@ system and gives an overview of their function and contents.
            }
          ],
 
-   :term:`SPDX_INCLUDE_SOURCES`
-      This option allows to add a description of the source files used to build
-      the host tools and the target packages, to the ``spdx.json`` files in
-      ``tmp/deploy/spdx/MACHINE/recipes/`` under the :term:`Build Directory`.
-      As a consequence, the ``spdx.json`` files under the ``by-namespace`` and
-      ``packages`` subdirectories in ``tmp/deploy/spdx/MACHINE`` are also
-      modified to include references to such source file descriptions.
-
-      Enable this option as follows::
-
-         SPDX_INCLUDE_SOURCES = "1"
-
-      According to our tests on release 4.1 "langdale", building
-      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
-      this option multiplied the total size of the ``tmp/deploy/spdx``
-      directory by a factor of 3  (+291 MiB for this image),
-      and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
-      ``tmp/deploy/images/MACHINE`` by a factor of 130 (+15 MiB for this
-      image), compared to just using the :ref:`ref-classes-create-spdx` class
-      with no option.
-
    :term:`SPDX_INCLUDE_COMPILED_SOURCES`
       This option allows the same as :term:`SPDX_INCLUDE_SOURCES` but including
       only the sources used to compile the host tools and the target packages.
@@ -8825,22 +8804,43 @@ system and gives an overview of their function and contents.
       :term:`SPDX_INCLUDE_SOURCES` reduces the size of the  ``tmp/deploy/spdx``
       directory from 2GB to 1.6GB.
 
+   :term:`SPDX_INCLUDE_SOURCES`
+      This option allows to add a description of the source files used to build
+      the host tools and the target packages, to the ``spdx.json`` files in
+      ``tmp/deploy/spdx/MACHINE/recipes/`` under the :term:`Build Directory`.
+      As a consequence, the ``spdx.json`` files under the ``by-namespace`` and
+      ``packages`` subdirectories in ``tmp/deploy/spdx/MACHINE`` are also
+      modified to include references to such source file descriptions.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_SOURCES = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      this option multiplied the total size of the ``tmp/deploy/spdx``
+      directory by a factor of 3  (+291 MiB for this image),
+      and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
+      ``tmp/deploy/images/MACHINE`` by a factor of 130 (+15 MiB for this
+      image), compared to just using the :ref:`ref-classes-create-spdx` class
+      with no option.
+
    :term:`SPDX_NAMESPACE_PREFIX`
       This option could be used in order to change the prefix of ``spdxDocument``
       and the prefix of ``documentNamespace``. It is set by default to
       ``http://spdx.org/spdxdoc``.
 
-   :term:`SPDX_PACKAGE_VERSION`
-      This variable controls the package version as seen in the SPDX 3.0 JSON
-      output (``software_packageVersion``). The default value for this variable
-      is :term:`PV`.
-
    :term:`SPDX_PACKAGE_URL`
       Provides a place for the SPDX data creator to record the package URL
       string (``software_packageUrl``, in accordance with the Package URL
       specification) for a software Package. The default value of this variable
       is an empty string.
 
+   :term:`SPDX_PACKAGE_VERSION`
+      This variable controls the package version as seen in the SPDX 3.0 JSON
+      output (``software_packageVersion``). The default value for this variable
+      is :term:`PV`.
+
    :term:`SPDX_PRETTY`
       This option makes the SPDX output more human-readable, using
       identation and newlines, instead of the default output in a
@@ -8962,9 +8962,6 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
       section.
 
-   :term:`SRCREV_FORMAT`
-      See :term:`bitbake:SRCREV_FORMAT` in the BitBake manual.
-
    :term:`SRC_URI`
 
       See the BitBake manual for the initial description for this variable:
@@ -9058,6 +9055,9 @@ system and gives an overview of their function and contents.
          ":ref:`dev-manual/packages:automatically incrementing a package version number`"
          section, which is in the Yocto Project Development Tasks Manual.
 
+   :term:`SRCREV_FORMAT`
+      See :term:`bitbake:SRCREV_FORMAT` in the BitBake manual.
+
    :term:`SRCTREECOVEREDTASKS`
       A list of tasks that are typically not relevant (and therefore skipped)
       when building using the :ref:`ref-classes-externalsrc`
@@ -9847,6 +9847,12 @@ system and gives an overview of their function and contents.
    :term:`TARGET_VENDOR`
       Specifies the name of the target vendor.
 
+   :term:`TC_CXX_RUNTIME`
+      Specifies the C/C++ STL and runtime variant to use during
+      the build process. Default value is 'gnu'
+
+      You can select "gnu", "llvm", or "android".
+
    :term:`TCLIBC`
       Specifies the GNU standard C library (``libc``) variant to use during
       the build process.
@@ -9896,12 +9902,6 @@ system and gives an overview of their function and contents.
       up any pre-built objects in the toolchain such as ``libgcc``,
       ``libstdcc++``, any locales, and ``libc``.
 
-   :term:`TC_CXX_RUNTIME`
-      Specifies the C/C++ STL and runtime variant to use during
-      the build process. Default value is 'gnu'
-
-      You can select "gnu", "llvm", or "android".
-
    :term:`TEMPLATECONF`
       Specifies the directory used by the build system to find templates
       from which to build the ``bblayers.conf`` and ``local.conf`` files.
@@ -10201,6 +10201,18 @@ system and gives an overview of their function and contents.
       portion of an eSDK. This is similar to :term:`TOOLCHAIN_HOST_TASK`
       applying to SDKs.
 
+   :term:`TOOLCHAIN_NATIVE`
+      The :term:`TOOLCHAIN_NATIVE` variable can be used to override the
+      toolchain used by a :ref:`ref-classes-native` recipe.
+
+      The default value for this variable is the value of
+      :term:`PREFERRED_TOOLCHAIN` (in :ref:`ref-classes-native` contexts). See
+      the description of :term:`PREFERRED_TOOLCHAIN` to know the list of
+      possible values for :term:`TOOLCHAIN_NATIVE`.
+
+      It is possible to override the value of this variable from a recipe if
+      this recipe is known to support only a specific toolchain.
+
    :term:`TOOLCHAIN_OPTIONS`
       This variable holds extra options passed to the compiler and the linker
       for non ``-native`` recipes as they have to point to their custom
@@ -10223,18 +10235,6 @@ system and gives an overview of their function and contents.
       :term:`SDK_VERSION` variables for additional
       information.
 
-   :term:`TOOLCHAIN_NATIVE`
-      The :term:`TOOLCHAIN_NATIVE` variable can be used to override the
-      toolchain used by a :ref:`ref-classes-native` recipe.
-
-      The default value for this variable is the value of
-      :term:`PREFERRED_TOOLCHAIN` (in :ref:`ref-classes-native` contexts). See
-      the description of :term:`PREFERRED_TOOLCHAIN` to know the list of
-      possible values for :term:`TOOLCHAIN_NATIVE`.
-
-      It is possible to override the value of this variable from a recipe if
-      this recipe is known to support only a specific toolchain.
-
    :term:`TOOLCHAIN_TARGET_TASK`
       This variable lists packages the OpenEmbedded build system uses when
       it creates the target part of an SDK (i.e. the part built for the
@@ -10828,12 +10828,6 @@ system and gives an overview of their function and contents.
       :term:`UBOOT_VERSION` variable contains this information, but can be
       overridden if desired.
 
-   :term:`UKIFY_CMD`
-      When inheriting the :ref:`ref-classes-uki` class,
-      `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build
-      `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
-      Defaults to ``ukify build``.
-
    :term:`UKI_CMDLINE`
       When inheriting the :ref:`ref-classes-uki` class, the kernel command line
       to use when booting the `Unified Kernel Image (UKI)
@@ -10865,6 +10859,12 @@ system and gives an overview of their function and contents.
       secureboot private key to sign the `Unified Kernel Image (UKI)
       <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
 
+   :term:`UKIFY_CMD`
+      When inheriting the :ref:`ref-classes-uki` class,
+      `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build
+      `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``ukify build``.
+
    :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
       Specifies a list of options that, if reported by the configure script
       as being invalid, should not generate a warning during the
@@ -11277,6 +11277,12 @@ system and gives an overview of their function and contents.
       The default value of :term:`XSERVER`, if not specified in the machine
       configuration, is "xserver-xorg xf86-video-fbdev xf86-input-evdev".
 
+   :term:`XZ_MEMLIMIT`
+      Specifies the maximum memory the xz compression should use as a percentage
+      of system memory. If unconstrained the xz compressor can use large amounts of
+      memory and become problematic with parallelism elsewhere in the build.
+      "50%" has been found to be a good value.
+
    :term:`XZ_THREADS`
       Specifies the number of parallel threads that should be used when
       using xz compression.
@@ -11290,12 +11296,6 @@ system and gives an overview of their function and contents.
       On systems where many tasks run in parallel, setting a limit to this
       can be helpful in controlling system resource usage.
 
-   :term:`XZ_MEMLIMIT`
-      Specifies the maximum memory the xz compression should use as a percentage
-      of system memory. If unconstrained the xz compressor can use large amounts of
-      memory and become problematic with parallelism elsewhere in the build.
-      "50%" has been found to be a good value.
-
    :term:`ZSTD_COMPRESSION_LEVEL`
       Specifies the compression level to be used with ZStandard compression
       (from ``1`` to ``19``, set to ``3`` by default, following upstream choice).

-- 
2.50.1


