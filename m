Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCBBE7718E
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 15:22:02 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.22809.1735226516964455629
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Dec 2024 07:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X28epkrM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32933FF804;
	Thu, 26 Dec 2024 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735226515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/SF46bewNQ5avZ4K48e3FN38S1Jnatu0Hw8Drif/gk=;
	b=X28epkrMR4Gt5FEfuttodh4eLbIuX5i0AWJ8hAP1WLzd7RWxmOV1gGhZBUsAidt0AtKYFh
	d11OKzeLDrm013vAmb9e/XoeGAspbySb+LzkYgTEKIEa3AuSFhtI4Cw01tdECIoFS3V1IU
	CGdgidT6HjX3FgPtH+kdBNj2pkJac2lk+C6/RKmDKqcEXJxyk58DlffD14bClHPCyBg5TG
	SdHougB0z41e2bS/rsXQS2ws3BcpzAHxGOgV34XuppiUe29JrAnpBNU9PHNuxO0d1fVif5
	nRJPM1B8nnbFwPBWy96ac7a68erUBP0w9khLFJdL3FuzzaCyN1y1Aza6IHhXlA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 26 Dec 2024 16:20:16 +0100
Subject: [PATCH v2 1/2] ref-manual/packages: move ptest section to the
 test-manual
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-move-ptest-to-test-manual-v2-1-227db1b045a2@bootlin.com>
References: <20241226-move-ptest-to-test-manual-v2-0-227db1b045a2@bootlin.com>
In-Reply-To: <20241226-move-ptest-to-test-manual-v2-0-227db1b045a2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=17665;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+REGg2l+433k5pyOfO6hGIqNjUrDOV2xNwqG3Cln9fg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnbXSSTEXLsU3ahhP21ZgtsGZDa1NNQD8Fy58TL
 rxfFrj2fISJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ210kgAKCRDRgEFAKaOo
 NhZND/9ixNT/tqK4p55EmZTNOdu7yEraBuahXAMxlc86GqGb3GtJ38ozg83CRDtpdJ9HNEJiSxT
 G7k6edq+d7fC9EvnbgH0FZ8rXN61PZEUQm3FaKMHshsGJy5L8M5lINaWw80QO9daYRuwil0t0Xw
 u6Z4/QirICYet9hY/W+/QkmsrJmxTJl7/z/7WbOutiTmmy+ZIWUl3HOiSxT8w8Z/oDPOejXTape
 j8Bd2Qc4FpZTggcxGuoOmPDRJatrTfYE35WXPzoN7hFC8qe5XJ/d4OU+r7Pj/PSPlyfTg7LLQ49
 5uz/b5OEX5RXw2ROVDKvfvgLXPo+vFXRTJ/J298njh7RXyrcIqNMC7tICiwr2JuJkSq4NKHW2vU
 Q3maPmxd9VLzw8TH4QONPvQLn2V/caIxE4mCiKtdrlp6mDnWqxwC7pIqk7c5dNuqXlXcJ1Dc0w5
 lcArubCVA9C42TnKobx64eAE2J9J26G8PIfa1tAIvjc54P0lFJQ5nivUhcG/CIdIMKllAAyprDl
 4DKx3Ynv7E8L5ctOVEolA8DA21J5ZeNlJQW6Zr/3ykz7KyLPiJHxSBcrZaSI+N/DL4cYnO8Wzlt
 dz7QnAR7X5b20vzQq7RxGL3xRFZMrDHWmxLjmHobe+cBsaZwSg6T/IuiNNFjdIUNkXH2djBXRU/
 S8a0f/N0sP4sQTg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Dec 2024 15:22:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6043

