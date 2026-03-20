Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B00108B901
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:46:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9826.1774003592973269662
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aFTFVKtT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9C49C415B5
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5CDAA600E0
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A745E10450B9D;
	Fri, 20 Mar 2026 11:46:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pcf00WiPkZ4GgKYNDu2uAvfkDeTxnUPuDKU0nJ/bBfw=;
	b=aFTFVKtTnfw6vogVn4VamjIei7wQfHB8rpeYoPPN5uyD9+P7l3eWyhr80gAAhtCgWlFdxh
	VwIcqI39W9B8fkufRfjLjHNHHcNhKUVld27AVd6vHDGadRK25x8evgbv31CzP7uRrPP1zG
	9o+rzBqUCn29ieixwLj1XjI7TeN+ZiOKQysX+/EU+u1r6l0R1BeIbhPY4De6KS+3/4Kpp8
	DajZYYdCMlyZSH9SDDMubwCvkje71wm5s9j9Z739Kj3+LLintgBxUO4pyVgvoxV/hgb6YG
	yOdFkA64FXjOD0tj0ORgbSQwSFhnG6PVvo6ak6y/WAChQgL9Rh4KKaEVrqCmMA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:24 +0100
Subject: [PATCH v2 6/8] migration-guides: update 6.0 (Wrynose) release
 notes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-release-notes-6-0-v2-6-1bdb1eb142ae@bootlin.com>
References: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
In-Reply-To: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=30607;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rg8lU1GuOX7A+3t8dZzJwr4fZ4SBsaS3W09oCfaHrbg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpvSWBmZhbSGgmOZQIZEvUFhh1aySxFpbCcqTKi
 MT9SKLyDciJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCab0lgQAKCRDRgEFAKaOo
 NurpD/9gviilxerrDmMQPC1+eL5Qfa8qVtEdZDM/zR6GAwQpKVyj5jhdNkfgcyvC/RLFV/Oekyw
 QL18KKcPT1vWXW2c0IRZ0rMopKwQHhFj3EVs9CN7fnI7a9yBVPT4D9uA6J75XmZa2RiqIkD5nXc
 /VR2Jzf3zIIuBe2EUibfC57c1F02iUnduI+QAD4mPLxd4lWFTsEjPtTT8Kn5CGtL7ivbQ1O+uas
 1FZnCY6x9gZP91JVKvgQ91xbq6CndRYFHS0cCr/QktssHS9KffKLpbLJr7zetv6dNFfk0lAyGq1
 IhTVPzRnn0Dovlw9nchDhs1nQMEYB0lBuxRMY7/AAsq83CZh5hoOt9lmF2m//fzV/B34Xy4Il2L
 6OWctnD505drONfvlMw8eq6MRJbBTWD7sTrHyy26UuOjk/N5U6BIdob7p/fto7HZjTqMX6WyciT
 rUsvvpxiyDLFIXnfYn/KFg6DFV5UQqG7DReTCxyIojVUZo3v8z65cDC5ZmQFE/TQrnNcqeoWrLm
 hkBR+kI8OhYlEu5ZroUjyKmjqjYgKHDtsTOmyDAEBceGEA46Nzglw5eETVKxPRxYfgdbu+rE5Ny
 fEPmT2PKocTnGUbdwwB6T8v1GPkitVjkAF6SJdyvXTIRLadHfJx/+DWB0k5nZJBfH3ZB3RKiE2E
 /EMF3L1UAdG5FVA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9107

Update documentation/migration-guides/migration-6.0.rst and
documentation/migration-guides/release-notes-6.0.rst to include
important changes between:

- bitbake: 8b02d65a6439 and bc8be83aef0a
- openembedded-core: 545e43a7a45b and be8cdcf13a65
- meta-yocto: 632d10b28141 and 2486ce288906

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst   | 191 +++++++++-
 .../migration-guides/release-notes-6.0.rst         | 414 ++++++++++++++++++++-
 2 files changed, 586 insertions(+), 19 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index b18206b21..0810d28af 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -10,9 +10,23 @@ Migration notes for |yocto-ver| (|yocto-codename|)
 
 This section provides migration information for moving to the Yocto
 Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
-For a list of new feature and enhancements, see the
+For a list of new features and enhancements, see the
 :doc:`/migration-guides/release-notes-6.0` section.
 
+The |yocto-ver| (|yocto-codename|) release is the new LTS release after 5.0
+(scarthgap). If you are migrating from the 5.0 version, be sure to read the
+previous migration guides:
+
+-  :doc:`/migration-guides/migration-5.1`
+-  :doc:`/migration-guides/migration-5.2`
+-  :doc:`/migration-guides/migration-5.3`
+
+See also the list of new features and enhancements of the previous releases:
+
+-  :doc:`/migration-guides/release-notes-5.1`
+-  :doc:`/migration-guides/release-notes-5.2`
+-  :doc:`/migration-guides/release-notes-5.3`
+
 Supported kernel versions
 -------------------------
 
