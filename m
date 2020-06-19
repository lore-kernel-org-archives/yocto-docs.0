Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.305.1592602546139963088
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2020 14:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mark.morton@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05JLZEB0002369
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Fri, 19 Jun 2020 14:35:35 -0700
Received: from san-mmorton-lx1.corp.ad.wrs.com (147.11.4.21) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Fri, 19 Jun 2020 14:35:08 -0700
From: "Mark Morton" <Mark.Morton@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] Applied Richard's edits to code formatting and logfiles
Date: Fri, 19 Jun 2020 14:30:35 -0700
Message-ID: <20200619213035.3919-1-mark.morton@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 05JLZEB0002369
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Mark Morton <mark.morton@windriver.com>
---
 .../test-manual/test-manual-intro.xml         | 251 +++++++++---------
 .../test-manual-understand-autobuilder.xml    |  81 +++---
 2 files changed, 164 insertions(+), 168 deletions(-)

diff --git a/documentation/test-manual/test-manual-intro.xml b/documentat=
ion/test-manual/test-manual-intro.xml
index 8e2c7cd87..a4a7f9062 100644
--- a/documentation/test-manual/test-manual-intro.xml
+++ b/documentation/test-manual/test-manual-intro.xml
@@ -1,14 +1,10 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
-<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
-
-<chapter id=3D'test-manual-intro'>
-
-<title>The Yocto Project Test Environment Manual</title>
-    <section id=3D'test-welcome'>
+<chapter id=3D"test-manual-intro">
+    <title>The Yocto Project Test Environment Manual</title>
+    <section id=3D"test-welcome">
         <title>Welcome</title>
-
         <para> Welcome to the Yocto Project Test Environment Manual! Thi=
s manual is a work in
             progress. The manual contains information about the testing =
environment used by the
             Yocto Project to make sure each major and minor release work=
s as intended. All the
@@ -18,7 +14,6 @@
             organizations can leverage off the process and testing envir=
onment used by the Yocto
             Project to create their own automated, production test envir=
onment, building upon the
             foundations from the project core. </para>
-
         <para> Currently, the Yocto Project Test Environment Manual has =
no projected release date.
             This manual is a work-in-progress and is being initially loa=
ded with information from
             the <ulink url=3D"">README</ulink> files and notes from key =
engineers: <itemizedlist>
@@ -51,23 +46,19 @@
             </itemizedlist>
         </para>
     </section>
-
-    <section id=3D'test-yocto-project-autobuilder-overview'>
+    <section id=3D"test-yocto-project-autobuilder-overview">
         <title>Yocto Project Autobuilder Overview</title>
-
         <para>The Yocto Project Autobuilder collectively refers to the s=
oftware, tools, scripts, and
             procedures used by the Yocto Project to test released softwa=
re across supported hardware
             in an automated and regular fashion. Basically, during the d=
evelopment of a Yocto
             Project release, the Autobuilder tests if things work. The A=
utobuilder builds all test
             targets and runs all the tests. </para>
-
         <para>The Yocto Project uses now uses standard upstream  <ulink
                 url=3D"https://docs.buildbot.net/0.9.15.post1/">Buildbot=
</ulink> (version 9) to drive
             its integration and testing. Buildbot Nine has a plug-in int=
erface that the Yocto
             Project customizes using code from the <filename>yocto-autob=
uilder2</filename>
             repository, adding its own console UI plugin. The resulting =
UI plug-in allows you to
             visualize builds in a way suited to the project's needs.</pa=
ra>
-
         <para>A <filename>helper</filename> layer provides configuration=
 and job management through
             scripts found in the <filename>yocto-autobuilder-helper</fil=
ename> repository. The
                 <filename>helper</filename> layer contains the bulk of t=
he build configuration
@@ -81,17 +72,14 @@
                     instead of Buildbot. </para>
             </note>
         </para>
-
         <para> The following figure shows the Yocto Project Autobuilder =
stack with a topology that
             includes a controller and a cluster of workers: <imagedata
                 fileref=3D"figures/ab-test-cluster.png" width=3D"4.6in" =
depth=3D"4.35in" align=3D"center"
                 scalefit=3D"1"/>
         </para>
     </section>
-
-    <section id=3D'test-project-tests'>
+    <section id=3D"test-project-tests">
         <title>Yocto Project Tests - Types of Testing Overview</title>
