Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AFFC4706D
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.3224.1702935911929080011
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m8W9PC+2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76625C0004;
	Mon, 18 Dec 2023 21:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsqWviaWBkH1ApSUWSGNKYFplsZO0ZcMEhLvCwbCcfE=;
	b=m8W9PC+2gYQZHS8RcVzZrQF8TLAMLxLgdrkpKhQWmjr/qmiRBZ1eTdFWmpHWL2UhsrzBiK
	orklx5iCQQAWEMagJbPcc0ohw5QnBTyB0JY3F5/A32qKMZyiCv0A+5K60A43ANbvyW9Tht
	/ZMHLOfJ4rs0hJT2m30vhk1VXmcxyCau41bSNH89kFtZiv8Kup9DKtxiP5kY55Ox53HM76
	qge9imxAnPpILzMTKn1ZsRb61xHia6jw61RB7yTxJ1PG+IcEpL0k17eoHlxlFfw72ulgfr
	P0agcjWWefz47U/Sq6dG0y0Vp0He12bIz8dDn9RhmQOP37nfVyYLHVz1yEIv6w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 10/18] test-manual: text and formatting fixes
Date: Mon, 18 Dec 2023 22:44:34 +0100
Message-Id: <20231218214442.147385-11-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4718

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/intro.rst           | 51 ++++++++++---------
 documentation/test-manual/test-process.rst    | 12 ++---
 .../test-manual/understand-autobuilder.rst    | 35 +++++++------
 3 files changed, 52 insertions(+), 46 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 8cfd6be87d..3a3fc2270e 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -14,7 +14,7 @@ release works as intended. All the project's testing infrastructure and
 processes are publicly visible and available so that the community can
 see what testing is being performed, how it's being done and the current
 status of the tests and the project at any given time. It is intended
-that Other organizations can leverage off the process and testing
+that other organizations can leverage off the process and testing
 environment used by the Yocto Project to create their own automated,
 production test environment, building upon the foundations from the
 project core.
@@ -93,8 +93,8 @@ the following types of tests:
 -  *Build Testing:* Tests whether specific configurations build by
    varying :term:`MACHINE`,
    :term:`DISTRO`, other configuration
-   options, and the specific target images being built (or world). Used
-   to trigger builds of all the different test configurations on the
+   options, and the specific target images being built (or ``world``). This is
+   used to trigger builds of all the different test configurations on the
    Autobuilder. Builds usually cover many different targets for
    different architectures, machines, and distributions, as well as
    different configurations, such as different init systems. The
@@ -121,7 +121,8 @@ the following types of tests:
 
       $ bitbake image -c testsdkext
 
-   The tests utilize the :ref:`testsdkext <ref-classes-testsdk>` class and the ``do_testsdkext`` task.
+   The tests use the :ref:`ref-classes-testsdk` class and the
+   ``do_testsdkext`` task.
 
 -  *Feature Testing:* Various scenario-based tests are run through the
    :ref:`OpenEmbedded Self test (oe-selftest) <ref-manual/release-process:Testing and Quality Assurance>`. We test oe-selftest on each of the main distributions
@@ -131,8 +132,8 @@ the following types of tests:
 
       $ bitbake image -c testimage
 
-   The tests utilize the :ref:`testimage* <ref-classes-testimage>`
-   classes and the :ref:`ref-tasks-testimage` task.
+   The tests use the :ref:`ref-classes-testimage`
+   class and the :ref:`ref-tasks-testimage` task.
 
 -  *Layer Testing:* The Autobuilder has the possibility to test whether
    specific layers work with the test of the system. The layers tested
@@ -151,7 +152,7 @@ the following types of tests:
 
       $ bitbake image -c testsdk
 
-   The tests utilize the :ref:`testsdk <ref-classes-testsdk>` class and
+   The tests use the :ref:`ref-classes-testsdk` class and
    the ``do_testsdk`` task.
 
 -  *Unit Testing:* Unit tests on various components of the system run
@@ -179,7 +180,7 @@ Tests map into the codebase as follows:
       $ bitbake-selftest
 
    To skip tests that access the Internet, use the ``BB_SKIP_NETTESTS``
-   variable when running "bitbake-selftest" as follows::
+   variable when running ``bitbake-selftest`` as follows::
 
       $ BB_SKIP_NETTESTS=yes bitbake-selftest
 
@@ -209,7 +210,7 @@ Tests map into the codebase as follows:
    -  These tests use OE to test the workflows, which include testing
       specific features, behaviors of tasks, and API unit tests.
 
-   -  The tests can take advantage of parallelism through the "-j"
+   -  The tests can take advantage of parallelism through the ``-j``
       option, which can specify a number of threads to spread the tests
       across. Note that all tests from a given class of tests will run
       in the same thread. To parallelize large numbers of tests you can
@@ -225,18 +226,18 @@ Tests map into the codebase as follows:
          $ oe-selftest -a
 
    -  To run a specific test, use the following command form where