@@ -34,12 +48,169 @@ On the other hand, some earlier distributions are no longer supported:
 
 See :ref:`all supported distributions <system-requirements-supported-distros>`.
 
+BitBake fetcher removals
+------------------------
+
+The following :term:`BitBake` :ref:`fetchers <bitbake:bb-fetchers>` have been
+disabled or removed:
+
+-  The ``npm`` and ``npmsw`` (:wikipedia:`NPM <Npm>`) fetchers were disabled due
+   to security concerns (:bitbake_rev:`355cd226e072`) and lack of maintenance.
+
+   All associated tests have been disabled.
+
+-  Support for the :wikipedia:`Bazaar <GNU_Bazaar>` fetcher was dropped
+   (:bitbake_rev:`8e057d54f09c`).
+
+-  Support for the `OSC <https://github.com/openSUSE/osc>`__ fetcher was dropped
+   (:bitbake_rev:`99497c131778`).
+
+-  Support for the `CVS` fetcher was dropped (:bitbake_rev:`5427500e4f23`).
+
+Default :term:`INIT_MANAGER` definition changed to ``systemd``
+--------------------------------------------------------------
+
+The default definition of :term:`INIT_MANAGER` in the :oe_git:`defaultsetup.conf
+<openembedded-core/tree/meta/conf/distro/defaultsetup.conf>` file was changed
+from ``none`` to ``systemd``.
+
+This means that users of the default distro setup (appearing as the ``nodistro``
+:term:`DISTRO`) will be using :wikipedia:`systemd <Systemd>` as the default init
+manager.
+
+This does not change the default init manager of the :term:`Poky` distribution,
+which remains :wikipedia:`SysVinit <UNIX_System_V>`.
+
+Reverting to :wikipedia:`SysVinit <UNIX_System_V>` can be done by specifying the
+:term:`INIT_MANAGER` in your own :term:`DISTRO` configuration file::
+
+   INIT_MANAGER = "sysvinit"
+
+See commit :oecore_rev:`0b4061c5d502` for more information.
+
+Changes to the list of :term:`DISTRO_FEATURES` enabled by default
+-----------------------------------------------------------------
+
+The following :term:`DISTRO_FEATURES` are now enabled by default in
+:oe_git:`meta/conf/bitbake.conf
+</openembedded-core/tree/meta/conf/bitbake.conf>`:
+
+-  ``multiarch``: Enable building applications with multiple architecture
+   support.
+
+-  ``opengl``: Include the Open Graphics Library, which is a
+   cross-language multi-platform application programming interface used
+   for rendering two and three-dimensional graphics.
+
+-  ``ptest``: Enable building the package tests where supported by
+   individual recipes. To add the built :ref:`ref-classes-ptest` packages to the
+   image, add ``ptest-pkgs`` to :term:`IMAGE_FEATURES` in your image recipe.
+
+-  ``vulkan``: Include support for the :wikipedia:`Vulkan API <Vulkan>`.
+
+-  ``wayland``: Include the Wayland display server protocol and the
+   library that supports it.
+
+See commit :oecore_rev:`2e1e7c86064c` for more information.
+
+:ref:`ref-classes-native` and :ref:`ref-classes-cross` classes :term:`DEBUG_BUILD` change
+-----------------------------------------------------------------------------------------
+
+Previously, setting :term:`DEBUG_BUILD` to "1" globally would prevent the
+:term:`OpenEmbedded Build System` from stripping target,
+:ref:`ref-classes-native` and :ref:`ref-classes-cross` binaries. This was
+changed so that only **target** binaries are stripped when this variable is set.
+
+This change can be reverted by setting the two following lines in a
+:term:`configuration file`::
+
+   INHIBIT_SYSROOT_STRIP:class-cross = "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
+   INHIBIT_SYSROOT_STRIP:class-native = "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
+
+See commit :oecore_rev:`3c29afed1dc0` for more information.
+
+.. _ref-migration-6-0-u-boot-config-flow-changes:
+
+U-Boot configuration flow changes (:ref:`ref-classes-uboot-config`)
+-------------------------------------------------------------------
+
+Declaring multiple U-Boot configurations used to be entirely defined by
+one :term:`UBOOT_CONFIG` variable flag per configuration, e.g.::
+
+   UBOOT_CONFIG ??= "foo bar"
+   UBOOT_CONFIG[foo] = "config,images,binary"
+   UBOOT_CONFIG[bar] = "config2,images2,binary2"
+
+This has now been split into more variable flags, e.g.::
+
+   UBOOT_CONFIG ??= "foo bar"
+   UBOOT_CONFIG[foo] = "config"
+   UBOOT_CONFIG[bar] = "config2"
+
+   UBOOT_CONFIG_IMAGE_FSTYPES[bar] = "fstype"
+
+   UBOOT_CONFIG_BINARY[foo] = "binary"
+
+   UBOOT_CONFIG_MAKE_OPTS[foo] = "FOO=1"
+   UBOOT_CONFIG_MAKE_OPTS[bar] = "BAR=1"
+
+   UBOOT_CONFIG_FRAGMENTS[foo] = "foo.fragment"
+
+See the documentation of the :ref:`ref-classes-uboot-config` for full details.
+
+While the previous legacy approach is still supported, it will be removed in
+for the next release. Users are advised to migrate to the new approach.
+
+See commit :oecore_rev:`cd9e7304481b2` for more information.
+
+.. note::
+
+   Single configuration builds have not changed and are still declared using the
+   following statements::
+
+      UBOOT_MACHINE = "config"
+      UBOOT_BINARY = "u-boot.bin"
+
+:ref:`ref-classes-pkgconfig`-related variables are no longer automatically exported
+-----------------------------------------------------------------------------------
+
+All the :ref:`ref-classes-pkgconfig`-related variables, such as
+:term:`PKG_CONFIG_PATH`, are no longer exported in
+:oe_git:`meta/conf/bitbake.conf <bitbake/tree/meta/conf/bitbake.conf>` with the
+:ref:`export <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:Exporting
+Variables to the Environment>` directive.
+
+These ``export`` statements have been moved to the :ref:`ref-classes-pkgconfig`
+class, meaning recipes using these variables that not yet inheriting the
+:ref:`ref-classes-pkgconfig` class should now inherit it with::
+
+   inherit pkgconfig
+
+See commit :oecore_rev:`68d2d38483ef` for more information.
+
 Rust language changes
 ---------------------
 
 systemd changes
 ---------------
 