-
         <para>The Autobuilder tests different elements of the project by=
 using thefollowing types of
             tests: <itemizedlist>
                 <listitem>
@@ -206,14 +194,11 @@
             </itemizedlist>
         </para>
     </section>
-
-    <section id=3D'test-test-mapping'>
+    <section id=3D"test-test-mapping">
         <title>How Tests Map to Areas of Code</title>
-
-        <para>
-            Tests map into the codebase as follows:
-            <itemizedlist>
-                <listitem><para>
+        <para> Tests map into the codebase as follows: <itemizedlist>
+                <listitem>
+                    <para>
                         <emphasis>bitbake-selftest</emphasis>: </para>
                     <para>These tests are self-contained and test BitBak=
e as well as its APIs, which
                         include the fetchers. The tests are located in
@@ -248,8 +233,10 @@
                              </literallayout></para>
                     <para>The tests are based on <ulink
                             url=3D"https://docs.python.org/3/library/uni=
ttest.html">Python
-                            unittest</ulink>. </para></listitem>
-                <listitem><para>
+                            unittest</ulink>. </para>
+                </listitem>
+                <listitem>
+                    <para>
                         <emphasis>oe-selftest</emphasis>: <itemizedlist>
                             <listitem>
                                 <para>These tests use OE to test the wor=
kflows, which include
@@ -296,63 +283,98 @@
                             </literallayout></para>
                             </listitem>
                         </itemizedlist>
-                    </para></listitem>
-                <listitem><para>
-                    <emphasis>testimage:</emphasis>
-                    <itemizedlist>
-                        <listitem><para>
-                            These tests build an image, boot it, and run=
 tests
-                            against the image's content.
-                            </para></listitem>
-                        <listitem><para> The code for these tests reside=
s in <filename>meta/lib/oeqa/runtime/cases/</filename>. </para></listitem=
>
-                        <listitem><para>
-                            You need to set the
-                            <ulink url=3D'&YOCTO_DOCS_REF_URL;#var-IMAGE=
_CLASSES'><filename>IMAGE_CLASSES</filename></ulink>
-                            variable as follows:
-                            <literallayout class=3D'monospaced'>
+                    </para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>testimage:</emphasis>
+                        <itemizedlist>
+                            <listitem>
+                                <para> These tests build an image, boot =
it, and run tests against
+                                    the image's content. </para>
+                            </listitem>
+                            <listitem>
+                                <para> The code for these tests resides =
in
+                                        <filename>meta/lib/oeqa/runtime/=
cases/</filename>. </para>
+                            </listitem>
+                            <listitem>
+                                <para> You need to set the <ulink
+                                        url=3D"&YOCTO_DOCS_REF_URL;#var-=
IMAGE_CLASSES"
+                                            ><filename>IMAGE_CLASSES</fi=
lename></ulink> variable as
+                                    follows:
+                                    <literallayout class=3D"monospaced">
      IMAGE_CLASSES +=3D "testimage"
                             </literallayout>
-                            </para></listitem>
-                        <listitem><para>
-                            Run the tests using the following command fo=
rm:
-                            <literallayout class=3D'monospaced'>
+                                </para>
+                            </listitem>
+                            <listitem>
+                                <para> Run the tests using the following=
 command form:
+                                    <literallayout class=3D"monospaced">
      $ bitbake <replaceable>image</replaceable> -c testimage
                             </literallayout>
-                            </para></listitem>
-                    </itemizedlist>
-                    </para></listitem>
-                <listitem><para>
-                    <emphasis>testsdk:</emphasis>
-                    <itemizedlist>
-                        <listitem><para>These tests build an SDK, instal=
l it, and then run tests against that SDK. </para></listitem>
-                        <listitem><para>The code for these tests resides=
 in <filename>meta/lib/oeqa/sdk/cases/</filename>. </para></listitem>
-                        <listitem><para>Run the test using the following=
 command form:
+                                </para>
+                            </listitem>
+                        </itemizedlist>
+                    </para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>testsdk:</emphasis>
+                        <itemizedlist>
+                            <listitem>
+                                <para>These tests build an SDK, install =
it, and then run tests
+                                    against that SDK. </para>
+                            </listitem>
+                            <listitem>
+                                <para>The code for these tests resides i=
n
+                                        <filename>meta/lib/oeqa/sdk/case=
s/</filename>. </para>
+                            </listitem>
+                            <listitem>
+                                <para>Run the test using the following c=
ommand form:
                                     <literallayout class=3D"monospaced">
      $ bitbake <replaceable>image</replaceable> -c testsdk
                             </literallayout>
