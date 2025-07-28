Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF239C87FD2
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 08:52:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.76955.1753692752895651189
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 01:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kUEEM4Sy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D31A4335D;
	Mon, 28 Jul 2025 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753692751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Gwm6N6bciUnzQS5Hb2EvWYtHVV9sTyaO8sRVhjCwjU=;
	b=kUEEM4SysnPfOChWj8MqfzH63jlKlWEhkJgIamUTPTGoH/b/hhaWEy23mndA8Su4IiJV02
	L0nrRK2UQYAIUvh5LBRwALg/X8IZBw9nUM9+e2gMpTM2sBIvE5Ro5bSwI1tFPc2F015emK
	pgOCkY6x9BSX+0/jqTgS2/9xIMaRZ0dSHJy3IA4eP5O7v44idPO705aapq0G5NNgt7JGxk
	Rq7Hk5qMjd3vSqv12iXXvjqu+bqqBQo2IuujpqiQdcljCkHcOa23AlIkDX4UE9AFuNXlly
	pkTDBCA0pjUbbLHoOkZO+wjVsqjVp6taxMwWaum3zoXduNkUHjsE7bFA2zfhgw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 28 Jul 2025 10:52:25 +0200
Subject: [PATCH v2 3/3] ref-manual: gather all QA checks in qa-checks.rst
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250728-refactor-qa-checks-v2-3-9e0737979f05@bootlin.com>
References: <20250728-refactor-qa-checks-v2-0-9e0737979f05@bootlin.com>
In-Reply-To: <20250728-refactor-qa-checks-v2-0-9e0737979f05@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=68699;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Cw8j81xHHJ9oI6oOjaF/yOgPr+5KJefVINuSDPV34f4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBohzpO/YkQ/nJYrY03s1C0llHtXI3927PUPBltr
 IERvSK8qKOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIc6TgAKCRDRgEFAKaOo
 Ngm6D/4wH6uRkI9/cACHfBbPDclKtgDw/kam3tcx6vdXj5W6foxUYW7gXjEes+uBw4a3OEO2/Bt
 hXUQFm6jdbLT1vHMZbGjRXHfthYlJ/Fu76TgxYVryYHkrhgD9XLUrnFyzvWm5lg3H8WmUYwCJxe
 /wRtejoyLkDpDp4hq4p4X65gNTPL52qH7PZfE7UnfT0zNteCRzPIKjprmphrcl96PIckhE8J/k3
 T0dNYvp7N/gdh+1nWwkq+26hXi7bck7IeN9J4ATJr5FzDdPCMYISqDU4z1m/v0NuVtr2gVsk/oz
 DWosAIFsfFnhgfPastOZKaqRxPqF4+EEi41OTY7UkgywcsPHABTsJgJuRVSQfx58tjS8614bb0O
 DYu3Ea6vftUB660DGXAZuxpTCLLhvYaLAXCo7Nmspnq/PatiCh/riCFaXr8OP6m9bEgHrZZJ/eX
 YxDNDQbzcS5dcUGjAyDoTchLRNmLlZvJw0UcTMzw3vwuzcikV1/wekZh87kKrANGlWMHZYYFcT/
 yGWe7RyHeD8daH74KsFC5lyIvh0uLr2tAvmcXKHeDo0qOUiFOG1Dd+1u2zgBFQHxtzrDdYbestJ
 56fti63XkVHFrqEKswIW8gucdLBrFAk0vHeeRXS60eUyVtYtEQ1f+ewmAEVpnuEiLMP4A5TYJx7
 eONLrnkPs570iNQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeluddtkedtjefhvedtudevhedvkeeltedvgfffvdevffeltdeugfeviedviefgnecuffhomhgrihhnpegrkhhkrgguihgrrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhop
 ehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Jul 2025 08:52:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7392

There was duplication between qa-checks.rst and the doc for the insane
class, so move all of the QA checks in this qa-checks.rst. Remove the
documentation for these checks from classes.rst and link to the
qa-checks.rst document from there.

For QA checks that were only documented only in classes.rst, add them to
qa-checks.rst.

Also sort qa-checks by their names in qa-checks.rst.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 317 +----------
 documentation/ref-manual/qa-checks.rst | 933 +++++++++++++++++----------------
 2 files changed, 487 insertions(+), 763 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5f7b7c5ce..dc93cd98e 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1345,321 +1345,8 @@ are meant to detect real or potential problems in the packaged
 output. So exercise caution when disabling these checks.
 
 The tests you can list with the :term:`WARN_QA` and
