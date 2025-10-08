Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05FBCCA472
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 13:33:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.16106.1759930409832604883
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Oct 2025 06:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bCJK+zm2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2DC174E40F8F
	for <docs@lists.yoctoproject.org>; Wed,  8 Oct 2025 13:33:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE03F606E5
	for <docs@lists.yoctoproject.org>; Wed,  8 Oct 2025 13:33:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D92E2102F1C7C;
	Wed,  8 Oct 2025 15:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759930407; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hJXlMB1cz/TEIRiud15qJRxQi+kGwA8Wo9xNHBldrZk=;
	b=bCJK+zm2EjmHggj+B85JuXn8KtHvPFlnDCVvY0MvYi2TGcdJ21jOxm8zwPAMAlRorEVJxF
	ruKe2ftfAtTDGfKkRH5taF9xNk0P7/LeHNGbSxTul7FkCzChWqaH2WBArD0JmeyntCO+YO
	myRAXs5uUXwsBOA0pHkY56LNmQCY+xhrHwY4k1EejFSNDDP2mZcYBY49xu+MGMU6TEsyWi
	LDJBC6KuG5M2MUSwfY8cykg+oQRnZebA/CWRFZKh65tpXEmxod/7V8QaqHrz2vQGzO1jcM
	2hYsbHT4xMWVgCZiXMivQ5NKay49tMBorTl8f1kPE7l2BLFjCaSut6vI9o+zDA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 08 Oct 2025 15:33:16 +0200
Subject: [PATCH] ref-manual/qa-checks.rst: fix references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-fix-qa-checks-doc-v1-1-5f92cb2a82ef@bootlin.com>
X-B4-Tracking: v=1; b=H4sIABto5mgC/x2MSQqAMAwAv1JyNlDFQvUr4qEkqQbBpQURpH+3e
 ByYmReyJJUMo3khya1Zj71C2xigNeyLoHJl6GznWms9Rn3wCkir0JaRD0KKLL2Lg2cmqN2ZpEr
 /c5pL+QDLVOo1YwAAAA==
X-Change-ID: 20251008-fix-qa-checks-doc-cfde45f98ddc
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=66127;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/5c44K//pVFF4ozIt3XSmTrmr/zyqOylvHhNcLT4//8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo5mgmiLJHv8F1swFnpG67M8j+u1a+vqfP1zK5Y
 tYELubpoAWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaOZoJgAKCRDRgEFAKaOo
 NrunEAC0b0i/h8rlak6UY/GN4SGkmK17XEhChUQzCnXJm75CjVUFwwkohSzxFhKmDirJpM/X8KT
 au+Spi9LZ6TJAKep2ijuReUda2Bzt7H97JSHy49zFtKO9Twcg0RzUh78ROi2lq/Xv3LzrO1666S
 1gnWvEQbLvOSPZVPPwQTPJkG/xhe5liJzFoQMTHesN3ep3ppYWnUtdqq9Gguq7xKxzJIJq/opF8
 emgMkdwjTXbZNy5tLNTpAmYu98Csu4xLxrQNcSNrys8QUrPwbE0+tk7FifeSEsGHfOYXnuFneG+
 YbrmFs8ZT8oTnWIkSH+L6Wh26YZ3sSlAvPdWPSlVM0FNgeJIFNFzNDemERBpZBPZOUj/OfRm8mR
 Rz45nmrpjnQ1nGeaP0eNXCpMlfbuAcxAZHggYFGPIYNIqhANpkQjqAqy1G26MBKdcBlf8OP1wIz
 g/2GWg3orqfVT7qn93Asi79RFjUm+XM4pzX+Jm0bb6xFcQblx9gbCRTxxwZl6EzoVFe48Pa2Zar
 tQNi+zzArB1gamIF6pLvOeevkGOdz8N9C3EctExZGOwjprVBkrwYBKnTjors0gB/htm6EYhuRM6
 4VmUybBx6qUZRioobzMoT0NLnEW04jmeNBDqRr5BA+wF2yvwc09up/8xsHetE7GQ6HsHbnHwkNV
 tHprzqoDCmJfnIA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Oct 2025 13:33:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7662

The references in this document do not work because references need to
be associated to a title. Change the bullet list into a section
separated document. This way we can cross-reference QA checks in other
parts of the documentation (it was previously failing when attempted).

The diff is a bit hard to digest, but there are no changes to content
except for:

- A fixed typo (inhert -> inherit)
- Indentation

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/qa-checks.rst | 1104 +++++++++++++++++++-------------
 1 file changed, 643 insertions(+), 461 deletions(-)

diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 69ecad74b..56128995b 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -45,31 +45,37 @@ Errors and Warnings
 
 .. _qa-check-already-stripped:
 
--  ``File '<file>' from <recipename> was already stripped, this will prevent future debugging! [already-stripped]``
+``already-stripped``
+--------------------
 
-   Produced binaries have already been stripped prior to the build
-   system extracting debug symbols. It is common for upstream software
-   projects to default to stripping debug symbols for output binaries.
-   In order for debugging to work on the target using ``-dbg`` packages,
-   this stripping must be disabled.
+``File '<file>' from <recipename> was already stripped, this will prevent future debugging! [already-stripped]``
 
-   Depending on the build system used by the software being built,
-   disabling this stripping could be as easy as specifying an additional
-   configure option. If not, disabling stripping might involve patching
-   the build scripts. In the latter case, look for references to "strip"
-   or "STRIP", or the "-s" or "-S" command-line options being specified
-   on the linker command line (possibly through the compiler command
-   line if preceded with "-Wl,").
+Produced binaries have already been stripped prior to the build
+system extracting debug symbols. It is common for upstream software
+projects to default to stripping debug symbols for output binaries.
+In order for debugging to work on the target using ``-dbg`` packages,
+this stripping must be disabled.
 
-   .. note::
+Depending on the build system used by the software being built,
+disabling this stripping could be as easy as specifying an additional
+configure option. If not, disabling stripping might involve patching
+the build scripts. In the latter case, look for references to "strip"
+or "STRIP", or the "-s" or "-S" command-line options being specified
+on the linker command line (possibly through the compiler command
+line if preceded with "-Wl,").
 
-      Disabling stripping here does not mean that the final packaged
-      binaries will be unstripped. Once the OpenEmbedded build system
-      splits out debug symbols to the ``-dbg`` package, it will then
-      strip the symbols from the binaries.
+.. note::
+
+   Disabling stripping here does not mean that the final packaged
+   binaries will be unstripped. Once the OpenEmbedded build system
+   splits out debug symbols to the ``-dbg`` package, it will then
+   strip the symbols from the binaries.
 
 .. _qa-check-arch:
 
+``arch``
+--------
+
 -  ``Architecture did not match (<file_arch>, expected <machine_arch>) in <file> [arch]``
 
    By default, the OpenEmbedded build system checks the Executable and
@@ -120,488 +126,591 @@ Errors and Warnings
 
 .. _qa-check-build-deps:
 
--  ``<packagename1> rdepends on <packagename2>, but it isn't a build dependency? [build-deps]``
+``build-deps``
+--------------
 
-   There is a runtime dependency between the two specified packages, but
-   there is nothing explicit within the recipe to enable the
-   OpenEmbedded build system to ensure that dependency is satisfied.
-   This condition is usually triggered by an
-   :term:`RDEPENDS` value being added at the packaging
-   stage rather than up front, which is usually automatic based on the
-   contents of the package. In most cases, you should change the recipe
-   to add an explicit :term:`RDEPENDS` for the dependency.
+``<packagename1> rdepends on <packagename2>, but it isn't a build dependency? [build-deps]``
+
+There is a runtime dependency between the two specified packages, but
+there is nothing explicit within the recipe to enable the
+OpenEmbedded build system to ensure that dependency is satisfied.
+This condition is usually triggered by an
+:term:`RDEPENDS` value being added at the packaging
+stage rather than up front, which is usually automatic based on the
+contents of the package. In most cases, you should change the recipe
+to add an explicit :term:`RDEPENDS` for the dependency.
 
 .. _qa-check-buildpaths:
 
