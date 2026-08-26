Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C856EC61DC6
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:21 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3465.1787708120058549870
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E4mTmzq0;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e50a650a0so18693885a.1
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708119; x=1788312919; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M5UmsDj0RVhN7agTi1yCgmdh8H45nE3aVZ/trzv8HXs=;
        b=E4mTmzq0a3k+QEzn4JlMTRCYlkQ4mS3sT+wndH4CQoh1/FpM+m6b8b6IA4nOFaUyiQ
         LUskyuaJPBiUE8FenFFzvTXHVKlqZ0doG2L4pcU02RLxwmHyNMx50QN+KicmlOLS0wVd
         yPRZ0wtyGeronA2tfzAWNlI12dvFAvbVdwaDkSdbR8JaT41DPKO3nWQD1iCRcK82Ajgs
         MYd9hSoAmf3RKIQJawLwp1WddNwdyc57JIOzZIoOGlvh9fCxAx4WoKceyhWc4/wNDFjK
         jpD2mLhie3IRRU9eGk9qruO4tUIGKWpizSq/FpRi8LlObRbYJtZc2Y6A+plhjA/srm/b
         HbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708119; x=1788312919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M5UmsDj0RVhN7agTi1yCgmdh8H45nE3aVZ/trzv8HXs=;
        b=qMxdSGHFgAt93j0bF/DoxbXglQIxYsq1Wzu8hRgggmvciC3CxKyAzwG8OIXRhm2rQd
         hkqM2TLzSP9fCZx8VBI4/zWk0CykzCuTRcir7f9sC7cGkTGnrxUqfWwkwloyobT4Zn4A
         CPXAtjCweJ5uBol1O3MIDpnfUCWNiyrCV5JA5qsYPQG0R+bDkYH5IyPnWeppO9Du8P8N
         TuQ4yDH0qcqrkTuvZnRrqJHp3OaOBTI6qPsVkaPzqdfsVjDyZwymysmTQluoL8ej2Hwe
         Ft5DJTdiYXk6nRoWgTQ/ooGPY6gEWq0z1FFql/qg2zYZMkVagOSwK94Kmx2fVdhiq0AN
         M8oA==
X-Gm-Message-State: AFuF++nmVdXqGi/BMYoibvZwdgXoz33yojjpGXTsKSBdY0LmvCww9jeb
	WASGmmqBPYNOkeVUQYL7ruwGchU/kK2j2QlMo+HmSNSeIrnRRjVHUI5rOFQVltvD
X-Gm-Gg: AR+sD10UX21Xk+VpfCJe2nb+eJoVkm2kbMzhMcHfZAMl4B6EtdSywk6dZUwnts7YpLM
	hHRg+EVKFxDnY07Z7EsYbVEjMoDdXh4xFBGgJJh15HIS2wUB3fkGz7I5y3ZJoscpmleCAc12q2C
	5HfkJ3PzlKctWJJEzJy80D5aC+e9EA9n58uGAfXBOuK/GRmElanEsLyhl8JTkEoXE6QEczEQ0ux
	KO9jTe6bowfX55RcDClHmWrlwgr0B/eY1Cn2cFEESJ8PYzSPPrM3PuOotedVzDZoDCa0IOg9DOE
	h4vfPaM49bgRmaCc2Yp9Xg7D80ZH9gOerKPu1930g+MH9uxFcfFXFx1hQSXwbRazeXLNAcgt4Ik
	7cY5Xja9/ArTd6RPorVs8vtMLQqPm5q0iDhF7xtq/IOEraaZEmN6FkzkiCazD28rLwLYa2Zllkp
	tPPeEH3ANC2sy3DOUdw9IKISe20cW3ScMPF1S1+HruN+KEC+D/AU9NP5Nh9o6Wj16aZESOuYI+2
	UrUropT4ZrA6b3pBzTjTnmgOecU2NBH
X-Received: by 2002:a05:620a:57c3:b0:937:1995:227b with SMTP id af79cd13be357-9377fe3d757mr242856185a.0.1787708118817;
        Tue, 25 Aug 2026 18:35:18 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.16
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 06/10] test-manual: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:34:51 -0400
Message-ID: <20260826013502.2674000-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10351

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 27 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

Blocks that only look like BitBake are left alone, as are blocks
already tagged "none" where the content is deliberately unhighlighted.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/test-manual/intro.rst           |  4 +-
 documentation/test-manual/ptest.rst           | 24 ++++++---
 .../test-manual/reproducible-builds.rst       |  8 ++-
 documentation/test-manual/runtime-testing.rst | 52 ++++++++++++++-----
 4 files changed, 66 insertions(+), 22 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 4ddc9851f824..614622daabfb 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -253,7 +253,9 @@ Tests map into the codebase as follows:
 
    -  The code for these tests resides in ``meta/lib/oeqa/runtime/cases/``.
 
