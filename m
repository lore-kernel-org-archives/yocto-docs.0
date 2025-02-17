Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3AAC021AD
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:50:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.53105.1739803835855282323
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UlH1A7Ul;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3264E432E9;
	Mon, 17 Feb 2025 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739803834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+HH1v+XW6XcXdZmmZeV3zAIVn9Qxz0xAQPu95GCcX0=;
	b=UlH1A7Ulw/MsOWcP+iNhxThKdBMX4qWwwYhDZ5Y3rmwpGR+mwai9EYNEIbpBJrckTts1Sz
	NGaLv3b9eW4BhA5AVm0R1ddb6QupGtr2sLCsFKw5W5tWSdVgsd1juXLBfIRul9aoreohHG
	Pr68fAbpsyIdNxshHEiLaP4fz0zLec7yi1tsv4lXHYHZVCxIMneXGFCSfMd3RxSQTMQ1vk
	hnaDp5ddoK1jTBsr87PWI76wlFDFm00MSRXgCd7uZ+oSadhN44DdbceTLtQR7uIt3BNrov
	++/VA/MM3Yz4vnaCH0k/XawSGfY59cyAVT3HnFl4UHl6qNjbinlVokYRi2xWnQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Feb 2025 15:50:20 +0100
Subject: [PATCH v3 1/6] dev-manual: move multiconfig documentation to its
 own document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-multiconfig-doc-v3-1-027a9fb282c3@bootlin.com>
References: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
In-Reply-To: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16603;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=pAAif/eg+h+XFLGJGi4gjyADjWaU5B49L2SjoYND8fk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBns0y51N1GbS2KM7EGQ9TQCYWEQAyEtgqDtj6+t
 +qGMjhvJ5CJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7NMuQAKCRDRgEFAKaOo
 NhnKEACjmq2pOV5wzfuvRSVq77BH9BPzEIXhBBGqb1UBkjq93eFMxY9ruZMPtGaRbswyu/qufTx
 C2cOlbWkCduWQbnx2tq2ogc2CU4S5/EOl7Y65WFObNU6YkoauLTSNC+9FRLdA/Mkldu5qqnBr7B
 gDLdDJXzUTb+GV+CDuT+bQIQsJ5q+S/SmSU6oORdQHiKdPa6+TGmZG2Cdmo/YYr0fDJKInskBuc
 2H2EacmUF/SBxyQ9Spd8D3pOAa2A7lDpmTEq7neYtCZmAdjz0qo5MvviZIZSy10KyEASurxr1sZ
 i7Ihad0/E+7PXGEzg6omH5ummoIREE5byPJ6F6ZHze5SzlsKYWzWGalyo9xRCSGVkIey0JgTJTQ
 R0YNjB5hiL9cS3uTz0LvhqasrFtTDt/0xJqfp87QYVhvznh8RgEtgVN8LY7ID7PpfVXUhYlE1n6
 M2/sD7ppY6hbpmExbUFcBTsSAUS/9Lmo53hLyN9i3bnMyMz30MS4uhQH9XBR5tSULq/XzQt6+wZ
 KmbK1EBZQ0rELWCt8CJNz9Te/eL9klkl+FqXv4Us2N87jkMctjEliKvB8mQrWruWk3fQU5OrXfJ
 Sz3LPuPqpyrkx/nDRX2Linjjr/gsjJPq2dpe48VFZoGKPgwDM3zdqR0Y+NPPmqgE17YB/3ESVDr
 TbunLh+XFigqcEg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:50:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6396

In preparation of more section and examples to multiconfig, move the
section about it in building.rst into its own document.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/building.rst    | 156 +-----------------------------
 documentation/dev-manual/index.rst       |   1 +
 documentation/dev-manual/multiconfig.rst | 160 +++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+), 154 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 4770a5a184fa63edfeaf60bb3b1aabd8eddc1ee7..807c665f68dce61440cb8116b82714df71c41193 100644
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
index 760108f60510d3fe3e9dcdbdc43f8e1bfd5327d2..63736e0abf20398d9cf24ae86d92dedeafabb48e 100644
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
index 0000000000000000000000000000000000000000..8464f80c3cb8191fbcf23928828a2d6a369e12a8
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