-      testname is the name of the specific test::
+      ``testname`` is the name of the specific test::
 
          $ oe-selftest -r <testname>
 
-      For example, the following command would run the tinfoil
-      getVar API test::
+      For example, the following command would run the ``tinfoil``
+      ``getVar`` API test::
 
          $ oe-selftest -r tinfoil.TinfoilTests.test_getvar
 
       It is also possible to run a set
       of tests. For example the following command will run all of the
-      tinfoil tests::
+      ``tinfoil`` tests::
 
          $ oe-selftest -r tinfoil
 
@@ -385,14 +386,14 @@ so tests within a given test class should always run in the same build,
 while tests in different classes or modules may be split into different
 builds. There is no data store available for these tests since the tests
 launch the ``bitbake`` command and exist outside of its context. As a
-result, common bitbake library functions (bb.\*) are also unavailable.
+result, common BitBake library functions (``bb.\*``) are also unavailable.
 
 ``testimage``
 -------------
 
 These tests are run once an image is up and running, either on target
 hardware or under QEMU. As a result, they are assumed to be running in a
-target image environment, as opposed to a host build environment. A
+target image environment, as opposed to in a host build environment. A
 simple example from ``meta/lib/oeqa/runtime/cases/python.py`` contains
 the following::
 
@@ -407,19 +408,19 @@ the following::
 
 In this example, the ``OERuntimeTestCase`` class wraps
 ``unittest.TestCase``. Within the test, ``self.target`` represents the
-target system, where commands can be run on it using the ``run()``
+target system, where commands can be run using the ``run()``
 method.
 
-To ensure certain test or package dependencies are met, you can use the
+To ensure certain tests or package dependencies are met, you can use the
 ``OETestDepends`` and ``OEHasPackage`` decorators. For example, the test
-in this example would only make sense if python3-core is installed in
+in this example would only make sense if ``python3-core`` is installed in
 the image.
 
 ``testsdk_ext``
 ---------------
 
 These tests are run against built extensible SDKs (eSDKs). The tests can
-assume that the eSDK environment has already been setup. An example from
+assume that the eSDK environment has already been set up. An example from
 ``meta/lib/oeqa/sdk/cases/devtool.py`` contains the following::
 
    class DevtoolTest(OESDKExtTestCase):
@@ -466,9 +467,9 @@ following::
             output = self._run(cmd)
             self.assertEqual(output, "Hello, world\n")
 
-In this example, if nativesdk-python3-core has been installed into the SDK, the code runs
-the python3 interpreter with a basic command to check it is working
-correctly. The test would only run if python3 is installed in the SDK.
+In this example, if ``nativesdk-python3-core`` has been installed into the SDK,
+the code runs the ``python3`` interpreter with a basic command to check it is
+working correctly. The test would only run if Python3 is installed in the SDK.
 
 ``oe-build-perf-test``
 ----------------------
@@ -512,9 +513,9 @@ an isolated directory.
 
 **Running "cleansstate" is not permitted.**
 
-This can delete files from SSTATE_DIR which would potentially break
-other builds running in parallel. If this is required, SSTATE_DIR must
-be set to an isolated directory. Alternatively, you can use the "-f"
+This can delete files from :term:`SSTATE_DIR` which would potentially break
+other builds running in parallel. If this is required, :term:`SSTATE_DIR` must
+be set to an isolated directory. Alternatively, you can use the ``-f``
 option with the ``bitbake`` command to "taint" tasks by changing the
 sstate checksums to ensure sstate cache items will not be reused.
 
diff --git a/documentation/test-manual/test-process.rst b/documentation/test-manual/test-process.rst
index 4c3b32bfea..0c560efe39 100644
--- a/documentation/test-manual/test-process.rst
+++ b/documentation/test-manual/test-process.rst
@@ -42,16 +42,16 @@ our sstate up to date. On the weekend, there is a master-next build
 instead to ensure the test results are updated for the less frequently
 run targets.
 
-Performance builds (buildperf-\* targets in the console) are triggered
+Performance builds (``buildperf-\*`` targets in the console) are triggered
 separately every six hours and automatically push their results to the
 buildstats repository at:
 :yocto_git:`/yocto-buildstats/`.
 
-The 'quick' targets have been selected to be the ones which catch the
-most failures or give the most valuable data. We run 'fast' ptests in
+The "quick" targets have been selected to be the ones which catch the
+most failures or give the most valuable data. We run "fast" ptests in
 this case for example but not the ones which take a long time. The quick
-target doesn't include \*-lsb builds for all architectures, some world
-builds and doesn't trigger performance tests or ltp testing. The full
+target doesn't include ``\*-lsb`` builds for all architectures, some ``world``
+builds and doesn't trigger performance tests or ``ltp`` testing. The full
 build includes all these things and is slower but more comprehensive.
 
 Release Builds
