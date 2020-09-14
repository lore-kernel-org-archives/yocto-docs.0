Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.1334.1600125403452413296
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2020 16:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mark.morton@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08ENGfjF029996
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2020 16:16:42 -0700 (PDT)
Received: from san-mmorton-lx1.corp.ad.wrs.com (147.11.4.21) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 14 Sep 2020 16:16:41 -0700
From: "Mark Morton" <Mark.Morton@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] test-manual code block, link, and format update
Date: Mon, 14 Sep 2020 16:11:31 -0700
Message-ID: <20200914231131.32571-1-mark.morton@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 08ENGfjF029996
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Mark Morton <mark.morton@windriver.com>
---
 documentation/conf.py                         |   4 +-
 .../test-manual/test-manual-intro.rst         | 266 +++++++++++-------
 .../test-manual-understand-autobuilder.rst    | 102 ++++---
 3 files changed, 226 insertions(+), 146 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index e1a7e5e3d..e825fbf6e 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -42,8 +42,8 @@ sys.path.insert(0, os.path.abspath('sphinx'))
 extensions =3D [
     'sphinx.ext.autosectionlabel',
     'sphinx.ext.extlinks',
-    'sphinx.ext.intersphinx',
-    'yocto-vars'
+    'sphinx.ext.intersphinx'
+ #   'yocto-vars'
 ]
 autosectionlabel_prefix_document =3D True
=20
diff --git a/documentation/test-manual/test-manual-intro.rst b/documentat=
ion/test-manual/test-manual-intro.rst
index 2f11e2beb..d68ab73f4 100644
--- a/documentation/test-manual/test-manual-intro.rst
+++ b/documentation/test-manual/test-manual-intro.rst
@@ -23,26 +23,25 @@ project core.
=20
 Currently, the Yocto Project Test Environment Manual has no projected
 release date. This manual is a work-in-progress and is being initially
-loaded with information from the `README <>`__ files and notes from key
+loaded with information from the README files and notes from key
 engineers:
=20
--  *``yocto-autobuilder2``:* This
-   ```README.md`http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobui=
lder2/tree/README.md
+-  *yocto-autobuilder2:* This
+   `README.md <http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobuil=
der2/tree/README.md>`__
    is the main README which detials how to set up the Yocto Project
    Autobuilder. The ``yocto-autobuilder2`` repository represents the
    Yocto Project's console UI plugin to Buildbot and the configuration
    necessary to configure Buildbot to perform the testing the project
    requires.
=20
--  *``yocto-autobuilder-helper``:* This
-   ```README`http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobuilde=
r-helper/tree/README
+-  *yocto-autobuilder-helper:* This `README <http://git.yoctoproject.org=
/clean/cgit.cgi/yocto-autobuilder-helper/tree/README/>`__
    and repository contains Yocto Project Autobuilder Helper scripts and
    configuration. The ``yocto-autobuilder-helper`` repository contains
    the "glue" logic that defines which tests to run and how to run them.
    As a result, it can be used by any Continuous Improvement (CI) system
    to run builds, support getting the correct code revisions, configure
    builds and layers, run builds, and collect results. The code is
-   independent of any CI system, which means the code can work Buildbot,
+   independent of any CI system, which means the code can work `Buildbot=
 <https://docs.buildbot.net/0.9.15.post1/>`__,
    Jenkins, or others. This repository has a branch per release of the
    project defining the tests to run on a per release basis.
=20
@@ -66,9 +65,9 @@ that the Yocto Project customizes using code from the
 resulting UI plug-in allows you to visualize builds in a way suited to
 the project's needs.
=20
-A ``helper`` layer provides configuration and job management through
+A helper layer provides configuration and job management through
 scripts found in the ``yocto-autobuilder-helper`` repository. The
-``helper`` layer contains the bulk of the build configuration
+helper layer contains the bulk of the build configuration
 information and is release-specific, which makes it highly customizable
 on a per-project basis. The layer is CI system-agnostic and contains a
 number of Helper scripts that can generate build configurations from
@@ -124,18 +123,21 @@ thefollowing types of tests:
    ensure we have no single point of failure and can ensure the
    different distros work effectively.