-- ``File <filename> in package <packagename> contains reference to TMPDIR [buildpaths]``
+``buildpaths``
+--------------
+
+``File <filename> in package <packagename> contains reference to TMPDIR [buildpaths]``
 
-    This check ensures that build system paths (including :term:`TMPDIR`) do not
-    appear in output files, which not only leaks build system configuration into
-    the target, but also hinders binary reproducibility as the output will change
-    if the build system configuration changes.
+This check ensures that build system paths (including :term:`TMPDIR`) do not
+appear in output files, which not only leaks build system configuration into
+the target, but also hinders binary reproducibility as the output will change
+if the build system configuration changes.
 
-    Typically these paths will enter the output through some mechanism in the
-    configuration or compilation of the software being built by the recipe. To
-    resolve this issue you will need to determine how the detected path is
-    entering the output. Sometimes it may require adjusting scripts or code to
-    use a relative path rather than an absolute one, or to pick up the path from
-    runtime configuration or environment variables.
+Typically these paths will enter the output through some mechanism in the
+configuration or compilation of the software being built by the recipe. To
+resolve this issue you will need to determine how the detected path is
+entering the output. Sometimes it may require adjusting scripts or code to
+use a relative path rather than an absolute one, or to pick up the path from
+runtime configuration or environment variables.
 
 .. _qa-check-configure-gettext:
 
--  ``AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]``
+``configure-gettext``
+---------------------
 
-    If a recipe is building something that uses automake and the automake
-    files contain an ``AM_GNU_GETTEXT`` directive then this check will fail
-    if there is no ``inherit gettext`` statement in the recipe to ensure
-    that gettext is available during the build. Add ``inherit gettext`` to
-    remove the warning.
+``AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]``
+
+ If a recipe is building something that uses automake and the automake
+ files contain an ``AM_GNU_GETTEXT`` directive then this check will fail
+ if there is no ``inherit gettext`` statement in the recipe to ensure
+ that gettext is available during the build. Add ``inherit gettext`` to
+ remove the warning.
 
 .. _qa-check-configure-unsafe:
 
--  ``This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities. Rerun configure task after fixing this. [configure-unsafe]``
+``configure-unsafe``
+--------------------
+
+``This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities. Rerun configure task after fixing this. [configure-unsafe]``
 
-   The log for the :ref:`ref-tasks-configure` task
-   indicates that paths on the host were searched for files, which is
-   not appropriate when cross-compiling. Look for "is unsafe for
-   cross-compilation" or "CROSS COMPILE Badness" in the specified log
-   file.
+The log for the :ref:`ref-tasks-configure` task
+indicates that paths on the host were searched for files, which is
+not appropriate when cross-compiling. Look for "is unsafe for
+cross-compilation" or "CROSS COMPILE Badness" in the specified log
+file.
 
 .. _qa-check-debug-deps:
 
--  ``<packagename> rdepends on <debug_packagename> [debug-deps]``
+``debug-deps``
+--------------
 
-   There is a dependency between the specified non-dbg package (i.e. a
-   package whose name does not end in ``-dbg``) and a package that is a
-   ``dbg`` package. The ``dbg`` packages contain debug symbols and are
-   brought in using several different methods:
+``<packagename> rdepends on <debug_packagename> [debug-deps]``
 
-   -  Using the ``dbg-pkgs``
-      :term:`IMAGE_FEATURES` value.
+There is a dependency between the specified non-dbg package (i.e. a
+package whose name does not end in ``-dbg``) and a package that is a
+``dbg`` package. The ``dbg`` packages contain debug symbols and are
+brought in using several different methods:
 
-   -  Using :term:`IMAGE_INSTALL`.
+-  Using the ``dbg-pkgs``
+   :term:`IMAGE_FEATURES` value.
 
-   -  As a dependency of another ``dbg`` package that was brought in
-      using one of the above methods.
+-  Using :term:`IMAGE_INSTALL`.
 
-   The dependency might have been automatically added because the
-   ``dbg`` package erroneously contains files that it should not contain
-   (e.g. a non-symlink ``.so`` file) or it might have been added
-   manually (e.g. by adding to :term:`RDEPENDS`).
+-  As a dependency of another ``dbg`` package that was brought in
+   using one of the above methods.
+
+The dependency might have been automatically added because the
+``dbg`` package erroneously contains files that it should not contain
+(e.g. a non-symlink ``.so`` file) or it might have been added
+manually (e.g. by adding to :term:`RDEPENDS`).
 
 .. _qa-check-debug-files:
 
--  ``non debug package contains .debug directory: <packagename> path <path> [debug-files]``
+``debug-files``
+---------------
+
+``non debug package contains .debug directory: <packagename> path <path> [debug-files]``
 
-   The specified package contains a ``.debug`` directory, which should
-   not appear in anything but the ``-dbg`` package. This situation might
-   occur if you add a path which contains a ``.debug`` directory and do
-   not explicitly add the ``.debug`` directory to the ``-dbg`` package.
-   If this is the case, add the ``.debug`` directory explicitly to
-   ``FILES:${PN}-dbg``. See :term:`FILES` for additional
-   information on :term:`FILES`.
+The specified package contains a ``.debug`` directory, which should
+not appear in anything but the ``-dbg`` package. This situation might
+occur if you add a path which contains a ``.debug`` directory and do
+not explicitly add the ``.debug`` directory to the ``-dbg`` package.
+If this is the case, add the ``.debug`` directory explicitly to
+``FILES:${PN}-dbg``. See :term:`FILES` for additional
+information on :term:`FILES`.
 
 .. _qa-check-dep-cmp:
 
--  ``<var>:<packagename> is invalid: <comparison> (<value>)   only comparisons <, =, >, <=, and >= are allowed [dep-cmp]``
+``dep-cmp``
+-----------
 
-   If you are adding a versioned dependency relationship to one of the
-   dependency variables (:term:`RDEPENDS`,
-   :term:`RRECOMMENDS`,
-   :term:`RSUGGESTS`,
-   :term:`RPROVIDES`,
-   :term:`RREPLACES`, or
-   :term:`RCONFLICTS`), you must only use the named
-   comparison operators. Change the versioned dependency values you are
-   adding to match those listed in the message.
+``<var>:<packagename> is invalid: <comparison> (<value>)   only comparisons <, =, >, <=, and >= are allowed [dep-cmp]``
+
+If you are adding a versioned dependency relationship to one of the
+dependency variables (:term:`RDEPENDS`,
+:term:`RRECOMMENDS`,
+:term:`RSUGGESTS`,
+:term:`RPROVIDES`,
+:term:`RREPLACES`, or
+:term:`RCONFLICTS`), you must only use the named
+comparison operators. Change the versioned dependency values you are
+adding to match those listed in the message.
 
 .. _qa-check-dev-deps:
 
--  ``<packagename> rdepends on <dev_packagename> [dev-deps]``
+``dev-deps``
+------------
+
+``<packagename> rdepends on <dev_packagename> [dev-deps]``
 
-   There is a dependency between the specified non-dev package (a package
-   whose name does not end in ``-dev``) and a package that is a ``dev``
-   package. The ``dev`` packages contain development headers and are
-   usually brought in using several different methods:
+There is a dependency between the specified non-dev package (a package
+whose name does not end in ``-dev``) and a package that is a ``dev``
+package. The ``dev`` packages contain development headers and are
+usually brought in using several different methods:
 
-   -  Using the ``dev-pkgs``
-      :term:`IMAGE_FEATURES` value.
+-  Using the ``dev-pkgs``
+   :term:`IMAGE_FEATURES` value.
 
-   -  Using :term:`IMAGE_INSTALL`.
+-  Using :term:`IMAGE_INSTALL`.
 
-   -  As a dependency of another ``dev`` package that was brought in
-      using one of the above methods.
+-  As a dependency of another ``dev`` package that was brought in
+   using one of the above methods.
 
