Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E83DC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 14:42:53 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.7902.1655908967313201741
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 07:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kDpY5hAY;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 42A19240004;
	Wed, 22 Jun 2022 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655908965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aA6rKzJAeyfADf0hWTlofsLRDCwmQPHZvh4pmBXrS04=;
	b=kDpY5hAYFwnm5CwVLkCUDdgvsLED2b/2gTOiJpL7cqthb2CUne3CZJILqN8Yau72FpiT9C
	DI7HpK2lwPAatD3iJETomE3MKNLyTjJy1hBkb5WrSOlMZ2HU2bIs9tIXAHqgSc3mxEZNCa
	Ek/qkx41JKOI/wBuex2wTwMmKeFPGg3EDA0PKtZpquA/7IG+M2GsttaI2BBu+Xwi7SRgMC
	338MqyBM3awoP2FzckXcfLVjQtamK+uRHtgMfzaHokQi6hvm67EgSTqlG5GDRGpBmG2Z5Y
	AJRdAMG30mAVR93astyVYCFrKzemX3WQDhfjs1UFS6NifBG6zL9Vl3AeIsrWKg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH RESEND] manuals: replace hyphens with em dashes
Date: Wed, 22 Jun 2022 16:42:43 +0200
Message-Id: <20220622144243.2729865-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <16E0C80D8544895A.19585@lists.yoctoproject.org>
References: <16E0C80D8544895A.19585@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jun 2022 14:42:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3023

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fix some hyphens being improperly used as em dashes.
See https://www.grammarly.com/blog/hyphens-and-dashes/

Using em dashes may also allow Sphinx to hyphenate
and break lines in the best way.

Note that the first character after an em dash not
supposed to be capitalized, unless a specific
rule applies, typically when what follows is a proper noun.

Fix a few misuses of parentheses in following text.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst               |  6 +--
 documentation/dev-manual/common-tasks.rst     | 38 +++++++--------
 documentation/kernel-dev/advanced.rst         |  2 +-
 documentation/kernel-dev/concepts-appx.rst    |  2 +-
 .../migration-guides/migration-1.6.rst        | 26 +++++-----
 .../migration-guides/migration-3.0.rst        |  4 +-
 .../migration-guides/migration-3.1.rst        |  2 +-
 .../migration-guides/migration-3.2.rst        | 18 +++----
 .../migration-guides/migration-3.3.rst        |  3 +-
 .../migration-guides/migration-3.4.rst        |  4 +-
 .../migration-guides/release-notes-3.4.rst    |  2 +-
 documentation/overview-manual/concepts.rst    |  6 +--
 .../development-environment.rst               |  2 +-
 documentation/overview-manual/yp-intro.rst    |  2 +-
 documentation/profile-manual/intro.rst        |  4 +-
 documentation/profile-manual/usage.rst        | 24 +++++-----
 documentation/ref-manual/classes.rst          |  6 +--
 .../ref-manual/devtool-reference.rst          |  2 +-
 documentation/ref-manual/faq.rst              |  4 +-
 documentation/ref-manual/qa-checks.rst        |  4 +-
 documentation/ref-manual/resources.rst        | 12 ++---
 documentation/ref-manual/structure.rst        | 10 ++--
 documentation/ref-manual/terms.rst            |  4 +-
 documentation/ref-manual/variables.rst        | 48 +++++++++----------
 documentation/ref-manual/varlocality.rst      |  2 +-
 documentation/sdk-manual/extensible.rst       |  6 +--
 documentation/sdk-manual/working-projects.rst |  6 +--
 documentation/test-manual/intro.rst           |  4 +-
 .../transitioning-to-a-custom-environment.rst |  2 +-
 29 files changed, 127 insertions(+), 128 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 280b160807..7e17b42886 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-************************************************
-Board Support Packages (BSP) - Developer's Guide
-************************************************
+**************************************************
+Board Support Packages (BSP) --- Developer's Guide
+**************************************************
 
 A Board Support Package (BSP) is a collection of information that
 defines how to support a particular hardware device, set of devices, or
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 50c571b103..b008bd0ac0 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2306,7 +2306,7 @@ under ``files``) requires a recipe that has the file listed in the
 :term:`SRC_URI` variable. Additionally, you need to manually write the
 ``do_compile`` and ``do_install`` tasks. The :term:`S` variable defines the
 directory containing the source code, which is set to
-:term:`WORKDIR` in this case - the
+:term:`WORKDIR` in this case --- the
 directory BitBake uses for the build.
 ::
 
@@ -2780,7 +2780,7 @@ in the BitBake User Manual.
    functionality. The same considerations apply to various system
    utilities (e.g. ``sed``, ``grep``, ``awk``, and so forth) that you
    might wish to use. If in doubt, you should check with multiple
-   implementations - including those from BusyBox.
+   implementations --- including those from BusyBox.
 
 Adding a New Machine
 ====================
@@ -3348,9 +3348,9 @@ The actual directory depends on several things:
 
 -  :term:`PN`: The recipe name.
 
--  :term:`EXTENDPE`: The epoch - (if
+-  :term:`EXTENDPE`: The epoch --- if
    :term:`PE` is not specified, which is
-   usually the case for most recipes, then :term:`EXTENDPE` is blank).
+   usually the case for most recipes, then :term:`EXTENDPE` is blank.
 
 -  :term:`PV`: The recipe version.
 
@@ -6602,7 +6602,7 @@ the following:
    installed into an image.
 
 -  Binary Package Version: The binary package version is composed of two
-   components - a version and a revision.
+   components --- a version and a revision.
 
    .. note::
 
@@ -6939,7 +6939,7 @@ optional arguments::
       Postinstall script to use for all packages
       (as a string)
    recursive
-      True to perform a recursive search - default
+      True to perform a recursive search --- default
       False
    hook
       A hook function to be called for every match.
@@ -6960,7 +6960,7 @@ optional arguments::
       Extra runtime dependencies (RDEPENDS) to be
       set for all packages. The default value of None
       causes a dependency on the main package
-      (${PN}) - if you do not want this, pass empty
+      (${PN}) --- if you do not want this, pass empty
       string '' for this parameter.
    aux_files_pattern
       Extra item(s) to be added to FILES for each