=20
--  *eSDK Testing:* Image tests initiated through the following command:
-   $ bitbake image -c testsdkext The tests utilize the ``testsdkext``
-   class and the ``do_testsdkext`` task.
+-  *eSDK Testing:* Image tests initiated through the following command::
+
+   $ bitbake image -c testsdkext=20
+  =20
+   The tests utilize the ``testsdkext`` class and the ``do_testsdkext`` =
task.
=20
 -  *Feature Testing:* Various scenario-based tests are run through the
-   `OpenEmbedded
-   Self-Test <&YOCTO_DOCS_REF_URL;#testing-and-quality-assurance>`__
-   (oe-selftest). We test oe-selftest on each of the main distrubutions
+   :ref:`OpenEmbedded Self test (oe-selftest) <ref-manual/ref-release-pr=
ocess:Testing and Quality Assurance>`. We test oe-selftest on each of the=
 main distrubutions
    we support.
=20
--  *Image Testing:* Image tests initiated through the following command:
-   $ bitbake image -c testimage The tests utilize the
+-  *Image Testing:* Image tests initiated through the following command:=
:
+
+   $ bitbake image -c testimage=20
+  =20
+   The tests utilize the
    :ref:`testimage* <ref-classes-testimage*>`
    classes and the
    :ref:`ref-tasks-testimage` task.
@@ -147,8 +149,8 @@ thefollowing types of tests:
=20
 -  *Package Testing:* A Package Test (ptest) runs tests against packages
    built by the OpenEmbedded build system on the target machine. See the
-   "`Testing Packages With
-   ptest <&YOCTO_DOCS_DEV_URL;#testing-packages-with-ptest>`__" section
+   :ref:`Testing Packages With
+   ptest <dev-manual/dev-manual-common-tasks:Testing Packages With ptest=
>` section
    in the Yocto Project Development Tasks Manual and the
    ":yocto_wiki:`Ptest </wiki/Ptest>`" Wiki page for more
    information on Ptest.
@@ -159,8 +161,8 @@ thefollowing types of tests:
    the ``do_testsdk`` task.
=20
 -  *Unit Testing:* Unit tests on various components of the system run
-   through ``oe-selftest`` and
-   ```bitbake-selftest`` <&YOCTO_DOCS_REF_URL;#testing-and-quality-assur=
ance>`__.
+   through :ref:`bitbake-selftest <ref-manual/ref-release-process:Testin=
g and Quality Assurance>` and
+   :ref:`oe-selftest <ref-manual/ref-release-process:Testing and Quality=
 Assurance>`.
=20
 -  *Automatic Upgrade Helper:* This target tests whether new versions of
    software are available and whether we can automatically upgrade to
@@ -174,36 +176,43 @@ How Tests Map to Areas of Code
=20
 Tests map into the codebase as follows:
