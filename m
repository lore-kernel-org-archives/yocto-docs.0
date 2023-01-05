Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48036C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 08:22:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8589.1672906951838894957
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 00:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BzA2oqls;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 74875240002;
	Thu,  5 Jan 2023 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672906949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y4ADe4THHQvzDPexbc6u3qbt/EMOg8dh7+2WMuRtFy8=;
	b=BzA2oqlsbVN2+H53MceUiuHU3lTrewba1+wNhSuer8LKY0Z6kOke8AeDe8LWLWH0fa46nz
	udC89z2aDk6K+jx+6Z2kmPeW8urQc2gE+qR8D6NAetIhgJO9RC/GuQdBJTwKobpZlLLSus
	zO16Ll2tS3o5CAWN6Y7g2jNvMlLFHxipwEMCtPYQEfXCjxpHW0/ZIvzS7I+c1vxYHOfVhU
	N+HiFra+XtBFB2EAEpX9b9fofJY7hIu+vAdyr6pB8U1khTwylyxpqAq54vHjtQK0IGuR/p
	N3w/UloKRY2y54SRBwblnNSmrfvbfjo6sKZJ6Z3kbc2EfQUFGn7kuGaEyw8LcQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/2] ref-manual/classes.rst: remove .bbclass from section titles
Date: Thu,  5 Jan 2023 09:22:22 +0100
Message-Id: <20230105082223.44090-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 08:22:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3580

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This is unnecessary and allows to simplify the references
to such sections, most of which are removing the .bbclass extension
anyway, for example in :ref:`insane <ref-classes-insane>`.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Quentin Schulz <foss+yocto@0leil.net>
---
 documentation/ref-manual/classes.rst | 588 +++++++++++++--------------
 1 file changed, 294 insertions(+), 294 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 7f760c5ba4..fed3dcc066 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -34,8 +34,8 @@ information.
 
 .. _ref-classes-allarch:
 
-``allarch.bbclass``
-===================
+``allarch``
+===========
 
 The :ref:`allarch <ref-classes-allarch>` class is inherited by recipes that do not produce
 architecture-specific output. The class disables functionality that is
@@ -67,8 +67,8 @@ inherit the :ref:`allarch <ref-classes-allarch>` class.
 
 .. _ref-classes-archiver:
 
-``archiver.bbclass``
-====================
+``archiver``
+============
 
 The :ref:`archiver <ref-classes-archiver>` class supports releasing source code and other
 materials with the binaries.
@@ -81,8 +81,8 @@ about the variable flags (varflags) that help control archive creation.
 
 .. _ref-classes-autotools:
 
-``autotools*.bbclass``
-======================
+``autotools*``
+==============
 
 The :ref:`autotools* <ref-classes-autotools>` classes support packages built with the
 :wikipedia:`GNU Autotools <GNU_Autotools>`.
@@ -130,8 +130,8 @@ It's useful to have some idea of how the tasks defined by the
 
 .. _ref-classes-base:
 
-``base.bbclass``
-================
+``base``
+========
 
 The :ref:`base <ref-classes-base>` class is special in that every ``.bb`` file implicitly
 inherits the class. This class contains definitions for standard basic
@@ -149,16 +149,16 @@ arguments passed directly to ``oe_runmake``.
 
 .. _ref-classes-bash-completion:
 
-``bash-completion.bbclass``
-===========================
+``bash-completion``
+===================
 
 Sets up packaging and dependencies appropriate for recipes that build
 software that includes bash-completion data.
 
 .. _ref-classes-bin-package:
 
-``bin_package.bbclass``
-=======================
+``bin_package``
+===============
 
 The :ref:`bin_package <ref-classes-bin-package>` class is a helper class for recipes that extract the
 contents of a binary package (e.g. an RPM) and install those contents
@@ -184,8 +184,8 @@ example use for this class.
 
 .. _ref-classes-binconfig:
 
-``binconfig.bbclass``
-=====================
+``binconfig``
+=============
 
 The :ref:`binconfig <ref-classes-binconfig>` class helps to correct paths in shell scripts.
 
@@ -204,8 +204,8 @@ information.
 
 .. _ref-classes-binconfig-disabled:
 
-``binconfig-disabled.bbclass``
-==============================
+``binconfig-disabled``
+======================
 
 An alternative version of the :ref:`binconfig <ref-classes-binconfig>`
 class, which disables binary configuration scripts by making them return
@@ -215,8 +215,8 @@ variable within the recipe inheriting the class.
 
 .. _ref-classes-buildhistory:
 
-``buildhistory.bbclass``
-========================
+``buildhistory``
+================
 
 The :ref:`buildhistory <ref-classes-buildhistory>` class records a history of build output metadata,
 which can be used to detect possible regressions as well as used for
@@ -227,8 +227,8 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-buildstats:
 
-``buildstats.bbclass``
-======================
+``buildstats``
+==============
 
 The :ref:`buildstats <ref-classes-buildstats>` class records performance statistics about each task
 executed during the build (e.g. elapsed time, CPU usage, and I/O usage).
@@ -248,8 +248,8 @@ remove ":ref:`buildstats <ref-classes-buildstats>`" from the :term:`USER_CLASSES
 
 .. _ref-classes-buildstats-summary:
 
-``buildstats-summary.bbclass``
-==============================
+``buildstats-summary``
+======================
 
 When inherited globally, prints statistics at the end of the build on
 sstate re-use. In order to function, this class requires the
@@ -257,8 +257,8 @@ sstate re-use. In order to function, this class requires the
 
 .. _ref-classes-ccache:
 
-``ccache.bbclass``
-==================
+``ccache``
+==========
 
 The :ref:`ccache <ref-classes-ccache>` class enables the C/C++ Compiler Cache for the build.
 This class is used to give a minor performance boost during the build.
@@ -274,8 +274,8 @@ this class is not recommended.
 
 .. _ref-classes-chrpath:
 
-``chrpath.bbclass``
-===================
+``chrpath``
+===========
 
 The :ref:`chrpath <ref-classes-chrpath>` class is a wrapper around the "chrpath" utility, which
 is used during the build process for :ref:`nativesdk <ref-classes-nativesdk>`, :ref:`cross <ref-classes-cross>`, and
@@ -284,8 +284,8 @@ in order to make them relocatable.
 
 .. _ref-classes-cmake:
 
-``cmake.bbclass``
-=================
+``cmake``
+=========
 
 The ref:`cmake <ref-classes-cmake>` class allows for recipes that need to build software using
 the `CMake <https://cmake.org/overview/>`__ build system. You can use