-:term:`ERROR_QA` variables are:
-
--  ``already-stripped:`` Checks that produced binaries have not
-   already been stripped prior to the build system extracting debug
-   symbols. It is common for upstream software projects to default to
-   stripping debug symbols for output binaries. In order for debugging
-   to work on the target using ``-dbg`` packages, this stripping must be
-   disabled.
-
--  ``arch:`` Checks the Executable and Linkable Format (ELF) type, bit
-   size, and endianness of any binaries to ensure they match the target
-   architecture. This test fails if any binaries do not match the type
-   since there would be an incompatibility. The test could indicate that
-   the wrong compiler or compiler options have been used. Sometimes
-   software, like bootloaders, might need to bypass this check.
-
--  ``buildpaths:`` Checks for paths to locations on the build host
-   inside the output files. Not only can these leak information about
-   the build environment, they also hinder binary reproducibility.
-
--  ``build-deps:`` Determines if a build-time dependency that is
-   specified through :term:`DEPENDS`, explicit
-   :term:`RDEPENDS`, or task-level dependencies exists
-   to match any runtime dependency. This determination is particularly
-   useful to discover where runtime dependencies are detected and added
-   during packaging. If no explicit dependency has been specified within
-   the metadata, at the packaging stage it is too late to ensure that
-   the dependency is built, and thus you can end up with an error when
-   the package is installed into the image during the
-   :ref:`ref-tasks-rootfs` task because the auto-detected
-   dependency was not satisfied. An example of this would be where the
-   :ref:`ref-classes-update-rc.d` class automatically
-   adds a dependency on the ``initscripts-functions`` package to
-   packages that install an initscript that refers to
-   ``/etc/init.d/functions``. The recipe should really have an explicit
-   :term:`RDEPENDS` for the package in question on ``initscripts-functions``
-   so that the OpenEmbedded build system is able to ensure that the
-   ``initscripts`` recipe is actually built and thus the
-   ``initscripts-functions`` package is made available.
-
--  ``configure-gettext:`` Checks that if a recipe is building something
-   that uses automake and the automake files contain an ``AM_GNU_GETTEXT``
-   directive, that the recipe also inherits the :ref:`ref-classes-gettext`
-   class to ensure that gettext is available during the build.
-
--  ``debug-deps:`` Checks that all packages except ``-dbg`` packages
-   do not depend on ``-dbg`` packages, which would cause a packaging
-   bug.
-
--  ``debug-files:`` Checks for ``.debug`` directories in anything but
-   the ``-dbg`` package. The debug files should all be in the ``-dbg``
-   package. Thus, anything packaged elsewhere is incorrect packaging.
-
--  ``dep-cmp:`` Checks for invalid version comparison statements in
-   runtime dependency relationships between packages (i.e. in
-   :term:`RDEPENDS`,
-   :term:`RRECOMMENDS`,
-   :term:`RSUGGESTS`,
-   :term:`RPROVIDES`,
-   :term:`RREPLACES`, and
-   :term:`RCONFLICTS` variable values). Any invalid
-   comparisons might trigger failures or undesirable behavior when
-   passed to the package manager.
-
--  ``desktop:`` Runs the ``desktop-file-validate`` program against any
-   ``.desktop`` files to validate their contents against the
-   specification for ``.desktop`` files.
-
--  ``dev-deps:`` Checks that all packages except ``-dev`` or
-   ``-staticdev`` packages do not depend on ``-dev`` packages, which
-   would be a packaging bug.
-
--  ``dev-so:`` Checks that the ``.so`` symbolic links are in the
-   ``-dev`` package and not in any of the other packages. In general,
-   these symlinks are only useful for development purposes. Thus, the
-   ``-dev`` package is the correct location for them. In very rare
-   cases, such as dynamically loaded modules, these symlinks
-   are needed instead in the main package.
-
--  ``empty-dirs:`` Checks that packages are not installing files to
-   directories that are normally expected to be empty (such as ``/tmp``)
-   The list of directories that are checked is specified by the
-   :term:`QA_EMPTY_DIRS` variable.
-
--  ``file-rdeps:`` Checks that file-level dependencies identified by
-   the OpenEmbedded build system at packaging time are satisfied. For
-   example, a shell script might start with the line ``#!/bin/bash``.
-   This line would translate to a file dependency on ``/bin/bash``. Of
-   the three package managers that the OpenEmbedded build system
-   supports, only RPM directly handles file-level dependencies,
-   resolving them automatically to packages providing the files.
-   However, the lack of that functionality in the other two package
-   managers does not mean the dependencies do not still need resolving.
-   This QA check attempts to ensure that explicitly declared
-   :term:`RDEPENDS` exist to handle any file-level
-   dependency detected in packaged files.
-
--  ``files-invalid:`` Checks for :term:`FILES` variable
-   values that contain "//", which is invalid.
-
--  ``host-user-contaminated:`` Checks that no package produced by the
-   recipe contains any files outside of ``/home`` with a user or group
-   ID that matches the user running BitBake. A match usually indicates
-   that the files are being installed with an incorrect UID/GID, since
-   target IDs are independent from host IDs. For additional information,
-   see the section describing the
-   :ref:`ref-tasks-install` task.
-
--  ``incompatible-license:`` Report when packages are excluded from
-   being created due to being marked with a license that is in
-   :term:`INCOMPATIBLE_LICENSE`.
-
--  ``installed-vs-shipped:`` Reports when files have been installed
-   within :ref:`ref-tasks-install` but have not been included in any package by
-   way of the :term:`FILES` variable. Files that do not
-   appear in any package cannot be present in an image later on in the
-   build process. Ideally, all installed files should be packaged or not
-   installed at all. These files can be deleted at the end of
-   :ref:`ref-tasks-install` if the files are not needed in any package.
-
--  ``invalid-chars:`` Checks that the recipe metadata variables
-   :term:`DESCRIPTION`,
-   :term:`SUMMARY`, :term:`LICENSE`, and
-   :term:`SECTION` do not contain non-UTF-8 characters.
-   Some package managers do not support such characters.
-
--  ``invalid-packageconfig:`` Checks that no undefined features are
-   being added to :term:`PACKAGECONFIG`. For
-   example, any name "foo" for which the following form does not exist::
-
-      PACKAGECONFIG[foo] = "..."
-
--  ``la:`` Checks ``.la`` files for any :term:`TMPDIR` paths. Any ``.la``
-   file containing these paths is incorrect since ``libtool`` adds the
-   correct sysroot prefix when using the files automatically itself.
-
--  ``ldflags:`` Ensures that the binaries were linked with the
-   :term:`LDFLAGS` options provided by the build system.
-   If this test fails, check that the :term:`LDFLAGS` variable is being
-   passed to the linker command.
-
--  ``libdir:`` Checks for libraries being installed into incorrect
-   (possibly hardcoded) installation paths. For example, this test will
-   catch recipes that install ``/lib/bar.so`` when ``${base_libdir}`` is
-   "lib32". Another example is when recipes install
-   ``/usr/lib64/foo.so`` when ``${libdir}`` is "/usr/lib".
-
--  ``libexec:`` Checks if a package contains files in
-   ``/usr/libexec``. This check is not performed if the ``libexecdir``
-   variable has been set explicitly to ``/usr/libexec``.
-
--  ``mime:`` Check that if a package contains mime type files (``.xml``
-   files in ``${datadir}/mime/packages``) that the recipe also inherits
-   the :ref:`ref-classes-mime` class in order to ensure that these get
-   properly installed.
-
--  ``mime-xdg:`` Checks that if a package contains a .desktop file with a
-   'MimeType' key present, that the recipe inherits the
-   :ref:`ref-classes-mime-xdg` class that is required in order for that
-   to be activated.
-
--  ``missing-update-alternatives:`` Check that if a recipe sets the
-   :term:`ALTERNATIVE` variable that the recipe also inherits
-   :ref:`ref-classes-update-alternatives` such that the alternative will
-   be correctly set up.
-
--  ``packages-list:`` Checks for the same package being listed
-   multiple times through the :term:`PACKAGES` variable
-   value. Installing the package in this manner can cause errors during
-   packaging.
-
--  ``patch-fuzz:`` Checks for fuzz in patch files that may allow
-   them to apply incorrectly if the underlying code changes.
-
--  ``patch-status:`` Checks that the ``Upstream-Status`` is specified and valid
-   in the headers of patches for recipes.
-
--  ``pep517-backend:`` checks that a recipe inheriting
-   :ref:`ref-classes-setuptools3` has a PEP517-compliant backend.
-
--  ``perllocalpod:`` Checks for ``perllocal.pod`` being erroneously
-   installed and packaged by a recipe.
-
--  ``perm-config:`` Reports lines in ``fs-perms.txt`` that have an
-   invalid format.
-
--  ``perm-line:`` Reports lines in ``fs-perms.txt`` that have an
-   invalid format.
-
--  ``perm-link:`` Reports lines in ``fs-perms.txt`` that specify
-   'link' where the specified target already exists.
-
--  ``perms:`` Currently, this check is unused but reserved.
-
--  ``pkgconfig:`` Checks ``.pc`` files for any
-   :term:`TMPDIR`/:term:`WORKDIR` paths.
-   Any ``.pc`` file containing these paths is incorrect since
-   ``pkg-config`` itself adds the correct sysroot prefix when the files
-   are accessed.
-
--  ``pkgname:`` Checks that all packages in
-   :term:`PACKAGES` have names that do not contain
-   invalid characters (i.e. characters other than 0-9, a-z, ., +, and
-   -).
-
--  ``pkgv-undefined:`` Checks to see if the :term:`PKGV` variable is
-   undefined during :ref:`ref-tasks-package`.
-
--  ``pkgvarcheck:`` Checks through the variables
-   :term:`RDEPENDS`,
-   :term:`RRECOMMENDS`,
-   :term:`RSUGGESTS`,
-   :term:`RCONFLICTS`,
-   :term:`RPROVIDES`,
-   :term:`RREPLACES`, :term:`FILES`,
-   :term:`ALLOW_EMPTY`, ``pkg_preinst``,
-   ``pkg_postinst``, ``pkg_prerm`` and ``pkg_postrm``, and reports if
-   there are variable sets that are not package-specific. Using these
-   variables without a package suffix is bad practice, and might
-   unnecessarily complicate dependencies of other packages within the
-   same recipe or have other unintended consequences.
-
--  ``pn-overrides:`` Checks that a recipe does not have a name
-   (:term:`PN`) value that appears in
-   :term:`OVERRIDES`. If a recipe is named such that
-   its :term:`PN` value matches something already in :term:`OVERRIDES` (e.g.
-   :term:`PN` happens to be the same as :term:`MACHINE` or
-   :term:`DISTRO`), it can have unexpected consequences.
-   For example, assignments such as ``FILES:${PN} = "xyz"`` effectively
-   turn into ``FILES = "xyz"``.
-
--  ``recipe-naming:`` Checks that the recipe name and recipe class match, so
-   that ``*-native`` recipes inherit :ref:`ref-classes-native` and
-   ``nativesdk-*`` recipes inherit :ref:`ref-classes-nativesdk`.
-
--  ``rpaths:`` Checks for rpaths in the binaries that contain build
-   system paths such as :term:`TMPDIR`. If this test fails, bad ``-rpath``
-   options are being passed to the linker commands and your binaries
-   have potential security issues.
-
--  ``shebang-size:`` Check that the shebang line (``#!`` in the first line)
-   in a packaged script is not longer than 128 characters, which can cause
-   an error at runtime depending on the operating system.
-
--  ``staticdev:`` Checks for static library files (``*.a``) in
-   non-``staticdev`` packages.
-
--  ``src-uri-bad:`` Checks that the :term:`SRC_URI` value set by a recipe
-   does not contain a reference to ``${PN}`` (instead of the correct
-   ``${BPN}``) nor refers to unstable Github archive tarballs.
-
--  ``symlink-to-sysroot:`` Checks for symlinks in packages that point
-   into :term:`TMPDIR` on the host. Such symlinks will
-   work on the host, but are clearly invalid when running on the target.
-
--  ``textrel:`` Checks for ELF binaries that contain relocations in
-   their ``.text`` sections, which can result in a performance impact at
-   runtime. See the explanation for the ``ELF binary`` message in
-   ":doc:`/ref-manual/qa-checks`" for more information regarding runtime performance
-   issues.
-
--  ``unhandled-features-check:`` check that if one of the variables that
-   the :ref:`ref-classes-features_check` class supports (e.g.
-   :term:`REQUIRED_DISTRO_FEATURES`) is set by a recipe, then the recipe
-   also inherits :ref:`ref-classes-features_check` in order for the
-   requirement to actually work.
-
--  ``unimplemented-ptest:`` Checks that ptests are implemented for upstream
-   tests.
-
--  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
-   for a package are also declared on the recipe level (i.e. any license
-   in ``LICENSE:*`` should appear in :term:`LICENSE`).
-
--  ``useless-rpaths:`` Checks for dynamic library load paths (rpaths)
-   in the binaries that by default on a standard system are searched by
-   the linker (e.g. ``/lib`` and ``/usr/lib``). While these paths will
-   not cause any breakage, they do waste space and are unnecessary.
-
--  ``usrmerge:`` If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this
-   check will ensure that no package installs files to root (``/bin``,
-   ``/sbin``, ``/lib``, ``/lib64``) directories.
-
--  ``var-undefined:`` Reports when variables fundamental to packaging
-   (i.e. :term:`WORKDIR`,
-   :term:`DEPLOY_DIR`, :term:`D`,
-   :term:`PN`, and :term:`PKGD`) are undefined
-   during :ref:`ref-tasks-package`.
-
--  ``version-going-backwards:`` If the :ref:`ref-classes-buildhistory`
-   class is enabled, reports when a package being written out has a lower
-   version than the previously written package under the same name. If
-   you are placing output packages into a feed and upgrading packages on
-   a target system using that feed, the version of a package going
-   backwards can result in the target system not correctly upgrading to
-   the "new" version of the package.
-
-   .. note::
-
-      This is only relevant when you are using runtime package management
-      on your target system.
-
--  ``virtual-slash:`` Checks to see if ``virtual/`` is being used in
-   :term:`RDEPENDS` or :term:`RPROVIDES`, which is not good practice ---
-   ``virtual/`` is a convention intended for use in the build context
-   (i.e. :term:`PROVIDES` and :term:`DEPENDS`) rather than the runtime
-   context.
-
--  ``xorg-driver-abi:`` Checks that all packages containing Xorg
-   drivers have ABI dependencies. The ``xserver-xorg`` recipe provides
-   driver ABI names. All drivers should depend on the ABI versions that
-   they have been built against. Driver recipes that include
-   ``xorg-driver-input.inc`` or ``xorg-driver-video.inc`` will
-   automatically get these versions. Consequently, you should only need
-   to explicitly add dependencies to binary driver recipes.
+:term:`ERROR_QA` variables are documented in the :doc:`/ref-manual/qa-checks`
+document of the Yocto Project Reference Manual.
 
 .. _ref-classes-kernel:
 
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 27d46de3f..91a0f6149 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -43,126 +43,30 @@ error form along with an explanation.
 Errors and Warnings
 ===================
 
-.. _qa-check-libexec:
-
--  ``<packagename>: <path> is using libexec please relocate to <libexecdir> [libexec]``
-
-   The specified package contains files in ``/usr/libexec`` when the
-   distro configuration uses a different path for ``<libexecdir>`` By
-   default, ``<libexecdir>`` is ``$prefix/libexec``. However, this
-   default can be changed (e.g. ``${libdir}``).
-
-    
-.. _qa-check-rpaths:
-
--  ``package <packagename> contains bad RPATH <rpath> in file <file> [rpaths]``
-
-   The specified binary produced by the recipe contains dynamic library
-   load paths (rpaths) that contain build system paths such as
-   :term:`TMPDIR`, which are incorrect for the target and
-   could potentially be a security issue. Check for bad ``-rpath``
-   options being passed to the linker in your
-   :ref:`ref-tasks-compile` log. Depending on the build
-   system used by the software being built, there might be a configure
-   option to disable rpath usage completely within the build of the
-   software.
-
-    
-.. _qa-check-useless-rpaths:
-
--  ``<packagename>: <file> contains probably-redundant RPATH <rpath> [useless-rpaths]``
-
-   The specified binary produced by the recipe contains dynamic library
-   load paths (rpaths) that on a standard system are searched by default
-   by the linker (e.g. ``/lib`` and ``/usr/lib``). While these paths
-   will not cause any breakage, they do waste space and are unnecessary.
-   Depending on the build system used by the software being built, there
-   might be a configure option to disable rpath usage completely within
-   the build of the software.
-
-    
-.. _qa-check-file-rdeps:
-
--  ``<packagename> requires <files>, but no providers in its RDEPENDS [file-rdeps]``
-
-   A file-level dependency has been identified from the specified
-   package on the specified files, but there is no explicit
-   corresponding entry in :term:`RDEPENDS`. If
-   particular files are required at runtime then :term:`RDEPENDS` should be
-   declared in the recipe to ensure the packages providing them are
-   built.
-
-    
-.. _qa-check-build-deps:
-
--  ``<packagename1> rdepends on <packagename2>, but it isn't a build dependency? [build-deps]``
-
-   There is a runtime dependency between the two specified packages, but
-   there is nothing explicit within the recipe to enable the
-   OpenEmbedded build system to ensure that dependency is satisfied.
-   This condition is usually triggered by an
-   :term:`RDEPENDS` value being added at the packaging
-   stage rather than up front, which is usually automatic based on the
-   contents of the package. In most cases, you should change the recipe
-   to add an explicit :term:`RDEPENDS` for the dependency.
-
-    
-.. _qa-check-dev-so:
-
--  ``non -dev/-dbg/nativesdk- package contains symlink .so: <packagename> path '<path>' [dev-so]``
-
-   Symlink ``.so`` files are for development only, and should therefore
-   go into the ``-dev`` package. This situation might occur if you add
-   ``*.so*`` rather than ``*.so.*`` to a non-dev package. Change
-   :term:`FILES` (and possibly
-   :term:`PACKAGES`) such that the specified ``.so``
-   file goes into an appropriate ``-dev`` package.
-
-    
-.. _qa-check-staticdev:
-
--  ``non -staticdev package contains static .a library: <packagename> path '<path>' [staticdev]``
-
-   Static ``.a`` library files should go into a ``-staticdev`` package.
-   Change :term:`FILES` (and possibly
-   :term:`PACKAGES`) such that the specified ``.a`` file
-   goes into an appropriate ``-staticdev`` package.
-
-    
-.. _qa-check-libdir:
-
--  ``<packagename>: found library in wrong location [libdir]``
-
-   The specified file may have been installed into an incorrect
-   (possibly hardcoded) installation path. For example, this test will
-   catch recipes that install ``/lib/bar.so`` when ``${base_libdir}`` is
-   "lib32". Another example is when recipes install
-   ``/usr/lib64/foo.so`` when ``${libdir}`` is "/usr/lib". False
-   positives occasionally exist. For these cases add "libdir" to
-   :term:`INSANE_SKIP` for the package.
-
-    
-.. _qa-check-debug-files:
+.. _qa-check-already-stripped:
 
--  ``non debug package contains .debug directory: <packagename> path <path> [debug-files]``
+-  ``File '<file>' from <recipename> was already stripped, this will prevent future debugging! [already-stripped]``
 
-   The specified package contains a ``.debug`` directory, which should
-   not appear in anything but the ``-dbg`` package. This situation might
-   occur if you add a path which contains a ``.debug`` directory and do
-   not explicitly add the ``.debug`` directory to the ``-dbg`` package.
-   If this is the case, add the ``.debug`` directory explicitly to
-   ``FILES:${PN}-dbg``. See :term:`FILES` for additional
-   information on :term:`FILES`.
+   Produced binaries have already been stripped prior to the build
+   system extracting debug symbols. It is common for upstream software
+   projects to default to stripping debug symbols for output binaries.
+   In order for debugging to work on the target using ``-dbg`` packages,
+   this stripping must be disabled.
 
-.. _qa-check-empty-dirs:
+   Depending on the build system used by the software being built,
+   disabling this stripping could be as easy as specifying an additional
+   configure option. If not, disabling stripping might involve patching
+   the build scripts. In the latter case, look for references to "strip"
+   or "STRIP", or the "-s" or "-S" command-line options being specified
+   on the linker command line (possibly through the compiler command
+   line if preceded with "-Wl,").
 
--  ``<packagename> installs files in <path>, but it is expected to be empty [empty-dirs]``
+   .. note::
 
-   The specified package is installing files into a directory that is
-   normally expected to be empty (such as ``/tmp``). These files may
-   be more appropriately installed to a different location, or
-   perhaps alternatively not installed at all, usually by updating the
-   :ref:`ref-tasks-install` task/function.
+      Disabling stripping here does not mean that the final packaged
+      binaries will be unstripped. Once the OpenEmbedded build system
+      splits out debug symbols to the ``-dbg`` package, it will then
+      strip the symbols from the binaries.
 
 .. _qa-check-arch:
 
@@ -182,8 +86,6 @@ Errors and Warnings
    option is to check the :ref:`ref-tasks-compile` log
    and verify that the compiler options being used are correct.
 
-    
-
 -  ``Bit size did not match (<file_bits>, expected <machine_bits>) in <file> [arch]``
 
    By default, the OpenEmbedded build system checks the Executable and
@@ -200,8 +102,6 @@ Errors and Warnings
    option is to check the :ref:`ref-tasks-compile` log
    and verify that the compiler options being used are correct.
 
-    
-
 -  ``Endianness did not match (<file_endianness>, expected <machine_endianness>) in <file> [arch]``
 
    By default, the OpenEmbedded build system checks the Executable and
@@ -218,96 +118,55 @@ Errors and Warnings
    option is to check the :ref:`ref-tasks-compile` log
    and verify that the compiler options being used are correct.
 
-    
-.. _qa-check-textrel:
-
--  ``ELF binary '<file>' has relocations in .text [textrel]``
-
-   The specified ELF binary contains relocations in its ``.text``
-   sections. This situation can result in a performance impact at
-   runtime.
-
-   Typically, the way to solve this performance issue is to add "-fPIC"
-   or "-fpic" to the compiler command-line options. For example, given
-   software that reads :term:`CFLAGS` when you build it,
-   you could add the following to your recipe::
-
-      CFLAGS:append = " -fPIC "
-
-   For more information on text relocations at runtime, see
-   https://www.akkadia.org/drepper/textrelocs.html.
-
-    
-.. _qa-check-ldflags:
-
--  ``File '<file>' in package '<package>' doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]``
-
-   This indicates that binaries produced when building the recipe have
-   not been linked with the :term:`LDFLAGS` options
-   provided by the build system. Check to be sure that the :term:`LDFLAGS`
-   variable is being passed to the linker command. A common workaround
-   for this situation is to pass in :term:`LDFLAGS` using
-   :term:`TARGET_CC_ARCH` within the recipe as
-   follows::
-
-      TARGET_CC_ARCH += "${LDFLAGS}"
-
-    
-.. _qa-check-xorg-driver-abi:
-
--  ``Package <packagename> contains Xorg driver (<driver>) but no xorg-abi- dependencies [xorg-driver-abi]``
-
-   The specified package contains an Xorg driver, but does not have a
-   corresponding ABI package dependency. The xserver-xorg recipe
-   provides driver ABI names. All drivers should depend on the ABI
-   versions that they have been built against. Driver recipes that
-   include ``xorg-driver-input.inc`` or ``xorg-driver-video.inc`` will
-   automatically get these versions. Consequently, you should only need
-   to explicitly add dependencies to binary driver recipes.
-
-    
-.. _qa-check-infodir:
+.. _qa-check-build-deps:
 