+Support for SysVinit compatibility in systemd was dropped
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Support for the :wikipedia:`SysVinit <UNIX_System_V>` compatibility in
+:wikipedia:`systemd <Systemd>` was dropped.
+
+This is due to `recent announcements
+<https://github.com/systemd/systemd/releases/tag/v260-rc1>`__ in `systemd` which
+is planning to drop support for the `SysVinit` compatibility.
+
+This means that the ``systemd`` and ``sysvinit`` :term:`distro features
+<DISTRO_FEATURES>` cannot be used together anymore.
+
+Users are advised to switch to one init manager or the other entirely.
+
+See commit :oecore_rev:`d9ec9e20eebc` for more information.
+
 Recipe changes
 --------------
 
@@ -53,6 +224,21 @@ Removed recipes
 
 The following recipes have been removed in this release:
 
+-  ``jquery``: The last users of this recipe were the reproducible tests, but
+   have been reworked to use the `jQuery` CDN instead with
+   :oecore_rev:`d3ee5497b1ce` (See :oecore_rev:`aae793a17e7d`)
+
+-  ``systemd-compat-units``: Dropped as a consequence of removing
+   :wikipedia:`SysVinit <UNIX_System_V>` support in :wikipedia:`systemd
+   <Systemd>`
+
+Removed :term:`PACKAGECONFIG` options
+-------------------------------------
+
+-  ``mesa``: ``freedreno-fdperf`` (:oecore_rev:`293edd0d3d07`)
+-  ``libcxx``: ``no-atomics`` (:oecore_rev:`ccc585f94c51`)
+-  ``systemd``: ``sysvinit`` (:oecore_rev:`e00d5d6eac65`)
+
 Removed classes
 ---------------
 
@@ -68,3 +254,6 @@ The following features have been removed in this release:
 
 Miscellaneous changes
 ---------------------
+
+-  :ref:`ref-classes-meson`: drop ``meson_do_qa_configure`` as it was
+   non-functional (:oecore_rev:`0514b451b5d9`)
diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index af72d1e93..901bd60bc 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -13,86 +13,464 @@ This document lists new features and enhancements for the Yocto Project
 changes and migration guides, see the :doc:`/migration-guides/migration-6.0`
 section.
 
+The |yocto-ver| (|yocto-codename|) release is the new LTS release after 5.0
+(scarthgap). If you are migrating from the 5.0 version, be sure to read the
+previous migration guides:
+
+-  :doc:`/migration-guides/migration-5.1`
+-  :doc:`/migration-guides/migration-5.2`
+-  :doc:`/migration-guides/migration-5.3`
+
+See also the list of new features and enhancements of the previous releases:
+
+-  :doc:`/migration-guides/release-notes-5.1`
+-  :doc:`/migration-guides/release-notes-5.2`
+-  :doc:`/migration-guides/release-notes-5.3`
+
 New Features / Enhancements in |yocto-ver|
 ------------------------------------------
 
 -  Linux kernel XXX, gcc XXX, glibc XXX, LLVM XXX, and over XXX other
