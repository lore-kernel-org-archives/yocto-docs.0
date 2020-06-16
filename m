Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.679.1592348884863729764
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 16:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mark.morton@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05GN84mH000980
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2020 16:08:04 -0700 (PDT)
Received: from san-mmorton-lx1.corp.ad.wrs.com (147.11.4.21) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 16 Jun 2020 16:08:03 -0700
From: "Mark Morton" <Mark.Morton@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] Fixed codeblock formatting in test-manual
Date: Tue, 16 Jun 2020 16:03:34 -0700
Message-ID: <20200616230334.9814-1-mark.morton@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 05GN84mH000980
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Mark Morton <mark.morton@windriver.com>
---
 .../test-manual/test-manual-intro.xml         | 79 ++++++++-----------
 .../test-manual-understand-autobuilder.xml    | 21 ++---
 2 files changed, 45 insertions(+), 55 deletions(-)

diff --git a/documentation/test-manual/test-manual-intro.xml b/documentat=
ion/test-manual/test-manual-intro.xml
index 5e9def894..90d522b9b 100644
--- a/documentation/test-manual/test-manual-intro.xml
+++ b/documentation/test-manual/test-manual-intro.xml
@@ -213,52 +213,41 @@
             Tests map into the codebase as follows:
             <itemizedlist>
                 <listitem><para>
-                        <emphasis>bitbake-selftest</emphasis>: <itemized=
list>
-                            <listitem>
-                                <para>These tests are self-contained and=
 test BitBake as well as its
-                                    APIs, which include the fetchers. Th=
e tests are located in
-                                        <filename>bitbake/lib/*/tests</f=
ilename>. </para>
-                            </listitem>
-                            <listitem>
-                                <para>From within the BitBake repository=
, run the following:
-                                    <literallayout class=3D"monospaced">
+                        <emphasis>bitbake-selftest</emphasis>: </para>
+                    <para>These tests are self-contained and test BitBak=
e as well as its APIs, which
+                        include the fetchers. The tests are located in
+                            <filename>bitbake/lib/*/tests</filename>. </=
para>
+                    <para>From within the BitBake repository, run the fo=
llowing:
+                        <literallayout class=3D"monospaced">
      $ bitbake-selftest
                             </literallayout>
-                                </para>
-                            </listitem>
-                            <listitem>
-                                <para>To skip tests that access the Inte=
rnet, use the
-                                        <filename>BB_SKIP_NETTEST</filen=
ame> variable when running
-                                    "bitbake-selftest" as follows:
-                                    <literallayout class=3D"monospaced">
+                    </para>
+                    <para>To skip tests that access the Internet, use th=
e
+                            <filename>BB_SKIP_NETTEST</filename> variabl=
e when running
+                        "bitbake-selftest" as follows:
+                        <literallayout class=3D"monospaced">
      $ BB_SKIP_NETTEST=3Dyes bitbake-selftest
-                            </literallayout>The
-                                    default output is quiet and just pri=
nts a summary of what was
-                                    run. To see more information, there =
is a verbose
-                                    option:<literallayout>
+                            </literallayout></para>
+                    <para>The default output is quiet and just prints a =
summary of what was run. To
+                        see more information, there is a verbose
+                        option:<literallayout class=3D"monospaced">
      $ bitbake-selftest -v
                              </literallayout></para>
-                                <para>Use this option when you wish to s=
kip tests that access the
-                                    network, which are mostly necessary =
to test the fetcher modules.
-                                    To specify individual test modules t=
o run, append the test
-                                    module name to the "bitbake-selftest=
" command. For example, to
-                                    specify the tests for the bb.data.mo=
dule, run:
-                                    <literallayout class=3D"monospaced">
+                    <para>Use this option when you wish to skip tests th=
at access the network, which
+                        are mostly necessary to test the fetcher modules=
. To specify individual test
+                        modules to run, append the test module name to t=
he "bitbake-selftest"
+                        command. For example, to specify the tests for t=
he bb.data.module, run:
+                        <literallayout class=3D"monospaced">
      $ bitbake-selftest bb.test.data.module
                             </literallayout>You