--  ``The /usr/share/info/dir file is not meant to be shipped in a particular package. [infodir]``
+-  ``<packagename1> rdepends on <packagename2>, but it isn't a build dependency? [build-deps]``
 
-   The ``/usr/share/info/dir`` should not be packaged. Add the following
-   line to your :ref:`ref-tasks-install` task or to your
-   ``do_install:append`` within the recipe as follows::
+   There is a runtime dependency between the two specified packages, but
+   there is nothing explicit within the recipe to enable the
+   OpenEmbedded build system to ensure that dependency is satisfied.
+   This condition is usually triggered by an
+   :term:`RDEPENDS` value being added at the packaging
+   stage rather than up front, which is usually automatic based on the
+   contents of the package. In most cases, you should change the recipe
+   to add an explicit :term:`RDEPENDS` for the dependency.
 
-      rm ${D}${infodir}/dir
-   
+.. _qa-check-buildpaths:
 
-.. _qa-check-symlink-to-sysroot:
+- ``File <filename> in package <packagename> contains reference to TMPDIR [buildpaths]``
 
--  ``Symlink <path> in <packagename> points to TMPDIR [symlink-to-sysroot]``
+    This check ensures that build system paths (including :term:`TMPDIR`) do not
+    appear in output files, which not only leaks build system configuration into
+    the target, but also hinders binary reproducibility as the output will change
+    if the build system configuration changes.
 