-   The dependency might have been automatically added (because the
-   ``dev`` package erroneously contains files that it should not have
-   (e.g. a non-symlink ``.so`` file) or it might have been added
-   manually (e.g. by adding to :term:`RDEPENDS`).
+The dependency might have been automatically added (because the
+``dev`` package erroneously contains files that it should not have
+(e.g. a non-symlink ``.so`` file) or it might have been added
+manually (e.g. by adding to :term:`RDEPENDS`).
 
 .. _qa-check-desktop:
 
--  ``"Desktop file issue: ... [desktop]``
+``desktop``
+-----------
 
-   Runs the ``desktop-file-validate`` program against any
-   ``.desktop`` files to validate their contents against the
-   specification for ``.desktop`` files.
+``"Desktop file issue: ... [desktop]``
+
+Runs the ``desktop-file-validate`` program against any
+``.desktop`` files to validate their contents against the
+specification for ``.desktop`` files.
 
 .. _qa-check-dev-so:
 
--  ``non -dev/-dbg/nativesdk- package contains symlink .so: <packagename> path '<path>' [dev-so]``
+``dev-so``
+----------
+
+``non -dev/-dbg/nativesdk- package contains symlink .so: <packagename> path '<path>' [dev-so]``
 
-   Symlink ``.so`` files are for development only, and should therefore
-   go into the ``-dev`` package. This situation might occur if you add
-   ``*.so*`` rather than ``*.so.*`` to a non-dev package. Change
-   :term:`FILES` (and possibly
-   :term:`PACKAGES`) such that the specified ``.so``
-   file goes into an appropriate ``-dev`` package.
+Symlink ``.so`` files are for development only, and should therefore
+go into the ``-dev`` package. This situation might occur if you add
+``*.so*`` rather than ``*.so.*`` to a non-dev package. Change
+:term:`FILES` (and possibly
+:term:`PACKAGES`) such that the specified ``.so``
+file goes into an appropriate ``-dev`` package.
 
 .. _qa-check-empty-dirs:
 
--  ``<packagename> installs files in <path>, but it is expected to be empty [empty-dirs]``
+``empty-dirs``
+--------------
 
-   The specified package is installing files into a directory that is
-   normally expected to be empty (such as ``/tmp``). These files may
-   be more appropriately installed to a different location, or
-   perhaps alternatively not installed at all, usually by updating the
-   :ref:`ref-tasks-install` task/function.
+``<packagename> installs files in <path>, but it is expected to be empty [empty-dirs]``
+
+The specified package is installing files into a directory that is
+normally expected to be empty (such as ``/tmp``). These files may
+be more appropriately installed to a different location, or
+perhaps alternatively not installed at all, usually by updating the
+:ref:`ref-tasks-install` task/function.
 
 .. _qa-check-file-rdeps:
 
--  ``<packagename> requires <files>, but no providers in its RDEPENDS [file-rdeps]``
+``file-rdeps``
+--------------
+
+``<packagename> requires <files>, but no providers in its RDEPENDS [file-rdeps]``
 
-   A file-level dependency has been identified from the specified
-   package on the specified files, but there is no explicit
-   corresponding entry in :term:`RDEPENDS`. If
-   particular files are required at runtime then :term:`RDEPENDS` should be
-   declared in the recipe to ensure the packages providing them are
-   built.
+A file-level dependency has been identified from the specified
+package on the specified files, but there is no explicit
+corresponding entry in :term:`RDEPENDS`. If
+particular files are required at runtime then :term:`RDEPENDS` should be
+declared in the recipe to ensure the packages providing them are
+built.
 
 .. _qa-check-files-invalid:
 
--  ``FILES variable for package <packagename> contains '//' which is invalid. Attempting to fix this but you should correct the metadata. [files-invalid]``
+``files-invalid``
+-----------------
 
-   The string "//" is invalid in a Unix path. Correct all occurrences
-   where this string appears in a :term:`FILES` variable so
-   that there is only a single "/".
+``FILES variable for package <packagename> contains '//' which is invalid. Attempting to fix this but you should correct the metadata. [files-invalid]``
+
+The string "//" is invalid in a Unix path. Correct all occurrences
+where this string appears in a :term:`FILES` variable so
+that there is only a single "/".
 
 .. _qa-check-host-user-contaminated:
 
--  ``<package name>: <path> is owned by gid/uid <gid/uid>, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]``
+``host-user-contaminated``
+--------------------------
+
+``<package name>: <path> is owned by gid/uid <gid/uid>, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]``
 
-   Checks that no package produced by the
-   recipe contains any files outside of ``/home`` with a user or group
-   ID that matches the user running BitBake. A match usually indicates
-   that the files are being installed with an incorrect UID/GID, since
-   target IDs are independent from host IDs. For additional information,
-   see the section describing the
-   :ref:`ref-tasks-install` task.
+Checks that no package produced by the
+recipe contains any files outside of ``/home`` with a user or group
+ID that matches the user running BitBake. A match usually indicates
+that the files are being installed with an incorrect UID/GID, since
+target IDs are independent from host IDs. For additional information,
+see the section describing the
+:ref:`ref-tasks-install` task.
 
 .. _qa-check-infodir:
 
--  ``The /usr/share/info/dir file is not meant to be shipped in a particular package. [infodir]``
+``infodir``
+-----------
 
-   The ``/usr/share/info/dir`` should not be packaged. Add the following
-   line to your :ref:`ref-tasks-install` task or to your
-   ``do_install:append`` within the recipe as follows::
+``The /usr/share/info/dir file is not meant to be shipped in a particular package. [infodir]``
 
-      rm ${D}${infodir}/dir
+The ``/usr/share/info/dir`` should not be packaged. Add the following
+line to your :ref:`ref-tasks-install` task or to your
+``do_install:append`` within the recipe as follows::
 
-.. _qa-check-installed-vs-shipped:
+   rm ${D}${infodir}/dir
 
--  ``<recipename>: Files/directories were installed but not shipped in any package [installed-vs-shipped]``
+.. _qa-check-installed-vs-shipped:
 
-   Files have been installed within the
-   :ref:`ref-tasks-install` task but have not been
-   included in any package by way of the :term:`FILES`
-   variable. Files that do not appear in any package cannot be present
-   in an image later on in the build process. You need to do one of the
-   following:
+``installed-vs-shipped``
+------------------------
 
-   -  Add the files to :term:`FILES` for the package you want them to appear
-      in (e.g. ``FILES:${``\ :term:`PN`\ ``}`` for the main
-      package).
+``<recipename>: Files/directories were installed but not shipped in any package [installed-vs-shipped]``
 
-   -  Delete the files at the end of the :ref:`ref-tasks-install` task if the
-      files are not needed in any package.
+Files have been installed within the
+:ref:`ref-tasks-install` task but have not been
+included in any package by way of the :term:`FILES`
+variable. Files that do not appear in any package cannot be present
+in an image later on in the build process. You need to do one of the
+following:
 
--  ``<oldpackage>-<oldpkgversion> was registered as shlib provider for <library>, changing it to <newpackage>-<newpkgversion> because it was built later``
+-  Add the files to :term:`FILES` for the package you want them to appear
+   in (e.g. ``FILES:${``\ :term:`PN`\ ``}`` for the main
+   package).
 
-   This message means that both ``<oldpackage>`` and ``<newpackage>``
-   provide the specified shared library. You can expect this message
-   when a recipe has been renamed. However, if that is not the case, the
-   message might indicate that a private version of a library is being
-   erroneously picked up as the provider for a common library. If that
-   is the case, you should add the library's ``.so`` filename to
-   :term:`PRIVATE_LIBS` in the recipe that provides
-   the private version of the library.
+-  Delete the files at the end of the :ref:`ref-tasks-install` task if the
+   files are not needed in any package.
 
 .. _qa-check-incompatible-license:
 
--  ``Excluding <package> from packaging as it has incompatible license(s): <license> [incompatible-license]``
+``incompatible-license``
+------------------------
+
+``Excluding <package> from packaging as it has incompatible license(s): <license> [incompatible-license]``
 