-   recipe upgrades.
+   recipe upgrades
 
 -  Minimum Python version required on the host: XXX.
 
 -  New variables:
 
-   - The :term:`OPENSSH_HOST_KEY_DIR_READONLY_CONFIG` variable can be used to
-     specify the directory where OpenSSH host keys are stored when the device
-     uses a read-only filesystem. The default value is ``/var/run/ssh``.
+   -  The :term:`OPENSSH_HOST_KEY_DIR` variable can be used to specify the
+      directory where OpenSSH host keys are stored. The default value is
+      ``/etc/ssh`` (:oecore_rev:`addd80ddfd89`)
+
+   -  The :term:`OPENSSH_HOST_KEY_DIR_READONLY_CONFIG` variable can be used to
+      specify the directory where OpenSSH host keys are stored when the device
+      uses a read-only filesystem. The default value is ``/var/run/ssh``
+      (:oecore_rev:`addd80ddfd89`)
+
+   -  The :term:`SPDX_INCLUDE_KERNEL_CONFIG` can be set to "1" to export the Linux
+      kernel configuration (``CONFIG_*`` parameters) into the SPDX document when
+      using the :ref:`ref-classes-create-spdx` class (:oecore_rev:`228a968e7c47`)
+
+   -  The :term:`SPDX_INCLUDE_PACKAGECONFIG` variable can be set to "1" to
+      export a recipe's :term:`PACKAGECONFIG` features (enabled/disabled) into
+      the SPDX document when using the :ref:`ref-classes-create-spdx` class
+      (:oecore_rev:`228a968e7c47`)
 
-   - The :term:`OPENSSH_HOST_KEY_DIR` variable can be used to specify the
-     directory where OpenSSH host keys are stored. The default value is
-     ``/etc/ssh``.
+   -  The :term:`SPDX_PACKAGE_URL` allows specifying a space-separated list of
+      Package URLs (purls) for the software Package when using the
+      :ref:`ref-classes-create-spdx` class (:oecore_rev:`874b2d301d3c`)
 
-   - :term:`SPDX_INCLUDE_KERNEL_CONFIG`: export the Linux kernel
-     configuration (``CONFIG_*`` parameters) into the SPDX document.
+   -  The :term:`SPDX_CONCLUDED_LICENSE` allows specifying the
+      ``hasConcludedLicense`` object of individual SBOM packages when using the
+      :ref:`ref-classes-create-spdx` class (:oecore_rev:`bb21c6a429a2`)
 
-   - :term:`SPDX_INCLUDE_PACKAGECONFIG`: export a recipe's
-     :term:`PACKAGECONFIG` features (enabled/disabled) into the SPDX document.
+   -  The :term:`FIT_MKIMAGE_EXTRA_OPTS` variable allows passing extra options
+      to the ``mkimage`` command when creating a FIT image with the
+      :ref:`ref-classes-kernel-fit-image` class (:oecore_rev:`d925d67061ef`)
+
+   -  The :term:`FIT_CONF_MAPPINGS` variable allows mapping extra configurations
+      to existing ones or rename an existing configuration in FIT images created
+      with the :ref:`ref-classes-kernel-fit-image` class (:oecore_rev:`e30f809a50c2`)
+
+   -  The :term:`UBOOT_CONFIG_FRAGMENTS` and :term:`UBOOT_FRAGMENTS` allow
+      supplying additional configuration fragments to the existing U-Boot
+      configuration. See the definition of the variables for more information,
+      and the documentation of the :ref:`ref-classes-uboot-config` class
+      (:oecore_rev:`9e96d3dedee4`)
+
+   -  The :term:`IMAGE_EXTRA_PARTITION_FILES` allows specifying extra files from
+      the deploy directory (:term:`DEPLOY_DIR_IMAGE`) to install in a WIC
+      partition created with the ``extra_partition`` plugin
+      (:oecore_rev:`e1526079d205`)
 
 -  Kernel-related changes:
 
 -  New core recipes:
 
+   -  ``libconfig``: Import recipe from :oe_git:`/meta-openembedded/`, needed by
+      one of the Mesa recipes (:oecore_rev:`1a0196a794f8`)
+
+   -  ``python3-sphinxcontrib-svg2pdfconverter``: Used for the generation of the
+      Yocto Project documentation (:oecore_rev:`f3f001967744`)
+
+   -  ``python3-pyzstd``: Import from :oe_git:`meta-python
+      </meta-openembedded/tree/meta-python>`, needed by the ``ukify`` tool of
+      systemd v258 (:oecore_rev:`88a27133c184`)
+
+   -  ``python3-uv-build``: This recipe adds the ``uv`` Python build backend,
+      required by ``python3-cryptography`` (:oecore_rev:`0880cd2b79ee`)
+
+   -  ``blueprint-compiler``: Add the recipe as it became a dependency of the
+      ``epiphany`` recipe after its upgrade to 49.2 (:oecore_rev:`4212392ca7eb`)
+
 -  New core classes:
 