-   The specified symlink points into :term:`TMPDIR` on the
-   host. Such symlinks will work on the host. However, they are clearly
-   invalid when running on the target. You should either correct the
-   symlink to use a relative path or remove the symlink.
+    Typically these paths will enter the output through some mechanism in the
+    configuration or compilation of the software being built by the recipe. To
+    resolve this issue you will need to determine how the detected path is
+    entering the output. Sometimes it may require adjusting scripts or code to
+    use a relative path rather than an absolute one, or to pick up the path from
+    runtime configuration or environment variables.
 
-    
-.. _qa-check-la:
+.. _qa-check-configure-gettext:
 
--  ``<file> failed sanity test (workdir) in path <path> [la]``
+-  ``AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]``
 
-   The specified ``.la`` file contains :term:`TMPDIR`
-   paths. Any ``.la`` file containing these paths is incorrect since
-   ``libtool`` adds the correct sysroot prefix when using the files
-   automatically itself.
+    If a recipe is building something that uses automake and the automake
+    files contain an ``AM_GNU_GETTEXT`` directive then this check will fail
+    if there is no ``inherit gettext`` statement in the recipe to ensure
+    that gettext is available during the build. Add ``inherit gettext`` to
+    remove the warning.
 
-    
-.. _qa-check-pkgconfig:
+.. _qa-check-configure-unsafe:
 
--  ``<file> failed sanity test (tmpdir) in path <path> [pkgconfig]``
+-  ``This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities. Rerun configure task after fixing this. [configure-unsafe]``
 
-   The specified ``.pc`` file contains
-   :term:`TMPDIR`\ ``/``\ :term:`WORKDIR`
-   paths. Any ``.pc`` file containing these paths is incorrect since
-   ``pkg-config`` itself adds the correct sysroot prefix when the files
-   are accessed.
+   The log for the :ref:`ref-tasks-configure` task
+   indicates that paths on the host were searched for files, which is
+   not appropriate when cross-compiling. Look for "is unsafe for
+   cross-compilation" or "CROSS COMPILE Badness" in the specified log
+   file.
 
-    
 .. _qa-check-debug-deps:
 
 -  ``<packagename> rdepends on <debug_packagename> [debug-deps]``
@@ -330,33 +189,21 @@ Errors and Warnings
    (e.g. a non-symlink ``.so`` file) or it might have been added
    manually (e.g. by adding to :term:`RDEPENDS`).
 
-    
-.. _qa-check-dev-deps:
-
--  ``<packagename> rdepends on <dev_packagename> [dev-deps]``
+.. _qa-check-debug-files:
 
-   There is a dependency between the specified non-dev package (a package
-   whose name does not end in ``-dev``) and a package that is a ``dev``
-   package. The ``dev`` packages contain development headers and are
-   usually brought in using several different methods:
+-  ``non debug package contains .debug directory: <packagename> path <path> [debug-files]``
 
-   -  Using the ``dev-pkgs``
-      :term:`IMAGE_FEATURES` value.
+   The specified package contains a ``.debug`` directory, which should
+   not appear in anything but the ``-dbg`` package. This situation might
+   occur if you add a path which contains a ``.debug`` directory and do
+   not explicitly add the ``.debug`` directory to the ``-dbg`` package.
+   If this is the case, add the ``.debug`` directory explicitly to
+   ``FILES:${PN}-dbg``. See :term:`FILES` for additional
+   information on :term:`FILES`.
 
-   -  Using :term:`IMAGE_INSTALL`.
+.. _qa-check-dep-cmp:
 
