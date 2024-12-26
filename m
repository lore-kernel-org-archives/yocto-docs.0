Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC03E7718F
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 14:38:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.22231.1735223910996320147
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Dec 2024 06:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ED5MPYra;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B7BD1C0008;
	Thu, 26 Dec 2024 14:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735223909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1BH4HLusxvq8FDLmqJLrYBlFLFqRjrAFl8tAz7ZNqk=;
	b=ED5MPYra7d9o9VNUYejUh6uBY4ocbOIFLpfbMALa+Edt7WrI2aR4nDTiCQmUlAaaxKLJKW
	yN3uxxdc6dAv5QdoEtIFXb+upt0YBkzTcInUEiyN1Yn6fwWVlvqjQbm8g+gBCsDbpvfRb9
	pIXQp/Ti4kwCwt1wPq6MavgGgSqiEEP9xcVMxUQTuntocMQeWsYZ6xZWBuC6vHe+7UofBi
	0Ya0gnbde15z05ZrrMv/VZKjSQ1uHeHHxqqc/RQHJbLNEjFmjMgxhEARiaF5aFxllqfo5v
	N+1e8mB10du3QkzLbUiZesJTmX/bmWtjslDbXaCacxvrV4c0HKGWhoJviWxnlg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 26 Dec 2024 15:38:07 +0100
Subject: [PATCH 1/2] ref-manual/packages: move ptest section to the
 test-manual
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-move-ptest-to-test-manual-v1-1-ef16b91c8971@bootlin.com>
References: <20241226-move-ptest-to-test-manual-v1-0-ef16b91c8971@bootlin.com>
In-Reply-To: <20241226-move-ptest-to-test-manual-v1-0-ef16b91c8971@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11902;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fIcI3edttlsx5xZxWTndNn+fuu9sIkJqoJh/8y3Su/E=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnbWpkvs7Ct4BBaFjokhCT0yz+VcXGxFkvCtckY
 8j8u3xAumOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ21qZAAKCRDRgEFAKaOo
 NtEwEACw4B1IdFCbeDf0yA7VluILOY+9OAoY7YpwCGMl3sYetv1yvuVVhBWyNaRAJbJHKyMrPm9
 WgnzvI8gicN7/Yzzqgx+UUqvASWFkprSoBf0EBsUYvTC7DX0fVWGG9S36fuwfC+2Iaux+7FkxBx
 S08+Y0gstlgnCtlN8kMMdqwuTNaznSuc0KibK+wd23cSC1DgGwHjOz6hHG0tIazevdt97aBmtoQ
 doIx29BeMICzzO2XjY2D9EnxBnFVl706QcgPTc9H7Da6ry4UcsiO6b9kgEYk42BLXqDwvhuJ5YD
 azL1kx+FniZLMzCE7Ti+h6H0Hr20Hu/N92AG+n9gJIht56BeG+cykWkWwVlAIZmx8y01qzdGoAY
 Wcedev9pUNgybBRd2jpd7uIjyfgqO+uH5tPfwQKZnXVJrB1Nl4oVQk8BvfWqyogMlO6mNpVfUWo
 zoxdC4l8uvR+Z1i2RQjCizIOGybsabvR9A8jCBBOuh1Ldv4fTjD5M69v40YZ1MBDTB70BoUBo6K
 0Rg10UEARMwW5496RxXxILvKvwwp4C3mz+wgWgqF+L/y+kcuDSiD+E+OX9MNNWAw3HygsM3vn2Z
 RB1F1oKBaNFfRO6qGtNfQ7O506HcliGVcNuGp0+C5zthuMwlkXpW4KFWCtydp14x7Gj3iLfZBeM
 r8oP/ocY5kW1YZg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Dec 2024 14:38:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6041

[ YOCTO #15106 ]

It makes more sense to document ptests in the test-manual. Since ptests
are still related to packages, keep a link to ptests from packages.rst
to the test-manual.

Reported-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/packages.rst | 110 +-------------------------------
 documentation/test-manual/index.rst   |   1 +
 documentation/test-manual/intro.rst   |   2 +-
 documentation/test-manual/ptest.rst   | 114 ++++++++++++++++++++++++++++++++++
 4 files changed, 118 insertions(+), 109 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 33cf78747d1bc62268811321ad7a40397268e13f..75964598c8222b7390a96873bc4a3bf37bf8c45b 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
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