@@ -6986,7 +6986,7 @@ optional arguments::
       or a list of strings for multiple items. Must
       include %s.
    allow_links
-      True to allow symlinks to be matched - default
+      True to allow symlinks to be matched --- default
       False
    summary
       Summary to set for each package. Must include %s;
@@ -7431,7 +7431,7 @@ A Package Test (ptest) runs tests against packages built by the
 OpenEmbedded build system on the target machine. A ptest contains at
 least two items: the actual test, and a shell script (``run-ptest``)
 that starts the test. The shell script that starts the test must not
-contain the actual test - the script only starts the test. On the other
+contain the actual test --- the script only starts the test. On the other
 hand, the test can be anything from a simple shell script that runs a
 binary and checks the output to an elaborate system of test binaries and
 data files.
@@ -9132,13 +9132,13 @@ The JSON file must include an object with the test name as keys of an
 object or an array. This object (or array of objects) uses the following
 data:
 
--  "pkg" - A mandatory string that is the name of the package to be
+-  "pkg" --- a mandatory string that is the name of the package to be
    installed.
 
--  "rm" - An optional boolean, which defaults to "false", that specifies
+-  "rm" --- an optional boolean, which defaults to "false", that specifies
    to remove the package after the test.
 
--  "extract" - An optional boolean, which defaults to "false", that
+-  "extract" --- an optional boolean, which defaults to "false", that
    specifies if the package must be extracted from the package format.
    When set to "true", the package is not automatically installed into
    the DUT.
@@ -9803,7 +9803,7 @@ Logging With Bash
 ~~~~~~~~~~~~~~~~~
 
 When creating recipes using Bash and inserting code that handles build
-logs, you have the same goals - informative with minimal console output.
+logs, you have the same goals --- informative with minimal console output.
 The syntax you use for recipes written in Bash is similar to that of
 recipes written in Python described in the previous section.
 
@@ -10076,7 +10076,7 @@ to use GDB directly on the remote target to debug applications. These
 constraints arise because GDB needs to load the debugging information
 and the binaries of the process being debugged. Additionally, GDB needs
 to perform many computations to locate information such as function
-names, variable names and values, stack traces and so forth - even
+names, variable names and values, stack traces and so forth --- even
 before starting the debugging process. These extra computations place
 more load on the target system and can alter the characteristics of the
 program being debugged.
@@ -10653,7 +10653,7 @@ Preparing Changes for Submission
    -  If the change addresses a specific bug or issue that is associated
       with a bug-tracking ID, include a reference to that ID in your
       detailed description. For example, the Yocto Project uses a
-      specific convention for bug references - any commit that addresses
+      specific convention for bug references --- any commit that addresses
       a specific bug should use the following form for the detailed
       description. Be sure to use the actual bug-tracking ID from
       Bugzilla for bug-id::
@@ -10916,20 +10916,20 @@ follows:
    result in the most straightforward path into the stable branch for the
    fix.
 
-   a. *If the fix is present in the master branch - Submit a backport request
+   a. *If the fix is present in the master branch --- submit a backport request
       by email:* You should send an email to the relevant stable branch
       maintainer and the mailing list with details of the bug or CVE to be
       fixed, the commit hash on the master branch that fixes the issue and
       the stable branches which you would like this fix to be backported to.
 
-   b. *If the fix is not present in the master branch - Submit the fix to the
+   b. *If the fix is not present in the master branch --- submit the fix to the
       master branch first:* This will ensure that the fix passes through the
       project's usual patch review and test processes before being accepted.
       It will also ensure that bugs are not left unresolved in the master
       branch itself. Once the fix is accepted in the master branch a backport
       request can be submitted as above.
 
-   c. *If the fix is unsuitable for the master branch - Submit a patch
+   c. *If the fix is unsuitable for the master branch --- submit a patch
       directly for the stable branch:* This method should be considered as a
       last resort. It is typically necessary when the master branch is using
       a newer version of the software which includes an upstream fix for the
@@ -11260,7 +11260,7 @@ Providing the Source Code
 
 Compliance activities should begin before you generate the final image.
 The first thing you should look at is the requirement that tops the list
-for most compliance groups - providing the source. The Yocto Project has
+for most compliance groups --- providing the source. The Yocto Project has
 a few ways of meeting this requirement.
 
 One of the easiest ways to meet this requirement is to provide the
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index b5290b61b3..b16b3e0517 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -183,7 +183,7 @@ the structure:
    order to define a base kernel policy or major kernel type to be
    reused across multiple BSPs, place the file in ``ktypes`` directory.
 
-These distinctions can easily become blurred - especially as out-of-tree
+These distinctions can easily become blurred --- especially as out-of-tree
 features slowly merge upstream over time. Also, remember that how the
 description files are placed is a purely logical organization and has no
 impact on the functionality of the kernel Metadata. There is no impact
diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index b3a2f3abbf..63c5124a57 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -117,7 +117,7 @@ upstream Linux kernel development and are managed by the Yocto Project
 team's Yocto Linux kernel development strategy. It is the Yocto Project
 team's policy to not back-port minor features to the released Yocto
 Linux kernel. They only consider back-porting significant technological
-jumps - and, that is done after a complete gap analysis. The reason
+jumps --- and, that is done after a complete gap analysis. The reason
 for this policy is that back-porting any small to medium sized change
 from an evolving Linux kernel can easily create mismatches,
 incompatibilities and very subtle errors.
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index 358086560b..f54d4ba729 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -341,39 +341,39 @@ Removed and Renamed Recipes
 
 The following recipes have been removed:
 
--  ``packagegroup-toolset-native`` - This recipe is largely unused.
+-  ``packagegroup-toolset-native`` --- this recipe is largely unused.
 
--  ``linux-yocto-3.8`` - Support for the Linux yocto 3.8 kernel has been
+-  ``linux-yocto-3.8`` --- support for the Linux yocto 3.8 kernel has been
    dropped. Support for the 3.10 and 3.14 kernels have been added with
    the ``linux-yocto-3.10`` and ``linux-yocto-3.14`` recipes.
 
--  ``ocf-linux`` - This recipe has been functionally replaced using
+-  ``ocf-linux`` --- this recipe has been functionally replaced using
    ``cryptodev-linux``.
 