-   -  As a dependency of another ``dev`` package that was brought in
-      using one of the above methods.
-
-   The dependency might have been automatically added (because the
-   ``dev`` package erroneously contains files that it should not have
-   (e.g. a non-symlink ``.so`` file) or it might have been added
-   manually (e.g. by adding to :term:`RDEPENDS`).
-
-    
-.. _qa-check-dep-cmp:
-
--  ``<var>:<packagename> is invalid: <comparison> (<value>)   only comparisons <, =, >, <=, and >= are allowed [dep-cmp]``
+-  ``<var>:<packagename> is invalid: <comparison> (<value>)   only comparisons <, =, >, <=, and >= are allowed [dep-cmp]``
 
    If you are adding a versioned dependency relationship to one of the
    dependency variables (:term:`RDEPENDS`,
@@ -368,159 +215,98 @@ Errors and Warnings
    comparison operators. Change the versioned dependency values you are
    adding to match those listed in the message.
 
-    
-.. _qa-check-compile-host-path:
-
--  ``<recipename>: The compile log indicates that host include and/or library paths were used. Please check the log '<logfile>' for more information. [compile-host-path]``
-
-   The log for the :ref:`ref-tasks-compile` task
-   indicates that paths on the host were searched for files, which is
-   not appropriate when cross-compiling. Look for "is unsafe for
-   cross-compilation" or "CROSS COMPILE Badness" in the specified log
-   file.
-
-    
-.. _qa-check-install-host-path:
-
--  ``<recipename>: The install log indicates that host include and/or library paths were used. Please check the log '<logfile>' for more information. [install-host-path]``
-
-   The log for the :ref:`ref-tasks-install` task
-   indicates that paths on the host were searched for files, which is
-   not appropriate when cross-compiling. Look for "is unsafe for
-   cross-compilation" or "CROSS COMPILE Badness" in the specified log
-   file.
-
-    
-.. _qa-check-configure-unsafe:
-
--  ``This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities. Rerun configure task after fixing this. [configure-unsafe]``
-
-   The log for the :ref:`ref-tasks-configure` task
-   indicates that paths on the host were searched for files, which is
-   not appropriate when cross-compiling. Look for "is unsafe for
-   cross-compilation" or "CROSS COMPILE Badness" in the specified log
-   file.
+.. _qa-check-dev-deps:
 
-    
-.. _qa-check-pkgname:
+-  ``<packagename> rdepends on <dev_packagename> [dev-deps]``
 
--  ``<packagename> doesn't match the [a-z0-9.+-]+ regex [pkgname]``
+   There is a dependency between the specified non-dev package (a package
+   whose name does not end in ``-dev``) and a package that is a ``dev``
+   package. The ``dev`` packages contain development headers and are
+   usually brought in using several different methods:
 
-   The convention within the OpenEmbedded build system (sometimes
-   enforced by the package manager itself) is to require that package
-   names are all lower case and to allow a restricted set of characters.
-   If your recipe name does not match this, or you add packages to
-   :term:`PACKAGES` that do not conform to the
-   convention, then you will receive this error. Rename your recipe. Or,
-   if you have added a non-conforming package name to :term:`PACKAGES`,
-   change the package name appropriately.
+   -  Using the ``dev-pkgs``
+      :term:`IMAGE_FEATURES` value.
 
-    
-.. _qa-check-unknown-configure-option:
+   -  Using :term:`IMAGE_INSTALL`.
 
--  ``<recipe>: configure was passed unrecognized options: <options> [unknown-configure-option]``
+   -  As a dependency of another ``dev`` package that was brought in
+      using one of the above methods.
 
-   The configure script is reporting that the specified options are
-   unrecognized. This situation could be because the options were
-   previously valid but have been removed from the configure script. Or,
-   there was a mistake when the options were added and there is another
-   option that should be used instead. If you are unsure, consult the
-   upstream build documentation, the ``./configure --help`` output, and
-   the upstream change log or release notes. Once you have worked out
-   what the appropriate change is, you can update
-   :term:`EXTRA_OECONF`,
-   :term:`PACKAGECONFIG_CONFARGS`, or the
-   individual :term:`PACKAGECONFIG` option values
-   accordingly.
+   The dependency might have been automatically added (because the
+   ``dev`` package erroneously contains files that it should not have
+   (e.g. a non-symlink ``.so`` file) or it might have been added
+   manually (e.g. by adding to :term:`RDEPENDS`).
 
-    
-.. _qa-check-pn-overrides:
+.. _qa-check-desktop:
 
--  ``Recipe <recipefile> has PN of "<recipename>" which is in OVERRIDES, this can result in unexpected behavior. [pn-overrides]``
+-  ``"Desktop file issue: ... [desktop]``
 
-   The specified recipe has a name (:term:`PN`) value that
-   appears in :term:`OVERRIDES`. If a recipe is named
-   such that its :term:`PN` value matches something already in :term:`OVERRIDES`
-   (e.g. :term:`PN` happens to be the same as :term:`MACHINE`
-   or :term:`DISTRO`), it can have unexpected
-   consequences. For example, assignments such as
-   ``FILES:${PN} = "xyz"`` effectively turn into ``FILES = "xyz"``.
-   Rename your recipe (or if :term:`PN` is being set explicitly, change the
-   :term:`PN` value) so that the conflict does not occur. See
-   :term:`FILES` for additional information.
+   Runs the ``desktop-file-validate`` program against any
+   ``.desktop`` files to validate their contents against the
+   specification for ``.desktop`` files.
 
-    
-.. _qa-check-pkgvarcheck:
+.. _qa-check-dev-so:
 
--  ``<recipefile>: Variable <variable> is set as not being package specific, please fix this. [pkgvarcheck]``
+-  ``non -dev/-dbg/nativesdk- package contains symlink .so: <packagename> path '<path>' [dev-so]``
 
-   Certain variables (:term:`RDEPENDS`,
-   :term:`RRECOMMENDS`,
-   :term:`RSUGGESTS`,
-   :term:`RCONFLICTS`,
-   :term:`RPROVIDES`,
-   :term:`RREPLACES`, :term:`FILES`,
-   ``pkg_preinst``, ``pkg_postinst``, ``pkg_prerm``, ``pkg_postrm``, and
-   :term:`ALLOW_EMPTY`) should always be set specific
-   to a package (i.e. they should be set with a package name override
-   such as ``RDEPENDS:${PN} = "value"`` rather than
-   ``RDEPENDS = "value"``). If you receive this error, correct any
-   assignments to these variables within your recipe.
+   Symlink ``.so`` files are for development only, and should therefore
+   go into the ``-dev`` package. This situation might occur if you add
+   ``*.so*`` rather than ``*.so.*`` to a non-dev package. Change
+   :term:`FILES` (and possibly
+   :term:`PACKAGES`) such that the specified ``.so``
+   file goes into an appropriate ``-dev`` package.
 
+.. _qa-check-empty-dirs:
 
-- ``recipe uses DEPENDS:${PN}, should use DEPENDS [pkgvarcheck]``
+-  ``<packagename> installs files in <path>, but it is expected to be empty [empty-dirs]``
 
-   This check looks for instances of setting ``DEPENDS:${PN}``
-   which is erroneous (:term:`DEPENDS` is a recipe-wide variable and thus
-   it is not correct to specify it for a particular package, nor will such
-   an assignment actually work.) Set :term:`DEPENDS` instead.
+   The specified package is installing files into a directory that is
+   normally expected to be empty (such as ``/tmp``). These files may
+   be more appropriately installed to a different location, or
+   perhaps alternatively not installed at all, usually by updating the
+   :ref:`ref-tasks-install` task/function.
 
+.. _qa-check-file-rdeps:
 
-.. _qa-check-already-stripped:
+-  ``<packagename> requires <files>, but no providers in its RDEPENDS [file-rdeps]``
 
--  ``File '<file>' from <recipename> was already stripped, this will prevent future debugging! [already-stripped]``
+   A file-level dependency has been identified from the specified
+   package on the specified files, but there is no explicit
+   corresponding entry in :term:`RDEPENDS`. If
+   particular files are required at runtime then :term:`RDEPENDS` should be
+   declared in the recipe to ensure the packages providing them are
+   built.
 
-   Produced binaries have already been stripped prior to the build
-   system extracting debug symbols. It is common for upstream software
-   projects to default to stripping debug symbols for output binaries.
-   In order for debugging to work on the target using ``-dbg`` packages,
-   this stripping must be disabled.
+.. _qa-check-files-invalid:
 
-   Depending on the build system used by the software being built,
-   disabling this stripping could be as easy as specifying an additional
-   configure option. If not, disabling stripping might involve patching
-   the build scripts. In the latter case, look for references to "strip"
-   or "STRIP", or the "-s" or "-S" command-line options being specified
-   on the linker command line (possibly through the compiler command
-   line if preceded with "-Wl,").
+-  ``FILES variable for package <packagename> contains '//' which is invalid. Attempting to fix this but you should correct the metadata. [files-invalid]``
 
-   .. note::
+   The string "//" is invalid in a Unix path. Correct all occurrences
+   where this string appears in a :term:`FILES` variable so
+   that there is only a single "/".
 
-      Disabling stripping here does not mean that the final packaged
-      binaries will be unstripped. Once the OpenEmbedded build system
-      splits out debug symbols to the ``-dbg`` package, it will then
-      strip the symbols from the binaries.
+.. _qa-check-host-user-contaminated:
 
-    
-.. _qa-check-packages-list:
+-  ``<package name>: <path> is owned by gid/uid <gid/uid>, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]``
 
--  ``<packagename> is listed in PACKAGES multiple times, this leads to packaging errors. [packages-list]``
+   Checks that no package produced by the
+   recipe contains any files outside of ``/home`` with a user or group
+   ID that matches the user running BitBake. A match usually indicates
+   that the files are being installed with an incorrect UID/GID, since
+   target IDs are independent from host IDs. For additional information,
+   see the section describing the
+   :ref:`ref-tasks-install` task.
 
-   Package names must appear only once in the
-   :term:`PACKAGES` variable. You might receive this
-   error if you are attempting to add a package to :term:`PACKAGES` that is
-   already in the variable's value.
+.. _qa-check-infodir:
 
-    
-.. _qa-check-files-invalid:
+-  ``The /usr/share/info/dir file is not meant to be shipped in a particular package. [infodir]``
 
--  ``FILES variable for package <packagename> contains '//' which is invalid. Attempting to fix this but you should correct the metadata. [files-invalid]``
+   The ``/usr/share/info/dir`` should not be packaged. Add the following
+   line to your :ref:`ref-tasks-install` task or to your
+   ``do_install:append`` within the recipe as follows::
 
-   The string "//" is invalid in a Unix path. Correct all occurrences
-   where this string appears in a :term:`FILES` variable so
-   that there is only a single "/".
+      rm ${D}${infodir}/dir
 
-    
 .. _qa-check-installed-vs-shipped:
 
 -  ``<recipename>: Files/directories were installed but not shipped in any package [installed-vs-shipped]``
@@ -539,8 +325,6 @@ Errors and Warnings
    -  Delete the files at the end of the :ref:`ref-tasks-install` task if the
       files are not needed in any package.
 
-    
-
 -  ``<oldpackage>-<oldpkgversion> was registered as shlib provider for <library>, changing it to <newpackage>-<newpkgversion> because it was built later``
 
    This message means that both ``<oldpackage>`` and ``<newpackage>``
@@ -552,27 +336,73 @@ Errors and Warnings
    :term:`PRIVATE_LIBS` in the recipe that provides
    the private version of the library.
 
+.. _qa-check-incompatible-license:
 
-.. _qa-check-unlisted-pkg-lics:
+-  ``Excluding <package> from packaging as it has incompatible license(s): <license> [incompatible-license]``
 
--  ``LICENSE:<packagename> includes licenses (<licenses>) that are not listed in LICENSE [unlisted-pkg-lics]``
+   Report when packages are excluded from being created due to being marked with
+   a license that is in :term:`INCOMPATIBLE_LICENSE`.
 
-   The :term:`LICENSE` of the recipe should be a superset
-   of all the licenses of all packages produced by this recipe. In other
-   words, any license in ``LICENSE:*`` should also appear in
-   :term:`LICENSE`.
+.. _qa-check-invalid-chars:
 
+-  ``<variable> has non <envoding> characters [invalid-chars]``
 
-.. _qa-check-configure-gettext:
+   Checks that the recipe metadata variables :term:`DESCRIPTION`,
+   :term:`SUMMARY`, :term:`LICENSE`, and :term:`SECTION` do not contain
+   non-UTF-8 characters. Some package managers do not support such characters.
 
--  ``AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]``
+.. _qa-check-invalid-packageconfig:
 
-    If a recipe is building something that uses automake and the automake
-    files contain an ``AM_GNU_GETTEXT`` directive then this check will fail
-    if there is no ``inherit gettext`` statement in the recipe to ensure
-    that gettext is available during the build. Add ``inherit gettext`` to
-    remove the warning.
+-  ``<package>: invalid PACKAGECONFIG(s): <configs> [invalid-packageconfig]``
+
+   Checks that no undefined features are being added to :term:`PACKAGECONFIG`.
+   For example, any name "foo" for which the following form does not exist::
+
+      PACKAGECONFIG[foo] = "..."
+
+.. _qa-check-la:
+
+-  ``<file> failed sanity test (workdir) in path <path> [la]``
+
+   The specified ``.la`` file contains :term:`TMPDIR`
+   paths. Any ``.la`` file containing these paths is incorrect since
+   ``libtool`` adds the correct sysroot prefix when using the files
+   automatically itself.
+
+.. _qa-check-ldflags:
+
+-  ``File '<file>' in package '<package>' doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]``
+
+   This indicates that binaries produced when building the recipe have
+   not been linked with the :term:`LDFLAGS` options
+   provided by the build system. Check to be sure that the :term:`LDFLAGS`
+   variable is being passed to the linker command. A common workaround
+   for this situation is to pass in :term:`LDFLAGS` using
+   :term:`TARGET_CC_ARCH` within the recipe as
+   follows::
+
+      TARGET_CC_ARCH += "${LDFLAGS}"
+
+.. _qa-check-libdir:
+
+-  ``<packagename>: found library in wrong location [libdir]``
+
+   The specified file may have been installed into an incorrect
+   (possibly hardcoded) installation path. For example, this test will
+   catch recipes that install ``/lib/bar.so`` when ``${base_libdir}`` is
+   "lib32". Another example is when recipes install
+   ``/usr/lib64/foo.so`` when ``${libdir}`` is "/usr/lib". False
+   positives occasionally exist. For these cases add "libdir" to
+   :term:`INSANE_SKIP` for the package.
+
+.. _qa-check-libexec:
+
+-  ``<packagename>: <path> is using libexec please relocate to <libexecdir> [libexec]``
 