[ YOCTO #15106 ]

It makes more sense to document ptests in the test-manual. Since ptests
are still related to packages, keep a link to ptests from packages.rst
to the test-manual.

Reported-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/packages.rst            | 112 +---------------------
 documentation/migration-guides/migration-1.6.rst |   2 +-
 documentation/ref-manual/classes.rst             |   4 +-
 documentation/ref-manual/features.rst            |   2 +-
 documentation/ref-manual/qa-checks.rst           |   2 +-
 documentation/ref-manual/release-process.rst     |   2 +-
 documentation/ref-manual/variables.rst           |   2 +-
 documentation/test-manual/index.rst              |   1 +
 documentation/test-manual/intro.rst              |   2 +-
 documentation/test-manual/ptest.rst              | 114 +++++++++++++++++++++++
 10 files changed, 126 insertions(+), 117 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 33cf78747d1bc62268811321ad7a40397268e13f..4ba2dcae3ac91a44d844de3e9fa33a87972d3d49 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -16,7 +16,7 @@ This section describes a few tasks that involve packages:
 -  :ref:`dev-manual/packages:generating and using signed packages`
 
 -  :ref:`Setting up and running package test
-   (ptest) <dev-manual/packages:testing packages with ptest>`
+   (ptest) <test-manual/ptest:testing packages with ptest>`
 
 -  :ref:`dev-manual/packages:creating node package manager (npm) packages`
 
@@ -882,114 +882,8 @@ related to signed package feeds are available:
 Testing Packages With ptest
 ===========================
 
-A Package Test (ptest) runs tests against packages built by the
-OpenEmbedded build system on the target machine. A ptest contains at
-least two items: the actual test, and a shell script (``run-ptest``)
-that starts the test. The shell script that starts the test must not
-contain the actual test --- the script only starts the test. On the other
-hand, the test can be anything from a simple shell script that runs a
-binary and checks the output to an elaborate system of test binaries and
-data files.
-
-The test generates output in the format used by Automake::
-
-   result: testname
-
-where the result can be ``PASS``, ``FAIL``, or ``SKIP``, and
-the testname can be any identifying string.
-
-For a list of Yocto Project recipes that are already enabled with ptest,
-see the :yocto_wiki:`Ptest </Ptest>` wiki page.
-
-.. note::
-
-   A recipe is "ptest-enabled" if it inherits the :ref:`ref-classes-ptest`
-   class.
-
-Adding ptest to Your Build
---------------------------
-
-To add package testing to your build, add the :term:`DISTRO_FEATURES` and
-:term:`EXTRA_IMAGE_FEATURES` variables to your ``local.conf`` file, which
-is found in the :term:`Build Directory`::
-
-   DISTRO_FEATURES:append = " ptest"
-   EXTRA_IMAGE_FEATURES += "ptest-pkgs"
-
-Once your build is complete, the ptest files are installed into the
-``/usr/lib/package/ptest`` directory within the image, where ``package``
-is the name of the package.
-
-Running ptest
--------------
-
-The ``ptest-runner`` package installs a shell script that loops through
-all installed ptest test suites and runs them in sequence. Consequently,
-you might want to add this package to your image.
-
-Getting Your Package Ready
---------------------------
-
-In order to enable a recipe to run installed ptests on target hardware,
-you need to prepare the recipes that build the packages you want to
-test. Here is what you have to do for each recipe:
-
--  *Be sure the recipe inherits the* :ref:`ref-classes-ptest` *class:*
-   Include the following line in each recipe::
-
-      inherit ptest
-
--  *Create run-ptest:* This script starts your test. Locate the
-   script where you will refer to it using
-   :term:`SRC_URI`. Here is an
-   example that starts a test for ``dbus``::
-
-      #!/bin/sh
-      cd test
-      make -k runtest-TESTS
-
--  *Ensure dependencies are met:* If the test adds build or runtime
-   dependencies that normally do not exist for the package (such as
-   requiring "make" to run the test suite), use the
-   :term:`DEPENDS` and
-   :term:`RDEPENDS` variables in
-   your recipe in order for the package to meet the dependencies. Here
-   is an example where the package has a runtime dependency on "make"::
-
-      RDEPENDS:${PN}-ptest += "make"
-
--  *Add a function to build the test suite:* Not many packages support
-   cross-compilation of their test suites. Consequently, you usually
-   need to add a cross-compilation function to the package.
-
-   Many packages based on Automake compile and run the test suite by
-   using a single command such as ``make check``. However, the host
-   ``make check`` builds and runs on the same computer, while
-   cross-compiling requires that the package is built on the host but
-   executed for the target architecture (though often, as in the case
-   for ptest, the execution occurs on the host). The built version of
-   Automake that ships with the Yocto Project includes a patch that
-   separates building and execution. Consequently, packages that use the
-   unaltered, patched version of ``make check`` automatically
-   cross-compiles.
-
-   Regardless, you still must add a ``do_compile_ptest`` function to
-   build the test suite. Add a function similar to the following to your
-   recipe::
-
-      do_compile_ptest() {
-          oe_runmake buildtest-TESTS
-      }
-
--  *Ensure special configurations are set:* If the package requires
-   special configurations prior to compiling the test code, you must
-   insert a ``do_configure_ptest`` function into the recipe.
-
--  *Install the test suite:* The :ref:`ref-classes-ptest` class
-   automatically copies the file ``run-ptest`` to the target and then runs make
-   ``install-ptest`` to run the tests. If this is not enough, you need
-   to create a ``do_install_ptest`` function and make sure it gets
-   called after the "make install-ptest" completes.
+See the :ref:`test-manual/ptest:Testing Packages With ptest` section of the
+Yocto Project Test Environment Manual.
 
 Creating Node Package Manager (NPM) Packages
 ============================================
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index 916169e836b159ba51b31c7eaebbfae8edbe0d81..b052a43a3125d0267c879f932c13ce308c584324 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -221,7 +221,7 @@ Package Test (ptest)
 
 Package Tests (ptest) are built but not installed by default. For
 information on using Package Tests, see the
-":ref:`dev-manual/packages:testing packages with ptest`" section in the
+":ref:`test-manual/ptest:testing packages with ptest`" section in the
 Yocto Project Development Tasks Manual. See also the ":ref:`ref-classes-ptest`"
 section.
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index e5fe44052d4b05bf1b2b3acfaf2fd368f66fb261..7da2a6d70955976c3c10e2971a4b6c5324c570b9 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2626,7 +2626,7 @@ runtime tests for recipes that build software that provides these tests.
 This class is intended to be inherited by individual recipes. However,
 the class' functionality is largely disabled unless "ptest" appears in
 :term:`DISTRO_FEATURES`. See the
-":ref:`dev-manual/packages:testing packages with ptest`"
+":ref:`test-manual/ptest:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual for more information
 on ptest.
 
@@ -2650,7 +2650,7 @@ Enables package tests (ptests) specifically for GNOME packages, which
 have tests intended to be executed with ``gnome-desktop-testing``.
 
 For information on setting up and running ptests, see the
-":ref:`dev-manual/packages:testing packages with ptest`"
+":ref:`test-manual/ptest:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-python3-dir:
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 6e52dfce17b9e06bdb8ad67a5fc8d7304a0f479d..c6215391eec0b41d93f5885a22db8ed06543a0b7 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -207,7 +207,7 @@ metadata, as extra layers can define their own:
 
 -  *ptest:* Enables building the package tests where supported by
    individual recipes. For more information on package tests, see the
-   ":ref:`dev-manual/packages:testing packages with ptest`" section
+   ":ref:`test-manual/ptest:testing packages with ptest`" section
    in the Yocto Project Development Tasks Manual.
 
 -  *pulseaudio:* Include support for
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 53b1836e74948f27bf83f91ebb512f3cf0881ab2..2beed3691d0991f5a2d0a225af618c0976af8d9f 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -795,7 +795,7 @@ Errors and Warnings
 
     This check will detect if the source of the package contains some
     upstream-provided tests and, if so, that ptests are implemented for this
-    recipe.  See the ":ref:`dev-manual/packages:testing packages with ptest`"
+    recipe.  See the ":ref:`test-manual/ptest:testing packages with ptest`"
     section in the Yocto Project Development Tasks Manual. See also the
     ":ref:`ref-classes-ptest`" section.
 
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 691e7d3ed90c98e43e558809828b5094670ccca3..3383a4e1b099f92e3d2b6f412698c3fe12cfe7fc 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -175,7 +175,7 @@ consists of the following pieces:
    operation and functions. However, the test can also use the IP
    address of a machine to test.
 
--  :ref:`ptest <dev-manual/packages:testing packages with ptest>`:
+-  :ref:`ptest <test-manual/ptest:testing packages with ptest>`:
    Runs tests against packages produced during the build for a given
    piece of software. The test allows the packages to be run within a
    target image.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e8db89f8c9642b1e36c574e1369093a7a2ce30a4..f78403fad0f844e54267c7f547b1abd98e1816af 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6896,7 +6896,7 @@ system and gives an overview of their function and contents.
 
    :term:`PTEST_ENABLED`
       Specifies whether or not :ref:`Package
-      Test <dev-manual/packages:testing packages with ptest>` (ptest)
+      Test <test-manual/ptest:testing packages with ptest>` (ptest)
       functionality is enabled when building a recipe. You should not set
       this variable directly. Enabling and disabling building Package Tests
       at build time should be done by adding "ptest" to (or removing it
diff --git a/documentation/test-manual/index.rst b/documentation/test-manual/index.rst
index 86a2f436ea04e8f6038037e79898218b058bde4a..ad71f379106261af32dc925d700ed36da43d234b 100644
--- a/documentation/test-manual/index.rst
+++ b/documentation/test-manual/index.rst
@@ -12,6 +12,7 @@ Yocto Project Test Environment Manual
 
    intro
    test-process
+   ptest
    understand-autobuilder
    reproducible-builds
    yocto-project-compatible
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 882ca16486722675264b43887c425880c80f6af7..252d3ea731c39709b8fbe64d281722c172a282a9 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -140,7 +140,7 @@ the following types of tests:
 -  *Package Testing:* A Package Test (ptest) runs tests against packages
    built by the OpenEmbedded build system on the target machine. See the
    :ref:`Testing Packages With
-   ptest <dev-manual/packages:Testing Packages With ptest>` section
+   ptest <test-manual/ptest:Testing Packages With ptest>` section
    in the Yocto Project Development Tasks Manual and the
    ":yocto_wiki:`Ptest </Ptest>`" Wiki page for more
    information on Ptest.
diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
new file mode 100644
index 0000000000000000000000000000000000000000..dea1bad23bd98817a2020030efdad7ce4e4b36c0
--- /dev/null
+++ b/documentation/test-manual/ptest.rst
@@ -0,0 +1,114 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+***************************
+Testing Packages With ptest
+***************************
+
+A Package Test (ptest) runs tests against packages built by the
+OpenEmbedded build system on the target machine. A ptest contains at
+least two items: the actual test, and a shell script (``run-ptest``)
+that starts the test. The shell script that starts the test must not
+contain the actual test --- the script only starts the test. On the other
+hand, the test can be anything from a simple shell script that runs a
+binary and checks the output to an elaborate system of test binaries and
+data files.
+
+The test generates output in the format used by Automake::
+
+   result: testname
+
+where the result can be ``PASS``, ``FAIL``, or ``SKIP``, and
+the testname can be any identifying string.
+
+For a list of Yocto Project recipes that are already enabled with ptest,
+see the :yocto_wiki:`Ptest </Ptest>` wiki page.
+
+.. note::
+
+   A recipe is "ptest-enabled" if it inherits the :ref:`ref-classes-ptest`
+   class.
+
+Adding ptest to Your Build
+==========================
+
+To add package testing to your build, add the :term:`DISTRO_FEATURES` and
+:term:`EXTRA_IMAGE_FEATURES` variables to your ``local.conf`` file, which
+is found in the :term:`Build Directory`::
+
+   DISTRO_FEATURES:append = " ptest"
+   EXTRA_IMAGE_FEATURES += "ptest-pkgs"
+
+Once your build is complete, the ptest files are installed into the
+``/usr/lib/package/ptest`` directory within the image, where ``package``
+is the name of the package.
+
+Running ptest
+=============
+
+The ``ptest-runner`` package installs a shell script that loops through
+all installed ptest test suites and runs them in sequence. Consequently,
+you might want to add this package to your image.
+
+Getting Your Package Ready
+==========================
+
+In order to enable a recipe to run installed ptests on target hardware,
+you need to prepare the recipes that build the packages you want to
+test. Here is what you have to do for each recipe:
+
+-  *Be sure the recipe inherits the* :ref:`ref-classes-ptest` *class:*
+   Include the following line in each recipe::
+
+      inherit ptest
+
+-  *Create run-ptest:* This script starts your test. Locate the
+   script where you will refer to it using
+   :term:`SRC_URI`. Here is an
+   example that starts a test for ``dbus``::
+
+      #!/bin/sh
+      cd test
+      make -k runtest-TESTS
+
+-  *Ensure dependencies are met:* If the test adds build or runtime
+   dependencies that normally do not exist for the package (such as
+   requiring "make" to run the test suite), use the
+   :term:`DEPENDS` and
+   :term:`RDEPENDS` variables in
+   your recipe in order for the package to meet the dependencies. Here
+   is an example where the package has a runtime dependency on "make"::
+
+      RDEPENDS:${PN}-ptest += "make"
+
+-  *Add a function to build the test suite:* Not many packages support
+   cross-compilation of their test suites. Consequently, you usually
+   need to add a cross-compilation function to the package.
+
+   Many packages based on Automake compile and run the test suite by
+   using a single command such as ``make check``. However, the host
+   ``make check`` builds and runs on the same computer, while
+   cross-compiling requires that the package is built on the host but
+   executed for the target architecture (though often, as in the case
+   for ptest, the execution occurs on the host). The built version of
+   Automake that ships with the Yocto Project includes a patch that
+   separates building and execution. Consequently, packages that use the
+   unaltered, patched version of ``make check`` automatically
+   cross-compiles.
+
+   Regardless, you still must add a ``do_compile_ptest`` function to
+   build the test suite. Add a function similar to the following to your
+   recipe::
+
+      do_compile_ptest() {
+          oe_runmake buildtest-TESTS
+      }
+
+-  *Ensure special configurations are set:* If the package requires
+   special configurations prior to compiling the test code, you must
+   insert a ``do_configure_ptest`` function into the recipe.
+
+-  *Install the test suite:* The :ref:`ref-classes-ptest` class
+   automatically copies the file ``run-ptest`` to the target and then runs make
+   ``install-ptest`` to run the tests. If this is not enough, you need
+   to create a ``do_install_ptest`` function and make sure it gets
+   called after the "make install-ptest" completes.

-- 
2.47.1