=20
--  *bitbake-selftest*:
+-  *bitbake-selftest:*
=20
    These tests are self-contained and test BitBake as well as its APIs,
    which include the fetchers. The tests are located in
    ``bitbake/lib/*/tests``.
=20
-   From within the BitBake repository, run the following: $
-   bitbake-selftest
+   From within the BitBake repository, run the following::  =20
+  =20
+   $ bitbake-selftest
=20
    To skip tests that access the Internet, use the ``BB_SKIP_NETTEST``
-   variable when running "bitbake-selftest" as follows: $
-   BB_SKIP_NETTEST=3Dyes bitbake-selftest
+   variable when running "bitbake-selftest" as follows::=20
+  =20
+   $ BB_SKIP_NETTEST=3Dyes bitbake-selftest
=20
    The default output is quiet and just prints a summary of what was
-   run. To see more information, there is a verbose option:$
-   bitbake-selftest -v
+   run. To see more information, there is a verbose option::
+   =20
+   $ bitbake-selftest -v
=20
    Use this option when you wish to skip tests that access the network,
    which are mostly necessary to test the fetcher modules. To specify
    individual test modules to run, append the test module name to the
    "bitbake-selftest" command. For example, to specify the tests for the
-   bb.data.module, run: $ bitbake-selftest bb.test.data.moduleYou can
-   also specify individual tests by defining the full name and module
-   plus the class path of the test, for example: $ bitbake-selftest
-   bb.tests.data.TestOverrides.test_one_override
+   bb.data.module, run::=20
+  =20
+   $ bitbake-selftest bb.test.data.module
+  =20
+   You can also specify individual tests by defining the full name and m=
odule
+   plus the class path of the test, for example::=20
+  =20
+   $ bitbake-selftest bb.tests.data.TestOverrides.test_one_override
=20
    The tests are based on `Python
    unittest <https://docs.python.org/3/library/unittest.html>`__.
=20
--  *oe-selftest*:
+-  *oe-selftest:*
=20
    -  These tests use OE to test the workflows, which include testing
       specific features, behaviors of tasks, and API unit tests.
@@ -219,16 +228,25 @@ Tests map into the codebase as follows:
    -  The code for the tests resides in
       ``meta/lib/oeqa/selftest/cases/``.
=20
-   -  To run all the tests, enter the following command: $ oe-selftest
-      -a
+   -  To run all the tests, enter the following command::=20
+  =20
+      $ oe-selftest -a
=20
    -  To run a specific test, use the following command form where
-      testname is the name of the specific test: $ oe-selftest -r
-      testname For example, the following command would run the tinfoil
-      getVar API test:$ oe-selftest -r
-      tinfoil.TinfoilTests.test_getvarIt is also possible to run a set
+      testname is the name of the specific test::=20
+     =20
+      $ oe-selftest -r <testname>=20
+     =20
+      For example, the following command would run the tinfoil
+      getVar API test::
+     =20
+      $ oe-selftest -r tinfoil.TinfoilTests.test_getvar
+     =20
+      It is also possible to run a set
       of tests. For example the following command will run all of the
-      tinfoil tests:$ oe-selftest -r tinfoil
+      tinfoil tests::
+     =20
+      $ oe-selftest -r tinfoil
=20
 -  *testimage:*
=20
@@ -240,10 +258,13 @@ Tests map into the codebase as follows:
=20
    -  You need to set the
       :term:`IMAGE_CLASSES`
-      variable as follows: IMAGE_CLASSES +=3D "testimage"
+      variable as follows::
+     =20
+      IMAGE_CLASSES +=3D "testimage"
=20
-   -  Run the tests using the following command form: $ bitbake image -c
-      testimage
+   -  Run the tests using the following command form::
+  =20
+      $ bitbake image -c testimage
=20
 -  *testsdk:*
=20
@@ -252,8 +273,9 @@ Tests map into the codebase as follows:
=20
    -  The code for these tests resides in ``meta/lib/oeqa/sdk/cases/``.
=20
-   -  Run the test using the following command form: $ bitbake image -c
-      testsdk
+   -  Run the test using the following command form::
+  =20
+      $ bitbake image -c testsdk
=20
 -  *testsdk_ext:*
=20
@@ -262,8 +284,9 @@ Tests map into the codebase as follows:
=20
    -  The code for these tests resides in ``meta/lib/oeqa/esdk``.
=20
-   -  To run the tests, use the following command form: $ bitbake image
-      -c testsdkext
+   -  To run the tests, use the following command form::
+  =20
+      $ bitbake image -c testsdkext
=20
 -  *oe-build-perf-test:*
=20
@@ -272,8 +295,11 @@ Tests map into the codebase as follows:
=20
    -  The code for these tests resides in ``meta/lib/oeqa/buildperf``.
=20
-   -  To run the tests, use the following command form: $
-      oe-build-perf-test optionsThe command takes a number of options,
+   -  To run the tests, use the following command form::
+  =20
+      $ oe-build-perf-test <options>
+     =20
+      The command takes a number of options,
       such as where to place the test results. The Autobuilder Helper
       Scripts include the ``build-perf-test-wrapper`` script with
       examples of how to use the oe-build-perf-test from the command
@@ -308,14 +334,20 @@ directory.
 ``bitbake-selftest``
 --------------------
=20
-A simple test example from ``lib/bb/tests/data.py`` is: class
-DataExpansions(unittest.TestCase): def setUp(self): self.d =3D
-bb.data.init() self.d["foo"] =3D "value_of_foo" self.d["bar"] =3D
-"value_of_bar" self.d["value_of_foo"] =3D "value_of_'value_of_foo'" def
-test_one_var(self): val =3D self.d.expand("${foo}")
-self.assertEqual(str(val), "value_of_foo")
+A simple test example from ``lib/bb/tests/data.py`` is::
=20
-In this example, a ```DataExpansions`` <>`__ class of tests is created,
+   class DataExpansions(unittest.TestCase):=20
+      def setUp(self):
+            self.d =3D bb.data.init()=20
+            self.d["foo"] =3D "value_of_foo"=20
+            self.d["bar"] =3D "value_of_bar"=20
+            self.d["value_of_foo"] =3D "value_of_'value_of_foo'"=20
+  =20
+      def test_one_var(self):
+            val =3D self.d.expand("${foo}")
+            self.assertEqual(str(val), "value_of_foo")
+
+In this example, a ``DataExpansions`` class of tests is created,
 derived from standard python unittest. The class has a common ``setUp``
 function which is shared by all the tests in the class. A simple test is
 then added to test that when a variable is expanded, the correct value
@@ -334,14 +366,15 @@ These tests are more complex due to the setup requi=
red behind the scenes
 for full builds. Rather than directly using Python's unittest, the code
 wraps most of the standard objects. The tests can be simple, such as
 testing a command from within the OE build environment using the
-following example:class BitbakeLayers(OESelftestTestCase): def
-test_bitbakelayers_showcrossdepends(self): result =3D
-runCmd('bitbake-layers show-cross-depends') self.assertTrue('aspell' in
-result.output, msg =3D "No dependencies were shown. bitbake-layers
-show-cross-depends output: %s"% result.output)
+following example::
+
+   class BitbakeLayers(OESelftestTestCase):=20
+      def test_bitbakelayers_showcrossdepends(self):=20
+            result =3D runCmd('bitbake-layers show-cross-depends')=20
+            self.assertTrue('aspell' in result.output, msg =3D "No depen=
dencies were shown. bitbake-layers show-cross-depends output: %s"% result=
.output)
=20
 This example, taken from ``meta/lib/oeqa/selftest/cases/bblayers.py``,
-creates a testcase from the ```OESelftestTestCase`` <>`__ class, derived
+creates a testcase from the ``OESelftestTestCase`` class, derived
 from ``unittest.TestCase``, which runs the ``bitbake-layers`` command
 and checks the output to ensure it contains something we know should be
 here.
@@ -367,7 +400,7 @@ so tests within a given test class should always run =
in the same build,
 while tests in different classes or modules may be split into different
 builds. There is no data store available for these tests since the tests
 launch the ``bitbake`` command and exist outside of its context. As a
-result, common bitbake library functions (bb.*) are also unavailable.
+result, common bitbake library functions (bb.\*) are also unavailable.
=20
 .. _testimage-example:
=20
@@ -378,14 +411,18 @@ These tests are run once an image is up and running=
, either on target
 hardware or under QEMU. As a result, they are assumed to be running in a
 target image environment, as opposed to a host build environment. A
 simple example from ``meta/lib/oeqa/runtime/cases/python.py`` contains
-the following:class PythonTest(OERuntimeTestCase):
-@OETestDepends(['ssh.SSHTest.test_ssh']) @OEHasPackage(['python3-core'])
-def test_python3(self): cmd =3D "python3 -c \\"import codecs;
-print(codecs.encode('Uryyb, jbeyq', 'rot13'))\"" status, output =3D
-self.target.run(cmd) msg =3D 'Exit status was not 0. Output: %s' % outpu=
t
-self.assertEqual(status, 0, msg=3Dmsg)
-
-In this example, the ```OERuntimeTestCase`` <>`__ class wraps
+the following::
+
+   class PythonTest(OERuntimeTestCase):
+      @OETestDepends(['ssh.SSHTest.test_ssh'])=20
+      @OEHasPackage(['python3-core'])
+      def test_python3(self):=20
+         cmd =3D "python3 -c \\"import codecs; print(codecs.encode('Uryy=
b, jbeyq', 'rot13'))\""=20
+         status, output =3D self.target.run(cmd)=20
+         msg =3D 'Exit status was not 0. Output: %s' % output
+         self.assertEqual(status, 0, msg=3Dmsg)
+
+In this example, the ``OERuntimeTestCase`` class wraps
 ``unittest.TestCase``. Within the test, ``self.target`` represents the
 target system, where commands can be run on it using the ``run()``
 method.
@@ -402,19 +439,30 @@ the image.
=20
 These tests are run against built extensible SDKs (eSDKs). The tests can
 assume that the eSDK environment has already been setup. An example from
-``meta/lib/oeqa/sdk/cases/devtool.py`` contains the following:class
-DevtoolTest(OESDKExtTestCase): @classmethod def setUpClass(cls):
-myapp_src =3D os.path.join(cls.tc.esdk_files_dir, "myapp") cls.myapp_dst=
 =3D
-os.path.join(cls.tc.sdk_dir, "myapp") shutil.copytree(myapp_src,
-cls.myapp_dst) subprocess.check_output(['git', 'init', '.'],
-cwd=3Dcls.myapp_dst) subprocess.check_output(['git', 'add', '.'],
-cwd=3Dcls.myapp_dst) subprocess.check_output(['git', 'commit', '-m',
-"'test commit'"], cwd=3Dcls.myapp_dst) @classmethod def
-tearDownClass(cls): shutil.rmtree(cls.myapp_dst) def
-\_test_devtool_build(self, directory): self._run('devtool add myapp %s'
-% directory) try: self._run('devtool build myapp') finally:
-self._run('devtool reset myapp') def test_devtool_build_make(self):
-self._test_devtool_build(self.myapp_dst)In this example, the ``devtool``
+``meta/lib/oeqa/sdk/cases/devtool.py`` contains the following::
+
+   class DevtoolTest(OESDKExtTestCase):=20
+      @classmethod def setUpClass(cls):
+         myapp_src =3D os.path.join(cls.tc.esdk_files_dir, "myapp")=20
+         cls.myapp_dst =3D os.path.join(cls.tc.sdk_dir, "myapp")=20
+         shutil.copytree(myapp_src, cls.myapp_dst)
+         subprocess.check_output(['git', 'init', '.'], cwd=3Dcls.myapp_d=
st)=20
+         subprocess.check_output(['git', 'add', '.'], cwd=3Dcls.myapp_ds=
t)
+         subprocess.check_output(['git', 'commit', '-m', "'test commit'"=
], cwd=3Dcls.myapp_dst)=20
+     =20
+      @classmethod=20
+      def tearDownClass(cls):=20
+         shutil.rmtree(cls.myapp_dst)=20
+      def _test_devtool_build(self, directory):=20
+         self._run('devtool add myapp %s' % directory)=20
+         try:=20
+         self._run('devtool build myapp')=20
+         finally:
+         self._run('devtool reset myapp')=20
+      def test_devtool_build_make(self):
+         self._test_devtool_build(self.myapp_dst)
+     =20
+In this example, the ``devtool``
 command is tested to see whether a sample application can be built with
 the ``devtool build`` command within the eSDK.
=20
@@ -426,14 +474,20 @@ the ``devtool build`` command within the eSDK.
 These tests are run against built SDKs. The tests can assume that an SDK
 has already been extracted and its environment file has been sourced. A
 simple example from ``meta/lib/oeqa/sdk/cases/python2.py`` contains the
-following:class Python3Test(OESDKTestCase): def setUp(self): if not
-(self.tc.hasHostPackage("nativesdk-python3-core") or
-self.tc.hasHostPackage("python3-core-native")): raise
-unittest.SkipTest("No python3 package in the SDK") def
-test_python3(self): cmd =3D "python3 -c \\"import codecs;
-print(codecs.encode('Uryyb, jbeyq', 'rot13'))\"" output =3D self._run(cm=
d)
-self.assertEqual(output, "Hello, world\n")In this example, if
-nativesdk-python3-core has been installed into the SDK, the code runs
+following::
+
+   class Python3Test(OESDKTestCase):=20
+      def setUp(self):=20
+            if not (self.tc.hasHostPackage("nativesdk-python3-core") or
+                  self.tc.hasHostPackage("python3-core-native")):=20
+               raise unittest.SkipTest("No python3 package in the SDK")=20
+  =20
+      def test_python3(self):=20
+            cmd =3D "python3 -c \\"import codecs; print(codecs.encode('U=
ryyb, jbeyq', 'rot13'))\""=20
+            output =3D self._run(cmd)
+            self.assertEqual(output, "Hello, world\n")
+        =20
+In this example, if nativesdk-python3-core has been installed into the S=
DK, the code runs
 the python3 interpreter with a basic command to check it is working
 correctly. The test would only run if python3 is installed in the SDK.
=20
@@ -444,17 +498,25 @@ correctly. The test would only run if python3 is in=
stalled in the SDK.
=20
 The performance tests usually measure how long operations take and the
 resource utilisation as that happens. An example from
-``meta/lib/oeqa/buildperf/test_basic.py`` contains the following:class
-Test3(BuildPerfTestCase): def test3(self): """Bitbake parsing (bitbake
--p)""" # Drop all caches and parse self.rm_cache()
-oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'), True)
-self.measure_cmd_resources(['bitbake', '-p'], 'parse_1', 'bitbake -p (no
-caches)') # Drop tmp/cache
-oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'), True)
-self.measure_cmd_resources(['bitbake', '-p'], 'parse_2', 'bitbake -p (no
-tmp/cache)') # Parse with fully cached data
-self.measure_cmd_resources(['bitbake', '-p'], 'parse_3', 'bitbake -p
-(cached)')This example shows how three specific parsing timings are
+``meta/lib/oeqa/buildperf/test_basic.py`` contains the following::
+
+   class Test3(BuildPerfTestCase):=20
+      def test3(self):=20
+            """Bitbake parsing (bitbake -p)"""=20
+            # Drop all caches and parse=20
+            self.rm_cache()
+            oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache')=
, True)
+            self.measure_cmd_resources(['bitbake', '-p'], 'parse_1',=20
+                     'bitbake -p (no caches)')         =20
+            # Drop tmp/cache
+            oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache')=
, True)
+            self.measure_cmd_resources(['bitbake', '-p'], 'parse_2',=20
+                     'bitbake -p (no tmp/cache)')
+            # Parse with fully cached data
+            self.measure_cmd_resources(['bitbake', '-p'], 'parse_3',=20
+                     'bitbake -p (cached)')
+                 =20
+This example shows how three specific parsing timings are
 measured, with and without various caches, to show how BitBake=E2=80=99s=
 parsing
 performance trends over time.
=20
diff --git a/documentation/test-manual/test-manual-understand-autobuilder=
.rst b/documentation/test-manual/test-manual-understand-autobuilder.rst
index 8d3c84415..0d987d245 100644
--- a/documentation/test-manual/test-manual-understand-autobuilder.rst
+++ b/documentation/test-manual/test-manual-understand-autobuilder.rst
@@ -20,32 +20,48 @@ each of those targets on a seperate buildbot worker. =
To understand the
 configuration, you need to look at the entry on ``config.json`` file
 within the ``yocto-autobuilder-helper`` repository. The targets are
 defined in the =E2=80=98overrides=E2=80=99 section, a quick example coul=
d be qemux86-64
-which looks like:"qemux86-64" : { "MACHINE" : "qemux86-64", "TEMPLATE" :
-"arch-qemu", "step1" : { "extravars" : [ "IMAGE_FSTYPES_append =3D ' wic
-wic.bmap'" ] } },And to expand that, you need the =E2=80=9Carch-qemu=E2=80=
=9D entry from
-the =E2=80=9Ctemplates=E2=80=9D section, which looks like:"arch-qemu" : =
{ "BUILDINFO" :
-true, "BUILDHISTORY" : true, "step1" : { "BBTARGETS" : "core-image-sato
-core-image-sato-dev core-image-sato-sdk core-image-minimal
-core-image-minimal-dev core-image-sato:do_populate_sdk", "SANITYTARGETS"
-: "core-image-minimal:do_testimage core-image-sato:do_testimage
-core-image-sato-sdk:do_testimage core-image-sato:do_testsdk" }, "step2"
-: { "SDKMACHINE" : "x86_64", "BBTARGETS" :
-"core-image-sato:do_populate_sdk core-image-minimal:do_populate_sdk_ext
-core-image-sato:do_populate_sdk_ext", "SANITYTARGETS" :
-"core-image-sato:do_testsdk core-image-minimal:do_testsdkext
-core-image-sato:do_testsdkext" }, "step3" : { "BUILDHISTORY" : false,
-"EXTRACMDS" : ["${SCRIPTSDIR}/checkvnc; DISPLAY=3D:1 oe-selftest
-${HELPERSTMACHTARGS} -j 15"], "ADDLAYER" :
-["${BUILDDIR}/../meta-selftest"] } },Combining these two entries you can
-see that =E2=80=9Cqemux86-64=E2=80=9D is a three step build where the
-``bitbake BBTARGETS`` would be run, then ``bitbake
-                SANITYTARGETS`` for each step; all for
+which looks like::
+
+   "qemux86-64" : {=20
+         "MACHINE" : "qemux86-64",=20
+         "TEMPLATE" : "arch-qemu",=20
+         "step1" : {=20
+               "extravars" : [=20
+                     "IMAGE_FSTYPES_append =3D ' wic wic.bmap'"=20
+                    ]=20
+        }=20
+   },
+  =20
+And to expand that, you need the =E2=80=9Carch-qemu=E2=80=9D entry from
+the =E2=80=9Ctemplates=E2=80=9D section, which looks like::
+
+   "arch-qemu" : {=20
+         "BUILDINFO" : true,=20
+         "BUILDHISTORY" : true,=20
+         "step1" : {=20
+               "BBTARGETS" : "core-image-sato core-image-sato-dev core-i=
mage-sato-sdk core-image-minimal core-image-minimal-dev core-image-sato:d=
o_populate_sdk",=20
+         "SANITYTARGETS" : "core-image-minimal:do_testimage core-image-s=
ato:do_testimage core-image-sato-sdk:do_testimage core-image-sato:do_test=
sdk"=20
+         },=20
+         "step2" : {=20
+               "SDKMACHINE" : "x86_64",=20
+               "BBTARGETS" : "core-image-sato:do_populate_sdk core-image=
-minimal:do_populate_sdk_ext core-image-sato:do_populate_sdk_ext",=20
+               "SANITYTARGETS" : "core-image-sato:do_testsdk core-image-=
minimal:do_testsdkext core-image-sato:do_testsdkext"=20
+         },=20
+         "step3" : {=20
+               "BUILDHISTORY" : false,=20
+               "EXTRACMDS" : ["${SCRIPTSDIR}/checkvnc; DISPLAY=3D:1 oe-s=
elftest ${HELPERSTMACHTARGS} -j 15"],=20
+               "ADDLAYER" : ["${BUILDDIR}/../meta-selftest"]=20
+         }=20
+   },
+  =20
+Combining these two entries you can see that =E2=80=9Cqemux86-64=E2=80=9D=
 is a three step build where the
+``bitbake BBTARGETS`` would be run, then ``bitbake SANITYTARGETS`` for e=
ach step; all for
 ``MACHINE=3D=E2=80=9Dqemx86-64=E2=80=9D`` but with differing SDKMACHINE =
settings. In step
 1 an extra variable is added to the ``auto.conf`` file to enable wic
 image generation.
=20
 While not every detail of this is covered here, you can see how the
-templating mechanism allows quite complex configurations to be built up
+template mechanism allows quite complex configurations to be built up
 yet allows duplication and repetition to be kept to a minimum.
=20
 The different build targets are designed to allow for parallelisation,
@@ -70,7 +86,7 @@ roughly consist of:
=20
    This cleans out any previous build. Old builds are left around to
    allow easier debugging of failed builds. For additional information,
-   see ```clobberdir`` <#test-clobberdir>`__.
+   see :ref:`test-clobberdir`.
=20
 2. *Obtain yocto-autobuilder-helper*
=20
@@ -94,7 +110,7 @@ roughly consist of:
    from the ``layerinfo.json`` file to help understand the
    configuration. It will also use a local cache of repositories to
    speed up the clone checkouts. For additional information, see
-   `Autobuilder Clone Cache <#test-autobuilder-clone-cache>`__.
+   :ref:`test-autobuilder-clone-cache`.
=20
    This step has two possible modes of operation. If the build is part
    of a parent build, its possible that all the repositories needed may
@@ -137,8 +153,7 @@ special script that moves files to a special location=
, rather than
 deleting them. Files in this location are deleted by an ``rm`` command,
 which is run under ``ionice -c 3``. For example, the deletion only
 happens when there is idle IO capacity on the Worker. The Autobuilder
-Worker Janitor runs this deletion. See `Autobuilder Worker
-Janitor <#test-autobuilder-worker-janitor>`__.
+Worker Janitor runs this deletion. See :ref:`test-autobuilder-worker-jan=
itor`.
=20
 .. _test-autobuilder-clone-cache:
=20
@@ -150,8 +165,8 @@ on the Autobuilder. We therefore have a stash of comm=
only used
 repositories pre-cloned on the Workers. Data is fetched from these
 during clones first, then "topped up" with later revisions from any
 upstream when necesary. The cache is maintained by the Autobuilder
-Worker Janitor. See `Autobuilder Worker
-Janitor <#test-autobuilder-worker-janitor>`__.
+Worker Janitor. See :ref:`Autobuilder Worker
+Janitor`.
=20
 .. _test-autobuilder-worker-janitor:
=20
@@ -159,8 +174,8 @@ Autobuilder Worker Janitor
 --------------------------
=20
 This is a process running on each Worker that performs two basic
-operations, including background file deletion at IO idle (see `Target
-Execution: clobberdir <#test-list-tgt-exec-clobberdir>`__) and
+operations, including background file deletion at IO idle (see Target
+Execution: clobberdir :ref:`test-list-tgt-exec-clobberdir`) and
 maintainenance of a cache of cloned repositories to improve the speed
 the system can checkout repositories.
=20
@@ -216,9 +231,6 @@ are general setup steps that are run once and include=
:
 For each step that is configured in ``config.json``, it will perform the
 following:
=20
-## WRITER's question: What does "logging in as stepXa" and others refer
-to below? ##
-
 1. Add any layers that are specified using the
    ``bitbake-layers add-layer`` command (logging as stepXa)
=20
@@ -235,9 +247,8 @@ to below? ##
 6. Run the ``EXTRAPLAINCMDS`` command(s), which are run outside the
    BitBake build environment (logging as stepXd)
=20
-7. Remove any layers added in `step
-   1 <#test-run-config-add-layers-step>`__ using the
-   ``bitbake-layers remove-layer`` command (logging as stepXa)
+7. Remove any layers added in step
+   1 using the ``bitbake-layers remove-layer`` command (logging as stepX=
a)
=20
 Once the execution steps above complete, ``run-config`` executes a set
 of post-build steps, including:
@@ -252,7 +263,7 @@ of post-build steps, including:
    generated to the remote server.
=20
 4. Cleanup the build directory using
-   ```clobberdir`` <#test-clobberdir>`__ if the build was successful,
+   :ref:`test-clobberdir` if the build was successful,
    else rename it to =E2=80=9Cbuild-renamed=E2=80=9D for potential futur=
e debugging.
=20
 .. _test-deploying-yp-autobuilder:
@@ -279,11 +290,18 @@ The standard ``config.json`` minimally attempts to =
allow substitution of
 the paths. The Helper script repository includes a
 ``local-example.json`` file to show how you could override these from a
 separate configuration file. Pass the following into the environment of
-the Autobuilder:$ ABHELPER_JSON=3D"config.json local-example.json"As
-another example, you could also pass the following into the
-environment:$ ABHELPER_JSON=3D"config.json /some/location/local.json"One
-issue users often run into is validation of the ``config.json`` files. A
+the Autobuilder::
+
+   $ ABHELPER_JSON=3D"config.json local-example.json"
+  =20
+As another example, you could also pass the following into the
+environment::
+
+   $ ABHELPER_JSON=3D"config.json /some/location/local.json"
+  =20
+One issue users often run into is validation of the ``config.json`` file=
s. A
 tip for minimizing issues from invalid json files is to use a Git
 ``pre-commit-hook.sh`` script to verify the JSON file before committing
-it. Create a symbolic link as follows:$ ln -s
-../../scripts/pre-commit-hook.sh .git/hooks/pre-commit
+it. Create a symbolic link as follows::=20
+
+   $ ln -s ../../scripts/pre-commit-hook.sh .git/hooks/pre-commit
--=20
2.17.1