+   The specified package contains files in ``/usr/libexec`` when the
+   distro configuration uses a different path for ``<libexecdir>`` By
+   default, ``<libexecdir>`` is ``$prefix/libexec``. However, this
+   default can be changed (e.g. ``${libdir}``).
 
 .. _qa-check-mime:
 
@@ -584,7 +414,6 @@ Errors and Warnings
    properly installed. Either add ``inherit mime`` to the recipe or remove the
    files at the :ref:`ref-tasks-install` step if they are not needed.
 
-
 .. _qa-check-mime-xdg:
 
 - ``package contains desktop file with key 'MimeType' but does not inhert mime-xdg: <packagename> path '<file>' [mime-xdg]``
@@ -595,89 +424,28 @@ Errors and Warnings
     ``inherit mime`` to the recipe or remove the files at the
     :ref:`ref-tasks-install` step if they are not needed.
 
+.. _qa-check-missing-update-alternatives:
 
-.. _qa-check-src-uri-bad:
-
-- ``<recipename>: SRC_URI uses unstable GitHub archives [src-uri-bad]``
+- ``<recipename>: recipe defines ALTERNATIVE:<packagename> but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]``
 
-    GitHub provides "archive" tarballs, however these can be re-generated
-    on the fly and thus the file's signature will not necessarily match that
-    in the :term:`SRC_URI` checksums in future leading to build failures. It is
-    recommended that you use an official release tarball or switch to
-    pulling the corresponding revision in the actual git repository instead.
+    This check ensures that if a recipe sets the :term:`ALTERNATIVE` variable that the
+    recipe also inherits :ref:`ref-classes-update-alternatives` such
+    that the alternative will be correctly set up. If you are seeing this message, either
+    add ``inherit update-alternatives`` to your recipe or remove the reference to the variable
+    if it is not needed.
 
+.. _qa-check-packages-list:
 
-- ``SRC_URI uses PN not BPN [src-uri-bad]``
+-  ``<packagename> is listed in PACKAGES multiple times, this leads to packaging errors. [packages-list]``
 
-    If some part of :term:`SRC_URI` needs to reference the recipe name, it should do
-    so using ${:term:`BPN`} rather than ${:term:`PN`} as the latter will change
-    for different variants of the same recipe e.g. when :term:`BBCLASSEXTEND`
-    or multilib are being used. This check will fail if a reference to ``${PN}``
-    is found within the :term:`SRC_URI` value --- change it to ``${BPN}`` instead.
+   Package names must appear only once in the
+   :term:`PACKAGES` variable. You might receive this
+   error if you are attempting to add a package to :term:`PACKAGES` that is
+   already in the variable's value.
 
+.. _qa-check-patch-fuzz:
 