-                                    can also specify individual tests by=
 defining the full name and
-                                    module plus the class path of the te=
st, for example:
-                                    <literallayout>
+                        can also specify individual tests by defining th=
e full name and module plus
+                        the class path of the test, for example:
+                        <literallayout class=3D"monospaced">
      $ bitbake-selftest bb.tests.data.TestOverrides.test_one_override
                              </literallayout></para>
-                            </listitem>
-                            <listitem>
-                                <para>The tests are based on <ulink
-                                        url=3D"https://docs.python.org/3=
/library/unittest.html">Python
-                                        unittest</ulink>. </para>
-                            </listitem>
-                        </itemizedlist>
-                    </para></listitem>
+                    <para>The tests are based on <ulink
+                            url=3D"https://docs.python.org/3/library/uni=
ttest.html">Python
+                            unittest</ulink>. </para></listitem>
                 <listitem><para>
                         <emphasis>oe-selftest</emphasis>: <itemizedlist>
                             <listitem>
@@ -296,12 +285,12 @@
                             </literallayout>
                                     For example, the following command w=
ould run the tinfoil getVar
                                     API
-                                    test:<literallayout>
+                                    test:<literallayout class=3D"monospa=
ced">
      $ oe-selftest -r tinfoil.TinfoilTests.test_getvar
                             </literallayout>It
                                     is also possible to run a set of tes=
ts. For example the
                                     following command will run all of th=
e tinfoil
-                                    tests:<literallayout>
+                                    tests:<literallayout class=3D"monosp=
aced">
      $ oe-selftest -r  tinfoil
                             </literallayout></para>
                             </listitem>
@@ -407,7 +396,7 @@
             <title><filename>bitbake-selftest</filename></title>
=20
             <para>A simple test example from <filename>lib/bb/tests/data=
.py</filename> is:
-                <literallayout>
+                <literallayout class=3D"monospaced">
      class DataExpansions(unittest.TestCase):
          def setUp(self):
              self.d =3D bb.data.init()
@@ -437,7 +426,7 @@
                 builds. Rather than directly using Python's unittest, th=
e code wraps most of the
                 standard objects. The tests can be simple, such as testi=
ng a command from within the
                 OE build environment using the following
-                example:<literallayout>
+                example:<literallayout class=3D"monospaced">
      class BitbakeLayers(OESelftestTestCase):
           def test_bitbakelayers_showcrossdepends(self):
              result =3D runCmd('bitbake-layers show-cross-depends')     =
 =20
@@ -486,7 +475,7 @@
                 under QEMU. As a result, they are assumed to be running =
in a target image
                 environment, as opposed to a host build environment. A s=
imple example from
                     <filename>meta/lib/oeqa/runtime/cases/python.py</fil=
ename> contains the
-                following:<literallayout>
+                following:<literallayout class=3D"monospaced">
      class PythonTest(OERuntimeTestCase):
          @OETestDepends(['ssh.SSHTest.test_ssh'])
          @OEHasPackage(['python3-core'])
@@ -513,7 +502,7 @@
             <para>These tests are run against built extensible SDKs (eSD=
Ks). The tests can assume
                 that the eSDK environment has already been setup. An exa=
mple from
                     <filename>meta/lib/oeqa/sdk/cases/devtool.py</filena=
me> contains the
-                following:<literallayout>
+                following:<literallayout class=3D"monospaced">
      class DevtoolTest(OESDKExtTestCase):
           @classmethod
           def setUpClass(cls):
@@ -547,7 +536,7 @@
             <para>These tests are run against built SDKs. The tests can =
assume that an SDK has
                 already been extracted and its environment file has been=
 sourced. A simple example
                 from <filename>meta/lib/oeqa/sdk/cases/python2.py</filen=