-   -  You need to set the :term:`IMAGE_CLASSES` variable as follows::
+   -  You need to set the :term:`IMAGE_CLASSES` variable as follows:
+
+      .. code-block:: bitbake
 
          IMAGE_CLASSES += "testimage"
 
diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index 2b86722145da..9c4b74f44c58 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -38,7 +38,9 @@ Adding package testing to your image is done in two steps:
 #. Identify which of those ptest packages to add to your image.
 
 First, in order to build all ptest packages, add the following line
-to a :term:`configuration file`::
+to a :term:`configuration file`:
+
+.. code-block:: bitbake
 
    DISTRO_FEATURES:append = " ptest"
 
@@ -46,12 +48,16 @@ Note that this will cause all ptest packages to be built and packaged,
 but will not add any of those packages to your image; that comes in
 the next step. You can then add ptest packages to your image in one of two ways.
 
-#. If you want to add *all* of the generated ptest packages, add the line::
+#. If you want to add *all* of the generated ptest packages, add the line:
+
+   .. code-block:: bitbake
 
       EXTRA_IMAGE_FEATURES += "ptest-pkgs"
 
 #. On the other hand, if you want to add only a select few of the ptest
-   packages, you can use some variation of::
+   packages, you can use some variation of:
+
+   .. code-block:: bitbake
 
       IMAGE_INSTALL:append = " e2fsprogs-ptest zlib-ptest"
 
@@ -95,7 +101,9 @@ you need to prepare the recipes that build the packages you want to
 test. Here is what you have to do for each recipe:
 
 -  *Be sure the recipe inherits the* :ref:`ref-classes-ptest` *class:*
-   Include the following line in each recipe::
+   Include the following line in each recipe:
+
+   .. code-block:: bitbake
 
       inherit ptest
 
@@ -148,7 +156,9 @@ test. Here is what you have to do for each recipe:
    :term:`DEPENDS` and
    :term:`RDEPENDS` variables in
    your recipe in order for the package to meet the dependencies. Here
-   is an example where the package has a runtime dependency on "make"::
+   is an example where the package has a runtime dependency on "make":
+
+   .. code-block:: bitbake
 
       RDEPENDS:${PN}-ptest += "make"
 
@@ -169,7 +179,9 @@ test. Here is what you have to do for each recipe:
 
    Regardless, you still must add a ``do_compile_ptest`` function to
    build the test suite. Add a function similar to the following to your