-.. _qa-check-unhandled-features-check:
-
-- ``<recipename>: recipe doesn't inherit features_check [unhandled-features-check]``
-
-    This check ensures that if one of the variables that the
-    :ref:`ref-classes-features_check` class supports (e.g.
-    :term:`REQUIRED_DISTRO_FEATURES`) is used, then the recipe
-    inherits :ref:`ref-classes-features_check` in order for
-    the requirement to actually work. If you are seeing this message, either
-    add ``inherit features_check`` to your recipe or remove the reference to
-    the variable if it is not needed.
-
-
-.. _qa-check-missing-update-alternatives:
-
-- ``<recipename>: recipe defines ALTERNATIVE:<packagename> but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]``
-
-    This check ensures that if a recipe sets the :term:`ALTERNATIVE` variable that the
-    recipe also inherits :ref:`ref-classes-update-alternatives` such
-    that the alternative will be correctly set up. If you are seeing this message, either
-    add ``inherit update-alternatives`` to your recipe or remove the reference to the variable
-    if it is not needed.
-
-
-.. _qa-check-shebang-size:
-
-- ``<packagename>: <file> maximum shebang size exceeded, the maximum size is 128. [shebang-size]``
-
-    This check ensures that the shebang line (``#!`` in the first line) for a script
-    is not longer than 128 characters, which can cause an error at runtime depending
-    on the operating system. If you are seeing this message then the specified script
-    may need to be patched to have a shorter in order to avoid runtime problems.
-
-
-.. _qa-check-perllocalpod:
-
-- ``<packagename> contains perllocal.pod (<files>), should not be installed [perllocalpod]``
-
-    ``perllocal.pod`` is an index file of locally installed modules and so shouldn't be
-    installed by any distribution packages. The :ref:`ref-classes-cpan` class
-    already sets ``NO_PERLLOCAL`` to stop this file being generated by most Perl recipes,
-    but if a recipe is using ``MakeMaker`` directly then they might not be doing this
-    correctly. This check ensures that perllocal.pod is not in any package in order to
-    avoid multiple packages shipping this file and thus their packages conflicting
-    if installed together.
-
-
-.. _qa-check-usrmerge:
-
-- ``<packagename> package is not obeying usrmerge distro feature. /<path> should be relocated to /usr. [usrmerge]``
-
-    If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this check will ensure that no package
-    installs files to root (``/bin``, ``/sbin``, ``/lib``, ``/lib64``) directories. If you are seeing this
-    message, it indicates that the :ref:`ref-tasks-install` step (or perhaps the build process that
-    :ref:`ref-tasks-install` is calling into, e.g. ``make install`` is using hardcoded paths instead
-    of the variables set up for this (``bindir``, ``sbindir``, etc.), and should be
-    changed so that it does.
-
-
-.. _qa-check-patch-fuzz:
-
-- ``Fuzz detected: <patch output> [patch-fuzz]``
+- ``Fuzz detected: <patch output> [patch-fuzz]``
 
     This check looks for evidence of "fuzz" when applying patches within the :ref:`ref-tasks-patch`
     task. Patch fuzz is a situation when the ``patch`` tool ignores some of the context
@@ -749,7 +517,6 @@ Errors and Warnings
     the patch updates that modify the context. Devtool may also refresh
     other things in the patches, those can be discarded.
 
-
 .. _qa-check-patch-status:
 
 - ``Missing Upstream-Status in patch <patchfile> Please add according to <url> [patch-status]``
@@ -768,22 +535,208 @@ Errors and Warnings
     it must be a specific format. See the "Missing Upstream-Status" entry above
     for more information.
 
+.. _qa-check-pep517-backend:
 
-.. _qa-check-buildpaths:
+-  ``inherits setuptools3 but has pyproject.toml with <build backend>, use the correct class [pep517-backend]``
 
-- ``File <filename> in package <packagename> contains reference to TMPDIR [buildpaths]``
+   Checks that a recipe inheriting :ref:`ref-classes-setuptools3` has a
+   PEP517-compliant backend.
 
-    This check ensures that build system paths (including :term:`TMPDIR`) do not
-    appear in output files, which not only leaks build system configuration into
-    the target, but also hinders binary reproducibility as the output will change
-    if the build system configuration changes.
+.. _qa-check-perllocalpod:
 
-    Typically these paths will enter the output through some mechanism in the
-    configuration or compilation of the software being built by the recipe. To
-    resolve this issue you will need to determine how the detected path is
-    entering the output. Sometimes it may require adjusting scripts or code to
-    use a relative path rather than an absolute one, or to pick up the path from
-    runtime configuration or environment variables.
+- ``<packagename> contains perllocal.pod (<files>), should not be installed [perllocalpod]``
+
+    ``perllocal.pod`` is an index file of locally installed modules and so shouldn't be
+    installed by any distribution packages. The :ref:`ref-classes-cpan` class
+    already sets ``NO_PERLLOCAL`` to stop this file being generated by most Perl recipes,
+    but if a recipe is using ``MakeMaker`` directly then they might not be doing this
+    correctly. This check ensures that perllocal.pod is not in any package in order to
+    avoid multiple packages shipping this file and thus their packages conflicting
+    if installed together.
+
+.. _qa-check-perm-config:
+
+-  ``Fixup Perms: invalid config line <line> [perm-config]``
+
+   Reports lines in ``fs-perms.txt`` that have an invalid format.
+
+.. _qa-check-perm-line:
+
+-  ``Fixup perms: <config> invalid line: <line> [perm-line]``
+
+   Reports lines in ``fs-perms.txt`` that have an invalid format.
+
+.. _qa-check-perm-link:
+
+-  ``Fixup Perms: Unable to correct directory link, target already exists: <directory> -> <target> [perm-link]``
+
+   Reports lines in ``fs-perms.txt`` that specify 'link' where the specified
+   target already exists.
+
+.. _qa-check-perms:
+
+-  ``perms``: Currently, this check is unused but reserved.
+
+.. _qa-check-pkgconfig:
+
+-  ``<file> failed sanity test (tmpdir) in path <path> [pkgconfig]``
+
+   The specified ``.pc`` file contains
+   :term:`TMPDIR`\ ``/``\ :term:`WORKDIR`
+   paths. Any ``.pc`` file containing these paths is incorrect since
+   ``pkg-config`` itself adds the correct sysroot prefix when the files
+   are accessed.
+
+.. _qa-check-pkgname:
+
+-  ``<packagename> doesn't match the [a-z0-9.+-]+ regex [pkgname]``
+
+   The convention within the OpenEmbedded build system (sometimes
+   enforced by the package manager itself) is to require that package
+   names are all lower case and to allow a restricted set of characters.
+   If your recipe name does not match this, or you add packages to
+   :term:`PACKAGES` that do not conform to the
+   convention, then you will receive this error. Rename your recipe. Or,
+   if you have added a non-conforming package name to :term:`PACKAGES`,
+   change the package name appropriately.
+
+.. _qa-check-pkgvarcheck:
+
+-  ``<recipefile>: Variable <variable> is set as not being package specific, please fix this. [pkgvarcheck]``
+
+   Certain variables (:term:`RDEPENDS`,
+   :term:`RRECOMMENDS`,
+   :term:`RSUGGESTS`,
+   :term:`RCONFLICTS`,
+   :term:`RPROVIDES`,
+   :term:`RREPLACES`, :term:`FILES`,
+   ``pkg_preinst``, ``pkg_postinst``, ``pkg_prerm``, ``pkg_postrm``, and
+   :term:`ALLOW_EMPTY`) should always be set specific
+   to a package (i.e. they should be set with a package name override
+   such as ``RDEPENDS:${PN} = "value"`` rather than
+   ``RDEPENDS = "value"``). If you receive this error, correct any
+   assignments to these variables within your recipe.
+
+
+- ``recipe uses DEPENDS:${PN}, should use DEPENDS [pkgvarcheck]``
+
+   This check looks for instances of setting ``DEPENDS:${PN}``
+   which is erroneous (:term:`DEPENDS` is a recipe-wide variable and thus
+   it is not correct to specify it for a particular package, nor will such
+   an assignment actually work.) Set :term:`DEPENDS` instead.
+
+.. _qa-check-pn-overrides:
+
+-  ``Recipe <recipefile> has PN of "<recipename>" which is in OVERRIDES, this can result in unexpected behavior. [pn-overrides]``
+
+   The specified recipe has a name (:term:`PN`) value that
+   appears in :term:`OVERRIDES`. If a recipe is named
+   such that its :term:`PN` value matches something already in :term:`OVERRIDES`
+   (e.g. :term:`PN` happens to be the same as :term:`MACHINE`
+   or :term:`DISTRO`), it can have unexpected
+   consequences. For example, assignments such as
+   ``FILES:${PN} = "xyz"`` effectively turn into ``FILES = "xyz"``.
+   Rename your recipe (or if :term:`PN` is being set explicitly, change the
+   :term:`PN` value) so that the conflict does not occur. See
+   :term:`FILES` for additional information.
+
+.. _qa-check-shebang-size:
+
+- ``<packagename>: <file> maximum shebang size exceeded, the maximum size is 128. [shebang-size]``
+
+    This check ensures that the shebang line (``#!`` in the first line) for a script
+    is not longer than 128 characters, which can cause an error at runtime depending
+    on the operating system. If you are seeing this message then the specified script
+    may need to be patched to have a shorter in order to avoid runtime problems.
+
+.. _qa-check-src-uri-bad:
+
+- ``<recipename>: SRC_URI uses unstable GitHub archives [src-uri-bad]``
+
+    GitHub provides "archive" tarballs, however these can be re-generated
+    on the fly and thus the file's signature will not necessarily match that
+    in the :term:`SRC_URI` checksums in future leading to build failures. It is
+    recommended that you use an official release tarball or switch to
+    pulling the corresponding revision in the actual git repository instead.
+
+
+- ``SRC_URI uses PN not BPN [src-uri-bad]``
+
+    If some part of :term:`SRC_URI` needs to reference the recipe name, it should do
+    so using ${:term:`BPN`} rather than ${:term:`PN`} as the latter will change
+    for different variants of the same recipe e.g. when :term:`BBCLASSEXTEND`
+    or multilib are being used. This check will fail if a reference to ``${PN}``
+    is found within the :term:`SRC_URI` value --- change it to ``${BPN}`` instead.
+
+.. _qa-check-staticdev:
+
+-  ``non -staticdev package contains static .a library: <packagename> path '<path>' [staticdev]``
+
+   Static ``.a`` library files should go into a ``-staticdev`` package.
+   Change :term:`FILES` (and possibly
+   :term:`PACKAGES`) such that the specified ``.a`` file
+   goes into an appropriate ``-staticdev`` package.
+
+.. _qa-check-symlink-to-sysroot:
+
+-  ``Symlink <path> in <packagename> points to TMPDIR [symlink-to-sysroot]``
+
+   The specified symlink points into :term:`TMPDIR` on the
+   host. Such symlinks will work on the host. However, they are clearly
+   invalid when running on the target. You should either correct the
+   symlink to use a relative path or remove the symlink.
+
+.. _qa-check-recipe-naming:
+
+-  ``Recipe <recipe> appears native/nativesdk but is not, should inherit native/nativesdk``
+
+   Checks that the recipe name and recipe class match, so that ``*-native``
+   recipes inherit :ref:`ref-classes-native` and ``nativesdk-*`` recipes
+   inherit :ref:`ref-classes-nativesdk`.
+
+.. _qa-check-rpaths:
+
+-  ``package <packagename> contains bad RPATH <rpath> in file <file> [rpaths]``
+
+   The specified binary produced by the recipe contains dynamic library
+   load paths (rpaths) that contain build system paths such as
+   :term:`TMPDIR`, which are incorrect for the target and
+   could potentially be a security issue. Check for bad ``-rpath``
+   options being passed to the linker in your
+   :ref:`ref-tasks-compile` log. Depending on the build
+   system used by the software being built, there might be a configure
+   option to disable rpath usage completely within the build of the
+   software.
+
+.. _qa-check-textrel:
+
+-  ``ELF binary '<file>' has relocations in .text [textrel]``
+
+   The specified ELF binary contains relocations in its ``.text``
+   sections. This situation can result in a performance impact at
+   runtime.
+
+   Typically, the way to solve this performance issue is to add "-fPIC"
+   or "-fpic" to the compiler command-line options. For example, given
+   software that reads :term:`CFLAGS` when you build it,
+   you could add the following to your recipe::
+
+      CFLAGS:append = " -fPIC "
+
+   For more information on text relocations at runtime, see
+   https://www.akkadia.org/drepper/textrelocs.html.
+
+.. _qa-check-unhandled-features-check:
+
+- ``<recipename>: recipe doesn't inherit features_check [unhandled-features-check]``
+
+    This check ensures that if one of the variables that the
+    :ref:`ref-classes-features_check` class supports (e.g.
+    :term:`REQUIRED_DISTRO_FEATURES`) is used, then the recipe
+    inherits :ref:`ref-classes-features_check` in order for
+    the requirement to actually work. If you are seeing this message, either
+    add ``inherit features_check`` to your recipe or remove the reference to
+    the variable if it is not needed.
 
 .. _qa-check-unimplemented-ptest:
 
@@ -795,6 +748,79 @@ Errors and Warnings
     section in the Yocto Project Development Tasks Manual. See also the
     ":ref:`ref-classes-ptest`" section.
 
+.. _qa-check-unknown-configure-option:
+
+-  ``<recipe>: configure was passed unrecognized options: <options> [unknown-configure-option]``
+
+   The configure script is reporting that the specified options are
+   unrecognized. This situation could be because the options were
+   previously valid but have been removed from the configure script. Or,
+   there was a mistake when the options were added and there is another
+   option that should be used instead. If you are unsure, consult the
+   upstream build documentation, the ``./configure --help`` output, and
+   the upstream change log or release notes. Once you have worked out
+   what the appropriate change is, you can update
+   :term:`EXTRA_OECONF`,
+   :term:`PACKAGECONFIG_CONFARGS`, or the
+   individual :term:`PACKAGECONFIG` option values
+   accordingly.
+
+.. _qa-check-unlisted-pkg-lics:
+
+-  ``LICENSE:<packagename> includes licenses (<licenses>) that are not listed in LICENSE [unlisted-pkg-lics]``
+
+   The :term:`LICENSE` of the recipe should be a superset
+   of all the licenses of all packages produced by this recipe. In other
+   words, any license in ``LICENSE:*`` should also appear in
+   :term:`LICENSE`.
+
+.. _qa-check-useless-rpaths:
+
+-  ``<packagename>: <file> contains probably-redundant RPATH <rpath> [useless-rpaths]``
+
+   The specified binary produced by the recipe contains dynamic library
+   load paths (rpaths) that on a standard system are searched by default
+   by the linker (e.g. ``/lib`` and ``/usr/lib``). While these paths
+   will not cause any breakage, they do waste space and are unnecessary.
+   Depending on the build system used by the software being built, there
+   might be a configure option to disable rpath usage completely within
+   the build of the software.
+
+.. _qa-check-usrmerge:
+
+- ``<packagename> package is not obeying usrmerge distro feature. /<path> should be relocated to /usr. [usrmerge]``
+
+    If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this check will ensure that no package
+    installs files to root (``/bin``, ``/sbin``, ``/lib``, ``/lib64``) directories. If you are seeing this
+    message, it indicates that the :ref:`ref-tasks-install` step (or perhaps the build process that
+    :ref:`ref-tasks-install` is calling into, e.g. ``make install`` is using hardcoded paths instead
+    of the variables set up for this (``bindir``, ``sbindir``, etc.), and should be
+    changed so that it does.
+
+.. _qa-check-var-undefined:
+
+-  ``WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package [var-undefined]`` 
+
+   Reports when variables fundamental to packaging (i.e. :term:`WORKDIR`,
+   :term:`DEPLOY_DIR`, :term:`D`, :term:`PN`, and :term:`PKGD`) are undefined
+   during :ref:`ref-tasks-package`.
+
+.. _qa-check-version-going-backwards:
+
+-  ``Package version for package <package> went backwards which would break package feeds (from <version2> to <version1>) [version-going-backwards]``
+
+   If the :ref:`ref-classes-buildhistory` class is enabled, reports when a
+   package being written out has a lower version than the previously written
+   package under the same name. If you are placing output packages into a feed
+   and upgrading packages on a target system using that feed, the version of a
+   package going backwards can result in the target system not correctly
+   upgrading to the "new" version of the package.
+
+   .. note::
+
+      This is only relevant when you are using runtime package management
+      on your target system.
+
 .. _qa-check-virtual-slash:
 
 - ``<variable> is set to <value> but the substring 'virtual/' holds no meaning in this context. It only works for build time dependencies, not runtime ones. It is suggested to use 'VIRTUAL-RUNTIME_' variables instead.``
@@ -804,6 +830,17 @@ Errors and Warnings
     context (i.e. :term:`RPROVIDES` and :term:`RDEPENDS`). Use
     :term:`VIRTUAL-RUNTIME` variables instead for the latter.
 
+.. _qa-check-xorg-driver-abi:
+
+-  ``Package <packagename> contains Xorg driver (<driver>) but no xorg-abi- dependencies [xorg-driver-abi]``
+
+   The specified package contains an Xorg driver, but does not have a
+   corresponding ABI package dependency. The xserver-xorg recipe
+   provides driver ABI names. All drivers should depend on the ABI
+   versions that they have been built against. Driver recipes that
+   include ``xorg-driver-input.inc`` or ``xorg-driver-video.inc`` will
+   automatically get these versions. Consequently, you should only need
+   to explicitly add dependencies to binary driver recipes.
 
 Configuring and Disabling QA Checks
 ===================================

-- 
2.50.1