@@ -301,16 +301,16 @@ Modules during
 
 .. _ref-classes-cml1:
 
-``cml1.bbclass``
-================
+``cml1``
+========
 
 The :ref:`cml1 <ref-classes-cml1>` class provides basic support for the Linux kernel style
 build configuration system.
 
 .. _ref-classes-compress_doc:
 
-``compress_doc.bbclass``
-========================
+``compress_doc``
+================
 
 Enables compression for man pages and info pages. This class is intended
 to be inherited globally. The default compression mechanism is gz (gzip)
@@ -319,8 +319,8 @@ but you can select an alternative mechanism by setting the
 
 .. _ref-classes-copyleft_compliance:
 
-``copyleft_compliance.bbclass``
-===============================
+``copyleft_compliance``
+=======================
 
 The :ref:`copyleft_compliance <ref-classes-copyleft_compliance>` class preserves source code for the purposes
 of license compliance. This class is an alternative to the :ref:`archiver <ref-classes-archiver>`
@@ -329,8 +329,8 @@ in favor of the :ref:`archiver <ref-classes-archiver>` class.
 
 .. _ref-classes-copyleft_filter:
 
-``copyleft_filter.bbclass``
-===========================
+``copyleft_filter``
+===================
 
 A class used by the :ref:`archiver <ref-classes-archiver>` and
 :ref:`copyleft_compliance <ref-classes-copyleft_compliance>` classes
@@ -339,8 +339,8 @@ class and is not intended to be used directly.
 
 .. _ref-classes-core-image:
 
-``core-image.bbclass``
-======================
+``core-image``
+==============
 
 The :ref:`core-image <ref-classes-core-image>` class provides common definitions for the
 ``core-image-*`` image recipes, such as support for additional
@@ -348,8 +348,8 @@ The :ref:`core-image <ref-classes-core-image>` class provides common definitions
 
 .. _ref-classes-cpan:
 
-``cpan*.bbclass``
-=================
+``cpan*``
+=========
 
 The :ref:`cpan* <ref-classes-cpan>` classes support Perl modules.
 
@@ -369,8 +369,8 @@ support.
 
 .. _ref-classes-create-spdx:
 
-``create-spdx.bbclass``
-=======================
+``create-spdx``
+===============
 
 The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for
 automatically creating :term:`SPDX` :term:`SBOM` documents based upon image
@@ -395,16 +395,16 @@ section in the Yocto Project Development Manual for more details.
 
 .. _ref-classes-cross:
 
-``cross.bbclass``
-=================
+``cross``
+=========
 
 The :ref:`cross <ref-classes-cross>` class provides support for the recipes that build the
 cross-compilation tools.
 
 .. _ref-classes-cross-canadian:
 
-``cross-canadian.bbclass``
-==========================
+``cross-canadian``
+==================
 
 The :ref:`cross-canadian <ref-classes-cross-canadian>` class provides support for the recipes that build
 the Canadian Cross-compilation tools for SDKs. See the
@@ -414,8 +414,8 @@ discussion on these cross-compilation tools.
 
 .. _ref-classes-crosssdk:
 
-``crosssdk.bbclass``
-====================
+``crosssdk``
+============
 
 The :ref:`crosssdk <ref-classes-crosssdk>` class provides support for the recipes that build the
 cross-compilation tools used for building SDKs. See the
@@ -425,8 +425,8 @@ discussion on these cross-compilation tools.
 
 .. _ref-classes-cve-check:
 
-``cve-check.bbclass``
-=====================
+``cve-check``
+=============
 
 The :ref:`cve-check <ref-classes-cve-check>` class looks for known CVEs (Common Vulnerabilities
 and Exposures) while building with BitBake. This class is meant to be
@@ -489,8 +489,8 @@ section in the Development Tasks Manual.
 
 .. _ref-classes-debian:
 