-   Report when packages are excluded from being created due to being marked with
-   a license that is in :term:`INCOMPATIBLE_LICENSE`.
+Report when packages are excluded from being created due to being marked with
+a license that is in :term:`INCOMPATIBLE_LICENSE`.
 
 .. _qa-check-invalid-chars:
 
--  ``<variable> has non <envoding> characters [invalid-chars]``
+``invalid-chars``
+-----------------
 
-   Checks that the recipe metadata variables :term:`DESCRIPTION`,
-   :term:`SUMMARY`, :term:`LICENSE`, and :term:`SECTION` do not contain
-   non-UTF-8 characters. Some package managers do not support such characters.
+``<variable> has non <envoding> characters [invalid-chars]``
+
+Checks that the recipe metadata variables :term:`DESCRIPTION`,
+:term:`SUMMARY`, :term:`LICENSE`, and :term:`SECTION` do not contain
+non-UTF-8 characters. Some package managers do not support such characters.
 
 .. _qa-check-invalid-packageconfig:
 
--  ``<package>: invalid PACKAGECONFIG(s): <configs> [invalid-packageconfig]``
+``invalid-packageconfig``
+-------------------------
+
+``<package>: invalid PACKAGECONFIG(s): <configs> [invalid-packageconfig]``
 
-   Checks that no undefined features are being added to :term:`PACKAGECONFIG`.
-   For example, any name "foo" for which the following form does not exist::
+Checks that no undefined features are being added to :term:`PACKAGECONFIG`.
+For example, any name "foo" for which the following form does not exist::
 
-      PACKAGECONFIG[foo] = "..."
+   PACKAGECONFIG[foo] = "..."
 
 .. _qa-check-la:
 
--  ``<file> failed sanity test (workdir) in path <path> [la]``
+``la``
+------
 
-   The specified ``.la`` file contains :term:`TMPDIR`
-   paths. Any ``.la`` file containing these paths is incorrect since
-   ``libtool`` adds the correct sysroot prefix when using the files
-   automatically itself.
+``<file> failed sanity test (workdir) in path <path> [la]``
+
+The specified ``.la`` file contains :term:`TMPDIR`
+paths. Any ``.la`` file containing these paths is incorrect since
+``libtool`` adds the correct sysroot prefix when using the files
+automatically itself.
 
 .. _qa-check-ldflags:
 
--  ``File '<file>' in package '<package>' doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]``
+``ldflags``
+-----------
+
+``File '<file>' in package '<package>' doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]``
 
-   This indicates that binaries produced when building the recipe have
-   not been linked with the :term:`LDFLAGS` options
-   provided by the build system. Check to be sure that the :term:`LDFLAGS`
-   variable is being passed to the linker command. A common workaround
-   for this situation is to pass in :term:`LDFLAGS` using
-   :term:`TARGET_CC_ARCH` within the recipe as
-   follows::
+This indicates that binaries produced when building the recipe have
+not been linked with the :term:`LDFLAGS` options
+provided by the build system. Check to be sure that the :term:`LDFLAGS`
+variable is being passed to the linker command. A common workaround
+for this situation is to pass in :term:`LDFLAGS` using
+:term:`TARGET_CC_ARCH` within the recipe as
+follows::
 
-      TARGET_CC_ARCH += "${LDFLAGS}"
+   TARGET_CC_ARCH += "${LDFLAGS}"
 
 .. _qa-check-libdir:
 
--  ``<packagename>: found library in wrong location [libdir]``
+``libdir``
+----------
 
-   The specified file may have been installed into an incorrect
-   (possibly hardcoded) installation path. For example, this test will
-   catch recipes that install ``/lib/bar.so`` when ``${base_libdir}`` is
-   "lib32". Another example is when recipes install
-   ``/usr/lib64/foo.so`` when ``${libdir}`` is "/usr/lib". False
-   positives occasionally exist. For these cases add "libdir" to
-   :term:`INSANE_SKIP` for the package.
+``<packagename>: found library in wrong location [libdir]``
+
+The specified file may have been installed into an incorrect
+(possibly hardcoded) installation path. For example, this test will
+catch recipes that install ``/lib/bar.so`` when ``${base_libdir}`` is
+"lib32". Another example is when recipes install
+``/usr/lib64/foo.so`` when ``${libdir}`` is "/usr/lib". False
+positives occasionally exist. For these cases add "libdir" to
+:term:`INSANE_SKIP` for the package.
 
 .. _qa-check-libexec:
 
--  ``<packagename>: <path> is using libexec please relocate to <libexecdir> [libexec]``
+``libexec``
+-----------
+
+``<packagename>: <path> is using libexec please relocate to <libexecdir> [libexec]``
 
-   The specified package contains files in ``/usr/libexec`` when the
-   distro configuration uses a different path for ``<libexecdir>`` By
-   default, ``<libexecdir>`` is ``$prefix/libexec``. However, this
-   default can be changed (e.g. ``${libdir}``).
+The specified package contains files in ``/usr/libexec`` when the
+distro configuration uses a different path for ``<libexecdir>`` By
+default, ``<libexecdir>`` is ``$prefix/libexec``. However, this
+default can be changed (e.g. ``${libdir}``).
 
 .. _qa-check-mime:
 
-- ``package contains mime types but does not inherit mime: <packagename> path '<file>' [mime]``
+``mime``
+--------
 
-   The specified package contains mime type files (``.xml`` files in
-   ``${datadir}/mime/packages``) and yet does not inherit the
-   :ref:`ref-classes-mime` class which will ensure that these get
-   properly installed. Either add ``inherit mime`` to the recipe or remove the
-   files at the :ref:`ref-tasks-install` step if they are not needed.
+``package contains mime types but does not inherit mime: <packagename> path '<file>' [mime]``
+
+The specified package contains mime type files (``.xml`` files in
+``${datadir}/mime/packages``) and yet does not inherit the
+:ref:`ref-classes-mime` class which will ensure that these get
+properly installed. Either add ``inherit mime`` to the recipe or remove the
+files at the :ref:`ref-tasks-install` step if they are not needed.
 
 .. _qa-check-mime-xdg:
 
-- ``package contains desktop file with key 'MimeType' but does not inhert mime-xdg: <packagename> path '<file>' [mime-xdg]``
+``mime-xdg``
+------------
+
+``package contains desktop file with key 'MimeType' but does not inherit mime-xdg: <packagename> path '<file>' [mime-xdg]``
 
-    The specified package contains a .desktop file with a 'MimeType' key
-    present, but does not inherit the :ref:`ref-classes-mime-xdg`
-    class that is required in order for that to be activated. Either add
-    ``inherit mime`` to the recipe or remove the files at the
-    :ref:`ref-tasks-install` step if they are not needed.
+The specified package contains a .desktop file with a 'MimeType' key
+present, but does not inherit the :ref:`ref-classes-mime-xdg`
+class that is required in order for that to be activated. Either add
+``inherit mime`` to the recipe or remove the files at the
+:ref:`ref-tasks-install` step if they are not needed.
 
 .. _qa-check-missing-update-alternatives:
 
-- ``<recipename>: recipe defines ALTERNATIVE:<packagename> but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]``
+``missing-update-alternatives``
+-------------------------------
 
-    This check ensures that if a recipe sets the :term:`ALTERNATIVE` variable that the
-    recipe also inherits :ref:`ref-classes-update-alternatives` such
-    that the alternative will be correctly set up. If you are seeing this message, either
-    add ``inherit update-alternatives`` to your recipe or remove the reference to the variable
-    if it is not needed.
+``<recipename>: recipe defines ALTERNATIVE:<packagename> but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]``
+
+This check ensures that if a recipe sets the :term:`ALTERNATIVE` variable that the
+recipe also inherits :ref:`ref-classes-update-alternatives` such
+that the alternative will be correctly set up. If you are seeing this message, either
+add ``inherit update-alternatives`` to your recipe or remove the reference to the variable
+if it is not needed.
 
 .. _qa-check-packages-list:
 