+-  Global configuration changes:
+
+   -  ``base-passwd``: Add a ``clock`` group as `systemd` version v258 introduces
+      this group to `enable applications like linuxptp to open clocks without
+      root privileges <https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd>`__
+      (:oecore_rev:`aad849301be1`)
+
+   -  ``lto.inc``: Add a `Clang` specific :term:`LTO` configuration (:oecore_rev:`253da2e6fc0a`)
+
+   -  ``bitbake.conf``:
+
+      -  remove :term:`DEBUG_PREFIX_MAP` from :term:`TARGET_LDFLAGS`
+         (:oecore_rev:`1797741aad02`)
+
+      -  The default definition of :term:`TARGET_LDFLAGS` used to
+         contain the value of :term:`DEBUG_PREFIX_MAP`, to fix binary
+         reproducibility issues. This was no longer needed after the originating
+         `GCC bug <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473>`__ was
+         fixed (:oecore_rev:`1797741aad02`)
+
+      -  Switch :term:`BB_SIGNATURE_HANDLER` to ``OEEquivHash`` and
+         :term:`BB_HASHSERVE` to ``auto`` by default
+         (:oecore_rev:`5596ea156d3f`, :oecore_rev:`4a388406acf0`)
+
+   -  The :ref:`ref-classes-uninative` class is now enabled by default. This
+      allows reuse of native sstate built on one distro on another
+      (:oecore_rev:`722897f96d30`)
+
+   -  The :oe_git:`no-static-libs.inc
+      <openembedded-core/tree/meta/conf/distro/include/no-static-libs.inc>`
+      file, disabling most static libraries in various recipes, is now included
+      by default in the default distro setup (appearing as the ``nodistro``
+      :term:`DISTRO`) (:oecore_rev:`03fc931bfe9e`)
+
+   -  The :oe_git:`security_flags.inc
+      <openembedded-core/tree/meta/conf/distro/include/security_flags.inc>`
+      file, adding various security related flags to the default compiler and
+      linker, is now included by default in the default distro setup (appearing
+      as ``nodistro`` :term:`DISTRO`) (:oecore_rev:`4c2d64c10a5b`)
+
+   -  The :oe_git:`yocto-space-optimize.inc
+      <openembedded-core/tree/meta/conf/distro/include/yocto-space-optimize.inc>`
+      file, adding various space optimization tweaks, is now included by default
+      in the default distro setup (appearing as ``nodistro`` :term:`DISTRO`)
+      (:oecore_rev:`175fcf9fad69`)
+
 -  Architecture-specific changes:
 
 -  QEMU / ``runqemu`` changes:
 