ame> contains the
-                following:<literallayout>
+                following:<literallayout class=3D"monospaced">
      class Python3Test(OESDKTestCase):
          def setUp(self):
              if not (self.tc.hasHostPackage("nativesdk-python3-core") or
@@ -570,7 +559,7 @@
             <para>The performance tests usually measure how long operati=
ons take and the resource
                 utilisation as that happens. An example from
                     <filename>meta/lib/oeqa/buildperf/test_basic.py</fil=
ename> contains the
-                following:<literallayout>
+                following:<literallayout class=3D"monospaced">
      class Test3(BuildPerfTestCase):
=20
        def test3(self):
diff --git a/documentation/test-manual/test-manual-understand-autobuilder=
.xml b/documentation/test-manual/test-manual-understand-autobuilder.xml
index 754130535..5c54cd57e 100644
--- a/documentation/test-manual/test-manual-understand-autobuilder.xml
+++ b/documentation/test-manual/test-manual-understand-autobuilder.xml
@@ -19,7 +19,7 @@
                 <filename>config.json</filename> file within the
                 <filename>yocto-autobuilder-helper</filename> repository=
. The targets are defined in
             the =E2=80=98overrides=E2=80=99 section, a quick example cou=
ld be qemux86-64 which looks
-            like:<literallayout>
+            like:<literallayout class=3D"monospaced">
      "qemux86-64" : {
          "MACHINE" : "qemux86-64",
          "TEMPLATE" : "arch-qemu",
@@ -31,7 +31,7 @@
      },
                     </literallayout>And
             to expand that, you need the =E2=80=9Carch-qemu=E2=80=9D ent=
ry from the =E2=80=9Ctemplates=E2=80=9D section, which looks
-            like:<literallayout>
+            like:<literallayout class=3D"monospaced">
      "arch-qemu" : {
          "BUILDINFO" : true,
          "BUILDHISTORY" : true,
@@ -51,11 +51,12 @@
          }
      },
                     </literallayout>Combining
-            these two entries you can see that =E2=80=9Cqemux86-64=E2=80=
=9D is a three step build where the =E2=80=9Cbitbake
-            BBTARGETS=E2=80=9D would be run, then =E2=80=9Cbitbake SANIT=
YTARGETS=E2=80=9D for each step; all for
-            MACHINE=3D=E2=80=9Dqemx86-64=E2=80=9D but with differing SDK=
MACHINE settings. In step 1 an extra variable
-            is added to the <filename>auto.conf</filename> file to enabl=
e wic image
-            generation.</para>
+            these two entries you can see that =E2=80=9Cqemux86-64=E2=80=
=9D is a three step build where the
+                <filename>bitbake BBTARGETS</filename> would be run, the=
n <filename>bitbake
+                SANITYTARGETS</filename> for each step; all for
+                <filename>MACHINE=3D=E2=80=9Dqemx86-64=E2=80=9D</filenam=
e> but with differing SDKMACHINE settings. In
+            step 1 an extra variable is added to the <filename>auto.conf=
</filename> file to enable
+            wic image generation.</para>
         <para>While not every detail of this is covered here, you can se=
e how the templating
             mechanism allows quite complex configurations to be built up=
 yet allows duplication and
             repetition to be kept to a minimum.</para>
@@ -283,18 +284,18 @@
             substitution of the paths. The Helper script repository incl=
udes a
                 <filename>local-example.json</filename> file to show how=
 you could override these
             from a separate configuration file. Pass the following into =
the environment of the
-            Autobuilder:<literallayout>
+            Autobuilder:<literallayout class=3D"monospaced">
      $ ABHELPER_JSON=3D"config.json local-example.json"
                     </literallayout>As
             another example, you could also pass the following into the
-            environment:<literallayout>
+            environment:<literallayout class=3D"monospaced">
      $ ABHELPER_JSON=3D"config.json <replaceable>/some/location/</replac=
eable>local.json"
                     </literallayout>One
             issue users often run into is validation of the <filename>co=
nfig.json</filename> files.
             A tip for minimizing issues from invalid json files is to us=
e a Git
                 <filename>pre-commit-hook.sh</filename> script to verify=
 the JSON file before
             committing it. Create a symbolic link as
-            follows:<literallayout>
+            follows:<literallayout class=3D"monospaced">
      $ ln -s ../../scripts/pre-commit-hook.sh .git/hooks/pre-commit
                     </literallayout></para>
     </section>
--=20
2.17.1