-   recipe::
+   recipe:
+
+   .. code-block:: bitbake
 
       do_compile_ptest() {
           oe_runmake buildtest-TESTS
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 84523ff13f9d..9e2502802390 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -95,7 +95,9 @@ This defaults to including a ``world`` build so, if other layers are added, it
 would also run the tests for recipes in the additional layers. Different build
 targets can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` variable
 in ``local.conf``. For example, running reproducibility tests for only the
-``python3-numpy`` recipe can be done by setting::
+``python3-numpy`` recipe can be done by setting:
+
+.. code-block:: bitbake
 
    OEQA_REPRODUCIBLE_TEST_TARGET = "python3-numpy"
 
@@ -150,7 +152,9 @@ Using :term:`OEQA_REPRODUCIBLE_TEST_* <OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS>` var
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 If you want to test the reproducibility of a set of recipes, you can define
-:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your local.conf::
+:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your local.conf:
+
+.. code-block:: bitbake
 
    OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS = "my-recipe"
 
diff --git a/documentation/test-manual/runtime-testing.rst b/documentation/test-manual/runtime-testing.rst
index a64a97c80833..e1c1d3b85625 100644
--- a/documentation/test-manual/runtime-testing.rst
+++ b/documentation/test-manual/runtime-testing.rst
@@ -185,7 +185,9 @@ not need any information in this section. You can skip down to the
 If you did set :term:`TEST_TARGET` to "SystemdbootTarget", you also need to
 perform a one-time setup of your controller image by doing the following:
 
-#. *Set EFI_PROVIDER:* Be sure that :term:`EFI_PROVIDER` is as follows::
+#. *Set EFI_PROVIDER:* Be sure that :term:`EFI_PROVIDER` is as follows:
+
+   .. code-block:: bitbake
 
       EFI_PROVIDER = "systemd-boot"
 
@@ -223,7 +225,9 @@ The final thing you need to do when setting :term:`TEST_TARGET` to
 "SystemdbootTarget" is to set up the test image:
 
 #. *Set up your local.conf file:* Make sure you have the following
-   statements in your ``local.conf`` file::
+   statements in your ``local.conf`` file:
+
+   .. code-block:: bitbake
 
       IMAGE_FSTYPES += "tar.gz"
       IMAGE_CLASSES += "testimage"
@@ -244,7 +248,9 @@ power:
    :term:`TEST_POWERCONTROL_EXTRA_ARGS` as a command that runs on the host
    and does power cycling. The test code passes one argument to that
    command: off, on or cycle (off then on). Here is an example that
-   could appear in your ``local.conf`` file::
+   could appear in your ``local.conf`` file:
+
+   .. code-block:: bitbake
 
       TEST_POWERCONTROL_CMD = "powercontrol.exp test 10.11.12.1 nuc1"
 
@@ -277,7 +283,9 @@ wish to experiment with automated hardware testing, you can use the
 the required power action. This script requires either KDialog or Zenity
 to be installed. To use this script, set the
 :term:`TEST_POWERCONTROL_CMD`
-variable as follows::
+variable as follows:
+
+.. code-block:: bitbake
 
    TEST_POWERCONTROL_CMD = "${COREBASE}/scripts/contrib/dialog-power-control"
 
@@ -299,7 +307,9 @@ connecting to a remote console server. Regardless of the case, the
 command simply needs to connect to the serial console and forward that
 connection to standard input and output as any normal terminal program
 does. For example, to use the picocom terminal program on serial device
-``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows::
+``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows:
+
+.. code-block:: bitbake
 
    TEST_SERIALCONTROL_CMD = "picocom /dev/ttyUSB0 -b 115200"
 
@@ -307,7 +317,9 @@ For local
 devices where the serial port device disappears when the device reboots,
 an additional "serdevtry" wrapper script is provided. To use this
 wrapper, simply prefix the terminal command with
-``${COREBASE}/scripts/contrib/serdevtry``::
+``${COREBASE}/scripts/contrib/serdevtry``:
+
+.. code-block:: bitbake
 
    TEST_SERIALCONTROL_CMD = "${COREBASE}/scripts/contrib/serdevtry picocom -b 115200 /dev/ttyUSB0"
 
@@ -319,7 +331,9 @@ You can start the tests automatically or manually:
 -  *Automatically running tests:* To run the tests automatically after the
    OpenEmbedded build system successfully creates an image, first set the
    :term:`TESTIMAGE_AUTO` variable to "1" in your ``local.conf`` file in the
-   :term:`Build Directory`::
+   :term:`Build Directory`:
+
+   .. code-block:: bitbake
 
       TESTIMAGE_AUTO = "1"
 
@@ -330,7 +344,9 @@ You can start the tests automatically or manually:
 
 -  *Manually running tests:* To manually run the tests, first globally
    inherit the :ref:`ref-classes-testimage` class by editing your
-   ``local.conf`` file::
+   ``local.conf`` file:
+
+   .. code-block:: bitbake
 
       IMAGE_CLASSES += "testimage"
 
@@ -377,15 +393,21 @@ handling.
 
 Here are some things to keep in mind when running tests:
 
--  The default tests for the image are defined as::
+-  The default tests for the image are defined as:
+
+   .. code-block:: bitbake
 
       DEFAULT_TEST_SUITES:pn-image = "ping ssh df connman syslog xorg scp vnc date rpm dnf dmesg"
 
--  Add your own test to the list of the by using the following::
+-  Add your own test to the list of the by using the following:
+
+   .. code-block:: bitbake
 
       TEST_SUITES:append = " mytest"
 
--  Run a specific list of tests as follows::
+-  Run a specific list of tests as follows:
+
+   .. code-block:: bitbake
 
      TEST_SUITES = "test1 test2 test3"
 
@@ -401,7 +423,9 @@ test execution off to a scheduler. You can only export tests that are
 defined in :term:`TEST_SUITES`.
 
 If your image is already built, make sure the following are set in your
-``local.conf`` file::
+``local.conf`` file:
+
+.. code-block:: bitbake
 
    IMAGE_CLASSES += "testexport"
    TEST_TARGET_IP = "IP-address-for-the-test-target"
@@ -427,7 +451,9 @@ You can now run the tests outside of the build environment::
    hardware before you can run the tests.
 
 Here is a complete example that shows IP addresses and uses the
-``core-image-sato`` image::
+``core-image-sato`` image:
+
+.. code-block:: bitbake
 
    IMAGE_CLASSES += "testexport"
    TEST_TARGET_IP = "192.168.7.2"

