Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDD3C021A8
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 08:23:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.6627.1739435003584035753
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 00:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mmIH74PB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE28F20454;
	Thu, 13 Feb 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739435002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Lavwrzod1nmAdtb6L5HHQEVpbc41UdSwzzh/4hiFt4=;
	b=mmIH74PBaAGYa1MT5H2PdUXtlWDf6SEMpfpK/eBgk+EUx7uB79IyW89JgVA8JnLkEX4ov2
	doRCMm1L1n8yrZTXGyusVSSKICE5wir7bSoWwEumhvPDRk/UFpFHi094L/8NBZcmdZIlm/
	BYtZ4fjPaL3eNwKkdpsWPdC3E4DIUxSW6hImVFiy7/xdbJHxXxxZoa/wyay+Btg8kPO2qz
	msCv/sIJOLLkKfGpWTh5H3ku8Sl2lYmPJvxlfbj2orHUCJJsQnrkrxTJiqRapI+1HNiO+v
	RT/xloGXOIgmVD99wisrTMTjRAVbWs12BYk/Kk8zrqI6eXc6/NRWHPP4vucjog==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Feb 2025 09:23:15 +0100
Subject: [PATCH v2 1/6] dev-manual: move multiconfig documentation to its
 own document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-multiconfig-doc-v2-1-f2bd35115cb7@bootlin.com>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
In-Reply-To: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16361;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=y/EOC3AaI/o3iNx5zS8ICZQJakA0zURWUJ65srT7MTk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnrav4CLAdVBnAg4CQYDGCzxPsXNM0tIvnPM9Qf
 jNDeb2VbHSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ62r+AAKCRDRgEFAKaOo
 NpIxD/9r5Nh/W9ibmfGGJwVt6+0dTbrxVgmiNqq7noMiMm47piMtdikBn9byLDZiAyG4k4IJI2S
 fBctIJ0DfvsM/xkQifSXuBD43uPmWrVb/typ0OXsMIWSeHCUIwHvWc6c3T9Yk3UQ4n1RaE4/JFQ
 3wzFS7jo97AWeL43R8sEQIkipDSJtuwrz7VcBYEMM3X2VvW1BSDEMz3HcTZkU7ZH2UxmYUHvff8
 xfOkgkkfHuYAOxSrOxu4MLfon+gOe/TgmqP6bbHN+sAxM2aeNJE179x2qowuB4Zlpb2r7OrHgmM
 6gxN7iJM0A5Om5rpi6z4YntYxDQw/N5tpGk6821jy/u7L5Ws3Gdb+exMqOTtxiVIhz7P5rhqw5V
 ODetbF/unghrHHwk19CrvKfL9ngBqqO8OJw9Im4TpjPT5xQ2vtYcILOX1XxJJe7cBDlcVbwZWHS
 hvCNsCMskYvk1tRDRNRp94KMB/kL/1f9/otu47bXV72Qr7yRKSjIjgzwfHKIab2jYoppGcuFMzV
 i0E0x3owKaxDyd1pQOtZVOeZxAgyLBv27H8vxdmjGsa7MnUBvXguchTUfQZpUoSZ7dYyNYBIDxo
 6gQAyCeTmXnI0DxUeFt0jvZV0S4pH1EGG/Nx2W3sQ/0FZE/TgHHy6zJiR8c3bjNLeGZi+6ge203
 kteGqmZs9Uc29AQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegiedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Feb 2025 08:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6359

In preparation of more section and examples to multiconfig, move the
section about it in building.rst into its own document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/building.rst    | 156 +-----------------------------
 documentation/dev-manual/index.rst       |   1 +
 documentation/dev-manual/multiconfig.rst | 160 +++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+), 154 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 4770a5a18..807c665f6 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -113,160 +113,8 @@ The following figure and list overviews the build process:
 Building Images for Multiple Targets Using Multiple Configurations
 ==================================================================
 