-``debian.bbclass``
-==================
+``debian``
+==========
 
 The :ref:`debian <ref-classes-debian>` class renames output packages so that they follow the
 Debian naming policy (i.e. ``glibc`` becomes ``libc6`` and
@@ -504,8 +504,8 @@ naming scheme.
 
 .. _ref-classes-deploy:
 
-``deploy.bbclass``
-==================
+``deploy``
+==========
 
 The :ref:`deploy <ref-classes-deploy>` class handles deploying files to the
 :term:`DEPLOY_DIR_IMAGE` directory. The main
@@ -520,8 +520,8 @@ staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
 
 .. _ref-classes-devshell:
 
-``devshell.bbclass``
-====================
+``devshell``
+============
 
 The :ref:`devshell <ref-classes-devshell>` class adds the :ref:`ref-tasks-devshell` task. Distribution
 policy dictates whether to include this class. See the ":ref:`dev-manual/development-shell:using a development shell`"
@@ -530,8 +530,8 @@ information about using :ref:`devshell <ref-classes-devshell>`.
 
 .. _ref-classes-devupstream:
 
-``devupstream.bbclass``
-=======================
+``devupstream``
+===============
 
 The :ref:`devupstream <ref-classes-devupstream>` class uses
 :term:`BBCLASSEXTEND` to add a variant of the
@@ -567,8 +567,8 @@ due to BitBake's automatic fetch dependencies (e.g.
 
 .. _ref-classes-externalsrc:
 
-``externalsrc.bbclass``
-=======================
+``externalsrc``
+===============
 
 The :ref:`externalsrc <ref-classes-externalsrc>` class supports building software from source code
 that is external to the OpenEmbedded build system. Building software
@@ -603,8 +603,8 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-extrausers:
 
-``extrausers.bbclass``
-======================
+``extrausers``
+==============
 
 The :ref:`extrausers <ref-classes-extrausers>` class allows additional user and group configuration
 to be applied at the image level. Inheriting this class either globally
@@ -665,8 +665,8 @@ Finally, here is an example that sets the root password::
 
 .. _ref-classes-features_check:
 
-``features_check.bbclass``
-=================================
+``features_check``
+==================
 
 The :ref:`features_check <ref-classes-features_check>` class allows individual recipes to check
 for required and conflicting
@@ -691,8 +691,8 @@ triggered.
 
 .. _ref-classes-fontcache:
 
-``fontcache.bbclass``
-=====================
+``fontcache``
+=============
 
 The :ref:`fontcache <ref-classes-fontcache>` class generates the proper post-install and
 post-remove (postinst and postrm) scriptlets for font packages. These
@@ -707,8 +707,8 @@ packages containing the fonts.
 
 .. _ref-classes-fs-uuid:
 
-``fs-uuid.bbclass``
-===================
+``fs-uuid``
+===========
 
 The :ref:`fs-uuid <ref-classes-fs-uuid>` class extracts UUID from
 ``${``\ :term:`ROOTFS`\ ``}``, which must have been built
@@ -717,8 +717,8 @@ works on ``ext`` file systems and depends on ``tune2fs``.
 
 .. _ref-classes-gconf:
 
-``gconf.bbclass``
-=================
+``gconf``
+=========
 
 The :ref:`gconf <ref-classes-gconf>` class provides common functionality for recipes that need
 to install GConf schemas. The schemas will be put into a separate
@@ -729,8 +729,8 @@ register and unregister the schemas in the target image.
 
 .. _ref-classes-gettext:
 
-``gettext.bbclass``
-===================
+``gettext``
+===========
 
 The :ref:`gettext <ref-classes-gettext>` class provides support for building
 software that uses the GNU ``gettext`` internationalization and localization
@@ -739,8 +739,8 @@ class.
 
 .. _ref-classes-github-releases:
 
-``github-releases.bbclass``
-===========================
+``github-releases``
+===================
 
 For recipes that fetch release tarballs from github, the :ref:`github-releases <ref-classes-github-releases>`
 class sets up a standard way for checking available upstream versions
@@ -753,8 +753,8 @@ in the value you set for :term:`SRC_URI` within the recipe.
 
 .. _ref-classes-gnomebase:
 
-``gnomebase.bbclass``
-=====================
+``gnomebase``
+=============
 
 The :ref:`gnomebase <ref-classes-gnomebase>` class is the base class for recipes that build
 software from the GNOME stack. This class sets
@@ -764,8 +764,8 @@ GNOME installation paths.
 
 .. _ref-classes-gobject-introspection:
 
-``gobject-introspection.bbclass``
-=================================
+``gobject-introspection``
+=========================
 
 Provides support for recipes building software that supports GObject
 introspection. This functionality is only enabled if the
@@ -782,8 +782,8 @@ introspection. This functionality is only enabled if the
 
 .. _ref-classes-grub-efi:
 
-``grub-efi.bbclass``
-====================
+``grub-efi``
+============
 
 The :ref:`grub-efi <ref-classes-grub-efi>` class provides ``grub-efi``-specific functions for
 building bootable images.
@@ -814,8 +814,8 @@ This class supports several variables:
 
 .. _ref-classes-gsettings:
 
-``gsettings.bbclass``
-=====================
+``gsettings``
+=============
 
 The :ref:`gsettings <ref-classes-gsettings>` class provides common functionality for recipes that
 need to install GSettings (glib) schemas. The schemas are assumed to be
@@ -825,16 +825,16 @@ schemas in the target image.
 
 .. _ref-classes-gtk-doc:
 
-``gtk-doc.bbclass``
-===================
+``gtk-doc``
+===========
 
 The :ref:`gtk-doc <ref-classes-gtk-doc>` class is a helper class to pull in the appropriate
 ``gtk-doc`` dependencies and disable ``gtk-doc``.
 
 .. _ref-classes-gtk-icon-cache:
 
-``gtk-icon-cache.bbclass``
-==========================
+``gtk-icon-cache``
+==================
 
 The :ref:`gtk-icon-cache <ref-classes-gtk-icon-cache>` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that use GTK+ and
@@ -846,8 +846,8 @@ creation.
 
 .. _ref-classes-gtk-immodules-cache:
 
-``gtk-immodules-cache.bbclass``
-===============================
+``gtk-immodules-cache``
+=======================
 
 The :ref:`gtk-immodules-cache <ref-classes-gtk-immodules-cache>` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that install GTK+
@@ -864,8 +864,8 @@ the packages containing the modules.
 
 .. _ref-classes-gzipnative:
 
-``gzipnative.bbclass``
-======================
+``gzipnative``
+==============
 
 The :ref:`gzipnative <ref-classes-gzipnative>` class enables the use of different native versions of
 ``gzip`` and ``pigz`` rather than the versions of these tools from the
@@ -873,8 +873,8 @@ build host.
 
 .. _ref-classes-icecc:
 
-``icecc.bbclass``
-=================
+``icecc``
+=========
 
 The :ref:`icecc <ref-classes-icecc>` class supports
 `Icecream <https://github.com/icecc/icecream>`__, which facilitates
@@ -947,8 +947,8 @@ individually as follows in your ``local.conf`` file::
 
 .. _ref-classes-image:
 
-``image.bbclass``
-=================
+``image``
+=========
 
 The :ref:`image <ref-classes-image>` class helps support creating images in different formats.
 First, the root filesystem is created from packages using one of the
@@ -970,8 +970,8 @@ Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-image-buildinfo:
 
-``image-buildinfo.bbclass``
-===========================
+``image-buildinfo``
+===================
 
 The :ref:`image-buildinfo <ref-classes-image-buildinfo>` class writes a plain text file containing
 build information to the target filesystem at ``${sysconfdir}/buildinfo``
@@ -992,8 +992,8 @@ to ``/buildinfo`` by default (as specified by
 
 .. _ref-classes-image_types:
 
-``image_types.bbclass``
-=======================
+``image_types``
+===============
 
 The :ref:`image_types <ref-classes-image_types>` class defines all of the standard image output types
 that you can enable through the
@@ -1024,8 +1024,8 @@ The :ref:`image_types <ref-classes-image_types>` class also handles conversion a
 
 .. _ref-classes-image-live:
 
-``image-live.bbclass``
-======================
+``image-live``
+==============
 
 This class controls building "live" (i.e. HDDIMG and ISO) images. Live
 images contain syslinux for legacy booting, as well as the bootloader
@@ -1037,8 +1037,8 @@ Normally, you do not use this class directly. Instead, you add "live" to
 
 .. _ref-classes-insane:
 
-``insane.bbclass``
-==================
+``insane``
+==========
 
 The :ref:`insane <ref-classes-insane>` class adds a step to the package generation process so
 that output quality assurance checks are generated by the OpenEmbedded
@@ -1337,8 +1337,8 @@ Here are the tests you can list with the :term:`WARN_QA` and
 
 .. _ref-classes-insserv:
 
-``insserv.bbclass``
-===================
+``insserv``
+===========
 
 The :ref:`insserv <ref-classes-insserv>` class uses the ``insserv`` utility to update the order
 of symbolic links in ``/etc/rc?.d/`` within an image based on
@@ -1347,8 +1347,8 @@ themselves.
 
 .. _ref-classes-kernel:
 
-``kernel.bbclass``
-==================
+``kernel``
+==========
 
 The :ref:`kernel <ref-classes-kernel>` class handles building Linux kernels. The class contains
 code to build all kernel trees. All needed headers are staged into the
@@ -1374,16 +1374,16 @@ internally including the :ref:`kernel-arch <ref-classes-kernel-arch>`,
 
 .. _ref-classes-kernel-arch:
 
-``kernel-arch.bbclass``
-=======================
+``kernel-arch``
+===============
 
 The :ref:`kernel-arch <ref-classes-kernel-arch>` class sets the ``ARCH`` environment variable for
 Linux kernel compilation (including modules).
 
 .. _ref-classes-kernel-devicetree:
 
-``kernel-devicetree.bbclass``
-=============================
+``kernel-devicetree``
+=====================
 
 The :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class, which is inherited by the
 :ref:`kernel <ref-classes-kernel>` class, supports device tree
@@ -1391,8 +1391,8 @@ generation.
 
 .. _ref-classes-kernel-fitimage:
 
-``kernel-fitimage.bbclass``
-===========================
+``kernel-fitimage``
+===================
 
 The :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class provides support to pack a kernel image,
 device trees, a U-boot script, a :term:`Initramfs` bundle and a RAM disk
@@ -1462,8 +1462,8 @@ the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class when both :term:`
 
 .. _ref-classes-kernel-grub:
 
-``kernel-grub.bbclass``
-=======================
+``kernel-grub``
+===============
 
 The :ref:`kernel-grub <ref-classes-kernel-grub>` class updates the boot area and the boot menu with
 the kernel as the priority boot mechanism while installing a RPM to
@@ -1471,46 +1471,46 @@ update the kernel on a deployed target.
 
 .. _ref-classes-kernel-module-split:
 
-``kernel-module-split.bbclass``
-===============================
+``kernel-module-split``
+=======================
 
 The :ref:`kernel-module-split <ref-classes-kernel-module-split>` class provides common functionality for
 splitting Linux kernel modules into separate packages.
 
 .. _ref-classes-kernel-uboot:
 
-``kernel-uboot.bbclass``
-========================
+``kernel-uboot``
+================
 
 The :ref:`kernel-uboot <ref-classes-kernel-uboot>` class provides support for building from
 vmlinux-style kernel sources.
 
 .. _ref-classes-kernel-uimage:
 
-``kernel-uimage.bbclass``
-=========================
+``kernel-uimage``
+=================
 
 The :ref:`kernel-uimage <ref-classes-kernel-uimage>` class provides support to pack uImage.
 
 .. _ref-classes-kernel-yocto:
 
-``kernel-yocto.bbclass``
-========================
+``kernel-yocto``
+================
 
 The :ref:`kernel-yocto <ref-classes-kernel-yocto>` class provides common functionality for building
 from linux-yocto style kernel source repositories.
 
 .. _ref-classes-kernelsrc:
 
-``kernelsrc.bbclass``
-=====================
+``kernelsrc``
+=============
 
 The :ref:`kernelsrc <ref-classes-kernelsrc>` class sets the Linux kernel source and version.
 
 .. _ref-classes-lib_package:
 
-``lib_package.bbclass``
-=======================
+``lib_package``
+===============
 
 The :ref:`lib_package <ref-classes-lib_package>` class supports recipes that build libraries and
 produce executable binaries, where those binaries should not be
@@ -1520,8 +1520,8 @@ make their installation optional.
 
 .. _ref-classes-libc*:
 
-``libc*.bbclass``
-=================
+``libc*``
+=========
 
 The :ref:`libc* <ref-classes-libc*>` classes support recipes that build packages with ``libc``:
 
@@ -1533,8 +1533,8 @@ The :ref:`libc* <ref-classes-libc*>` classes support recipes that build packages
 
 .. _ref-classes-license:
 
-``license.bbclass``
-===================
+``license``
+===========
 
 The :ref:`license <ref-classes-license>` class provides license manifest creation and license
 exclusion. This class is enabled by default using the default value for
@@ -1542,8 +1542,8 @@ the :term:`INHERIT_DISTRO` variable.
 
 .. _ref-classes-linux-kernel-base:
 
-``linux-kernel-base.bbclass``
-=============================
+``linux-kernel-base``
+=====================
 
 The :ref:`linux-kernel-base <ref-classes-linux-kernel-base>` class provides common functionality for
 recipes that build out of the Linux kernel source tree. These builds
@@ -1552,8 +1552,8 @@ inherits this class.
 
 .. _ref-classes-linuxloader:
 
-``linuxloader.bbclass``
-=======================
+``linuxloader``
+===============
 
 Provides the function ``linuxloader()``, which gives the value of the
 dynamic loader/linker provided on the platform. This value is used by a
@@ -1561,8 +1561,8 @@ number of other classes.
 
 .. _ref-classes-logging:
 
-``logging.bbclass``
-===================
+``logging``
+===========
 
 The :ref:`logging <ref-classes-logging>` class provides the standard shell functions used to log
 messages for various BitBake severity levels (i.e. ``bbplain``,
@@ -1573,8 +1573,8 @@ class.
 
 .. _ref-classes-metadata_scm:
 
-``metadata_scm.bbclass``
-========================
+``metadata_scm``
+================
 
 The :ref:`metadata_scm <ref-classes-metadata_scm>` class provides functionality for querying the
 branch and revision of a Source Code Manager (SCM) repository.
@@ -1586,16 +1586,16 @@ the :ref:`base <ref-classes-base>` class.
 
 .. _ref-classes-migrate_localcount:
 
-``migrate_localcount.bbclass``
-==============================
+``migrate_localcount``
+======================
 
 The :ref:`migrate_localcount <ref-classes-migrate_localcount>` class verifies a recipe's localcount data and
 increments it appropriately.
 
 .. _ref-classes-mime:
 
-``mime.bbclass``
-================
+``mime``
+========
 
 The :ref:`mime <ref-classes-mime>` class generates the proper post-install and post-remove
 (postinst/postrm) scriptlets for packages that install MIME type files.
@@ -1604,8 +1604,8 @@ the shared database.
 
 .. _ref-classes-mime-xdg:
 
-``mime-xdg.bbclass``
-====================
+``mime-xdg``
+============
 
 The :ref:`mime-xdg <ref-classes-mime-xdg>` class generates the proper
 post-install and post-remove (postinst/postrm) scriptlets for packages
@@ -1625,8 +1625,8 @@ package names to the :term:`MIME_XDG_PACKAGES` variable.
 
 .. _ref-classes-mirrors:
 
-``mirrors.bbclass``
-===================
+``mirrors``
+===========
 
 The :ref:`mirrors <ref-classes-mirrors>` class sets up some standard
 :term:`MIRRORS` entries for source code mirrors. These
@@ -1638,8 +1638,8 @@ This class is enabled by default since it is inherited by the
 
 .. _ref-classes-module:
 
-``module.bbclass``
-==================
+``module``
+==========
 
 The :ref:`module <ref-classes-module>` class provides support for building out-of-tree Linux
 kernel modules. The class inherits the
@@ -1655,8 +1655,8 @@ section in the Yocto Project Linux Kernel Development Manual.
 
 .. _ref-classes-module-base:
 
-``module-base.bbclass``
-=======================
+``module-base``
+===============
 
 The :ref:`module-base <ref-classes-module-base>` class provides the base functionality for building
 Linux kernel modules. Typically, a recipe that builds software that
@@ -1666,8 +1666,8 @@ the module inherits this class as opposed to inheriting the
 
 .. _ref-classes-multilib*:
 
-``multilib*.bbclass``
-=====================
+``multilib*``
+=============
 
 The :ref:`multilib* <ref-classes-multilib*>` classes provide support for building libraries with
 different target optimizations or target architectures and installing
@@ -1679,8 +1679,8 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-native:
 
-``native.bbclass``
-==================
+``native``
+==========
 
 The :ref:`native <ref-classes-native>` class provides common functionality for recipes that
 build tools to run on the :term:`Build Host` (i.e. tools that use the compiler
@@ -1721,8 +1721,8 @@ target. All common parts of the recipe are automatically shared.
 
 .. _ref-classes-nativesdk:
 
-``nativesdk.bbclass``
-=====================
+``nativesdk``
+=============
 
 The :ref:`nativesdk <ref-classes-nativesdk>` class provides common functionality for recipes that
 wish to build tools to run as part of an SDK (i.e. tools that run on
@@ -1762,16 +1762,16 @@ and the target. All common parts of the recipe are automatically shared.
 
 .. _ref-classes-nopackages:
 
-``nopackages.bbclass``
-======================
+``nopackages``
+==============
 
 Disables packaging tasks for those recipes and classes where packaging
 is not needed.
 
 .. _ref-classes-npm:
 
-``npm.bbclass``
-===============
+``npm``
+=======
 
 Provides support for building Node.js software fetched using the
 :wikipedia:`node package manager (NPM) <Npm_(software)>`.
@@ -1787,8 +1787,8 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-oelint:
 
-``oelint.bbclass``
-==================
+``oelint``
+==========
 
 The :ref:`oelint <ref-classes-oelint>` class is an obsolete lint checking tool available in
 ``meta/classes`` in the :term:`Source Directory`.
@@ -1801,8 +1801,8 @@ layers.
 
 .. _ref-classes-overlayfs:
 
-``overlayfs.bbclass``
-=======================
+``overlayfs``
+=============
 
 It's often desired in Embedded System design to have a read-only root filesystem.
 But a lot of different applications might want to have read-write access to
@@ -1865,8 +1865,8 @@ to the unit the following::
 
 .. _ref-classes-overlayfs-etc:
 
-``overlayfs-etc.bbclass``
-=========================
+``overlayfs-etc``
+=================
 
 In order to have the ``/etc`` directory in overlayfs a special handling at early
 boot stage is required. The idea is to supply a custom init script that mounts
@@ -1910,8 +1910,8 @@ The class provides two options for ``/sbin/init`` generation:
 
 .. _ref-classes-own-mirrors:
 
-``own-mirrors.bbclass``
-=======================
+``own-mirrors``
+===============
 
 The :ref:`own-mirrors <ref-classes-own-mirrors>` class makes it easier to set up your own
 :term:`PREMIRRORS` from which to first fetch source
@@ -1929,8 +1929,8 @@ in :term:`SOURCE_MIRROR_URL`.
 
 .. _ref-classes-package:
 
-``package.bbclass``
-===================
+``package``
+===========
 
 The :ref:`package <ref-classes-package>` class supports generating packages from a build's
 output. The core generic functionality is in ``package.bbclass``. The
@@ -1994,8 +1994,8 @@ at these two Yocto Project mailing list links:
 
 .. _ref-classes-package_deb:
 
-``package_deb.bbclass``
-=======================
+``package_deb``
+===============
 
 The :ref:`package_deb <ref-classes-package_deb>` class provides support for creating packages that
 use the Debian (i.e. ``.deb``) file format. The class ensures the
@@ -2008,8 +2008,8 @@ variable in the ``local.conf`` file.
 
 .. _ref-classes-package_ipk:
 
-``package_ipk.bbclass``
-=======================
+``package_ipk``
+===============
 
 The :ref:`package_ipk <ref-classes-package_ipk>` class provides support for creating packages that
 use the IPK (i.e. ``.ipk``) file format. The class ensures the packages
@@ -2022,8 +2022,8 @@ variable in the ``local.conf`` file.
 
 .. _ref-classes-package_rpm:
 
-``package_rpm.bbclass``
-=======================
+``package_rpm``
+===============
 
 The :ref:`package_rpm <ref-classes-package_rpm>` class provides support for creating packages that
 use the RPM (i.e. ``.rpm``) file format. The class ensures the packages
@@ -2036,8 +2036,8 @@ variable in the ``local.conf`` file.
 
 .. _ref-classes-package_tar:
 
-``package_tar.bbclass``
-=======================
+``package_tar``
+===============
 
 The :ref:`package_tar <ref-classes-package_tar>` class provides support for creating tarballs. The
 class ensures the packages are written out in a tarball format to the
@@ -2055,8 +2055,8 @@ variable in the ``local.conf`` file.
 
 .. _ref-classes-packagedata:
 
-``packagedata.bbclass``
-=======================
+``packagedata``
+===============
 
 The :ref:`packagedata <ref-classes-packagedata>` class provides common functionality for reading
 ``pkgdata`` files found in :term:`PKGDATA_DIR`. These
@@ -2068,8 +2068,8 @@ This class is enabled by default because it is inherited by the
 
 .. _ref-classes-packagegroup:
 
-``packagegroup.bbclass``
-========================
+``packagegroup``
+================
 
 The :ref:`packagegroup <ref-classes-packagegroup>` class sets default values appropriate for package
 group recipes (e.g. :term:`PACKAGES`, :term:`PACKAGE_ARCH`, :term:`ALLOW_EMPTY`, and
@@ -2084,8 +2084,8 @@ Previously, this class was called the ``task`` class.
 
 .. _ref-classes-patch:
 
-``patch.bbclass``
-=================
+``patch``
+=========
 
 The :ref:`patch <ref-classes-patch>` class provides all functionality for applying patches
 during the :ref:`ref-tasks-patch` task.
@@ -2095,8 +2095,8 @@ This class is enabled by default because it is inherited by the
 
 .. _ref-classes-perlnative:
 
-``perlnative.bbclass``
-======================
+``perlnative``
+==============
 
 When inherited by a recipe, the :ref:`perlnative <ref-classes-perlnative>` class supports using the
 native version of Perl built by the build system rather than using the
@@ -2104,8 +2104,8 @@ version provided by the build host.
 
 .. _ref-classes-pypi:
 
-``pypi.bbclass``
-================
+``pypi``
+========
 
 The :ref:`pypi <ref-classes-pypi>` class sets variables appropriately for recipes that build
 Python modules from `PyPI <https://pypi.org/>`__, the Python Package Index.
@@ -2120,8 +2120,8 @@ and :term:`CVE_PRODUCT`.
 
 .. _ref-classes-python_flit_core:
 
-``python_flit_core.bbclass``
-============================
+``python_flit_core``
+====================
 
 The :ref:`python_flit_core <ref-classes-python_flit_core>` class enables building Python modules which declare
 the  `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
@@ -2135,8 +2135,8 @@ Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
 
 .. _ref-classes-python_pep517:
 
-``python_pep517.bbclass``
-=========================
+``python_pep517``
+=================
 
 The :ref:`python_pep517 <ref-classes-python_pep517>` class builds and installs a Python ``wheel`` binary
 archive (see `PEP-517 <https://peps.python.org/pep-0517/>`__).
@@ -2151,8 +2151,8 @@ Examples of classes which do this are :ref:`python_flit_core
 
 .. _ref-classes-python_poetry_core:
 
-``python_poetry_core.bbclass``
-==============================
+``python_poetry_core``
+======================
 
 The :ref:`python_poetry_core <ref-classes-python_poetry_core>` class enables building Python modules which use the
 `Poetry Core <https://python-poetry.org>`__ build system.
@@ -2161,8 +2161,8 @@ Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
 
 .. _ref-classes-pixbufcache:
 
-``pixbufcache.bbclass``
-=======================
+``pixbufcache``
+===============
 
 The :ref:`pixbufcache <ref-classes-pixbufcache>` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that install
@@ -2179,8 +2179,8 @@ containing the loaders.
 
 .. _ref-classes-pkgconfig:
 
-``pkgconfig.bbclass``
-=====================
+``pkgconfig``
+=============
 
 The :ref:`pkgconfig <ref-classes-pkgconfig>` class provides a standard way to get header and
 library information by using ``pkg-config``. This class aims to smooth
@@ -2193,8 +2193,8 @@ files.
 
 .. _ref-classes-populate-sdk:
 
-``populate_sdk.bbclass``
-========================
+``populate_sdk``
+================
 
 The :ref:`populate_sdk <ref-classes-populate-sdk>` class provides support for SDK-only recipes. For
 information on advantages gained when building a cross-development
@@ -2205,8 +2205,8 @@ Software Development Kit (eSDK) manual.
 
 .. _ref-classes-populate-sdk-*:
 
-``populate_sdk_*.bbclass``
-==========================
+``populate_sdk_*``
+==================
 
 The :ref:`populate_sdk_* <ref-classes-populate-sdk-*>` classes support SDK creation and consist of the
 following classes:
@@ -2262,8 +2262,8 @@ Software Development Kit (eSDK) manual.
 
 .. _ref-classes-prexport:
 
-``prexport.bbclass``
-====================
+``prexport``
+============
 
 The :ref:`prexport <ref-classes-prexport>` class provides functionality for exporting
 :term:`PR` values.
@@ -2275,8 +2275,8 @@ The :ref:`prexport <ref-classes-prexport>` class provides functionality for expo
 
 .. _ref-classes-primport:
 
-``primport.bbclass``
-====================
+``primport``
+============
 
 The :ref:`primport <ref-classes-primport>` class provides functionality for importing
 :term:`PR` values.
@@ -2288,8 +2288,8 @@ The :ref:`primport <ref-classes-primport>` class provides functionality for impo
 
 .. _ref-classes-prserv:
 
-``prserv.bbclass``
-==================
+``prserv``
+==========
 
 The :ref:`prserv <ref-classes-prserv>` class provides functionality for using a :ref:`PR
 service <dev-manual/packages:working with a pr service>` in order to
@@ -2303,8 +2303,8 @@ build system will not enable the functionality of this class unless
 
 .. _ref-classes-ptest:
 
-``ptest.bbclass``
-=================
+``ptest``
+=========
 
 The :ref:`ptest <ref-classes-ptest>` class provides functionality for packaging and installing
 runtime tests for recipes that build software that provides these tests.
@@ -2318,8 +2318,8 @@ on ptest.
 
 .. _ref-classes-ptest-gnome:
 
-``ptest-gnome.bbclass``
-=======================
+``ptest-gnome``
+===============
 
 Enables package tests (ptests) specifically for GNOME packages, which
 have tests intended to be executed with ``gnome-desktop-testing``.
@@ -2330,16 +2330,16 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-python3-dir:
 
-``python3-dir.bbclass``
-=======================
+``python3-dir``
+===============
 
 The :ref:`python3-dir <ref-classes-python3-dir>` class provides the base version, location, and site
 package location for Python 3.
 
 .. _ref-classes-python3native:
 
-``python3native.bbclass``
-=========================
+``python3native``
+=================
 
 The :ref:`python3native <ref-classes-python3native>` class supports using the native version of Python
 3 built by the build system rather than support of the version provided
@@ -2347,8 +2347,8 @@ by the build host.
 
 .. _ref-classes-python3targetconfig:
 
-``python3targetconfig.bbclass``
-===============================
+``python3targetconfig``
+=======================
 
 The :ref:`python3targetconfig <ref-classes-python3targetconfig>` class supports using the native version of Python
 3 built by the build system rather than support of the version provided
@@ -2359,8 +2359,8 @@ in order to avoid unnecessarily lengthening builds.
 
 .. _ref-classes-qemu:
 
-``qemu.bbclass``
-================
+``qemu``
+========
 
 The :ref:`qemu <ref-classes-qemu>` class provides functionality for recipes that either need
 QEMU or test for the existence of QEMU. Typically, this class is used to
@@ -2369,8 +2369,8 @@ application emulation mode.
 
 .. _ref-classes-recipe_sanity:
 
-``recipe_sanity.bbclass``
-=========================
+``recipe_sanity``
+=================
 
 The :ref:`recipe_sanity <ref-classes-recipe_sanity>` class checks for the presence of any host system
 recipe prerequisites that might affect the build (e.g. variables that
@@ -2378,8 +2378,8 @@ are set or software that is present).
 
 .. _ref-classes-relocatable:
 
-``relocatable.bbclass``
-=======================
+``relocatable``
+===============
 
 The :ref:`relocatable <ref-classes-relocatable>` class enables relocation of binaries when they are
 installed into the sysroot.
@@ -2390,8 +2390,8 @@ and is used by both the :ref:`cross <ref-classes-cross>` and
 
 .. _ref-classes-remove-libtool:
 
-``remove-libtool.bbclass``
-==========================
+``remove-libtool``
+==================
 
 The :ref:`remove-libtool <ref-classes-remove-libtool>` class adds a post function to the
 :ref:`ref-tasks-install` task to remove all ``.la`` files
@@ -2409,8 +2409,8 @@ override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows::
 
 .. _ref-classes-report-error:
 
-``report-error.bbclass``
-========================
+``report-error``
+================
 
 The :ref:`report-error <ref-classes-report-error>` class supports enabling the :ref:`error reporting
 tool <dev-manual/error-reporting-tool:using the error reporting tool>`",
@@ -2424,8 +2424,8 @@ are created and stored in
 
 .. _ref-classes-rm-work:
 
-``rm_work.bbclass``
-===================
+``rm_work``
+===========
 
 The :ref:`rm_work <ref-classes-rm-work>` class supports deletion of temporary workspace, which
 can ease your hard drive demands during builds.
@@ -2454,8 +2454,8 @@ can also be set in your ``local.conf`` file. Here is an example::
 
 .. _ref-classes-rootfs*:
 
-``rootfs*.bbclass``
-===================
+``rootfs*``
+===========
 
 The :ref:`rootfs* <ref-classes-rootfs*>` classes support creating the root filesystem for an
 image and consist of the following classes:
@@ -2485,8 +2485,8 @@ section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-sanity:
 
-``sanity.bbclass``
-==================
+``sanity``
+==========
 
 The :ref:`sanity <ref-classes-sanity>` class checks to see if prerequisite software is present
 on the host system so that users can be notified of potential problems
@@ -2497,8 +2497,8 @@ usually determines whether to include this class.
 
 .. _ref-classes-scons:
 
-``scons.bbclass``
-=================
+``scons``
+=========
 
 The :ref:`scons <ref-classes-scons>` class supports recipes that need to build software that
 uses the SCons build system. You can use the
@@ -2507,16 +2507,16 @@ additional configuration options you want to pass SCons command line.
 
 .. _ref-classes-sdl:
 
-``sdl.bbclass``
-===============
+``sdl``
+=======
 
 The :ref:`sdl <ref-classes-sdl>` class supports recipes that need to build software that uses
 the Simple DirectMedia Layer (SDL) library.
 
 .. _ref-classes-python_setuptools_build_meta:
 
-``python_setuptools_build_meta.bbclass``
-========================================
+``python_setuptools_build_meta``
+================================
 
 The :ref:`python_setuptools_build_meta <ref-classes-python_setuptools_build_meta>` class enables building Python modules which
 declare the
@@ -2531,8 +2531,8 @@ Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
 
 .. _ref-classes-setuptools3:
 
-``setuptools3.bbclass``
-=======================
+``setuptools3``
+===============
 
 The :ref:`setuptools3 <ref-classes-setuptools3>` class supports Python version 3.x extensions that
 use build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and
@@ -2561,8 +2561,8 @@ uses these build systems, the recipe needs to inherit the :ref:`setuptools3 <ref
 
 .. _ref-classes-setuptools3_legacy:
 
-``setuptools3_legacy.bbclass``
-==============================
+``setuptools3_legacy``
+======================
 
 The :ref:`setuptools3_legacy <ref-classes-setuptools3_legacy>` class supports
 Python version 3.x extensions that use build systems based on ``setuptools``
@@ -2575,8 +2575,8 @@ but still relatively common.
 
 .. _ref-classes-setuptools3-base:
 
-``setuptools3-base.bbclass``
-============================
+``setuptools3-base``
+====================
 
 The :ref:`setuptools3-base <ref-classes-setuptools3-base>` class provides a reusable base for other classes
 that support building Python version 3.x extensions. If you need
@@ -2586,15 +2586,15 @@ in the :ref:`setuptools3 <ref-classes-setuptools3>` class and inherit this class
 
 .. _ref-classes-sign_rpm:
 
-``sign_rpm.bbclass``
-====================
+``sign_rpm``
+============
 
 The :ref:`sign_rpm <ref-classes-sign_rpm>` class supports generating signed RPM packages.
 
 .. _ref-classes-siteconfig:
 
-``siteconfig.bbclass``
-======================
+``siteconfig``
+==============
 
 The :ref:`siteconfig <ref-classes-siteconfig>` class provides functionality for handling site
 configuration. The class is used by the
@@ -2603,8 +2603,8 @@ configuration. The class is used by the
 
 .. _ref-classes-siteinfo:
 
-``siteinfo.bbclass``
-====================
+``siteinfo``
+============
 
 The :ref:`siteinfo <ref-classes-siteinfo>` class provides information about the targets that might
 be needed by other classes or recipes.
@@ -2624,8 +2624,8 @@ The class also provides variables like :term:`SITEINFO_ENDIANNESS` and
 
 .. _ref-classes-sstate:
 
-``sstate.bbclass``
-==================
+``sstate``
+==========
 
 The :ref:`sstate <ref-classes-sstate>` class provides support for Shared State (sstate). By
 default, the class is enabled through the
@@ -2637,8 +2637,8 @@ section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-staging:
 
-``staging.bbclass``
-===================
+``staging``
+===========
 
 The :ref:`staging <ref-classes-staging>` class installs files into individual recipe work
 directories for sysroots. The class contains the following key tasks:
@@ -2737,8 +2737,8 @@ stages:
 
 .. _ref-classes-syslinux:
 
-``syslinux.bbclass``
-====================
+``syslinux``
+============
 
 The :ref:`syslinux <ref-classes-syslinux>` class provides syslinux-specific functions for building
 bootable images.
@@ -2780,8 +2780,8 @@ The class supports the following variables:
 
 .. _ref-classes-systemd:
 
-``systemd.bbclass``
-===================
+``systemd``
+===========
 
 The :ref:`systemd <ref-classes-systemd>` class provides support for recipes that install systemd
 unit files.
@@ -2815,8 +2815,8 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-systemd-boot:
 
-``systemd-boot.bbclass``
-========================
+``systemd-boot``
+================
 
 The :ref:`systemd-boot <ref-classes-systemd-boot>` class provides functions specific to the
 systemd-boot bootloader for building bootable images. This is an
@@ -2842,8 +2842,8 @@ for more information.
 
 .. _ref-classes-terminal:
 
-``terminal.bbclass``
-====================
+``terminal``
+============
 
 The :ref:`terminal <ref-classes-terminal>` class provides support for starting a terminal session.
 The :term:`OE_TERMINAL` variable controls which
@@ -2859,8 +2859,8 @@ class.
 
 .. _ref-classes-testimage:
 
-``testimage.bbclass``
-=====================
+``testimage``
+=============
 
 The :ref:`testimage <ref-classes-testimage>` class supports running automated tests against
 images using QEMU and on actual hardware. The classes handle loading the
@@ -2890,8 +2890,8 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-testsdk:
 
-``testsdk.bbclass``
-===================
+``testsdk``
+===========
 
 This class supports running automated tests against software development
 kits (SDKs). The :ref:`testsdk <ref-classes-testsdk>` class runs tests on an SDK when called
@@ -2907,8 +2907,8 @@ using the following::
 
 .. _ref-classes-texinfo:
 
-``texinfo.bbclass``
-===================
+``texinfo``
+===========
 
 This class should be inherited by recipes whose upstream packages invoke
 the ``texinfo`` utilities at build-time. Native and cross recipes are
@@ -2925,8 +2925,8 @@ host system.
 
 .. _ref-classes-toaster:
 
-``toaster.bbclass``
-===================
+``toaster``
+===========
 
 The :ref:`toaster <ref-classes-toaster>` class collects information about packages and images and
 sends them as events that the BitBake user interface can receive. The
@@ -2936,16 +2936,16 @@ This class is not intended to be used directly.
 
 .. _ref-classes-toolchain-scripts:
 
-``toolchain-scripts.bbclass``
-=============================
+``toolchain-scripts``
+=====================
 
 The :ref:`toolchain-scripts <ref-classes-toolchain-scripts>` class provides the scripts used for setting up
 the environment for installed SDKs.
 
 .. _ref-classes-typecheck:
 
-``typecheck.bbclass``
-=====================
+``typecheck``
+=============
 
 The :ref:`typecheck <ref-classes-typecheck>` class provides support for validating the values of
 variables set at the configuration level against their defined types.
@@ -2956,8 +2956,8 @@ variable using the "type" varflag. Here is an example::
 
 .. _ref-classes-uboot-config:
 
-``uboot-config.bbclass``
-========================
+``uboot-config``
+================
 
 The :ref:`uboot-config <ref-classes-uboot-config>` class provides support for U-Boot configuration for
 a machine. Specify the machine in your recipe as follows::
@@ -2974,8 +2974,8 @@ information.
 
 .. _ref-classes-uninative:
 
-``uninative.bbclass``
-=====================
+``uninative``
+=============
 
 Attempts to isolate the build system from the host distribution's C
 library in order to make re-use of native shared state artifacts across
@@ -2996,8 +2996,8 @@ and the resulting tarball is included within the SDK.
 
 .. _ref-classes-update-alternatives:
 
-``update-alternatives.bbclass``
-===============================
+``update-alternatives``
+=======================
 
 The :ref:`update-alternatives <ref-classes-update-alternatives>` class helps the alternatives system when
 multiple sources provide the same command. This situation occurs when
@@ -3034,8 +3034,8 @@ file.
 
 .. _ref-classes-update-rc.d:
 
-``update-rc.d.bbclass``
-=======================
+``update-rc.d``
+===============
 
 The :ref:`update-rc.d <ref-classes-update-rc.d>` class uses ``update-rc.d`` to safely install an
 initialization script on behalf of the package. The OpenEmbedded build
@@ -3048,8 +3048,8 @@ for details.
 
 .. _ref-classes-useradd:
 
-``useradd*.bbclass``
-====================
+``useradd*``
+============
 
 The :ref:`useradd* <ref-classes-useradd>` classes support the addition of users or groups for
 usage by the package on the target. For example, if you have packages
@@ -3103,8 +3103,8 @@ additional information.
 
 .. _ref-classes-utility-tasks:
 
-``utility-tasks.bbclass``
-=========================
+``utility-tasks``
+=================
 
 The :ref:`utility-tasks <ref-classes-utility-tasks>` class provides support for various "utility" type
 tasks that are applicable to all recipes, such as
@@ -3116,8 +3116,8 @@ This class is enabled by default because it is inherited by the
 
 .. _ref-classes-utils:
 
-``utils.bbclass``
-=================
+``utils``
+=========
 
 The :ref:`utils <ref-classes-utils>` class provides some useful Python functions that are
 typically used in inline Python expressions (e.g. ``${@...}``). One
@@ -3128,16 +3128,16 @@ This class is enabled by default because it is inherited by the
 
 .. _ref-classes-vala:
 
-``vala.bbclass``
-================
+``vala``
+========
 
 The :ref:`vala <ref-classes-vala>` class supports recipes that need to build software written
 using the Vala programming language.
 
 .. _ref-classes-waf:
 
-``waf.bbclass``
-===============
+``waf``
+=======
 
 The :ref:`waf <ref-classes-waf>` class supports recipes that need to build software that uses
 the Waf build system. You can use the
-- 
2.37.2