--  ``<packagename> is listed in PACKAGES multiple times, this leads to packaging errors. [packages-list]``
+``packages-list``
+-----------------
+
+``<packagename> is listed in PACKAGES multiple times, this leads to packaging errors. [packages-list]``
 
-   Package names must appear only once in the
-   :term:`PACKAGES` variable. You might receive this
-   error if you are attempting to add a package to :term:`PACKAGES` that is
-   already in the variable's value.
+Package names must appear only once in the
+:term:`PACKAGES` variable. You might receive this
+error if you are attempting to add a package to :term:`PACKAGES` that is
+already in the variable's value.
 
 .. _qa-check-patch-fuzz:
 
-- ``Fuzz detected: <patch output> [patch-fuzz]``
+``patch-fuzz``
+--------------
 
-    This check looks for evidence of "fuzz" when applying patches within the :ref:`ref-tasks-patch`
-    task. Patch fuzz is a situation when the ``patch`` tool ignores some of the context
-    lines in order to apply the patch. Consider this example:
+``Fuzz detected: <patch output> [patch-fuzz]``
 
-    Patch to be applied::
+This check looks for evidence of "fuzz" when applying patches within the :ref:`ref-tasks-patch`
+task. Patch fuzz is a situation when the ``patch`` tool ignores some of the context
+lines in order to apply the patch. Consider this example:
 
-        --- filename
-        +++ filename
-         context line 1
-         context line 2
-         context line 3
-        +newly added line
-         context line 4
-         context line 5
-         context line 6
+Patch to be applied::
 
-    Original source code::
+   --- filename
+   +++ filename
+    context line 1
+    context line 2
+    context line 3
+   +newly added line
+    context line 4
+    context line 5
+    context line 6
 
-        different context line 1
-        different context line 2
-        context line 3
-        context line 4
-        different context line 5
-        different context line 6
+Original source code::
 
-    Outcome (after applying patch with fuzz)::
+   different context line 1
+   different context line 2
+   context line 3
+   context line 4
+   different context line 5
+   different context line 6
 
-        different context line 1
-        different context line 2
-        context line 3
-        newly added line
-        context line 4
-        different context line 5
-        different context line 6
+Outcome (after applying patch with fuzz)::
 
-    Chances are, the newly added line was actually added in a completely
-    wrong location, or it was already in the original source and was added
-    for the second time. This is especially possible if the context line 3
-    and 4 are blank or have only generic things in them, such as ``#endif`` or ``}``.
-    Depending on the patched code, it is entirely possible for an incorrectly
-    patched file to still compile without errors.
+   different context line 1
+   different context line 2
+   context line 3
+   newly added line
+   context line 4
+   different context line 5
+   different context line 6
 
-    *How to eliminate patch fuzz warnings*
+Chances are, the newly added line was actually added in a completely
+wrong location, or it was already in the original source and was added
+for the second time. This is especially possible if the context line 3
+and 4 are blank or have only generic things in them, such as ``#endif`` or ``}``.
+Depending on the patched code, it is entirely possible for an incorrectly
+patched file to still compile without errors.
 
-    Use the ``devtool`` command as explained by the warning. First, unpack the
-    source into devtool workspace::
+*How to eliminate patch fuzz warnings*
 
-            devtool modify <recipe>
+Use the ``devtool`` command as explained by the warning. First, unpack the
+source into devtool workspace::
 
-    This will apply all of the patches, and create new commits out of them in
-    the workspace --- with the patch context updated.
+   devtool modify <recipe>
 
-    Then, replace the patches in the recipe layer::
+This will apply all of the patches, and create new commits out of them in
+the workspace --- with the patch context updated.
 
-            devtool finish --force-patch-refresh <recipe> <layer_path>
+Then, replace the patches in the recipe layer::
 
-    The patch updates then need be reviewed (preferably with a side-by-side diff
-    tool) to ensure they are indeed doing the right thing i.e.:
+   devtool finish --force-patch-refresh <recipe> <layer_path>
 
-    #. they are applied in the correct location within the file;
-    #. they do not introduce duplicate lines, or otherwise do things that
-       are no longer necessary.
+The patch updates then need be reviewed (preferably with a side-by-side diff
+tool) to ensure they are indeed doing the right thing i.e.:
 
-    To confirm these things, you can also review the patched source code in
-    devtool's workspace, typically in ``<build_dir>/workspace/sources/<recipe>/``
+#. they are applied in the correct location within the file;
+#. they do not introduce duplicate lines, or otherwise do things that
+   are no longer necessary.
 
-    Once the review is done, you can create and publish a layer commit with
-    the patch updates that modify the context. Devtool may also refresh
-    other things in the patches, those can be discarded.
+To confirm these things, you can also review the patched source code in
+devtool's workspace, typically in ``<build_dir>/workspace/sources/<recipe>/``
+
+Once the review is done, you can create and publish a layer commit with
+the patch updates that modify the context. Devtool may also refresh
+other things in the patches, those can be discarded.
 
 .. _qa-check-patch-status:
 
-- ``Missing Upstream-Status in patch <patchfile> Please add according to <url> [patch-status]``
+``patch-status``
+----------------
+
+-  ``Missing Upstream-Status in patch <patchfile> Please add according to <url> [patch-status]``
 
-    The ``Upstream-Status`` value is missing in the specified patch file's header.
-    This value is intended to track whether or not the patch has been sent
-    upstream, whether or not it has been merged, etc.
+   The ``Upstream-Status`` value is missing in the specified patch file's header.
+   This value is intended to track whether or not the patch has been sent
+   upstream, whether or not it has been merged, etc.
 
-    For more information, see the
-    ":ref:`contributor-guide/recipe-style-guide:patch upstream status`"
-    section in the Yocto Project and OpenEmbedded Contributor Guide.
+   For more information, see the
+   ":ref:`contributor-guide/recipe-style-guide:patch upstream status`"
+   section in the Yocto Project and OpenEmbedded Contributor Guide.
 
-- ``Malformed Upstream-Status in patch <patchfile> Please correct according to <url> [patch-status]``
+-  ``Malformed Upstream-Status in patch <patchfile> Please correct according to <url> [patch-status]``
 
-    The ``Upstream-Status`` value in the specified patch file's header is invalid -
-    it must be a specific format. See the "Missing Upstream-Status" entry above
-    for more information.
+   The ``Upstream-Status`` value in the specified patch file's header is invalid -
+   it must be a specific format. See the "Missing Upstream-Status" entry above
+   for more information.
 
 .. _qa-check-pep517-backend:
 
--  ``inherits setuptools3 but has pyproject.toml with <build backend>, use the correct class [pep517-backend]``
+``pep517-backend``
+------------------
 
-   Checks that a recipe inheriting :ref:`ref-classes-setuptools3` has a
-   PEP517-compliant backend.
+``inherits setuptools3 but has pyproject.toml with <build backend>, use the correct class [pep517-backend]``
+
+Checks that a recipe inheriting :ref:`ref-classes-setuptools3` has a
+PEP517-compliant backend.
 
 .. _qa-check-perllocalpod:
 
-- ``<packagename> contains perllocal.pod (<files>), should not be installed [perllocalpod]``
+``perllocalpod``
+----------------
+
+``<packagename> contains perllocal.pod (<files>), should not be installed [perllocalpod]``
 
-    ``perllocal.pod`` is an index file of locally installed modules and so shouldn't be
-    installed by any distribution packages. The :ref:`ref-classes-cpan` class
-    already sets ``NO_PERLLOCAL`` to stop this file being generated by most Perl recipes,
-    but if a recipe is using ``MakeMaker`` directly then they might not be doing this
-    correctly. This check ensures that perllocal.pod is not in any package in order to
-    avoid multiple packages shipping this file and thus their packages conflicting
-    if installed together.
+``perllocal.pod`` is an index file of locally installed modules and so shouldn't be
+installed by any distribution packages. The :ref:`ref-classes-cpan` class
+already sets ``NO_PERLLOCAL`` to stop this file being generated by most Perl recipes,
+but if a recipe is using ``MakeMaker`` directly then they might not be doing this
+correctly. This check ensures that perllocal.pod is not in any package in order to
+avoid multiple packages shipping this file and thus their packages conflicting
+if installed together.
 
 .. _qa-check-perm-config:
 