-You can use a single ``bitbake`` command to build multiple images or
-packages for different targets where each image or package requires a
-different configuration (multiple configuration builds). The builds, in
-this scenario, are sometimes referred to as "multiconfigs", and this
-section uses that term throughout.
-
-This section describes how to set up for multiple configuration builds
-and how to account for cross-build dependencies between the
-multiconfigs.
-
-Setting Up and Running a Multiple Configuration Build
------------------------------------------------------
-
-To accomplish a multiple configuration build, you must define each
-target's configuration separately using a parallel configuration file in
-the :term:`Build Directory` or configuration directory within a layer, and you
-must follow a required file hierarchy. Additionally, you must enable the
-multiple configuration builds in your ``local.conf`` file.
-
-Follow these steps to set up and execute multiple configuration builds:
-
--  *Create Separate Configuration Files*: You need to create a single
-   configuration file for each build target (each multiconfig).
-   The configuration definitions are implementation dependent but often
-   each configuration file will define the machine and the
-   temporary directory BitBake uses for the build. Whether the same
-   temporary directory (:term:`TMPDIR`) can be shared will depend on what is
-   similar and what is different between the configurations. Multiple MACHINE
-   targets can share the same (:term:`TMPDIR`) as long as the rest of the
-   configuration is the same, multiple :term:`DISTRO` settings would need separate
-   (:term:`TMPDIR`) directories.
-
-   For example, consider a scenario with two different multiconfigs for the same
-   :term:`MACHINE`: "qemux86" built
-   for two distributions such as "poky" and "poky-lsb". In this case,
-   you would need to use the different :term:`TMPDIR`.
-
-   Here is an example showing the minimal statements needed in a
-   configuration file for a "qemux86" target whose temporary build
-   directory is ``tmpmultix86``::
-
-      MACHINE = "qemux86"
-      TMPDIR = "${TOPDIR}/tmpmultix86"
-
-   The location for these multiconfig configuration files is specific.
-   They must reside in the current :term:`Build Directory` in a sub-directory of
-   ``conf`` named ``multiconfig`` or within a layer's ``conf`` directory
-   under a directory named ``multiconfig``. Here is an example that defines
-   two configuration files for the "x86" and "arm" multiconfigs:
-
-   .. image:: figures/multiconfig_files.png
-      :align: center
-      :width: 50%
-
-   The usual :term:`BBPATH` search path is used to locate multiconfig files in
-   a similar way to other conf files.
-
--  *Add the BitBake Multi-configuration Variable to the Local
-   Configuration File*: Use the
-   :term:`BBMULTICONFIG`
-   variable in your ``conf/local.conf`` configuration file to specify
-   each multiconfig. Continuing with the example from the previous
-   figure, the :term:`BBMULTICONFIG` variable needs to enable two
-   multiconfigs: "x86" and "arm" by specifying each configuration file::
-
-      BBMULTICONFIG = "x86 arm"
-
-   .. note::
-
-      A "default" configuration already exists by definition. This
-      configuration is named: "" (i.e. empty string) and is defined by
-      the variables coming from your ``local.conf``
-      file. Consequently, the previous example actually adds two
-      additional configurations to your build: "arm" and "x86" along
-      with "".
-
--  *Launch BitBake*: Use the following BitBake command form to launch
-   the multiple configuration build::
-
-      $ bitbake [mc:multiconfigname:]target [[[mc:multiconfigname:]target] ... ]
-
-   For the example in this section, the following command applies::
-
-      $ bitbake mc:x86:core-image-minimal mc:arm:core-image-sato mc::core-image-base
-
-   The previous BitBake command builds a ``core-image-minimal`` image
-   that is configured through the ``x86.conf`` configuration file, a
-   ``core-image-sato`` image that is configured through the ``arm.conf``
-   configuration file and a ``core-image-base`` that is configured
-   through your ``local.conf`` configuration file.
-
-.. note::
-
-   Support for multiple configuration builds in the Yocto Project &DISTRO;
-   (&DISTRO_NAME;) Release does not include Shared State (sstate)
-   optimizations. Consequently, if a build uses the same object twice
-   in, for example, two different :term:`TMPDIR`
-   directories, the build either loads from an existing sstate cache for
-   that build at the start or builds the object fresh.
-
-Enabling Multiple Configuration Build Dependencies
---------------------------------------------------
-
-Sometimes dependencies can exist between targets (multiconfigs) in a
-multiple configuration build. For example, suppose that in order to
-build a ``core-image-sato`` image for an "x86" multiconfig, the root
-filesystem of an "arm" multiconfig must exist. This dependency is
-essentially that the
-:ref:`ref-tasks-image` task in the
-``core-image-sato`` recipe depends on the completion of the
-:ref:`ref-tasks-rootfs` task of the
-``core-image-minimal`` recipe.
-
-To enable dependencies in a multiple configuration build, you must
-declare the dependencies in the recipe using the following statement
-form::
-
-   task_or_package[mcdepends] = "mc:from_multiconfig:to_multiconfig:recipe_name:task_on_which_to_depend"
-
-To better show how to use this statement, consider the example scenario
-from the first paragraph of this section. The following statement needs
-to be added to the recipe that builds the ``core-image-sato`` image::
-
-   do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_rootfs"
-
-In this example, the `from_multiconfig` is "x86". The `to_multiconfig` is "arm". The
-task on which the :ref:`ref-tasks-image` task in the recipe depends is the
-:ref:`ref-tasks-rootfs` task from the ``core-image-minimal`` recipe associated
-with the "arm" multiconfig.
-
-Once you set up this dependency, you can build the "x86" multiconfig
-using a BitBake command as follows::
-
-   $ bitbake mc:x86:core-image-sato
-
-This command executes all the tasks needed to create the
-``core-image-sato`` image for the "x86" multiconfig. Because of the
-dependency, BitBake also executes through the :ref:`ref-tasks-rootfs` task for the
-"arm" multiconfig build.
-
-Having a recipe depend on the root filesystem of another build might not
-seem that useful. Consider this change to the statement in the
-``core-image-sato`` recipe::
-
-   do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_image"
-
-In this case, BitBake must
-create the ``core-image-minimal`` image for the "arm" build since the
-"x86" build depends on it.
-
-Because "x86" and "arm" are enabled for multiple configuration builds
-and have separate configuration files, BitBake places the artifacts for
-each build in the respective temporary build directories (i.e.
-:term:`TMPDIR`).
+See the :doc:`multiconfig` section of the Yocto Project Development Tasks
+Manual.
 
 Building an Initial RAM Filesystem (Initramfs) Image
 ====================================================
diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 760108f60..63736e0ab 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -20,6 +20,7 @@ Yocto Project Development Tasks Manual
    development-shell
    python-development-shell
    building
+   multiconfig
    speeding-up-build
    libraries
    prebuilt-libraries
diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
new file mode 100644
index 000000000..8464f80c3
--- /dev/null
+++ b/documentation/dev-manual/multiconfig.rst
@@ -0,0 +1,160 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Building Images for Multiple Targets Using Multiple Configurations
+******************************************************************
+
+You can use a single ``bitbake`` command to build multiple images or
+packages for different targets where each image or package requires a
+different configuration (multiple configuration builds). The builds, in
+this scenario, are sometimes referred to as "multiconfigs", and this
+section uses that term throughout.
+
+This section describes how to set up for multiple configuration builds
+and how to account for cross-build dependencies between the
+multiconfigs.
+
+Setting Up and Running a Multiple Configuration Build
+=====================================================
+
+To accomplish a multiple configuration build, you must define each
+target's configuration separately using a parallel configuration file in
+the :term:`Build Directory` or configuration directory within a layer, and you
+must follow a required file hierarchy. Additionally, you must enable the
+multiple configuration builds in your ``local.conf`` file.
+
+Follow these steps to set up and execute multiple configuration builds:
+
+-  *Create Separate Configuration Files*: You need to create a single
+   configuration file for each build target (each multiconfig).
+   The configuration definitions are implementation dependent but often
+   each configuration file will define the machine and the
+   temporary directory BitBake uses for the build. Whether the same
+   temporary directory (:term:`TMPDIR`) can be shared will depend on what is
+   similar and what is different between the configurations. Multiple MACHINE
+   targets can share the same (:term:`TMPDIR`) as long as the rest of the
+   configuration is the same, multiple :term:`DISTRO` settings would need separate
+   (:term:`TMPDIR`) directories.
+
+   For example, consider a scenario with two different multiconfigs for the same
+   :term:`MACHINE`: "qemux86" built
+   for two distributions such as "poky" and "poky-lsb". In this case,
+   you would need to use the different :term:`TMPDIR`.
+
+   Here is an example showing the minimal statements needed in a
+   configuration file for a "qemux86" target whose temporary build
+   directory is ``tmpmultix86``::
+
+      MACHINE = "qemux86"
+      TMPDIR = "${TOPDIR}/tmpmultix86"
+
+   The location for these multiconfig configuration files is specific.
+   They must reside in the current :term:`Build Directory` in a sub-directory of
+   ``conf`` named ``multiconfig`` or within a layer's ``conf`` directory
+   under a directory named ``multiconfig``. Here is an example that defines
+   two configuration files for the "x86" and "arm" multiconfigs:
+
+   .. image:: figures/multiconfig_files.png
+      :align: center
+      :width: 50%
+
+   The usual :term:`BBPATH` search path is used to locate multiconfig files in
+   a similar way to other conf files.
+
+-  *Add the BitBake Multi-configuration Variable to the Local
+   Configuration File*: Use the
+   :term:`BBMULTICONFIG`
+   variable in your ``conf/local.conf`` configuration file to specify
+   each multiconfig. Continuing with the example from the previous
+   figure, the :term:`BBMULTICONFIG` variable needs to enable two
+   multiconfigs: "x86" and "arm" by specifying each configuration file::
+
+      BBMULTICONFIG = "x86 arm"
+
+   .. note::
+
+      A "default" configuration already exists by definition. This
+      configuration is named: "" (i.e. empty string) and is defined by
+      the variables coming from your ``local.conf``
+      file. Consequently, the previous example actually adds two
+      additional configurations to your build: "arm" and "x86" along
+      with "".
+
+-  *Launch BitBake*: Use the following BitBake command form to launch
+   the multiple configuration build::
+
+      $ bitbake [mc:multiconfigname:]target [[[mc:multiconfigname:]target] ... ]
+
+   For the example in this section, the following command applies::
+
+      $ bitbake mc:x86:core-image-minimal mc:arm:core-image-sato mc::core-image-base
+
+   The previous BitBake command builds a ``core-image-minimal`` image
+   that is configured through the ``x86.conf`` configuration file, a
+   ``core-image-sato`` image that is configured through the ``arm.conf``
+   configuration file and a ``core-image-base`` that is configured
+   through your ``local.conf`` configuration file.
+
+.. note::
+
+   Support for multiple configuration builds in the Yocto Project &DISTRO;
+   (&DISTRO_NAME;) Release does not include Shared State (sstate)
+   optimizations. Consequently, if a build uses the same object twice
+   in, for example, two different :term:`TMPDIR`
+   directories, the build either loads from an existing sstate cache for
+   that build at the start or builds the object fresh.
+
+Enabling Multiple Configuration Build Dependencies
+==================================================
+
+Sometimes dependencies can exist between targets (multiconfigs) in a
+multiple configuration build. For example, suppose that in order to
+build a ``core-image-sato`` image for an "x86" multiconfig, the root
+filesystem of an "arm" multiconfig must exist. This dependency is
+essentially that the
+:ref:`ref-tasks-image` task in the
+``core-image-sato`` recipe depends on the completion of the
+:ref:`ref-tasks-rootfs` task of the
+``core-image-minimal`` recipe.
+
+To enable dependencies in a multiple configuration build, you must
+declare the dependencies in the recipe using the following statement
+form::
+
+   task_or_package[mcdepends] = "mc:from_multiconfig:to_multiconfig:recipe_name:task_on_which_to_depend"
+
+To better show how to use this statement, consider the example scenario
+from the first paragraph of this section. The following statement needs
+to be added to the recipe that builds the ``core-image-sato`` image::
+
+   do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_rootfs"
+
+In this example, the `from_multiconfig` is "x86". The `to_multiconfig` is "arm". The
+task on which the :ref:`ref-tasks-image` task in the recipe depends is the
+:ref:`ref-tasks-rootfs` task from the ``core-image-minimal`` recipe associated
+with the "arm" multiconfig.
+
+Once you set up this dependency, you can build the "x86" multiconfig
+using a BitBake command as follows::
+
+   $ bitbake mc:x86:core-image-sato
+
+This command executes all the tasks needed to create the
+``core-image-sato`` image for the "x86" multiconfig. Because of the
+dependency, BitBake also executes through the :ref:`ref-tasks-rootfs` task for the
+"arm" multiconfig build.
+
+Having a recipe depend on the root filesystem of another build might not
+seem that useful. Consider this change to the statement in the
+``core-image-sato`` recipe::
+
+   do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_image"
+
+In this case, BitBake must
+create the ``core-image-minimal`` image for the "arm" build since the
+"x86" build depends on it.
+
+Because "x86" and "arm" are enabled for multiple configuration builds
+and have separate configuration files, BitBake places the artifacts for
+each build in the respective temporary build directories (i.e.
+:term:`TMPDIR`).
+

-- 
2.47.0