--  ``genext2fs`` - ``genext2fs`` is no longer used by the build system
+-  ``genext2fs`` --- ``genext2fs`` is no longer used by the build system
    and is unmaintained upstream.
 
--  ``js`` - This provided an ancient version of Mozilla's javascript
+-  ``js`` --- this provided an ancient version of Mozilla's javascript
    engine that is no longer needed.
 
--  ``zaurusd`` - The recipe has been moved to the ``meta-handheld``
+-  ``zaurusd`` --- the recipe has been moved to the ``meta-handheld``
    layer.
 
--  ``eglibc 2.17`` - Replaced by the ``eglibc 2.19`` recipe.
+-  ``eglibc 2.17`` --- replaced by the ``eglibc 2.19`` recipe.
 
--  ``gcc 4.7.2`` - Replaced by the now stable ``gcc 4.8.2``.
+-  ``gcc 4.7.2`` --- replaced by the now stable ``gcc 4.8.2``.
 
--  ``external-sourcery-toolchain`` - this recipe is now maintained in
+-  ``external-sourcery-toolchain`` --- this recipe is now maintained in
    the ``meta-sourcery`` layer.
 
--  ``linux-libc-headers-yocto 3.4+git`` - Now using version 3.10 of the
+-  ``linux-libc-headers-yocto 3.4+git`` --- now using version 3.10 of the
    ``linux-libc-headers`` by default.
 
--  ``meta-toolchain-gmae`` - This recipe is obsolete.
+-  ``meta-toolchain-gmae`` --- this recipe is obsolete.
 
--  ``packagegroup-core-sdk-gmae`` - This recipe is obsolete.
+-  ``packagegroup-core-sdk-gmae`` --- this recipe is obsolete.
 
--  ``packagegroup-core-standalone-gmae-sdk-target`` - This recipe is
+-  ``packagegroup-core-standalone-gmae-sdk-target`` --- this recipe is
    obsolete.
 
 .. _migration-1.6-removed-classes:
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 1219edf921..96aea2f332 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -216,11 +216,11 @@ The following sanity check changes occurred.
 -  :term:`SRC_URI` is now checked for usage of two
    problematic items:
 
-   -  "${PN}" prefix/suffix use - Warnings always appear if ${PN} is
+   -  "${PN}" prefix/suffix use --- warnings always appear if ${PN} is
       used. You must fix the issue regardless of whether multiconfig or
       anything else that would cause prefixing/suffixing to happen.
 
-   -  Github archive tarballs - these are not guaranteed to be stable.
+   -  Github archive tarballs --- these are not guaranteed to be stable.
       Consequently, it is likely that the tarballs will be refreshed and
       thus the SRC_URI checksums will fail to apply. It is recommended
       that you fetch either an official release tarball or a specific
diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index e3fdbbe425..cc788efeba 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -200,7 +200,7 @@ Packaging changes
 -----------------
 
 -  ``intltool`` has been removed from ``packagegroup-core-sdk`` as it is
-   rarely needed to build modern software - gettext can do most of the
+   rarely needed to build modern software --- gettext can do most of the
    things it used to be needed for. ``intltool`` has also been removed
    from ``packagegroup-core-self-hosted`` as it is not needed to for
    standard builds.
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index a376eced52..92b7f91f2c 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -23,7 +23,7 @@ Removed recipes
 The following recipes have been removed:
 
 - ``bjam-native``: replaced by ``boost-build-native``
-- ``avahi-ui``: folded into the main ``avahi`` recipe - the GTK UI can be disabled using :term:`PACKAGECONFIG` for ``avahi``.
+- ``avahi-ui``: folded into the main ``avahi`` recipe --- the GTK UI can be disabled using :term:`PACKAGECONFIG` for ``avahi``.
 - ``build-compare``: no longer needed with the removal of the ``packagefeed-stability`` class
 - ``dhcp``: obsolete, functionally replaced by ``dhcpcd`` and ``kea``
 - ``libmodulemd-v1``: replaced by ``libmodulemd``
@@ -37,7 +37,7 @@ Removed classes
 
 The following classes (.bbclass files) have been removed:
 
--  ``spdx``: obsolete - the Yocto Project is a strong supporter of SPDX, but this class was old code using a dated approach and had the potential to be misleading. The ``meta-sdpxscanner`` layer is a much more modern and active approach to handling this and is recommended as a replacement.
+-  ``spdx``: obsolete --- the Yocto Project is a strong supporter of SPDX, but this class was old code using a dated approach and had the potential to be misleading. The ``meta-sdpxscanner`` layer is a much more modern and active approach to handling this and is recommended as a replacement.
 
 - ``packagefeed-stability``: this class had become obsolete with the advent of hash equivalence and reproducible builds.
 
@@ -46,7 +46,7 @@ pseudo path filtering and mismatch behaviour
 --------------------------------------------
 
 pseudo now operates on a filtered subset of files. This is a significant change
-to the way pseudo operates within OpenEmbedded - by default, pseudo monitors and
+to the way pseudo operates within OpenEmbedded --- by default, pseudo monitors and
 logs (adds to its database) any file created or modified whilst in a ``fakeroot``
 environment. However, there are large numbers of files that we simply don't care
 about the permissions of whilst in that ``fakeroot`` context, for example ${:term:`S`}, ${:term:`B`}, ${:term:`T`},
@@ -68,7 +68,7 @@ structure above that subdirectory. For these types of cases in your own recipes,
 extend :term:`PSEUDO_IGNORE_PATHS` to cover additional paths that pseudo should not
 be monitoring.
 
-In addition, pseudo's behaviour on mismatches has now been changed - rather
+In addition, pseudo's behaviour on mismatches has now been changed --- rather
 than doing what turns out to be a rather dangerous "fixup" if it sees a file
 with a different path but the same inode as another file it has previously seen,
 pseudo will throw an ``abort()`` and direct you to a :yocto_wiki:`wiki page </Pseudo_Abort>`
@@ -137,10 +137,10 @@ DHCP server/client replaced
 
 The ``dhcp`` software package has become unmaintained and thus has been
 functionally replaced by ``dhcpcd`` (client) and ``kea`` (server). You will