--  ``Fixup Perms: invalid config line <line> [perm-config]``
+``perm-config``
+---------------
+
+``Fixup Perms: invalid config line <line> [perm-config]``
 
-   Reports lines in ``fs-perms.txt`` that have an invalid format.
+Reports lines in ``fs-perms.txt`` that have an invalid format.
 
 .. _qa-check-perm-line:
 
--  ``Fixup perms: <config> invalid line: <line> [perm-line]``
+``perm-line``
+-------------
 
-   Reports lines in ``fs-perms.txt`` that have an invalid format.
+``Fixup perms: <config> invalid line: <line> [perm-line]``
+
+Reports lines in ``fs-perms.txt`` that have an invalid format.
 
 .. _qa-check-perm-link:
 
--  ``Fixup Perms: Unable to correct directory link, target already exists: <directory> -> <target> [perm-link]``
+``perm-link``
+-------------
+
+``Fixup Perms: Unable to correct directory link, target already exists: <directory> -> <target> [perm-link]``
 
-   Reports lines in ``fs-perms.txt`` that specify 'link' where the specified
-   target already exists.
+Reports lines in ``fs-perms.txt`` that specify 'link' where the specified
+target already exists.
 
 .. _qa-check-perms:
 
--  ``perms``: Currently, this check is unused but reserved.
+``perms``
+---------
+
+Currently, this check is unused but reserved.
 
 .. _qa-check-pkgconfig:
 
--  ``<file> failed sanity test (tmpdir) in path <path> [pkgconfig]``
+``pkgconfig``
+-------------
+
+``<file> failed sanity test (tmpdir) in path <path> [pkgconfig]``
 
-   The specified ``.pc`` file contains
-   :term:`TMPDIR`\ ``/``\ :term:`WORKDIR`
-   paths. Any ``.pc`` file containing these paths is incorrect since
-   ``pkg-config`` itself adds the correct sysroot prefix when the files
-   are accessed.
+The specified ``.pc`` file contains
+:term:`TMPDIR`\ ``/``\ :term:`WORKDIR`
+paths. Any ``.pc`` file containing these paths is incorrect since
+``pkg-config`` itself adds the correct sysroot prefix when the files
+are accessed.
 
 .. _qa-check-pkgname:
 
--  ``<packagename> doesn't match the [a-z0-9.+-]+ regex [pkgname]``
+``pkgname``
+-----------
 
-   The convention within the OpenEmbedded build system (sometimes
-   enforced by the package manager itself) is to require that package
-   names are all lower case and to allow a restricted set of characters.
-   If your recipe name does not match this, or you add packages to
-   :term:`PACKAGES` that do not conform to the
-   convention, then you will receive this error. Rename your recipe. Or,
-   if you have added a non-conforming package name to :term:`PACKAGES`,
-   change the package name appropriately.
+``<packagename> doesn't match the [a-z0-9.+-]+ regex [pkgname]``
+
+The convention within the OpenEmbedded build system (sometimes
+enforced by the package manager itself) is to require that package
+names are all lower case and to allow a restricted set of characters.
+If your recipe name does not match this, or you add packages to
+:term:`PACKAGES` that do not conform to the
+convention, then you will receive this error. Rename your recipe. Or,
+if you have added a non-conforming package name to :term:`PACKAGES`,
+change the package name appropriately.
 
 .. _qa-check-pkgvarcheck:
 