+   -  ``qemuboot```: Make the tap interface nameserver configurable through
+      :term:`QB_TAP_NAMESERVER` (:oecore_rev:`0e8c2582d46d`)
+
+   -  ``qemu``: Disable the ``libkeyutils`` feature (:oecore_rev:`30cc9f519243`)
+
+   -  ``runqemu-extract-sdk``: Support the ``tar.zst`` format
+      (:oecore_rev:`650bb45251b5`)
+
+   -  ``qemurunner``: Improve ``qmp`` module detection
+      (:oecore_rev:`a7386d071d42`)
+
+   -  ``runqemu``: Support ``.tar.zst``, ``.tar,xz``, ``.tar`` rootfs archive
+      types (:oecore_rev:`3a6172fbb6d3`)
+
 -  Documentation changes:
 
 -  Go changes:
 
+   -  :ref:`ref-classes-go`: Disable workspaces when building
+      (``GOWORK="off"``) (:oecore_rev:`c52c5e886269`)
+
+   -  ``meta-go-toolchain``: Disable support for the ``riscv32`` and ``ppc32``
+      architectures, as this was not supported (:oecore_rev:`f55407185c63`)
+
 -  Rust changes:
 
+   -  Enable dynamic linking with llvm. This allows dynamically linking to
+      ``libLLVM.so`` instead of linking statically (:oecore_rev:`74ba238ff1ba`)
+
 -  Wic Image Creator changes:
 
+   -  ``wic/engine``: Fix copying directories into wic image with ``ext*``
+      partitions (:oecore_rev:`1ed38aff5f81`)
+
 -  SDK-related changes:
 
 -  Testing-related changes:
 
+   - :ref:`ref-classes-ptest` support was added for the following recipes:
+
+      -  ``libarchive`` (:oecore_rev:`6e0bf90e31c9`)
+      -  ``libassuan`` (:oecore_rev:`1010abf3e32e`)
+      -  ``libcheck`` (:oecore_rev:`1bb06e23c1c8`)
+      -  ``libconfig`` (:oecore_rev:`f3e9d1326bf3`)
+      -  ``libksba`` (:oecore_rev:`f50a2005dda8`)
+      -  ``libmd`` (:oecore_rev:`4c0a41389bda`)
+      -  ``libsolv`` (:oecore_rev:`f5432d1c45f9`)
+      -  ``libyaml`` (:oecore_rev:`ed2a3459829b`)
+      -  ``utfcpp`` (:oecore_rev:`49314caa7eb8`)
+
+   -  ``selftests``: Use SHA256 keys for RPM tests (:oecore_rev:`692919be1947`)
+
+   -  ``oeqa``: Open JSON files to parse in a context manager
+      (:oecore_rev:`e96baf588dfa`)
+
+   -  ``resulttool``: Add :ref:`ref-classes-ptest` support to the JUnit output
+      format (:oecore_rev:`2abe2d701c98`)
+
+   -  :ref:`ref-tasks-testimage`: Print last lines of kernel log on test fail
+      (:oecore_rev:`fea3c445a9cc`)
+
+   -  ``reproducible``: Use the `jQuery` CDN instead of ``jquery-native``
+      (:oecore_rev:`d3ee5497b1ce`)
+
+   -  ``selftest``: Test installation of recipes with complex packaging
+      (:oecore_rev:`6f3aab6bfa75`)
+
 -  Utility script changes:
 
+   -  ``bitbake-config-build``: It is now possible to disable all fragments
+      starting with a prefix by issuing ``bitbake-config-build disable-fragment
+      <prefix>/`` (:oecore_rev:`573695d2ff3e`)
+
+   -  ``recipetool``: Support PEP639-variant of license key in Python
+      ``pyproject.toml`` files (:oecore_rev:`9d1a7bb5d8aa`)
+
+   -  :ref:`ref-classes-buildhistory`:
+
+      -  Also show renamed directories (:oecore_rev:`9bf22112ea46`)
+      -  Fix handling of :term:`RDEPENDS` style strings (:oecore_rev:`b013d62d1092`)
+
+   -  ``create-pull-request``: Keep commit hash to be pulled in cover email
+      (:oecore_rev:`c78f5ae4a5ba`)
+
+   -  ``yocto-check-layer``: Add messages in ``test_readme`` assertions
+      (:oecore_rev:`9fe883ce4c62`)
+
 -  BitBake changes:
 
+   -  ``bitbake-layers``:
+
+      -  Add a ``--show-variants`` option to the ``show-recipes`` subcommand to
+         display :term:`BBCLASSEXTEND` variants (:bitbake_rev:`353d5e948c99`)
+
+      -  Fix the branch detection method of ``layerindex-fetch`` (:bitbake_rev:`af9dd012e7f4`)
+
+   -  ``bitbake-setup``:
+
+      -  Implement symlinking local sources into builds with the
+         ``--use-local-source`` option of the ``init`` subcommand
+         (:bitbake_rev:`ed5a3a0fc820`)
+
+      -  Convert ``print()`` calls to use a :term:`BitBake` logger
+         (:bitbake_rev:`6e511d035a3d`)
+
+      -  Correct several scenarios in layer updates (:bitbake_rev:`aa15cc7bd102`)
+
+      -  Source in the ``git-remote`` section can now be specified more simply
+         with the ``uri`` property, instead of the ``remotes`` property
+         (:bitbake_rev:`7941a5dc4dba`). For example:
+
+         .. code-block:: json
+
+            "bitbake": {
+                "git-remote": {
+                    "uri": "https://git.openembedded.org/bitbake",
+                    "branch": "master",
+                    "rev": "master"
+                }
+            }
+
+      -  Use the internal registry if run from a Git checkout, from a remote
+         :term:`BitBake` repository otherwise (:bitbake_rev:`675e9076a252`)
+
+      -  Fragments passed in the ``oe-fragments-one-of`` property can now
+         contain descriptions (:bitbake_rev:`29f2cee655be`)
+
+      -  Improve the readability of choices during the
+         :ref:`bitbake:ref-bbsetup-command-init` command
+         (:bitbake_rev:`d9700632bd6b`)
+
+      -  Enable coloring of the diff outputs when using the
+         :ref:`bitbake:ref-bbsetup-command-status` or
+         :ref:`bitbake:ref-bbsetup-command-update` commands
+
+   -  ``cooker``: Use :term:`bitbake:BB_HASHSERVE_DB_DIR` as hash server
+      database location. If unset, the existing behavior is preserved
+      (:bitbake_rev:`b339d05ad2b6`)
+
+   -  ``bitbake-getvar``: Show close matches when no providers are found
+      (:bitbake_rev:`1f8fa7c25e71`)
+
 -  Packaging changes:
 
--  LLVM related changes:
+-  Clang/LLVM related changes:
+
+   -  ``compiler-rt``: 
+
+      -  Remove the need to depend on ``libgcc`` (:oecore_rev:`f504b6bb8366`)
+      -  Always build C runtime (``crt``) files (:oecore_rev:`56fe42abe21e`)
+
+   -  ``libcxx``: Remove GNU runtime from dependencies (:oecore_rev:`8034509d3065`)
+
+   -  ``libcxx/compiler-rt``: Add support for ``llvm-libgcc``, a drop-in
+      replacement for ``libgcc`` and ``crt`` files (:oecore_rev:`ed02230e3bba`)
 
 -  SPDX-related changes:
 
+   -  ``spdx30_tasks``: Fix :term:`SPDX_CUSTOM_ANNOTATION_VARS` implementation
+      (:oecore_rev:`52ab3b640c6b`)
+
+   -  :ref:`ref-classes-kernel`: Add a task to export the kernel configuration
+      to SPDX (:oecore_rev:`228a968e7c47`)
+
+   -  Add support for exporting the :term:`PACKAGECONFIG` to SPDX
+      (:oecore_rev:`7ec61ac40345`)
+
+   -  Add suport for package URLs (PURLs) through :term:`SPDX_PACKAGE_URL`
+      (:oecore_rev:`874b2d301d3c`)
+
+   -  ``create-spdx-2.2``: Add CVEs in :term:`CVE_CHECK_IGNORE`
+      to the list of fixed CVEs in the output SBOM (:oecore_rev:`f8525224cb82`)
+
 -  ``devtool`` changes:
 
+   -  ``ide-sdk``: Find ``bitbake-setup``'s ``init-build-env``
+      first, and ``oe-init-build-env`` if not found (:oecore_rev:`6ab7e9e8e52f`)
+
+   -  ``ide-sdk``: Add `gdbserver` attach mode support (:oecore_rev:`119171087681`)
+
+   -  ``ide-sdk``: Support GDB pretty-printing for C++ STL types (:oecore_rev:`a69e2baba81b`)
+
 -  Patchtest-related changes:
 
--  :ref:`ref-classes-insane` class related changes:
+   -  Code refactoring and improvements (:oecore_rev:`86d0b2254ae9`,
+      :oecore_rev:`317ef42b9b23`, :oecore_rev:`6cdb5cbbee62`,
+      :oecore_rev:`ae787b32d501`, :oecore_rev:`a85025234809`)
+
+   -  Reject ``Upstream-Status`` after scissors (:oecore_rev:`2156ef9e6def`)
+
+-  :ref:`ref-classes-insane` / :ref:`ref-classes-sanity` classes related changes:
 
 -  Security changes:
 
--  :ref:`ref-classes-cve-check` changes:
+   -  A new document was added to the Yocto Project documentation:
+      :doc:`/security-reference/index`. It is intended to document how to report
+      vulnerabilities to the Yocto Project security team.
+
+-  :ref:`ref-classes-cve-check`-related changes:
+
+   -  ``cve-update-nvd2-native``: Use maximum CVSS score when extracting it from
+      multiple sources (:oecore_rev:`4f6192f3165d`)
 
 -  New :term:`PACKAGECONFIG` options for individual recipes:
 
--  Systemd related changes:
+   -  ``curl``: ``schannel``
+   -  ``gstreamer1.0-plugins-good``: ``qt6``
+   -  ``libinput``: ``lua``, ``libwacom``, ``mtdev``
+   -  ``mesa``: ``expat``, ``zlib``
+   -  ``openssl``: ``legacy``
+   -  ``opkg``: ``acl``, ``xattr``
+   -  ``python3-cryptography``: ``legacy-openssl``
 
--  :ref:`ref-classes-sanity` class changes:
+-  systemd related changes:
 
--  U-boot related changes:
+   -  Package ``ukify`` separately, with the ``systemd-ukify`` package name
+      (:oecore_rev:`e92427496210`)
+
+-  U-Boot related changes:
 
    -  :ref:`ref-classes-uboot-config`: Add support for generating the U-Boot
       initial environment in binary format using
-      :term:`UBOOT_INITIAL_ENV_BINARY`.
+      :term:`UBOOT_INITIAL_ENV_BINARY` (:oecore_rev:`cf11b14a4cfc`)
+
+   -  A new way of specifying multiple U-Boot configurations has been added
+      (:oecore_rev:`cd9e7304481b`). See
+      :ref:`ref-migration-6-0-u-boot-config-flow-changes`
 
 -  Miscellaneous changes:
 
+   -  ``curl``: Ensure ``CURL_CA_BUNDLE`` from host environment is respected
+      (:oecore_rev:`545e43a7a45b`)
+
+   -  ``weston``: Add PipeWire as runtime dependency when ``pipewire`` is part
+      of :term:`PACKAGECONFIG` (:oecore_rev:`9f5286725ad4`)
+
+   -  :ref:`ref-classes-uki`: Use basename of device trees available via
+      :term:`KERNEL_DEVICETREE` (:oecore_rev:`27a7fbb767c0`)
+
+   -  ``rpcbind``: Set the owner of ``/run/rpcbind`` to ``rpc``
+      (:oecore_rev:`80e428924715`)
+
+   -  :ref:`ref-classes-archiver`: Remove :term:`WORKDIR` from the patch
+      directory (:oecore_rev:`c99d22827c95`)
+
+   -  ``gtk4``: Convert to use the :ref:`ref-classes-gnomebase` class
+      (:oecore_rev:`fcd5e7c4468f`)
+
+   -  ``udev-extraconf``: Split ``automount`` and ``autonet`` into seperate
+      packages (``udev-extraconf-automount`` and ``udev-extraconf-autonet``)
+      (:oecore_rev:`08662d71cd35`)
+
+   -  ``e2fsprogs``: Fix a bug for files larger than 2GB (:oecore_rev:`683a1e773899`)
+
+   -  ``mesa``: Add support for the ``virtio``, ``gfxstream``, ``hasvk`` Vulkan drivers
+      (:oecore_rev:`8e7ffdceded3`, :oecore_rev:`3b56f14b2019`)
+
+   -  ``mesa``: Drop :wikipedia:`VDPAU <VDPAU>` remnants in the recipe after
+      upstream support was removed (:oecore_rev:`3b05f58586bc`)
+
+   -  :ref:`ref-classes-cross`: Propagate dependencies to ``outhash``,
+      improving :ref:`hash equivalence <overview-manual/concepts:Hash
+      Equivalence>` (:oecore_rev:`267b651e875d`)
+
+   -  ``run-postinsts``: Propagate exit status to the ``run-postinsts.service``
+      systemd service (:oecore_rev:`7f74d88bb628`)
+
+   -  ``freetype``: Use :ref:`ref-classes-meson` instead of
+      :ref:`ref-classes-autotools` (:oecore_rev:`7395e4f99e90`)
+
+   -  ``wpa-supplicant``:
+
+      -  Build with :wikipedia:`OWE <Opportunistic_Wireless_Encryption>` support
+         by default (:oecore_rev:`d16c66b4efad`)
+
+      -  Build with :wikipedia:`802.11be <Wi-Fi_7>` support by default
+         (:oecore_rev:`d16c66b4efad`)
+
+   -  ``overlayfs``: Remove helper unit (:oecore_rev:`623c20ff1e98`)
+
+   -  :ref:`ref-classes-patch`: Show full path when a patch fails to apply
+      (:oecore_rev:`602e28b48134`)
+
+   -  ``kea``: Replace ``keactrl`` with `kea` daemons (``kea-dhcp*``) in
+      initscripts (:oecore_rev:`7f9d9297a84f`), and remove ``keactrl`` from the
+      recipe (:oecore_rev:`08c3877f4df8`)
+
+   -  ``initramfs-framework``: Add handover of PID 1's arguments to modules
+      (:oecore_rev:`a0ab3d1c4f9e`)
+
+   -  ``perl``: Provide ``pod2man`` (in the recipe's :term:`PROVIDES`
+      definition). This is used by many other recipes to produce :wikipedia:`man
+      pages <Man_page>`. This allows existing recipes to explicitly depend on
+      ``pod2man-native`` to produce man pages (:oecore_rev:`1d1e55d200fb`)
+
+   -  ``build-sysroots``: Add sysroot tasks to default build and remove warning
+      (:oecore_rev:`e73f15095522`)
+
+   -  Licenses and manifests are now deployed in the SDK when setting
+      :term:`COPY_LIC_DIRS` and/or :term:`COPY_LIC_MANIFEST`, for both host and
+      target sysroots (:oecore_rev:`f757ae4dadab`)
+
+   -  ``openssl``: Disable TLS 1.0/1.1 by default (:oecore_rev:`d5501e772088`)
+
+   -  ``python3-cryptography``: Disable ``legacy-openssl`` feature by default
+      (:oecore_rev:`1acd1998bbaf`)
+
+   -  ``openssl``: Add support for config snippet includes. This can be done by
+      installing extra configuration files in ``${sysconfdir}/ssl/openssl.cnf.d/``
+      (:oecore_rev:`34bafcf3d8cd`)
+
+   -  ``busybox``: Enable SELinux support if :term:`DISTRO_FEATURES` contains
+      ``selinux`` (:oecore_rev:`c544f12073ea`)
+
+   -  ``coreutils``: ``kill`` and ``uptime`` are no longer provided by the
+      recipe (:oecore_rev:`cedeb958dfa8`)
+
 Known Issues in |yocto-ver|
 ---------------------------
 

-- 
2.53.0