-need to replace references to the recipe/package names as appropriate - most
+need to replace references to the recipe/package names as appropriate --- most
 commonly, at the package level ``dhcp-client`` should be replaced by
 ``dhcpcd`` and ``dhcp-server`` should be replaced by ``kea``. If you have any
-custom configuration files for these they will need to be adapted - refer to
+custom configuration files for these they will need to be adapted --- refer to
 the upstream documentation for ``dhcpcd`` and ``kea`` for further details.
 
 
@@ -181,7 +181,7 @@ In addition, the following new checks were added and default to triggering an er
 
 - :ref:`missing-update-alternatives <qa-check-missing-update-alternatives>`: Check if the recipe sets the :term:`ALTERNATIVE` variable for any of its packages, and does not inherit the :ref:`update-alternatives <ref-classes-update-alternatives>` class.
 
-- A trailing slash or duplicated slashes in the value of :term:`S` or :term:`B` will now trigger a warning so that they can be removed and path comparisons can be more reliable - remove any instances of these in your recipes if the warning is displayed.
+- A trailing slash or duplicated slashes in the value of :term:`S` or :term:`B` will now trigger a warning so that they can be removed and path comparisons can be more reliable --- remove any instances of these in your recipes if the warning is displayed.
 
 
 .. _migration-3.2-src-uri-file-globbing:
@@ -209,7 +209,7 @@ deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
 
 ``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as ``do_install`` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
 
-Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` - these should be refactored to use ``do_deploy_prepend`` instead.
+Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` --- these should be refactored to use ``do_deploy_prepend`` instead.
 
 
 .. _migration-3.2-nativesdk-sdk-provides-dummy:
@@ -303,7 +303,7 @@ now need to be changed to ``inherit image-artifact-names``.
 Miscellaneous changes
 ---------------------
 
-- Support for the long-deprecated ``PACKAGE_GROUP`` variable has now been removed - replace any remaining instances with :term:`FEATURE_PACKAGES`.
+- Support for the long-deprecated ``PACKAGE_GROUP`` variable has now been removed --- replace any remaining instances with :term:`FEATURE_PACKAGES`.
 - The ``FILESPATHPKG`` variable, having been previously deprecated, has now been removed. Replace any remaining references with appropriate use of :term:`FILESEXTRAPATHS`.
 - Erroneous use of ``inherit +=`` (instead of ``INHERIT +=``) in a configuration file now triggers an error instead of silently being ignored.
 - ptest support has been removed from the ``kbd`` recipe, as upstream has moved to autotest which is difficult to work with in a cross-compilation environment.
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index d65f1c7b1f..aba5c4237c 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -13,11 +13,10 @@ Minimum system requirements
 You will now need at least Python 3.6 installed on your build host. Most recent
 distributions provide this, but should you be building on a distribution that
 does not have it, you can use the ``buildtools-tarball`` (easily installable
-using ``scripts/install-buildtools``) - see
+using ``scripts/install-buildtools``) --- see
 :ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
 for details.
 
-
 .. _migration-3.3-removed-recipes:
 
 Removed recipes
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 8db43a1454..c55c0b8c3c 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -146,7 +146,7 @@ Virtual runtime provides
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
 Recipes shouldn't use the ``virtual/`` string in :term:`RPROVIDES` and
-:term:`RDEPENDS` - it is confusing because ``virtual/`` has no special
+:term:`RDEPENDS` --- it is confusing because ``virtual/`` has no special
 meaning in :term:`RPROVIDES` and :term:`RDEPENDS` (unlike in the
 corresponding build-time :term:`PROVIDES` and :term:`DEPENDS`).
 
@@ -171,7 +171,7 @@ Extensible SDK host extension
 For a normal SDK, some layers append to :term:`TOOLCHAIN_HOST_TASK`
 unconditionally which is fine, until the eSDK tries to override the
 variable to its own values. Instead of installing packages specified
-in this variable it uses native recipes instead - a very different
+in this variable it uses native recipes instead --- a very different
 approach. This has led to confusing errors when binaries are added
 to the SDK but not relocated.
 
diff --git a/documentation/migration-guides/release-notes-3.4.rst b/documentation/migration-guides/release-notes-3.4.rst
index 5a8fb4b5a9..323e4df7ae 100644
--- a/documentation/migration-guides/release-notes-3.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.rst
@@ -5,7 +5,7 @@ New Features / Enhancements in 3.4
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 -  Linux kernel 5.14, glibc 2.34 and ~280 other recipe upgrades
--  Switched override character to ':' (replacing '_') for more robust parsing and improved performance - see the above migration guide for help
+-  Switched override character to ':' (replacing '_') for more robust parsing and improved performance --- see the above migration guide for help
 -  Rust integrated into core, providing rust support for cross-compilation and SDK
 -  New create-spdx class for creating SPDX SBoM documents
 -  New recipes: cargo, core-image-ptest-all, core-image-ptest-fast, core-image-weston-sdk, erofs-utils, gcompat, gi-docgen, libmicrohttpd, libseccomp, libstd-rs, perlcross, python3-markdown, python3-pyyaml, python3-smartypants, python3-typogrify, rust, rust-cross, rust-cross-canadian, rust-hello-world, rust-llvm, rust-tools-cross-canadian, rustfmt, xwayland
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 016577e07e..83339da98f 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -557,7 +557,7 @@ Local Projects
 ~~~~~~~~~~~~~~
 
 Local projects are custom bits of software the user provides. These bits
-reside somewhere local to a project - perhaps a directory into which the
+reside somewhere local to a project --- perhaps a directory into which the
 user checks in items (e.g. a local directory containing a development
 source tree used by the group).
 
@@ -1641,7 +1641,7 @@ you a good idea of when the task's data changes.
 
 To complicate the problem, there are things that should not be included
 in the checksum. First, there is the actual specific build path of a
-given task - the :term:`WORKDIR`. It
+given task --- the :term:`WORKDIR`. It
 does not matter if the work directory changes because it should not
 affect the output for target packages. Also, the build process has the
 objective of making native or cross packages relocatable.
@@ -1700,7 +1700,7 @@ need to fix this situation.
 Thus far, this section has limited discussion to the direct inputs into
 a task. Information based on direct inputs is referred to as the
 "basehash" in the code. However, the question of a task's indirect