+``pkgvarcheck``
+---------------
+
 -  ``<recipefile>: Variable <variable> is set as not being package specific, please fix this. [pkgvarcheck]``
 
    Certain variables (:term:`RDEPENDS`,
@@ -618,7 +727,7 @@ Errors and Warnings
    assignments to these variables within your recipe.
 
 
-- ``recipe uses DEPENDS:${PN}, should use DEPENDS [pkgvarcheck]``
+-  ``recipe uses DEPENDS:${PN}, should use DEPENDS [pkgvarcheck]``
 
    This check looks for instances of setting ``DEPENDS:${PN}``
    which is erroneous (:term:`DEPENDS` is a recipe-wide variable and thus
@@ -627,194 +736,258 @@ Errors and Warnings
 
 .. _qa-check-pn-overrides:
 
--  ``Recipe <recipefile> has PN of "<recipename>" which is in OVERRIDES, this can result in unexpected behavior. [pn-overrides]``
+``pn-overrides``
+----------------
 
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
+``Recipe <recipefile> has PN of "<recipename>" which is in OVERRIDES, this can result in unexpected behavior. [pn-overrides]``
+
+The specified recipe has a name (:term:`PN`) value that
+appears in :term:`OVERRIDES`. If a recipe is named
+such that its :term:`PN` value matches something already in :term:`OVERRIDES`
+(e.g. :term:`PN` happens to be the same as :term:`MACHINE`
+or :term:`DISTRO`), it can have unexpected
+consequences. For example, assignments such as
+``FILES:${PN} = "xyz"`` effectively turn into ``FILES = "xyz"``.
+Rename your recipe (or if :term:`PN` is being set explicitly, change the
+:term:`PN` value) so that the conflict does not occur. See
+:term:`FILES` for additional information.
 
 .. _qa-check-shebang-size:
 
-- ``<packagename>: <file> maximum shebang size exceeded, the maximum size is 128. [shebang-size]``
+``shebang-size``
+----------------
+
+``<packagename>: <file> maximum shebang size exceeded, the maximum size is 128. [shebang-size]``
+
+This check ensures that the shebang line (``#!`` in the first line) for a script
+is not longer than 128 characters, which can cause an error at runtime depending
+on the operating system. If you are seeing this message then the specified script
+may need to be patched to have a shorter in order to avoid runtime problems.
+
+.. _qa-check-shlib-provider:
 
-    This check ensures that the shebang line (``#!`` in the first line) for a script
-    is not longer than 128 characters, which can cause an error at runtime depending
-    on the operating system. If you are seeing this message then the specified script
-    may need to be patched to have a shorter in order to avoid runtime problems.
+Shlib provider
+--------------
+
+``<oldpackage>-<oldpkgversion> was registered as shlib provider for <library>, changing it to <newpackage>-<newpkgversion> because it was built later``
+
+This message means that both ``<oldpackage>`` and ``<newpackage>``
+provide the specified shared library. You can expect this message
+when a recipe has been renamed. However, if that is not the case, the
+message might indicate that a private version of a library is being
+erroneously picked up as the provider for a common library. If that
+is the case, you should add the library's ``.so`` filename to
+:term:`PRIVATE_LIBS` in the recipe that provides
+the private version of the library.
 
 .. _qa-check-space-around-equal:
 
--  ``<filename>:<line number> has a lack of whitespace around the assignment: '<assignment>'``
+``space-around-equal``
+----------------------
 
-   This warning indicated that there is missing spaces around an assignment.
+``<filename>:<line number> has a lack of whitespace around the assignment: '<assignment>'``
 
-   For example, the following assignments would print a warning::
+This warning indicated that there is missing spaces around an assignment.
 
-      FOO="bar"
-      FOO= "bar"
-      FOO ="bar"
+For example, the following assignments would print a warning::
 
-   These should be replaced by::
+   FOO="bar"
+   FOO= "bar"
+   FOO ="bar"
 
-      FOO = "bar"
+These should be replaced by::
+
+   FOO = "bar"
 
 .. _qa-check-src-uri-bad:
 
-- ``<recipename>: SRC_URI uses unstable GitHub archives [src-uri-bad]``
+``src-uri-bad``
+---------------
+
+-  ``<recipename>: SRC_URI uses unstable GitHub archives [src-uri-bad]``
 
-    GitHub provides "archive" tarballs, however these can be re-generated
-    on the fly and thus the file's signature will not necessarily match that
-    in the :term:`SRC_URI` checksums in future leading to build failures. It is
-    recommended that you use an official release tarball or switch to
-    pulling the corresponding revision in the actual git repository instead.
+   GitHub provides "archive" tarballs, however these can be re-generated
+   on the fly and thus the file's signature will not necessarily match that
+   in the :term:`SRC_URI` checksums in future leading to build failures. It is
+   recommended that you use an official release tarball or switch to
+   pulling the corresponding revision in the actual git repository instead.
 
 
-- ``SRC_URI uses PN not BPN [src-uri-bad]``
+-  ``SRC_URI uses PN not BPN [src-uri-bad]``
 
-    If some part of :term:`SRC_URI` needs to reference the recipe name, it should do
-    so using ${:term:`BPN`} rather than ${:term:`PN`} as the latter will change
-    for different variants of the same recipe e.g. when :term:`BBCLASSEXTEND`
-    or multilib are being used. This check will fail if a reference to ``${PN}``
-    is found within the :term:`SRC_URI` value --- change it to ``${BPN}`` instead.
+   If some part of :term:`SRC_URI` needs to reference the recipe name, it should do
+   so using ${:term:`BPN`} rather than ${:term:`PN`} as the latter will change
+   for different variants of the same recipe e.g. when :term:`BBCLASSEXTEND`
+   or multilib are being used. This check will fail if a reference to ``${PN}``
+   is found within the :term:`SRC_URI` value --- change it to ``${BPN}`` instead.
 
 .. _qa-check-staticdev:
 
--  ``non -staticdev package contains static .a library: <packagename> path '<path>' [staticdev]``
+``staticdev``
+-------------
 
-   Static ``.a`` library files should go into a ``-staticdev`` package.
-   Change :term:`FILES` (and possibly
-   :term:`PACKAGES`) such that the specified ``.a`` file
-   goes into an appropriate ``-staticdev`` package.
+``non -staticdev package contains static .a library: <packagename> path '<path>' [staticdev]``
+
+Static ``.a`` library files should go into a ``-staticdev`` package.
+Change :term:`FILES` (and possibly
+:term:`PACKAGES`) such that the specified ``.a`` file
+goes into an appropriate ``-staticdev`` package.
 
 .. _qa-check-symlink-to-sysroot:
 
--  ``Symlink <path> in <packagename> points to TMPDIR [symlink-to-sysroot]``
+``symlink-to-sysroot``
+----------------------
+
+``Symlink <path> in <packagename> points to TMPDIR [symlink-to-sysroot]``
 
-   The specified symlink points into :term:`TMPDIR` on the
-   host. Such symlinks will work on the host. However, they are clearly
-   invalid when running on the target. You should either correct the
-   symlink to use a relative path or remove the symlink.
+The specified symlink points into :term:`TMPDIR` on the
+host. Such symlinks will work on the host. However, they are clearly
+invalid when running on the target. You should either correct the
+symlink to use a relative path or remove the symlink.
 
 .. _qa-check-recipe-naming:
 
--  ``Recipe <recipe> appears native/nativesdk but is not, should inherit native/nativesdk``
+Recipe naming
+-------------
+
+``Recipe <recipe> appears native/nativesdk but is not, should inherit native/nativesdk``
 
-   Checks that the recipe name and recipe class match, so that ``*-native``
-   recipes inherit :ref:`ref-classes-native` and ``nativesdk-*`` recipes
-   inherit :ref:`ref-classes-nativesdk`.
+Checks that the recipe name and recipe class match, so that ``*-native``
+recipes inherit :ref:`ref-classes-native` and ``nativesdk-*`` recipes
+inherit :ref:`ref-classes-nativesdk`.
 
 .. _qa-check-rpaths:
 
--  ``package <packagename> contains bad RPATH <rpath> in file <file> [rpaths]``
+``rpaths``
+----------
 
-   The specified binary produced by the recipe contains dynamic library
-   load paths (rpaths) that contain build system paths such as
-   :term:`TMPDIR`, which are incorrect for the target and
-   could potentially be a security issue. Check for bad ``-rpath``
-   options being passed to the linker in your
-   :ref:`ref-tasks-compile` log. Depending on the build
-   system used by the software being built, there might be a configure
-   option to disable rpath usage completely within the build of the
-   software.
+``package <packagename> contains bad RPATH <rpath> in file <file> [rpaths]``
+
+The specified binary produced by the recipe contains dynamic library
+load paths (rpaths) that contain build system paths such as
+:term:`TMPDIR`, which are incorrect for the target and
+could potentially be a security issue. Check for bad ``-rpath``
+options being passed to the linker in your
+:ref:`ref-tasks-compile` log. Depending on the build
+system used by the software being built, there might be a configure
+option to disable rpath usage completely within the build of the
+software.
 
 .. _qa-check-textrel:
 
--  ``ELF binary '<file>' has relocations in .text [textrel]``
+``textrel``
+-----------
+
+``ELF binary '<file>' has relocations in .text [textrel]``
 
-   The specified ELF binary contains relocations in its ``.text``
-   sections. This situation can result in a performance impact at
-   runtime.
+The specified ELF binary contains relocations in its ``.text``
+sections. This situation can result in a performance impact at
+runtime.
 
-   Typically, the way to solve this performance issue is to add "-fPIC"
-   or "-fpic" to the compiler command-line options. For example, given
-   software that reads :term:`CFLAGS` when you build it,
-   you could add the following to your recipe::
+Typically, the way to solve this performance issue is to add "-fPIC"
+or "-fpic" to the compiler command-line options. For example, given
+software that reads :term:`CFLAGS` when you build it,
+you could add the following to your recipe::
 
-      CFLAGS:append = " -fPIC "
+   CFLAGS:append = " -fPIC "
 
-   For more information on text relocations at runtime, see
-   https://www.akkadia.org/drepper/textrelocs.html.
+For more information on text relocations at runtime, see
+https://www.akkadia.org/drepper/textrelocs.html.
 
 .. _qa-check-unhandled-features-check:
 
-- ``<recipename>: recipe doesn't inherit features_check [unhandled-features-check]``
+``unhandled-features-check``
+----------------------------
 
-    This check ensures that if one of the variables that the
-    :ref:`ref-classes-features_check` class supports (e.g.
-    :term:`REQUIRED_DISTRO_FEATURES`) is used, then the recipe
-    inherits :ref:`ref-classes-features_check` in order for
-    the requirement to actually work. If you are seeing this message, either
-    add ``inherit features_check`` to your recipe or remove the reference to
-    the variable if it is not needed.
+``<recipename>: recipe doesn't inherit features_check [unhandled-features-check]``
+
+This check ensures that if one of the variables that the
+:ref:`ref-classes-features_check` class supports (e.g.
+:term:`REQUIRED_DISTRO_FEATURES`) is used, then the recipe
+inherits :ref:`ref-classes-features_check` in order for
+the requirement to actually work. If you are seeing this message, either
+add ``inherit features_check`` to your recipe or remove the reference to
+the variable if it is not needed.
 
 .. _qa-check-unimplemented-ptest:
 
-- ``<tool> tests detected [unimplemented-ptest]``
+``unimplemented-ptest``
+-----------------------
+
+``<tool> tests detected [unimplemented-ptest]``
 
-    This check will detect if the source of the package contains some
-    upstream-provided tests and, if so, that ptests are implemented for this
-    recipe.  See the ":ref:`test-manual/ptest:testing packages with ptest`"
-    section in the Yocto Project Development Tasks Manual. See also the
-    ":ref:`ref-classes-ptest`" section.
+This check will detect if the source of the package contains some
+upstream-provided tests and, if so, that ptests are implemented for this
+recipe.  See the ":ref:`test-manual/ptest:testing packages with ptest`"
+section in the Yocto Project Development Tasks Manual. See also the
+":ref:`ref-classes-ptest`" section.
 
 .. _qa-check-unknown-configure-option:
 
--  ``<recipe>: configure was passed unrecognized options: <options> [unknown-configure-option]``
-
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
+``unknown-configure-option``
+----------------------------
+
+``<recipe>: configure was passed unrecognized options: <options> [unknown-configure-option]``
+
+The configure script is reporting that the specified options are
+unrecognized. This situation could be because the options were
+previously valid but have been removed from the configure script. Or,
+there was a mistake when the options were added and there is another
+option that should be used instead. If you are unsure, consult the
+upstream build documentation, the ``./configure --help`` output, and
+the upstream change log or release notes. Once you have worked out
+what the appropriate change is, you can update
+:term:`EXTRA_OECONF`,
+:term:`PACKAGECONFIG_CONFARGS`, or the
+individual :term:`PACKAGECONFIG` option values
+accordingly.
 
 .. _qa-check-unlisted-pkg-lics:
 
--  ``LICENSE:<packagename> includes licenses (<licenses>) that are not listed in LICENSE [unlisted-pkg-lics]``
+``unlisted-pkg-lics``
+---------------------
 
-   The :term:`LICENSE` of the recipe should be a superset
-   of all the licenses of all packages produced by this recipe. In other
-   words, any license in ``LICENSE:*`` should also appear in
-   :term:`LICENSE`.
+``LICENSE:<packagename> includes licenses (<licenses>) that are not listed in LICENSE [unlisted-pkg-lics]``
+
+The :term:`LICENSE` of the recipe should be a superset
+of all the licenses of all packages produced by this recipe. In other
+words, any license in ``LICENSE:*`` should also appear in
+:term:`LICENSE`.
 
 .. _qa-check-useless-rpaths:
 
--  ``<packagename>: <file> contains probably-redundant RPATH <rpath> [useless-rpaths]``
+``useless-rpaths``
+------------------
+
+``<packagename>: <file> contains probably-redundant RPATH <rpath> [useless-rpaths]``
 
-   The specified binary produced by the recipe contains dynamic library
-   load paths (rpaths) that on a standard system are searched by default
-   by the linker (e.g. ``/lib`` and ``/usr/lib``). While these paths
-   will not cause any breakage, they do waste space and are unnecessary.
-   Depending on the build system used by the software being built, there
-   might be a configure option to disable rpath usage completely within
-   the build of the software.
+The specified binary produced by the recipe contains dynamic library
+load paths (rpaths) that on a standard system are searched by default
+by the linker (e.g. ``/lib`` and ``/usr/lib``). While these paths
+will not cause any breakage, they do waste space and are unnecessary.
+Depending on the build system used by the software being built, there
+might be a configure option to disable rpath usage completely within
+the build of the software.
 
 .. _qa-check-usrmerge:
 
-- ``<packagename> package is not obeying usrmerge distro feature. /<path> should be relocated to /usr. [usrmerge]``
+``usrmerge``
+------------
 
-    If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this check will ensure that no package
-    installs files to root (``/bin``, ``/sbin``, ``/lib``, ``/lib64``) directories. If you are seeing this
-    message, it indicates that the :ref:`ref-tasks-install` step (or perhaps the build process that
-    :ref:`ref-tasks-install` is calling into, e.g. ``make install`` is using hardcoded paths instead
-    of the variables set up for this (``bindir``, ``sbindir``, etc.), and should be
-    changed so that it does.
+``<packagename> package is not obeying usrmerge distro feature. /<path> should be relocated to /usr. [usrmerge]``
+
+If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this check will ensure that no package
+installs files to root (``/bin``, ``/sbin``, ``/lib``, ``/lib64``) directories. If you are seeing this
+message, it indicates that the :ref:`ref-tasks-install` step (or perhaps the build process that
+:ref:`ref-tasks-install` is calling into, e.g. ``make install`` is using hardcoded paths instead
+of the variables set up for this (``bindir``, ``sbindir``, etc.), and should be
+changed so that it does.
 
 .. _qa-check-var-undefined:
 
+``var-undefined``
+-----------------
+
 -  ``WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package [var-undefined]`` 
 
    Reports when variables fundamental to packaging (i.e. :term:`WORKDIR`,
@@ -823,40 +996,49 @@ Errors and Warnings
 
 .. _qa-check-version-going-backwards:
 
--  ``Package version for package <package> went backwards which would break package feeds (from <version2> to <version1>) [version-going-backwards]``
+``version-going-backwards``
+---------------------------
 
-   If the :ref:`ref-classes-buildhistory` class is enabled, reports when a
-   package being written out has a lower version than the previously written
-   package under the same name. If you are placing output packages into a feed
-   and upgrading packages on a target system using that feed, the version of a
-   package going backwards can result in the target system not correctly
-   upgrading to the "new" version of the package.
+``Package version for package <package> went backwards which would break package feeds (from <version2> to <version1>) [version-going-backwards]``
 
-   .. note::
+If the :ref:`ref-classes-buildhistory` class is enabled, reports when a
+package being written out has a lower version than the previously written
+package under the same name. If you are placing output packages into a feed
+and upgrading packages on a target system using that feed, the version of a
+package going backwards can result in the target system not correctly
+upgrading to the "new" version of the package.
 
-      This is only relevant when you are using runtime package management
-      on your target system.
+.. note::
+
+   This is only relevant when you are using runtime package management
+   on your target system.
 
 .. _qa-check-virtual-slash:
 
-- ``<variable> is set to <value> but the substring 'virtual/' holds no meaning in this context. It only works for build time dependencies, not runtime ones. It is suggested to use 'VIRTUAL-RUNTIME_' variables instead.``
+``virtual-slash``
+-----------------
 
-    ``virtual/`` is a convention intended for use in the build context
-    (i.e. :term:`PROVIDES` and :term:`DEPENDS`) rather than the runtime
-    context (i.e. :term:`RPROVIDES` and :term:`RDEPENDS`). Use
-    :term:`VIRTUAL-RUNTIME` variables instead for the latter.
+``<variable> is set to <value> but the substring 'virtual/' holds no meaning in this context. It only works for build time dependencies, not runtime ones. It is suggested to use 'VIRTUAL-RUNTIME_' variables instead. [virtual-slash]``
+
+``virtual/`` is a convention intended for use in the build context
+(i.e. :term:`PROVIDES` and :term:`DEPENDS`) rather than the runtime
+context (i.e. :term:`RPROVIDES` and :term:`RDEPENDS`). Use
+:term:`VIRTUAL-RUNTIME` variables instead for the latter.
 
 .. _qa-check-xorg-driver-abi:
 
--  ``Package <packagename> contains Xorg driver (<driver>) but no xorg-abi- dependencies [xorg-driver-abi]``
+``xorg-driver-abi``
+-------------------
+
+``Package <packagename> contains Xorg driver (<driver>) but no xorg-abi- dependencies [xorg-driver-abi]``
 
-   The specified package contains an Xorg driver, but does not have a
-   corresponding ABI package dependency. The xserver-xorg recipe
-   provides driver ABI names. All drivers should depend on the ABI
-   versions that they have been built against. Driver recipes that
-   include ``xorg-driver-input.inc`` or ``xorg-driver-video.inc`` will
-   automatically get these versions. Consequently, you should only need
-   to explicitly add dependencies to binary driver recipes.
+The specified package contains an Xorg driver, but does not have a
+corresponding ABI package dependency. The xserver-xorg recipe
+provides driver ABI names. All drivers should depend on the ABI
+versions that they have been built against. Driver recipes that
+include ``xorg-driver-input.inc`` or ``xorg-driver-video.inc`` will
+automatically get these versions. Consequently, you should only need
+to explicitly add dependencies to binary driver recipes.
 
 Configuring and Disabling QA Checks
 ===================================

---
base-commit: 09c7800333b17b21e50d2a089a3ae1b123697243
change-id: 20251008-fix-qa-checks-doc-cfde45f98ddc

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