-                                </para></listitem>
-                    </itemizedlist>
-                    </para></listitem>
-                <listitem><para>
-                    <emphasis>testsdk_ext:</emphasis>
-                    <itemizedlist>
-                        <listitem><para>These tests build an extended SD=
K (eSDK), install that eSDK, and run tests against the eSDK. </para></lis=
titem>
-                        <listitem><para>The code for these tests resides=
 in <filename>meta/lib/oeqa/esdk</filename>. </para></listitem>
-                        <listitem><para>To run the tests, use the follow=
ing command form:
+                                </para>
+                            </listitem>
+                        </itemizedlist>
+                    </para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>testsdk_ext:</emphasis>
+                        <itemizedlist>
+                            <listitem>
+                                <para>These tests build an extended SDK =
(eSDK), install that eSDK,
+                                    and run tests against the eSDK. </pa=
ra>
+                            </listitem>
+                            <listitem>
+                                <para>The code for these tests resides i=
n
+                                        <filename>meta/lib/oeqa/esdk</fi=
lename>. </para>
+                            </listitem>
+                            <listitem>
+                                <para>To run the tests, use the followin=
g command form:
                                     <literallayout class=3D"monospaced">
      $ bitbake <replaceable>image</replaceable> -c testsdkext
                             </literallayout>
-                                </para></listitem>
-                    </itemizedlist>
-                    </para></listitem>
-
-
-                <listitem><para>
-                    <emphasis>oe-build-perf-test:</emphasis>
-                    <itemizedlist>
-                        <listitem><para>These tests run through commonly=
 used usage scenarios and measure the performance times. </para></listite=
m>
-                        <listitem><para>The code for these tests resides=
 in <filename>meta/lib/oeqa/buildperf</filename>. </para></listitem>
-                        <listitem><para>To run the tests, use the follow=
ing command form:
+                                </para>
+                            </listitem>
+                        </itemizedlist>
+                    </para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>oe-build-perf-test:</emphasis>
+                        <itemizedlist>
+                            <listitem>
+                                <para>These tests run through commonly u=
sed usage scenarios and
+                                    measure the performance times. </par=
a>
+                            </listitem>
+                            <listitem>
+                                <para>The code for these tests resides i=
n
+                                        <filename>meta/lib/oeqa/buildper=
f</filename>. </para>
+                            </listitem>
+                            <listitem>
+                                <para>To run the tests, use the followin=
g command form:
                                     <literallayout class=3D"monospaced">
     $ oe-build-perf-test <replaceable>options</replaceable>
                             </literallayout>The
@@ -368,34 +390,28 @@
                                     performance data. For examples, see =
<link linkend=3D""
                                         >http://downloads.yoctoproject.o=
rg/releases/yocto/yocto-2.7/testresults/buildperf-centos7/perf-centos7.yo=
ctoproject.org_warrior_20190414204758_0e39202.html</link>
                                     and <link linkend=3D""
-                                        >http://downloads.yoctoproject.o=
rg/releases/yocto/yocto-2.7/testresults/buildperf-centos7/perf-centos7.yo=
ctoproject.org_warrior_20190414204758_0e39202.txt</link>.</para></listite=
m>
+                                        >http://downloads.yoctoproject.o=
rg/releases/yocto/yocto-2.7/testresults/buildperf-centos7/perf-centos7.yo=
ctoproject.org_warrior_20190414204758_0e39202.txt</link>.</para>
+                            </listitem>
                             <listitem>
                                 <para>The tests are contained in
                                         <filename>lib/oeqa/buildperf/tes=
t_basic.py</filename>.</para>
                             </listitem>
-                    </itemizedlist>
-                    </para></listitem>
-
-
-
-
+                        </itemizedlist>
+                    </para>
+                </listitem>
             </itemizedlist>
         </para>
     </section>
-
-    <section id=3D'test-examples'>
+    <section id=3D"test-examples">
         <title>Test Examples</title>
-
         <para>This section provides example tests for each of the tests =
listed in the <link
                 linkend=3D"test-test-mapping">How Tests Map to Areas of =
Code</link> section. </para>
         <para>For oeqa tests, testcases for each area reside in the main=
 test directory at
                 <filename>meta/lib/oeqa/selftest/cases</filename> direct=