-inputs still exits - items already built and present in the
+inputs still exits --- items already built and present in the
 :term:`Build Directory`. The checksum (or
 signature) for a particular task needs to add the hashes of all the
 tasks on which the particular task depends. Choosing which dependencies
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index f1001e0bd3..43a6f1b480 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -52,7 +52,7 @@ A development host or :term:`Build Host` is key to
 using the Yocto Project. Because the goal of the Yocto Project is to
 develop images or applications that run on embedded hardware,
 development of those images and applications generally takes place on a
-system not intended to run the software - the development host.
+system not intended to run the software --- the development host.
 
 You need to set up a development host in order to use it with the Yocto
 Project. Most find that it is best to have a native Linux machine
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index a2e0862459..4e3b7c3250 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -842,7 +842,7 @@ helpful for getting started:
    distribution.
 
    Another point worth noting is that historically within the Yocto
-   Project, recipes were referred to as packages - thus, the existence
+   Project, recipes were referred to as packages --- thus, the existence
    of several BitBake variables that are seemingly mis-named, (e.g.
    :term:`PR`,
    :term:`PV`, and
diff --git a/documentation/profile-manual/intro.rst b/documentation/profile-manual/intro.rst
index 9c8fa3dbfa..e9208dfde8 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -7,7 +7,7 @@ Yocto Project Profiling and Tracing Manual
 Introduction
 ============
 
-Yocto bundles a number of tracing and profiling tools - this 'HOWTO'
+Yocto bundles a number of tracing and profiling tools --- this 'HOWTO'
 describes their basic usage and shows by example how to make use of them
 to examine application and system behavior.
 
@@ -26,7 +26,7 @@ please see the documentation and/or websites listed for each tool.
 
 The final section of this 'HOWTO' is a collection of real-world examples
 which we'll be continually adding to as we solve more problems using the
-tools - feel free to add your own examples to the list!
+tools --- feel free to add your own examples to the list!
 
 General Setup
 =============
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 0ff9d921fd..49f8af4a74 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -17,7 +17,7 @@ The 'perf' tool is the profiling and tracing tool that comes bundled
 with the Linux kernel.
 
 Don't let the fact that it's part of the kernel fool you into thinking
-that it's only for tracing and profiling the kernel - you can indeed use
+that it's only for tracing and profiling the kernel --- you can indeed use
 it to trace and profile just the kernel, but you can also use it to
 profile specific applications separately (with or without kernel
 context), and you can also use it to trace and profile the kernel and
@@ -176,7 +176,7 @@ interactive text-based UI (or simply as text if we specify ``--stdio`` to
 
 As our first attempt at profiling this workload, we'll simply run 'perf
 record', handing it the workload we want to profile (everything after
-'perf record' and any perf options we hand it - here none - will be
+'perf record' and any perf options we hand it --- here none, will be
 executed in a new shell). perf collects samples until the process exits
 and records them in a file named 'perf.data' in the current working
 directory. ::
@@ -203,7 +203,7 @@ The above screenshot displays a 'flat' profile, one entry for each
 'bucket' corresponding to the functions that were profiled during the
 profiling run, ordered from the most popular to the least (perf has
 options to sort in various orders and keys as well as display entries
-only above a certain threshold and so on - see the perf documentation
+only above a certain threshold and so on --- see the perf documentation
 for details). Note that this includes both userspace functions (entries
 containing a [.]) and kernel functions accounted to the process (entries
 containing a [k]). (perf has command-line modifiers that can be used to
@@ -608,7 +608,7 @@ and tell perf to do a profile using it as the sampling event::
 The screenshot above shows the results of running a profile using
 sched:sched_switch tracepoint, which shows the relative costs of various
 paths to sched_wakeup (note that sched_wakeup is the name of the
-tracepoint - it's actually defined just inside ttwu_do_wakeup(), which
+tracepoint --- it's actually defined just inside ttwu_do_wakeup(), which
 accounts for the function name actually displayed in the profile:
 
 .. code-block:: c
@@ -877,7 +877,7 @@ System-Wide Tracing and Profiling
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The examples so far have focused on tracing a particular program or
-workload - in other words, every profiling run has specified the program
+workload --- in other words, every profiling run has specified the program
 to profile in the command-line e.g. 'perf record wget ...'.
 
 It's also possible, and more interesting in many cases, to run a
@@ -964,7 +964,7 @@ Filtering
 Notice that there are a lot of events that don't really have anything to
 do with what we're interested in, namely events that schedule 'perf'
 itself in and out or that wake perf up. We can get rid of those by using
-the '--filter' option - for each event we specify using -e, we can add a
+the '--filter' option --- for each event we specify using -e, we can add a
 --filter after that to filter out trace events that contain fields with
 specific values::
 
@@ -1135,7 +1135,7 @@ callgraphs from starting a few programs during those 30 seconds:
 .. admonition:: Tying it Together
 
    The trace events subsystem accommodate static and dynamic tracepoints
-   in exactly the same way - there's no difference as far as the
+   in exactly the same way --- there's no difference as far as the
    infrastructure is concerned. See the ftrace section for more details
    on the trace event subsystem.
 
@@ -1201,7 +1201,7 @@ For this section, we'll assume you've already performed the basic setup
 outlined in the ":ref:`profile-manual/intro:General Setup`" section.
 
 ftrace, trace-cmd, and kernelshark run on the target system, and are
-ready to go out-of-the-box - no additional setup is necessary. For the
+ready to go out-of-the-box --- no additional setup is necessary. For the
 rest of this section we assume you've ssh'ed to the host and will be
 running ftrace on the target. kernelshark is a GUI application and if
 you use the '-X' option to ssh you can have the kernelshark GUI run on
@@ -1321,7 +1321,7 @@ great way to learn about how the kernel code works in a dynamic sense.
    ftrace:function tracepoint.
 
 It is a little more difficult to follow the call chains than it needs to
-be - luckily there's a variant of the function tracer that displays the
+be --- luckily there's a variant of the function tracer that displays the
 callchains explicitly, called the 'function_graph' tracer::
 
    root@sugarbay:/sys/kernel/debug/tracing# echo function_graph > current_tracer
@@ -2138,7 +2138,7 @@ You can now view the trace in text form on the target::
    .
 
 You can now safely destroy the trace
-session (note that this doesn't delete the trace - it's still there in
+session (note that this doesn't delete the trace --- it's still there in
 ~/lttng-traces)::
 
    root@crownbay:~# lttng destroy
@@ -2222,7 +2222,7 @@ You can now view the trace in text form on the target::
    .
 
 You can now safely destroy the trace session (note that this doesn't delete the
-trace - it's still there in ~/lttng-traces)::
+trace --- it's still there in ~/lttng-traces)::
 
    root@crownbay:~# lttng destroy
    Session auto-20190303-021943 destroyed at /home/root
@@ -2557,7 +2557,7 @@ Execute the workload you're interested in::
    root@crownbay:/sys/kernel/debug/tracing# cat /media/sdc/testfile.txt
 
 And look at the output (note here that we're using 'trace_pipe' instead of
-trace to capture this trace - this allows us to wait around on the pipe
+trace to capture this trace --- this allows us to wait around on the pipe
 for data to appear)::
 
    root@crownbay:/sys/kernel/debug/tracing# cat trace_pipe
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 729aa259e0..d0ed539229 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -108,18 +108,18 @@ support is either not present or is broken.
 It's useful to have some idea of how the tasks defined by the
 ``autotools*`` classes work and what they do behind the scenes.
 
--  :ref:`ref-tasks-configure` - Regenerates the
+-  :ref:`ref-tasks-configure` --- regenerates the
    configure script (using ``autoreconf``) and then launches it with a
    standard set of arguments used during cross-compilation. You can pass
    additional parameters to ``configure`` through the :term:`EXTRA_OECONF`
    or :term:`PACKAGECONFIG_CONFARGS`
    variables.
 
--  :ref:`ref-tasks-compile` - Runs ``make`` with
+-  :ref:`ref-tasks-compile` --- runs ``make`` with
    arguments that specify the compiler and linker. You can pass
    additional arguments through the :term:`EXTRA_OEMAKE` variable.
 
--  :ref:`ref-tasks-install` - Runs ``make install`` and
+-  :ref:`ref-tasks-install` --- runs ``make install`` and
    passes in ``${``\ :term:`D`\ ``}`` as ``DESTDIR``.
 
 .. _ref-classes-base:
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 10ca70a2b3..997ec0351c 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -164,7 +164,7 @@ Adding a New Recipe to the Workspace Layer
 ==========================================
 
 Use the ``devtool add`` command to add a new recipe to the workspace
-layer. The recipe you add should not exist - ``devtool`` creates it for
+layer. The recipe you add should not exist --- ``devtool`` creates it for
 you. The source files the recipe uses should exist in an external area.
 
 The following example creates and adds a new recipe named ``jackson`` to
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 3eee9e1be5..2fcbf7da96 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -364,7 +364,7 @@ redirect requests through proxy servers.
 
 **Q:** Can I get rid of build output so I can start over?
 
-**A:** Yes - you can easily do this. When you use BitBake to build an
+**A:** Yes --- you can easily do this. When you use BitBake to build an
 image, all the build output goes into the directory created when you run
 the build environment setup script (i.e.
 :ref:`structure-core-script`). By default, this :term:`Build Directory`
@@ -428,7 +428,7 @@ relatively normal and the second is not:
       build/tmp/sysroots/x86_64-linux/usr/bin
 
 Even if the paths look unusual,
-they both are correct - the first for a target and the second for a
+they both are correct --- the first for a target and the second for a
 native recipe. These paths are a consequence of the ``DESTDIR``
 mechanism and while they appear strange, they are correct and in
 practice very effective.
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 8c475d0f72..fbab1dc92e 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -613,7 +613,7 @@ Errors and Warnings
     so using ${:term:`BPN`} rather than ${:term:`PN`} as the latter will change
     for different variants of the same recipe e.g. when :term:`BBCLASSEXTEND`
     or multilib are being used. This check will fail if a reference to ``${PN}``
-    is found within the :term:`SRC_URI` value - change it to ``${BPN}`` instead.
+    is found within the :term:`SRC_URI` value --- change it to ``${BPN}`` instead.
 
 
 .. _qa-check-unhandled-features-check:
@@ -727,7 +727,7 @@ Errors and Warnings
             devtool modify <recipe>
 
     This will apply all of the patches, and create new commits out of them in
-    the workspace - with the patch context updated.
+    the workspace --- with the patch context updated.
 
     Then, replace the patches in the recipe layer::
 
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index c942384662..292a9d6f61 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -64,22 +64,22 @@ and announcements. To subscribe to one of the following mailing lists,
 click on the appropriate URL in the following list and follow the
 instructions:
 
--  :yocto_lists:`/g/yocto` - General Yocto Project
+-  :yocto_lists:`/g/yocto` --- general Yocto Project
    discussion mailing list.
 
--  :oe_lists:`/g/openembedded-core` - Discussion mailing
+-  :oe_lists:`/g/openembedded-core` --- discussion mailing
    list about OpenEmbedded-Core (the core metadata).
 
--  :oe_lists:`/g/openembedded-devel` - Discussion
+-  :oe_lists:`/g/openembedded-devel` --- discussion
    mailing list about OpenEmbedded.
 
--  :oe_lists:`/g/bitbake-devel` - Discussion mailing
+-  :oe_lists:`/g/bitbake-devel` --- discussion mailing
    list about the :term:`BitBake` build tool.
 
--  :yocto_lists:`/g/poky` - Discussion mailing list
+-  :yocto_lists:`/g/poky` --- discussion mailing list
    about :term:`Poky`.
 
--  :yocto_lists:`/g/yocto-announce` - Mailing list to
+-  :yocto_lists:`/g/yocto-announce` --- mailing list to
    receive official Yocto Project release and milestone announcements.
 
 For more Yocto Project-related mailing lists, see the
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 12a085552f..bdcffc1947 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -213,8 +213,8 @@ These files are standard top-level files.
 
 .. _structure-build:
 
-The Build Directory - ``build/``
-================================
+The Build Directory --- ``build/``
+==================================
 
 The OpenEmbedded build system creates the :term:`Build Directory`
 when you run the build environment setup
@@ -589,7 +589,7 @@ install" places its output that is then split into sub-packages within
 ``build/tmp/work/tunearch/recipename/version/``
 -----------------------------------------------
 
-The recipe work directory - ``${WORKDIR}``.
+The recipe work directory --- ``${WORKDIR}``.
 
 As described earlier in the
 ":ref:`structure-build-tmp-sysroots`" section,
@@ -654,8 +654,8 @@ recipes. In practice, this is only used for ``gcc`` and its variants
 
 .. _structure-meta:
 
-The Metadata - ``meta/``
-========================
+The Metadata --- ``meta/``
+==========================
 
 As mentioned previously, :term:`Metadata` is the core of the
 Yocto Project. Metadata has several important subdivisions:
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 512032a67e..1e3f718a8f 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -270,7 +270,7 @@ universal, the list includes them just in case:
       your Linux distribution.
 
       Another point worth noting is that historically within the Yocto
-      Project, recipes were referred to as packages - thus, the existence
+      Project, recipes were referred to as packages --- thus, the existence
       of several BitBake variables that are seemingly mis-named, (e.g.
       :term:`PR`, :term:`PV`, and
       :term:`PE`).
@@ -369,7 +369,7 @@ universal, the list includes them just in case:
      Directory created by unpacking a released tarball as compared to
      cloning ``git://git.yoctoproject.org/poky``. When you unpack a
      tarball, you have an exact copy of the files based on the time of
-     release - a fixed release point. Any changes you make to your local
+     release --- a fixed release point. Any changes you make to your local
      files in the Source Directory are on top of the release and will
      remain local only. On the other hand, when you clone the ``poky`` Git
      repository, you have an active development repository with access to
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 28267101d8..761412e26d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -591,7 +591,7 @@ system and gives an overview of their function and contents.
       This variable is useful in situations where the same recipe appears
       in more than one layer. Setting this variable allows you to
       prioritize a layer against other layers that contain the same recipe
-      - effectively letting you control the precedence for the multiple
+      --- effectively letting you control the precedence for the multiple
       layers. The precedence established through this variable stands
       regardless of a recipe's version (:term:`PV` variable). For
       example, a layer that has a recipe with a higher :term:`PV` value but for
@@ -889,7 +889,7 @@ system and gives an overview of their function and contents.
    :term:`BUILD_OS`
       Specifies the operating system in use on the build host (e.g.
       "linux"). The OpenEmbedded build system sets the value of
-      :term:`BUILD_OS` from the OS reported by the ``uname`` command - the
+      :term:`BUILD_OS` from the OS reported by the ``uname`` command --- the
       first word, converted to lower-case characters.
 
    :term:`BUILD_PREFIX`
@@ -1689,7 +1689,7 @@ system and gives an overview of their function and contents.
       ``${TMPDIR}/deploy``.
 
       For more information on the structure of the Build Directory, see
-      ":ref:`ref-manual/structure:the build directory - \`\`build/\`\``" section.
+      ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`",
       ":ref:`overview-manual/concepts:package feeds`", and
@@ -1733,7 +1733,7 @@ system and gives an overview of their function and contents.
       <ref-classes-image>` class.
 
       For more information on the structure of the Build Directory, see
-      ":ref:`ref-manual/structure:the build directory - \`\`build/\`\``" section.
+      ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`" and
       ":ref:`overview-manual/concepts:application development sdk`" sections both in
@@ -2245,24 +2245,24 @@ system and gives an overview of their function and contents.
 
       Here are some examples of features you can add:
 
-        - "dbg-pkgs" - Adds -dbg packages for all installed packages including
+        - "dbg-pkgs" --- adds -dbg packages for all installed packages including
           symbol information for debugging and profiling.
 
-        - "debug-tweaks" - Makes an image suitable for debugging. For example, allows root logins without passwords and
+        - "debug-tweaks" --- makes an image suitable for debugging. For example, allows root logins without passwords and
           enables post-installation logging. See the 'allow-empty-password' and
           'post-install-logging' features in the ":ref:`ref-features-image`"
           section for more information.
-        - "dev-pkgs" - Adds -dev packages for all installed packages. This is
+        - "dev-pkgs" --- adds -dev packages for all installed packages. This is
           useful if you want to develop against the libraries in the image.
-        - "read-only-rootfs" - Creates an image whose root filesystem is
+        - "read-only-rootfs" --- creates an image whose root filesystem is
           read-only. See the
           ":ref:`dev-manual/common-tasks:creating a read-only root filesystem`"
           section in the Yocto Project Development Tasks Manual for more
           information
-        - "tools-debug" - Adds debugging tools such as gdb and strace.
-        - "tools-sdk" - Adds development tools such as gcc, make,
+        - "tools-debug" --- adds debugging tools such as gdb and strace.
+        - "tools-sdk" --- adds development tools such as gcc, make,
           pkgconfig and so forth.
-        - "tools-testapps" - Adds useful testing tools
+        - "tools-testapps" --- adds useful testing tools
           such as ts_print, aplay, arecord and so forth.
 
       For a complete list of image features that ships with the Yocto
@@ -3256,7 +3256,7 @@ system and gives an overview of their function and contents.
          IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
    :term:`IMAGE_NAME_SUFFIX`
-      Suffix used for the image output filename - defaults to ``".rootfs"``
+      Suffix used for the image output filename --- defaults to ``".rootfs"``
       to distinguish the image file from other files created during image
       building; however if this suffix is redundant or not desired you can
       clear the value of this variable (set the value to ""). For example,
@@ -6206,7 +6206,7 @@ system and gives an overview of their function and contents.
       ``baz``.
 
       The names of the packages you list within :term:`RDEPENDS` must be the
-      names of other packages - they cannot be recipe names. Although
+      names of other packages --- they cannot be recipe names. Although
       package names and recipe names usually match, the important point
       here is that you are providing package names within the :term:`RDEPENDS`
       variable. For an example of the default list of packages created from
@@ -7109,35 +7109,35 @@ system and gives an overview of their function and contents.
 
       There are standard and recipe-specific options. Here are standard ones:
 
-      -  ``apply`` - Whether to apply the patch or not. The default
+      -  ``apply`` --- whether to apply the patch or not. The default
          action is to apply the patch.
 
-      -  ``striplevel`` - Which striplevel to use when applying the
+      -  ``striplevel`` --- which striplevel to use when applying the
          patch. The default level is 1.
 
-      -  ``patchdir`` - Specifies the directory in which the patch should
+      -  ``patchdir`` --- specifies the directory in which the patch should
          be applied. The default is ``${``\ :term:`S`\ ``}``.
 
       Here are options specific to recipes building code from a revision
       control system:
 
-      -  ``mindate`` - Apply the patch only if
+      -  ``mindate`` --- apply the patch only if
          :term:`SRCDATE` is equal to or greater than
          ``mindate``.
 
-      -  ``maxdate`` - Apply the patch only if :term:`SRCDATE` is not later
+      -  ``maxdate`` --- apply the patch only if :term:`SRCDATE` is not later
          than ``maxdate``.
 
-      -  ``minrev`` - Apply the patch only if :term:`SRCREV` is equal to or
+      -  ``minrev`` --- apply the patch only if :term:`SRCREV` is equal to or
          greater than ``minrev``.
 
-      -  ``maxrev`` - Apply the patch only if :term:`SRCREV` is not later
+      -  ``maxrev`` --- apply the patch only if :term:`SRCREV` is not later
          than ``maxrev``.
 
-      -  ``rev`` - Apply the patch only if :term:`SRCREV` is equal to
+      -  ``rev`` --- apply the patch only if :term:`SRCREV` is equal to
          ``rev``.
 
-      -  ``notrev`` - Apply the patch only if :term:`SRCREV` is not equal to
+      -  ``notrev`` --- apply the patch only if :term:`SRCREV` is not equal to
          ``rev``.
 
       .. note::
@@ -8846,8 +8846,8 @@ system and gives an overview of their function and contents.
       -  :term:`TMPDIR`: The top-level build output directory
       -  :term:`MULTIMACH_TARGET_SYS`: The target system identifier
       -  :term:`PN`: The recipe name
-      -  :term:`EXTENDPE`: The epoch - (if :term:`PE` is not specified, which
-         is usually the case for most recipes, then `EXTENDPE` is blank)
+      -  :term:`EXTENDPE`: The epoch --- if :term:`PE` is not specified, which
+         is usually the case for most recipes, then `EXTENDPE` is blank.
       -  :term:`PV`: The recipe version
       -  :term:`PR`: The recipe revision
 
diff --git a/documentation/ref-manual/varlocality.rst b/documentation/ref-manual/varlocality.rst
index 5f7dba8775..e2c086ffa0 100644
--- a/documentation/ref-manual/varlocality.rst
+++ b/documentation/ref-manual/varlocality.rst
@@ -113,7 +113,7 @@ This section lists variables that are required for recipes.
 
 -  :term:`LIC_FILES_CHKSUM`
 
--  :term:`SRC_URI` - used in recipes that fetch local or remote files.
+-  :term:`SRC_URI` --- used in recipes that fetch local or remote files.
 
 .. _ref-varlocality-recipe-dependencies:
 
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 6bb262273d..ed9e43a2d8 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -252,7 +252,7 @@ command:
    -  *Left*: The left scenario in the figure represents a common
       situation where the source code does not exist locally and needs
       to be extracted. In this situation, the source code is extracted
-      to the default workspace - you do not want the files in some
+      to the default workspace --- you do not want the files in some
       specific location outside of the workspace. Thus, everything you
       need will be located in the workspace::
 
@@ -267,7 +267,7 @@ command:
    -  *Middle*: The middle scenario in the figure also represents a
       situation where the source code does not exist locally. In this
       case, the code is again upstream and needs to be extracted to some
-      local area - this time outside of the default workspace.
+      local area --- this time outside of the default workspace.
 
       .. note::
 
@@ -302,7 +302,7 @@ command:
       recipe for the code and places the recipe into the workspace.
 
       Because the extracted source code already exists, ``devtool`` does
-      not try to relocate the source code into the workspace - only the
+      not try to relocate the source code into the workspace --- only the
       new recipe is placed in the workspace.
 
       Aside from a recipe folder, the command also creates an associated
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index efef5c8bd2..7f8d9b8491 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -174,19 +174,19 @@ variables and Makefile variables during development.
 The main point of this section is to explain the following three cases
 regarding variable behavior:
 
--  *Case 1 - No Variables Set in the Makefile Map to Equivalent
+-  *Case 1 --- No Variables Set in the Makefile Map to Equivalent
    Environment Variables Set in the SDK Setup Script:* Because matching
    variables are not specifically set in the ``Makefile``, the variables
    retain their values based on the environment setup script.
 
--  *Case 2 - Variables Are Set in the Makefile that Map to Equivalent
+-  *Case 2 --- Variables Are Set in the Makefile that Map to Equivalent
    Environment Variables from the SDK Setup Script:* Specifically
    setting matching variables in the ``Makefile`` during the build
    results in the environment settings of the variables being
    overwritten. In this case, the variables you set in the ``Makefile``
    are used.
 
--  *Case 3 - Variables Are Set Using the Command Line that Map to
+-  *Case 3 --- Variables Are Set Using the Command Line that Map to
    Equivalent Environment Variables from the SDK Setup Script:*
    Executing the ``Makefile`` from the command line results in the
    environment variables being overwritten. In this case, the
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 12324e592c..6421dd53c9 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -85,8 +85,8 @@ topology that includes a controller and a cluster of workers:
    :align: center
    :width: 70%
 
-Yocto Project Tests - Types of Testing Overview
-===============================================
+Yocto Project Tests --- Types of Testing Overview
+=================================================
 
 The Autobuilder tests different elements of the project by using
 the following types of tests:
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index 6b34fedc26..ee1fc891ab 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -84,7 +84,7 @@ Transitioning to a custom environment for systems development
 
 #. **Now you're ready to create an image recipe**.
    There are a number of ways to do this. However, it is strongly recommended
-   that you have your own image recipe - don't try appending to existing image
+   that you have your own image recipe --- don't try appending to existing image
    recipes. Recipes for images are trivial to create and you usually want to
    fully customize their contents.
 
-- 
2.34.1