@@ -67,7 +67,7 @@ that in :ref:`test-manual/test-process:day to day development`, in that the
 a-full target of the Autobuilder is used but in addition the form is
 configured to generate and publish artifacts and the milestone number,
 version, release candidate number and other information is entered. The
-box to "generate an email to QA"is also checked.
+box to "generate an email to QA" is also checked.
 
 When the build completes, an email is sent out using the send-qa-email
 script in the ``yocto-autobuilder-helper`` repository to the list of
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index b6809ce7bd..ef03955954 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -32,8 +32,8 @@ which looks like::
         }
    },
 
-And to expand that, you need the "arch-qemu" entry from
-the "templates" section, which looks like::
+And to expand that, you need the ``arch-qemu`` entry from
+the ``templates`` section, which looks like::
 
    "arch-qemu" : {
          "BUILDINFO" : true,
@@ -54,11 +54,11 @@ the "templates" section, which looks like::
          }
    },
 
-Combining these two entries you can see that "qemux86-64" is a three step build where the
-``bitbake BBTARGETS`` would be run, then ``bitbake SANITYTARGETS`` for each step; all for
-``MACHINE="qemx86-64"`` but with differing SDKMACHINE settings. In step
-1 an extra variable is added to the ``auto.conf`` file to enable wic
-image generation.
+Combining these two entries you can see that ``qemux86-64`` is a three step
+build where ``bitbake BBTARGETS`` would be run, then ``bitbake SANITYTARGETS``
+for each step; all for ``MACHINE="qemux86-64"`` but with differing
+:term:`SDKMACHINE` settings. In step 1, an extra variable is added to the
+``auto.conf`` file to enable wic image generation.
 
 While not every detail of this is covered here, you can see how the
 template mechanism allows quite complex configurations to be built up
@@ -163,8 +163,9 @@ Autobuilder Worker Janitor
 --------------------------
 
 This is a process running on each Worker that performs two basic
-operations, including background file deletion at IO idle (see :ref:`test-manual/understand-autobuilder:Autobuilder Target Execution Overview`: Run clobberdir) and
-maintenance of a cache of cloned repositories to improve the speed
+operations, including background file deletion at IO idle (see
+"Run clobberdir" in :ref:`test-manual/understand-autobuilder:Autobuilder Target Execution Overview`)
+and maintenance of a cache of cloned repositories to improve the speed
 the system can checkout repositories.
 
 Shared DL_DIR
@@ -172,7 +173,7 @@ Shared DL_DIR
 
 The Workers are all connected over NFS which allows DL_DIR to be shared
 between them. This reduces network accesses from the system and allows
-the build to be sped up. Usage of the directory within the build system
+the build to be sped up. The usage of the directory within the build system
 is designed to be able to be shared over NFS.
 
 Shared SSTATE_DIR
@@ -180,8 +181,8 @@ Shared SSTATE_DIR
 
 The Workers are all connected over NFS which allows the ``sstate``
 directory to be shared between them. This means once a Worker has built
-an artifact, all the others can benefit from it. Usage of the directory
-within the directory is designed for sharing over NFS.
+an artifact, all the others can benefit from it. The usage of the directory
+within the build system is designed for sharing over NFS.
 
 Resulttool
 ----------
@@ -192,7 +193,7 @@ in a given build and their status. Additional information, such as
 failure logs or the time taken to run the tests, may also be included.
 
 Resulttool is part of OpenEmbedded-Core and is used to manipulate these
-json results files. It has the ability to merge files together, display
+JSON results files. It has the ability to merge files together, display
 reports of the test results and compare different result files.
 
 For details, see :yocto_wiki:`/Resulttool`.
@@ -206,7 +207,11 @@ are general setup steps that are run once and include:
 
 #. Set up any ``buildtools-tarball`` if configured.
 
+<<<<<<< HEAD
 #. Call "buildhistory-init" if buildhistory is configured.
+=======
+#. Call ``buildhistory-init`` if :ref:`ref-classes-buildhistory` is configured.
+>>>>>>> 7c4f616f77 (test-manual: text and formatting fixes)
 
 For each step that is configured in ``config.json``, it will perform the
 following:
@@ -258,7 +263,7 @@ it is inevitable that users will end up needing to heavily customise the
 ``yocto-autobuilder-helper`` repository, particularly the
 ``config.json`` file as they will want to define their own test matrix.
 
-The Autobuilder supports wo customization options:
+The Autobuilder supports two customization options:
 
 -  variable substitution
 
@@ -278,7 +283,7 @@ environment::
    $ ABHELPER_JSON="config.json /some/location/local.json"
 
 One issue users often run into is validation of the ``config.json`` files. A
-tip for minimizing issues from invalid json files is to use a Git
+tip for minimizing issues from invalid JSON files is to use a Git
 ``pre-commit-hook.sh`` script to verify the JSON file before committing
 it. Create a symbolic link as follows::
 
-- 
2.34.1