ory.</para>
         <para>For oe-selftest. bitbake testcases reside in the <filename=
>lib/bb/tests/</filename>
             directory. </para>
-
-        <section id=3D'bitbake-selftest-example'>
+        <section id=3D"bitbake-selftest-example">
             <title><filename>bitbake-selftest</filename></title>
-
             <para>A simple test example from <filename>lib/bb/tests/data=
.py</filename> is:
                 <literallayout class=3D"monospaced">
      class DataExpansions(unittest.TestCase):
@@ -419,10 +435,8 @@
                 unittest documentation for additional information on wri=
ting these tests at: <link
                     linkend=3D"">https://docs.python.org/3/library/unitt=
est.html</link>.</para>
         </section>
-
-        <section id=3D'oe-selftest-example'>
+        <section id=3D"oe-selftest-example">
             <title><filename>oe-selftest</filename></title>
-
             <para>These tests are more complex due to the setup required=
 behind the scenes for full
                 builds. Rather than directly using Python's unittest, th=
e code wraps most of the
                 standard objects. The tests can be simple, such as testi=
ng a command from within the
@@ -431,9 +445,7 @@
      class BitbakeLayers(OESelftestTestCase):
           def test_bitbakelayers_showcrossdepends(self):
              result =3D runCmd('bitbake-layers show-cross-depends')     =
 =20
-             self.assertTrue('aspell' in result.output, msg =3D "No depe=
ndencies=20
-     were shown. bitbake-layers show-cross-depends output:
-           %s"% result.output)
+             self.assertTrue('aspell' in result.output, msg =3D "No depe=
ndencies were shown. bitbake-layers show-cross-depends output: %s"% resul=
t.output)
                    </literallayout></para>
             <para>This example, taken from
                     <filename>meta/lib/oeqa/selftest/cases/bblayers.py</=
filename>, creates a
@@ -468,10 +480,8 @@
                     <filename>bitbake</filename> command and exist outsi=
de of its context. As a
                 result, common bitbake library functions (bb.*) are also=
 unavailable.</para>
         </section>
-
-        <section id=3D'testimage-example'>
+        <section id=3D"testimage-example">
             <title><filename>testimage</filename></title>
-
             <para>These tests are run once an image is up and running, e=
ither on target hardware or
                 under QEMU. As a result, they are assumed to be running =
in a target image
                 environment, as opposed to a host build environment. A s=
imple example from
@@ -481,8 +491,7 @@
          @OETestDepends(['ssh.SSHTest.test_ssh'])
          @OEHasPackage(['python3-core'])
          def test_python3(self):
-             cmd =3D "python3 -c \"import codecs; print(codecs.encode('U=
ryyb,
-     jbeyq', 'rot13'))\""
+             cmd =3D "python3 -c \"import codecs; print(codecs.encode('U=
ryyb', 'jbeyq', 'rot13'))\""
              status, output =3D self.target.run(cmd)
              msg =3D 'Exit status was not 0. Output: %s' % output
              self.assertEqual(status, 0, msg=3Dmsg)
@@ -496,10 +505,8 @@
                 decorators. For example, the test in this example would =
only make sense if
                 python3-core is installed in the image.</para>
         </section>
-
-        <section id=3D'testsdk_ext-example'>
+        <section id=3D"testsdk_ext-example">
             <title><filename>testsdk_ext</filename></title>
-
             <para>These tests are run against built extensible SDKs (eSD=
Ks). The tests can assume
                 that the eSDK environment has already been setup. An exa=
mple from
                     <filename>meta/lib/oeqa/sdk/cases/devtool.py</filena=
me> contains the
@@ -507,33 +514,31 @@
      class DevtoolTest(OESDKExtTestCase):
           @classmethod
           def setUpClass(cls):
-          myapp_src =3D os.path.join(cls.tc.esdk_files_dir, "myapp")
-          cls.myapp_dst =3D os.path.join(cls.tc.sdk_dir, "myapp")
-          shutil.copytree(myapp_src, cls.myapp_dst)
-          subprocess.check_output(['git', 'init', '.'], cwd=3Dcls.myapp_=
dst)
-          subprocess.check_output(['git', 'add', '.'], cwd=3Dcls.myapp_d=
st)
-          subprocess.check_output(['git', 'commit', '-m', "'test commit'=
"], cwd=3Dcls.myapp_dst)
+              myapp_src =3D os.path.join(cls.tc.esdk_files_dir, "myapp")
+              cls.myapp_dst =3D os.path.join(cls.tc.sdk_dir, "myapp")
+              shutil.copytree(myapp_src, cls.myapp_dst)
+              subprocess.check_output(['git', 'init', '.'], cwd=3Dcls.my=
app_dst)
+              subprocess.check_output(['git', 'add', '.'], cwd=3Dcls.mya=
pp_dst)
+              subprocess.check_output(['git', 'commit', '-m', "'test com=
mit'"], cwd=3Dcls.myapp_dst)
=20
          @classmethod
          def tearDownClass(cls):
-         shutil.rmtree(cls.myapp_dst)
+             shutil.rmtree(cls.myapp_dst)
          def _test_devtool_build(self, directory):
-         self._run('devtool add myapp %s' % directory)
-         try:
-         self._run('devtool build myapp')
-         finally:
-         self._run('devtool reset myapp')
+             self._run('devtool add myapp %s' % directory)
+             try:
+             self._run('devtool build myapp')
+             finally:
+             self._run('devtool reset myapp')
          def test_devtool_build_make(self):
-         self._test_devtool_build(self.myapp_dst)
+             self._test_devtool_build(self.myapp_dst)
                     </literallayout>In
                 this example, the <filename>devtool</filename> command i=
s tested to see whether a
                 sample application can be built with the <filename>devto=
ol build</filename> command
                 within the eSDK.</para>
         </section>
-
-        <section id=3D'testsdk-example'>
+        <section id=3D"testsdk-example">
             <title><filename>testsdk</filename></title>
-
             <para>These tests are run against built SDKs. The tests can =
assume that an SDK has
                 already been extracted and its environment file has been=
 sourced. A simple example
                 from <filename>meta/lib/oeqa/sdk/cases/python2.py</filen=
ame> contains the
@@ -553,10 +558,8 @@
                 runs the python3 interpreter with a basic command to che=
ck it is working correctly.
                 The test would only run if python3 is installed in the S=
DK.</para>
         </section>
-
-        <section id=3D'oe-build-perf-test-example'>
+        <section id=3D"oe-build-perf-test-example">
             <title><filename>oe-build-perf-test</filename></title>
-
             <para>The performance tests usually measure how long operati=
ons take and the resource
                 utilisation as that happens. An example from
                     <filename>meta/lib/oeqa/buildperf/test_basic.py</fil=
ename> contains the
@@ -582,7 +585,7 @@
                 various caches, to show how BitBake=E2=80=99s parsing pe=
rformance trends over time.</para>
         </section>
     </section>
-    <section id=3D'test-writing-considerations'>
+    <section id=3D"test-writing-considerations">
         <title>Considerations When Writing Tests</title>
         <para>When writing good tests, there are several things to keep =
in mind. Since things
             running on the Autobuilder are accessed concurrently by mult=
iple workers, consider the
@@ -610,14 +613,6 @@
                 metadate from changes, set up temporary copies of that d=
ata first.</para>
         </formalpara>
     </section>
-
-
-
-
-
-
-
-
 </chapter>
 <!--
 vim: expandtab tw=3D80 ts=3D4
diff --git a/documentation/test-manual/test-manual-understand-autobuilder=
.xml b/documentation/test-manual/test-manual-understand-autobuilder.xml
index a04006605..e375b3adf 100644
--- a/documentation/test-manual/test-manual-understand-autobuilder.xml
+++ b/documentation/test-manual/test-manual-understand-autobuilder.xml
@@ -1,11 +1,8 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
-<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
-
-<chapter id=3D'test-manual-understand-autobuilder'>
-
-<title>Understanding the Yocto Project Autobuilder</title>
+<chapter id=3D"test-manual-understand-autobuilder">
+    <title>Understanding the Yocto Project Autobuilder</title>
     <section>
         <title>Execution Flow within the Autobuilder</title>
         <para>The =E2=80=9Ca-full=E2=80=9D and =E2=80=9Ca-quick=E2=80=9D=
 targets are the usual entry points into the Autobuilder and
@@ -69,14 +66,12 @@
             repository in the <filename>scripts</filename> directory. Th=
e following  section details
             how this works.</para>
     </section>
-
-    <section id=3D'test-autobuilder-target-exec-overview'>
+    <section id=3D"test-autobuilder-target-exec-overview">
         <title>Autobuilder Target Execution Overview</title>
-
         <para>For each given target in a build, the Autobuilder executes=
 several steps. These are
             configured in <filename>yocto-autobuilder2/builders.py</file=
name> and roughly consist
             of: <orderedlist>
-                <listitem id=3D'test-list-tgt-exec-clobberdir'>
+                <listitem id=3D"test-list-tgt-exec-clobberdir">
                     <para><emphasis>Run <filename>clobberdir</filename><=
/emphasis></para>
                     <para>This cleans out any previous build. Old builds=
 are left around to allow
                         easier debugging of failed builds. For additiona=
l information, see <link
@@ -133,11 +128,11 @@
                 </listitem>
             </orderedlist></para>
     </section>
-    <section id=3D'test-autobuilder-tech'>
+    <section id=3D"test-autobuilder-tech">
         <title>Autobuilder Technology</title>
         <para>The Autobuilder has Yocto Project-specific functionality t=
o allow builds to operate
             with increased efficiency and speed.</para>
-        <section id=3D'test-clobberdir'>
+        <section id=3D"test-clobberdir">
             <title>clobberdir</title>
             <para>When deleting files, the Autobuilder uses <filename>cl=
obberdir</filename>, which
                 is a special script that moves files to a special locati=
on, rather than deleting
@@ -147,7 +142,7 @@
                 runs this deletion. See <link linkend=3D"test-autobuilde=
r-worker-janitor">Autobuilder
                     Worker Janitor</link>.</para>
         </section>
-        <section id=3D'test-autobuilder-clone-cache'>
+        <section id=3D"test-autobuilder-clone-cache">
             <title>Autobuilder Clone Cache</title>
             <para>Cloning repositories from scratch each time they are r=
equired was slow on the
                 Autobuilder. We therefore have a stash of commonly used =
repositories pre-cloned on
@@ -156,7 +151,7 @@
                 Autobuilder Worker Janitor. See <link linkend=3D"test-au=
tobuilder-worker-janitor"
                     >Autobuilder Worker Janitor</link>.</para>
         </section>
-        <section id=3D'test-autobuilder-worker-janitor'>
+        <section id=3D"test-autobuilder-worker-janitor">
             <title>Autobuilder Worker Janitor</title>
             <para>This is a process running on each Worker that performs=
 two basic operations,
                 including background file deletion at IO idle (see <link
@@ -164,21 +159,21 @@
                 maintainenance of a cache of cloned repositories to impr=
ove the speed the system can
                 checkout repositories.</para>
         </section>
-        <section id=3D'test-shared-dl-dir'>
+        <section id=3D"test-shared-dl-dir">
             <title>Shared DL_DIR</title>
             <para>The Workers are all connected over NFS which allows DL=
_DIR to be shared between
                 them. This reduces network accesses from the system and =
allows the build to be sped
                 up. Usage of the directory within the build system is de=
signed to be able to be
                 shared over NFS.</para>
         </section>
-        <section id=3D'test-shared-sstate-cache'>
+        <section id=3D"test-shared-sstate-cache">
             <title>Shared SSTATE_DIR</title>
             <para>The Workers are all connected over NFS which allows th=
e
                     <filename>sstate</filename> directory to be shared b=
etween them. This means once
                 a Worker has built an artefact, all the others can benef=
it from it. Usage of the
                 directory within the directory is designed for sharing o=
ver NFS.</para>
         </section>
-        <section id=3D'test-resulttool'>
+        <section id=3D"test-resulttool">
             <title>Resulttool</title>
             <para>All of the different tests run as part of the build ge=
nerate output into
                     <filename>testresults.json</filename> files. This al=
lows us to determine which
@@ -191,11 +186,13 @@
                     >https://wiki.yoctoproject.org/wiki/Resulttool</link=
>.</para>
         </section>
     </section>
-    <section id=3D'test-run-config-tgt-execution'>
+    <section id=3D"test-run-config-tgt-execution">
         <title>run-config Target Execution</title>
         <para>The <filename>scripts/run-config</filename> execution is w=
here most of the work within
-            the Autobuilder happens. It runs through a number of steps; =
the first are general setup
-            steps that are run once and include:<orderedlist>
+            the Autobuilder happens. It runs through a number of steps, =
and logs the details to the
+                <filename>stdio</filename> log file in the Web UI by def=
ault. Certain steps generate
+            their own specific log files as detailed in this section. </=
para>
+        <para>The first steps perform general setup, are run once, and i=
nclude:<orderedlist>
                 <listitem>
                     <para>Set up any <filename>buildtools-tarball</filen=
ame> if configured.</para>
                 </listitem>
@@ -206,13 +203,14 @@
         <para>For each step that is configured in <filename>config.json<=
/filename>, it will perform
             the following:</para>
         <para>
-            <remark>## WRITER's question: What does "logging in as stepX=
a" and others refer to
-                below? ##</remark>
             <orderedlist>
                 <listitem id=3D"test-run-config-add-layers-step">
                     <para dir=3D"ltr">Add any layers that are specified =
using the
-                            <filename>bitbake-layers add-layer</filename=
> command (logging as
-                        stepXa)</para>
+                            <filename>bitbake-layers add-layer</filename=
> command. </para>
+                    <para dir=3D"ltr">The details are saved in the
+                                <filename>step<replaceable>X</replaceabl=
e>a</filename> log file,
+                        where <replaceable>X</replaceable> is a number b=
etween 1 and 20. This
+                        variable applies to all steps in this section.</=
para>
                 </listitem>
                 <listitem>
                     <para dir=3D"ltr">Call the <filename>scripts/setup-c=
onfig</filename> script to
@@ -220,26 +218,37 @@
                         the build</para>
                 </listitem>
                 <listitem>
-                    <para dir=3D"ltr">Run the <filename>bitbake BBTARGET=
S</filename> command (logging
-                        as stepXb)</para>
+                    <para dir=3D"ltr">Run the <filename>bitbake BBTARGET=
S</filename> command.</para>
+                    <para dir=3D"ltr">The output logs to the
+                                <filename>step<replaceable>X</replaceabl=
e>b</filename> log
+                        file.</para>
                 </listitem>
                 <listitem>
-                    <para dir=3D"ltr">Run the <filename>bitbake SANITYTA=
RGETS</filename> command
-                        (logging as stepXc)</para>
+                    <para dir=3D"ltr">Run the <filename>bitbake SANITYTA=
RGETS</filename>
+                        command.</para>
+                    <para dir=3D"ltr">The output logs to the
+                                <filename>step<replaceable>X</replaceabl=
e>c</filename> log
+                        file.</para>
                 </listitem>
                 <listitem>
                     <para dir=3D"ltr">Run the <filename>EXTRACMDS</filen=
ame> command, which are run
-                        within the BitBake build environment (logging as=
 stepXd)</para>
+                        within the BitBake build environment.</para>
+                    <para dir=3D"ltr">The output logs to the
+                                <filename>step<replaceable>X</replaceabl=
e>d</filename> log
+                        file.</para>
                 </listitem>
                 <listitem>
                     <para dir=3D"ltr">Run the <filename>EXTRAPLAINCMDS</=
filename> command(s), which
-                        are run outside the BitBake build environment (l=
ogging as stepXd)</para>
+                        are run outside the BitBake build environment. T=
he output logs to the
+                                <filename>step<replaceable>X</replaceabl=
e>d</filename> log
+                        file.</para>
                 </listitem>
                 <listitem>
                     <para dir=3D"ltr">Remove any layers added in <link
                             linkend=3D"test-run-config-add-layers-step">=
step 1</link> using the
-                            <filename>bitbake-layers remove-layer</filen=
ame> command (logging as
-                        stepXa)</para>
+                            <filename>bitbake-layers remove-layer</filen=
ame> command. The ouput logs
+                        to the <filename>step<replaceable>X</replaceable=
>a</filename> log
+                        file.</para>
                 </listitem>
             </orderedlist>
         </para>
@@ -265,7 +274,7 @@
                 </listitem>
             </orderedlist></para>
     </section>
-    <section id=3D'test-deploying-yp-autobuilder'>
+    <section id=3D"test-deploying-yp-autobuilder">
         <title>Deploying Yocto Autobuilder</title>
         <para>The most up to date information about how to setup and dep=
loy your own Autbuilder can
             be found in README.md in the <filename>yocto-autobuilder2</f=
ilename> repository.</para>
@@ -300,14 +309,6 @@
      $ ln -s ../../scripts/pre-commit-hook.sh .git/hooks/pre-commit
                     </literallayout></para>
     </section>
-
-
-
-
-
-
-
-
 </chapter>
 <!--
 vim: expandtab tw=3D80 ts=3D4
--=20
2.17.1

