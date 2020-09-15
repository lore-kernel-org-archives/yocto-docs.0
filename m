Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web12.7303.1600150112674637064
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2020 23:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KBZPlyR3;
 spf=pass (domain: linaro.org, ip: 209.85.219.179, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f179.google.com with SMTP id 67so1747700ybt.6
        for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2020 23:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mYf0f/d6814vKWACK49Y2dyM86oRexKb1V6iOax81+s=;
        b=KBZPlyR3IKrOjMF+Wdcd21zmP87zXECjSYYxlrDC6kxA1Se4JwAXX7YjTH99DR60VP
         oFtALKH/BjqvNpoXqLB3ynC6Px/MoQDyzvyk6qT19lsbBg/QVf0bSFtM4Bs5kyhoPgzp
         /qSIylVsrbVLDj5vnAGh0ifGV+ZO3gK/LWlfOLowXac3sNc1gPHqthcQAPb9sUycwpIp
         Nlc/O8BhP8c7ASPhmMPwgbzfZ83vNj5OVXOUHBOVKSg4vgBkTHN4jfd0LdGYFl2X0euj
         /53KmcCbqw6JVDYg1oUjjvgsdlvCDdE4AQ4xPNYSa8aGZFKXC7I3P/0tLLmaQgdTHqy0
         pDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mYf0f/d6814vKWACK49Y2dyM86oRexKb1V6iOax81+s=;
        b=t9oPT2jzMPQuFEyShiQ+9CsZtFAEDWb6OBIGVGUSjq6XIMlP+bGw7Y/TYpvFHEJyk/
         SjE7EA05f6M9IclGRjCy0HIrburID2nzT5Rcny43uiNBcoswePTE2YvZWAano4xNPeNH
         /RvPwT6QQZ27hTlKgXYMSnwqgmEWg2N+C2ME5WZw9O09ZiGUgP/wxnywfMxJ/H/JDhVE
         sr/oUD3Xn2XPGLxxdyvqPjy3AIjnXIGmHft53SKiCGnQALILKI6n3EzBKsl1ewEQsHI/
         PzeIZpu6dAnt7i3KGGE1YZqAul4lA1OKATzyxG7D7dXRnclYsa/hO/egQxj37WrDDjm3
         VACw==
X-Gm-Message-State: AOAM530oXa5BYIo5X3zGUs/45PmD9Jgf/In5w4KU2YDqTe7ZrShq8+T8
	o3yctAxGkX6oA4pjkt9a8ZCnB6FOeAmKGqcMdS3TMw==
X-Google-Smtp-Source: ABdhPJwKql71liLfthbbOP+PNq8XfAAy+zu8A6mDxnvozIDIoeFZZ1I6Z/3XfBAK6P73IKPU80mInJj+n8aW7RVdiag=
X-Received: by 2002:a25:508c:: with SMTP id e134mr27391635ybb.371.1600150111261;
 Mon, 14 Sep 2020 23:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200914231131.32571-1-mark.morton@windriver.com>
In-Reply-To: <20200914231131.32571-1-mark.morton@windriver.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 15 Sep 2020 08:08:19 +0200
Message-ID: <CAP71WjyQdfzAWVO3gvxx88wAZGLeow0grtSc9mJudoAkgRFTtw@mail.gmail.com>
Subject: Re: [docs] [PATCH] test-manual code block, link, and format update
To: Mark Morton <Mark.Morton@windriver.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f834bf05af53faa4"

--000000000000f834bf05af53faa4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Mark,

many thanks for your help!

On Tue, Sep 15, 2020 at 1:16 AM Mark Morton <Mark.Morton@windriver.com>
wrote:

> Signed-off-by: Mark Morton <mark.morton@windriver.com>
> ---
>  documentation/conf.py                         |   4 +-
>  .../test-manual/test-manual-intro.rst         | 266 +++++++++++-------
>  .../test-manual-understand-autobuilder.rst    | 102 ++++---
>  3 files changed, 226 insertions(+), 146 deletions(-)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index e1a7e5e3d..e825fbf6e 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -42,8 +42,8 @@ sys.path.insert(0, os.path.abspath('sphinx'))
>  extensions =3D [
>      'sphinx.ext.autosectionlabel',
>      'sphinx.ext.extlinks',
> -    'sphinx.ext.intersphinx',
> -    'yocto-vars'
> +    'sphinx.ext.intersphinx'
> + #   'yocto-vars'
>  ]
>

This extension doesn't work with Python2. To be honest, I don't think i
want to bother with Python2 at this point. I am not even sure how well
Sphinx is expected to work with Python2, so we should make clear  that our
doc system requires Python3, and we need to write clear instructions for
users who have Python3 on their host as 'default' vs users who still have
Python2 (which is the problem you faced)

 autosectionlabel_prefix_document =3D True
>
> diff --git a/documentation/test-manual/test-manual-intro.rst
> b/documentation/test-manual/test-manual-intro.rst
> index 2f11e2beb..d68ab73f4 100644
> --- a/documentation/test-manual/test-manual-intro.rst
> +++ b/documentation/test-manual/test-manual-intro.rst
> @@ -23,26 +23,25 @@ project core.
>
>  Currently, the Yocto Project Test Environment Manual has no projected
>  release date. This manual is a work-in-progress and is being initially
> -loaded with information from the `README <>`__ files and notes from key
> +loaded with information from the README files and notes from key
>  engineers:
>
> --  *``yocto-autobuilder2``:* This
> -   ```README.md`
> http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobuilder2/tree/READM=
E.md
> +-  *yocto-autobuilder2:* This
> +   `README.md <
> http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobuilder2/tree/READM=
E.md
> >`__
>

that works. However for links to git trees, we are using the :yocto_git:
extlink , such as (from the BSP guide):
:yocto_git:`README.md </cgit.cgi/meta-raspberrypi/tree/README.md>`
We should standardize on that.
I think i will eventually make sure we don't even need /cgit.git in the
link name, but for now it's needed.

    is the main README which detials how to set up the Yocto Project
>     Autobuilder. The ``yocto-autobuilder2`` repository represents the
>     Yocto Project's console UI plugin to Buildbot and the configuration
>     necessary to configure Buildbot to perform the testing the project
>     requires.
>
> --  *``yocto-autobuilder-helper``:* This
> -   ```README`
> http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobuilder-helper/tree=
/README
> +-  *yocto-autobuilder-helper:* This `README <
> http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobuilder-helper/tree=
/README/
> >`__
>     and repository contains Yocto Project Autobuilder Helper scripts and
>     configuration. The ``yocto-autobuilder-helper`` repository contains
>     the "glue" logic that defines which tests to run and how to run them=
.
>     As a result, it can be used by any Continuous Improvement (CI) syste=
m
>     to run builds, support getting the correct code revisions, configure
>     builds and layers, run builds, and collect results. The code is
> -   independent of any CI system, which means the code can work Buildbot=
,
> +   independent of any CI system, which means the code can work `Buildbo=
t <
> https://docs.buildbot.net/0.9.15.post1/>`__,
>

this is a new link you created which was not in the original Docbook,
right? Perhaps best to have that in a separate patch if you think it's
needed.


>     Jenkins, or others. This repository has a branch per release of the
>     project defining the tests to run on a per release basis.
>
> @@ -66,9 +65,9 @@ that the Yocto Project customizes using code from the
>  resulting UI plug-in allows you to visualize builds in a way suited to
>  the project's needs.
>
> -A ``helper`` layer provides configuration and job management through
> +A helper layer provides configuration and job management through
>

Why? 'helper' is inside a <filename> tag in docbook to make it verbatim in
the output, why did you remove it?

 scripts found in the ``yocto-autobuilder-helper`` repository. The
> -``helper`` layer contains the bulk of the build configuration
> +helper layer contains the bulk of the build configuration
>  information and is release-specific, which makes it highly customizable
>  on a per-project basis. The layer is CI system-agnostic and contains a
>  number of Helper scripts that can generate build configurations from
> @@ -124,18 +123,21 @@ thefollowing types of tests:
>     ensure we have no single point of failure and can ensure the
>     different distros work effectively.
>
> --  *eSDK Testing:* Image tests initiated through the following command:
> -   $ bitbake image -c testsdkext The tests utilize the ``testsdkext``
> -   class and the ``do_testsdkext`` task.
> +-  *eSDK Testing:* Image tests initiated through the following command:=
:
>

does that work? I've always done ": ::" to keep the semi column, and I
thought the :: needed a space before.

> +
> +   $ bitbake image -c testsdkext
>
Indentation is not typical here. you need 3 space starting from the
previous indentation level.

> +
> +   The tests utilize the ``testsdkext`` class and the ``do_testsdkext``
> task.
>
this sentence above is no in the code-block, it should not be at the same
indentation level as the code block.


>
>  -  *Feature Testing:* Various scenario-based tests are run through the
> -   `OpenEmbedded
> -   Self-Test <&YOCTO_DOCS_REF_URL;#testing-and-quality-assurance>`__
> -   (oe-selftest). We test oe-selftest on each of the main distrubutions
> +   :ref:`OpenEmbedded Self test (oe-selftest)
> <ref-manual/ref-release-process:Testing and Quality Assurance>`. We test
> oe-selftest on each of the main distrubutions
>     we support.
>

> --  *Image Testing:* Image tests initiated through the following command=
:
> -   $ bitbake image -c testimage The tests utilize the
> +-  *Image Testing:* Image tests initiated through the following command=
::
> +
> +   $ bitbake image -c testimage
> +
> +   The tests utilize the
>
Need to fix indentation here

    :ref:`testimage* <ref-classes-testimage*>`
>     classes and the
>     :ref:`ref-tasks-testimage` task.
> @@ -147,8 +149,8 @@ thefollowing types of tests:
>
>  -  *Package Testing:* A Package Test (ptest) runs tests against package=
s
>     built by the OpenEmbedded build system on the target machine. See th=
e
> -   "`Testing Packages With
> -   ptest <&YOCTO_DOCS_DEV_URL;#testing-packages-with-ptest>`__" section
> +   :ref:`Testing Packages With
> +   ptest <dev-manual/dev-manual-common-tasks:Testing Packages With
> ptest>` section
>     in the Yocto Project Development Tasks Manual and the
>     ":yocto_wiki:`Ptest </wiki/Ptest>`" Wiki page for more
>     information on Ptest.
> @@ -159,8 +161,8 @@ thefollowing types of tests:
>     the ``do_testsdk`` task.
>
>  -  *Unit Testing:* Unit tests on various components of the system run
> -   through ``oe-selftest`` and
> -   ```bitbake-selftest``
> <&YOCTO_DOCS_REF_URL;#testing-and-quality-assurance>`__.
> +   through :ref:`bitbake-selftest <ref-manual/ref-release-process:Testi=
ng
> and Quality Assurance>` and
> +   :ref:`oe-selftest <ref-manual/ref-release-process:Testing and Qualit=
y
> Assurance>`.
>

the link is on bitbake-selftest, not oe-selftest (you added it).


>
>  -  *Automatic Upgrade Helper:* This target tests whether new versions o=
f
>     software are available and whether we can automatically upgrade to
> @@ -174,36 +176,43 @@ How Tests Map to Areas of Code
>
>  Tests map into the codebase as follows:
>
> --  *bitbake-selftest*:
> +-  *bitbake-selftest:*
>
>     These tests are self-contained and test BitBake as well as its APIs,
>     which include the fetchers. The tests are located in
>     ``bitbake/lib/*/tests``.
>
> -   From within the BitBake repository, run the following: $
> -   bitbake-selftest
> +   From within the BitBake repository, run the following::
> +
> +   $ bitbake-selftest
>

indentation and use of :: are not right (please check all other occurrence=
s)


>
>     To skip tests that access the Internet, use the ``BB_SKIP_NETTEST``
> -   variable when running "bitbake-selftest" as follows: $
> -   BB_SKIP_NETTEST=3Dyes bitbake-selftest
> +   variable when running "bitbake-selftest" as follows::
> +
> +   $ BB_SKIP_NETTEST=3Dyes bitbake-selftest
>
>     The default output is quiet and just prints a summary of what was
> -   run. To see more information, there is a verbose option:$
> -   bitbake-selftest -v
> +   run. To see more information, there is a verbose option::
> +
> +   $ bitbake-selftest -v
>
>     Use this option when you wish to skip tests that access the network,
>     which are mostly necessary to test the fetcher modules. To specify
>     individual test modules to run, append the test module name to the
>     "bitbake-selftest" command. For example, to specify the tests for th=
e
> -   bb.data.module, run: $ bitbake-selftest bb.test.data.moduleYou can
> -   also specify individual tests by defining the full name and module
> -   plus the class path of the test, for example: $ bitbake-selftest
> -   bb.tests.data.TestOverrides.test_one_override
> +   bb.data.module, run::
> +
> +   $ bitbake-selftest bb.test.data.module
> +
> +   You can also specify individual tests by defining the full name and
> module
> +   plus the class path of the test, for example::
> +
> +   $ bitbake-selftest bb.tests.data.TestOverrides.test_one_override
>
>     The tests are based on `Python
>     unittest <https://docs.python.org/3/library/unittest.html>`__.
>
> --  *oe-selftest*:
> +-  *oe-selftest:*
>
>     -  These tests use OE to test the workflows, which include testing
>        specific features, behaviors of tasks, and API unit tests.
> @@ -219,16 +228,25 @@ Tests map into the codebase as follows:
>     -  The code for the tests resides in
>        ``meta/lib/oeqa/selftest/cases/``.
>
> -   -  To run all the tests, enter the following command: $ oe-selftest
> -      -a
> +   -  To run all the tests, enter the following command::
> +
> +      $ oe-selftest -a
>
>     -  To run a specific test, use the following command form where
> -      testname is the name of the specific test: $ oe-selftest -r
> -      testname For example, the following command would run the tinfoil
> -      getVar API test:$ oe-selftest -r
> -      tinfoil.TinfoilTests.test_getvarIt is also possible to run a set
> +      testname is the name of the specific test::
> +
> +      $ oe-selftest -r <testname>
> +
> +      For example, the following command would run the tinfoil
> +      getVar API test::
> +
> +      $ oe-selftest -r tinfoil.TinfoilTests.test_getvar
> +
> +      It is also possible to run a set
>        of tests. For example the following command will run all of the
> -      tinfoil tests:$ oe-selftest -r tinfoil
> +      tinfoil tests::
> +
> +      $ oe-selftest -r tinfoil
>
>  -  *testimage:*
>
> @@ -240,10 +258,13 @@ Tests map into the codebase as follows:
>
>     -  You need to set the
>        :term:`IMAGE_CLASSES`
> -      variable as follows: IMAGE_CLASSES +=3D "testimage"
> +      variable as follows::
> +
> +      IMAGE_CLASSES +=3D "testimage"
>
> -   -  Run the tests using the following command form: $ bitbake image -=
c
> -      testimage
> +   -  Run the tests using the following command form::
> +
> +      $ bitbake image -c testimage
>
>  -  *testsdk:*
>
> @@ -252,8 +273,9 @@ Tests map into the codebase as follows:
>
>     -  The code for these tests resides in ``meta/lib/oeqa/sdk/cases/``.
>
> -   -  Run the test using the following command form: $ bitbake image -c
> -      testsdk
> +   -  Run the test using the following command form::
> +
> +      $ bitbake image -c testsdk
>
>  -  *testsdk_ext:*
>
> @@ -262,8 +284,9 @@ Tests map into the codebase as follows:
>
>     -  The code for these tests resides in ``meta/lib/oeqa/esdk``.
>
> -   -  To run the tests, use the following command form: $ bitbake image
> -      -c testsdkext
> +   -  To run the tests, use the following command form::
> +
> +      $ bitbake image -c testsdkext
>
>  -  *oe-build-perf-test:*
>
> @@ -272,8 +295,11 @@ Tests map into the codebase as follows:
>
>     -  The code for these tests resides in ``meta/lib/oeqa/buildperf``.
>
> -   -  To run the tests, use the following command form: $
> -      oe-build-perf-test optionsThe command takes a number of options,
> +   -  To run the tests, use the following command form::
> +
> +      $ oe-build-perf-test <options>
> +
> +      The command takes a number of options,
>        such as where to place the test results. The Autobuilder Helper
>        Scripts include the ``build-perf-test-wrapper`` script with
>        examples of how to use the oe-build-perf-test from the command
> @@ -308,14 +334,20 @@ directory.
>  ``bitbake-selftest``
>  --------------------
>
> -A simple test example from ``lib/bb/tests/data.py`` is: class
> -DataExpansions(unittest.TestCase): def setUp(self): self.d =3D
> -bb.data.init() self.d["foo"] =3D "value_of_foo" self.d["bar"] =3D
> -"value_of_bar" self.d["value_of_foo"] =3D "value_of_'value_of_foo'" def
> -test_one_var(self): val =3D self.d.expand("${foo}")
> -self.assertEqual(str(val), "value_of_foo")
> +A simple test example from ``lib/bb/tests/data.py`` is::
>
> -In this example, a ```DataExpansions`` <>`__ class of tests is created,
> +   class DataExpansions(unittest.TestCase):
> +      def setUp(self):
> +            self.d =3D bb.data.init()
> +            self.d["foo"] =3D "value_of_foo"
> +            self.d["bar"] =3D "value_of_bar"
> +            self.d["value_of_foo"] =3D "value_of_'value_of_foo'"
> +
> +      def test_one_var(self):
> +            val =3D self.d.expand("${foo}")
> +            self.assertEqual(str(val), "value_of_foo")
> +
> +In this example, a ``DataExpansions`` class of tests is created,
>  derived from standard python unittest. The class has a common ``setUp``
>  function which is shared by all the tests in the class. A simple test i=
s
>  then added to test that when a variable is expanded, the correct value
> @@ -334,14 +366,15 @@ These tests are more complex due to the setup
> required behind the scenes
>  for full builds. Rather than directly using Python's unittest, the code
>  wraps most of the standard objects. The tests can be simple, such as
>  testing a command from within the OE build environment using the
> -following example:class BitbakeLayers(OESelftestTestCase): def
> -test_bitbakelayers_showcrossdepends(self): result =3D
> -runCmd('bitbake-layers show-cross-depends') self.assertTrue('aspell' in
> -result.output, msg =3D "No dependencies were shown. bitbake-layers
> -show-cross-depends output: %s"% result.output)
> +following example::
> +
> +   class BitbakeLayers(OESelftestTestCase):
> +      def test_bitbakelayers_showcrossdepends(self):
> +            result =3D runCmd('bitbake-layers show-cross-depends')
> +            self.assertTrue('aspell' in result.output, msg =3D "No
> dependencies were shown. bitbake-layers show-cross-depends output: %s"%
> result.output)
>
>  This example, taken from ``meta/lib/oeqa/selftest/cases/bblayers.py``,
> -creates a testcase from the ```OESelftestTestCase`` <>`__ class, derive=
d
> +creates a testcase from the ``OESelftestTestCase`` class, derived
>  from ``unittest.TestCase``, which runs the ``bitbake-layers`` command
>  and checks the output to ensure it contains something we know should be
>  here.
> @@ -367,7 +400,7 @@ so tests within a given test class should always run
> in the same build,
>  while tests in different classes or modules may be split into different
>  builds. There is no data store available for these tests since the test=
s
>  launch the ``bitbake`` command and exist outside of its context. As a
> -result, common bitbake library functions (bb.*) are also unavailable.
> +result, common bitbake library functions (bb.\*) are also unavailable.
>
>  .. _testimage-example:
>
> @@ -378,14 +411,18 @@ These tests are run once an image is up and runnin=
g,
> either on target
>  hardware or under QEMU. As a result, they are assumed to be running in =
a
>  target image environment, as opposed to a host build environment. A
>  simple example from ``meta/lib/oeqa/runtime/cases/python.py`` contains
> -the following:class PythonTest(OERuntimeTestCase):
> -@OETestDepends(['ssh.SSHTest.test_ssh']) @OEHasPackage(['python3-core']=
)
> -def test_python3(self): cmd =3D "python3 -c \\"import codecs;
> -print(codecs.encode('Uryyb, jbeyq', 'rot13'))\"" status, output =3D
> -self.target.run(cmd) msg =3D 'Exit status was not 0. Output: %s' % outp=
ut
> -self.assertEqual(status, 0, msg=3Dmsg)
> -
> -In this example, the ```OERuntimeTestCase`` <>`__ class wraps
> +the following::
> +
> +   class PythonTest(OERuntimeTestCase):
> +      @OETestDepends(['ssh.SSHTest.test_ssh'])
> +      @OEHasPackage(['python3-core'])
> +      def test_python3(self):
> +         cmd =3D "python3 -c \\"import codecs; print(codecs.encode('Ury=
yb,
> jbeyq', 'rot13'))\""
> +         status, output =3D self.target.run(cmd)
> +         msg =3D 'Exit status was not 0. Output: %s' % output
> +         self.assertEqual(status, 0, msg=3Dmsg)
> +
> +In this example, the ``OERuntimeTestCase`` class wraps
>  ``unittest.TestCase``. Within the test, ``self.target`` represents the
>  target system, where commands can be run on it using the ``run()``
>  method.
> @@ -402,19 +439,30 @@ the image.
>
>  These tests are run against built extensible SDKs (eSDKs). The tests ca=
n
>  assume that the eSDK environment has already been setup. An example fro=
m
> -``meta/lib/oeqa/sdk/cases/devtool.py`` contains the following:class
> -DevtoolTest(OESDKExtTestCase): @classmethod def setUpClass(cls):
> -myapp_src =3D os.path.join(cls.tc.esdk_files_dir, "myapp") cls.myapp_ds=
t =3D
> -os.path.join(cls.tc.sdk_dir, "myapp") shutil.copytree(myapp_src,
> -cls.myapp_dst) subprocess.check_output(['git', 'init', '.'],
> -cwd=3Dcls.myapp_dst) subprocess.check_output(['git', 'add', '.'],
> -cwd=3Dcls.myapp_dst) subprocess.check_output(['git', 'commit', '-m',
> -"'test commit'"], cwd=3Dcls.myapp_dst) @classmethod def
> -tearDownClass(cls): shutil.rmtree(cls.myapp_dst) def
> -\_test_devtool_build(self, directory): self._run('devtool add myapp %s'
> -% directory) try: self._run('devtool build myapp') finally:
> -self._run('devtool reset myapp') def test_devtool_build_make(self):
> -self._test_devtool_build(self.myapp_dst)In this example, the ``devtool`=
`
> +``meta/lib/oeqa/sdk/cases/devtool.py`` contains the following::
> +
> +   class DevtoolTest(OESDKExtTestCase):
> +      @classmethod def setUpClass(cls):
> +         myapp_src =3D os.path.join(cls.tc.esdk_files_dir, "myapp")
> +         cls.myapp_dst =3D os.path.join(cls.tc.sdk_dir, "myapp")
> +         shutil.copytree(myapp_src, cls.myapp_dst)
> +         subprocess.check_output(['git', 'init', '.'], cwd=3Dcls.myapp_=
dst)
> +         subprocess.check_output(['git', 'add', '.'], cwd=3Dcls.myapp_d=
st)
> +         subprocess.check_output(['git', 'commit', '-m', "'test
> commit'"], cwd=3Dcls.myapp_dst)
> +
> +      @classmethod
> +      def tearDownClass(cls):
> +         shutil.rmtree(cls.myapp_dst)
> +      def _test_devtool_build(self, directory):
> +         self._run('devtool add myapp %s' % directory)
> +         try:
> +         self._run('devtool build myapp')
> +         finally:
> +         self._run('devtool reset myapp')
> +      def test_devtool_build_make(self):
> +         self._test_devtool_build(self.myapp_dst)
> +
> +In this example, the ``devtool``
>  command is tested to see whether a sample application can be built with
>  the ``devtool build`` command within the eSDK.
>
> @@ -426,14 +474,20 @@ the ``devtool build`` command within the eSDK.
>  These tests are run against built SDKs. The tests can assume that an SD=
K
>  has already been extracted and its environment file has been sourced. A
>  simple example from ``meta/lib/oeqa/sdk/cases/python2.py`` contains the
> -following:class Python3Test(OESDKTestCase): def setUp(self): if not
> -(self.tc.hasHostPackage("nativesdk-python3-core") or
> -self.tc.hasHostPackage("python3-core-native")): raise
> -unittest.SkipTest("No python3 package in the SDK") def
> -test_python3(self): cmd =3D "python3 -c \\"import codecs;
> -print(codecs.encode('Uryyb, jbeyq', 'rot13'))\"" output =3D self._run(c=
md)
> -self.assertEqual(output, "Hello, world\n")In this example, if
> -nativesdk-python3-core has been installed into the SDK, the code runs
> +following::
> +
> +   class Python3Test(OESDKTestCase):
> +      def setUp(self):
> +            if not (self.tc.hasHostPackage("nativesdk-python3-core") or
> +                  self.tc.hasHostPackage("python3-core-native")):
> +               raise unittest.SkipTest("No python3 package in the SDK")
> +
> +      def test_python3(self):
> +            cmd =3D "python3 -c \\"import codecs;
> print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
> +            output =3D self._run(cmd)
> +            self.assertEqual(output, "Hello, world\n")
> +
> +In this example, if nativesdk-python3-core has been installed into the
> SDK, the code runs
>  the python3 interpreter with a basic command to check it is working
>  correctly. The test would only run if python3 is installed in the SDK.
>
> @@ -444,17 +498,25 @@ correctly. The test would only run if python3 is
> installed in the SDK.
>
>  The performance tests usually measure how long operations take and the
>  resource utilisation as that happens. An example from
> -``meta/lib/oeqa/buildperf/test_basic.py`` contains the following:class
> -Test3(BuildPerfTestCase): def test3(self): """Bitbake parsing (bitbake
> --p)""" # Drop all caches and parse self.rm_cache()
> -oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'), True)
> -self.measure_cmd_resources(['bitbake', '-p'], 'parse_1', 'bitbake -p (n=
o
> -caches)') # Drop tmp/cache
> -oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'), True)
> -self.measure_cmd_resources(['bitbake', '-p'], 'parse_2', 'bitbake -p (n=
o
> -tmp/cache)') # Parse with fully cached data
> -self.measure_cmd_resources(['bitbake', '-p'], 'parse_3', 'bitbake -p
> -(cached)')This example shows how three specific parsing timings are
> +``meta/lib/oeqa/buildperf/test_basic.py`` contains the following::
> +
> +   class Test3(BuildPerfTestCase):
> +      def test3(self):
> +            """Bitbake parsing (bitbake -p)"""
> +            # Drop all caches and parse
> +            self.rm_cache()
> +            oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'=
),
> True)
> +            self.measure_cmd_resources(['bitbake', '-p'], 'parse_1',
> +                     'bitbake -p (no caches)')
> +            # Drop tmp/cache
> +            oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'=
),
> True)
> +            self.measure_cmd_resources(['bitbake', '-p'], 'parse_2',
> +                     'bitbake -p (no tmp/cache)')
> +            # Parse with fully cached data
> +            self.measure_cmd_resources(['bitbake', '-p'], 'parse_3',
> +                     'bitbake -p (cached)')
> +
> +This example shows how three specific parsing timings are
>  measured, with and without various caches, to show how BitBake=E2=80=99=
s parsing
>  performance trends over time.
>
> diff --git
> a/documentation/test-manual/test-manual-understand-autobuilder.rst
> b/documentation/test-manual/test-manual-understand-autobuilder.rst
> index 8d3c84415..0d987d245 100644
> --- a/documentation/test-manual/test-manual-understand-autobuilder.rst
> +++ b/documentation/test-manual/test-manual-understand-autobuilder.rst
> @@ -20,32 +20,48 @@ each of those targets on a seperate buildbot worker.
> To understand the
>  configuration, you need to look at the entry on ``config.json`` file
>  within the ``yocto-autobuilder-helper`` repository. The targets are
>  defined in the =E2=80=98overrides=E2=80=99 section, a quick example cou=
ld be qemux86-64
> -which looks like:"qemux86-64" : { "MACHINE" : "qemux86-64", "TEMPLATE" =
:
> -"arch-qemu", "step1" : { "extravars" : [ "IMAGE_FSTYPES_append =3D ' wi=
c
> -wic.bmap'" ] } },And to expand that, you need the =E2=80=9Carch-qemu=E2=
=
=80=9D entry from
> -the =E2=80=9Ctemplates=E2=80=9D section, which looks like:"arch-qemu" :=
 { "BUILDINFO" :
> -true, "BUILDHISTORY" : true, "step1" : { "BBTARGETS" : "core-image-sato
> -core-image-sato-dev core-image-sato-sdk core-image-minimal
> -core-image-minimal-dev core-image-sato:do_populate_sdk", "SANITYTARGETS=
"
> -: "core-image-minimal:do_testimage core-image-sato:do_testimage
> -core-image-sato-sdk:do_testimage core-image-sato:do_testsdk" }, "step2"
> -: { "SDKMACHINE" : "x86_64", "BBTARGETS" :
> -"core-image-sato:do_populate_sdk core-image-minimal:do_populate_sdk_ext
> -core-image-sato:do_populate_sdk_ext", "SANITYTARGETS" :
> -"core-image-sato:do_testsdk core-image-minimal:do_testsdkext
> -core-image-sato:do_testsdkext" }, "step3" : { "BUILDHISTORY" : false,
> -"EXTRACMDS" : ["${SCRIPTSDIR}/checkvnc; DISPLAY=3D:1 oe-selftest
> -${HELPERSTMACHTARGS} -j 15"], "ADDLAYER" :
> -["${BUILDDIR}/../meta-selftest"] } },Combining these two entries you ca=
n
> -see that =E2=80=9Cqemux86-64=E2=80=9D is a three step build where the
> -``bitbake BBTARGETS`` would be run, then ``bitbake
> -                SANITYTARGETS`` for each step; all for
> +which looks like::
> +
> +   "qemux86-64" : {
> +         "MACHINE" : "qemux86-64",
> +         "TEMPLATE" : "arch-qemu",
> +         "step1" : {
> +               "extravars" : [
> +                     "IMAGE_FSTYPES_append =3D ' wic wic.bmap'"
> +                    ]
> +        }
> +   },
> +
> +And to expand that, you need the =E2=80=9Carch-qemu=E2=80=9D entry from
> +the =E2=80=9Ctemplates=E2=80=9D section, which looks like::
> +
> +   "arch-qemu" : {
> +         "BUILDINFO" : true,
> +         "BUILDHISTORY" : true,
> +         "step1" : {
> +               "BBTARGETS" : "core-image-sato core-image-sato-dev
> core-image-sato-sdk core-image-minimal core-image-minimal-dev
> core-image-sato:do_populate_sdk",
> +         "SANITYTARGETS" : "core-image-minimal:do_testimage
> core-image-sato:do_testimage core-image-sato-sdk:do_testimage
> core-image-sato:do_testsdk"
> +         },
> +         "step2" : {
> +               "SDKMACHINE" : "x86_64",
> +               "BBTARGETS" : "core-image-sato:do_populate_sdk
> core-image-minimal:do_populate_sdk_ext
> core-image-sato:do_populate_sdk_ext",
> +               "SANITYTARGETS" : "core-image-sato:do_testsdk
> core-image-minimal:do_testsdkext core-image-sato:do_testsdkext"
> +         },
> +         "step3" : {
> +               "BUILDHISTORY" : false,
> +               "EXTRACMDS" : ["${SCRIPTSDIR}/checkvnc; DISPLAY=3D:1
> oe-selftest ${HELPERSTMACHTARGS} -j 15"],
> +               "ADDLAYER" : ["${BUILDDIR}/../meta-selftest"]
> +         }
> +   },
> +
> +Combining these two entries you can see that =E2=80=9Cqemux86-64=E2=80=
=9D is a three step
> build where the
> +``bitbake BBTARGETS`` would be run, then ``bitbake SANITYTARGETS`` for
> each step; all for
>  ``MACHINE=3D=E2=80=9Dqemx86-64=E2=80=9D`` but with differing SDKMACHINE=
 settings. In step
>  1 an extra variable is added to the ``auto.conf`` file to enable wic
>  image generation.
>
>  While not every detail of this is covered here, you can see how the
> -templating mechanism allows quite complex configurations to be built up
> +template mechanism allows quite complex configurations to be built up
>

why? let's stick to the original .xml file, we can fix the doc later.


>  yet allows duplication and repetition to be kept to a minimum.
>
>  The different build targets are designed to allow for parallelisation,
> @@ -70,7 +86,7 @@ roughly consist of:
>
>     This cleans out any previous build. Old builds are left around to
>     allow easier debugging of failed builds. For additional information,
> -   see ```clobberdir`` <#test-clobberdir>`__.
> +   see :ref:`test-clobberdir`.
>

It works. However we are now using autosectionlabel which creates sections
labels for headings automatically. So I would like to get rid of all custo=
m
labels, as much as possible. the following is preferred:
:ref:`test-manual/test-manual-understand-autobuilder:clobberdir>`

I know we've left some links like that in other manuals. So it's not
strictly required to change it now.


>  2. *Obtain yocto-autobuilder-helper*
>
> @@ -94,7 +110,7 @@ roughly consist of:
>     from the ``layerinfo.json`` file to help understand the
>     configuration. It will also use a local cache of repositories to
>     speed up the clone checkouts. For additional information, see
> -   `Autobuilder Clone Cache <#test-autobuilder-clone-cache>`__.
> +   :ref:`test-autobuilder-clone-cache`.
>

same here (and probably in other places)


>
>     This step has two possible modes of operation. If the build is part
>     of a parent build, its possible that all the repositories needed may
> @@ -137,8 +153,7 @@ special script that moves files to a special locatio=
n,
> rather than
>  deleting them. Files in this location are deleted by an ``rm`` command,
>  which is run under ``ionice -c 3``. For example, the deletion only
>  happens when there is idle IO capacity on the Worker. The Autobuilder
> -Worker Janitor runs this deletion. See `Autobuilder Worker
> -Janitor <#test-autobuilder-worker-janitor>`__.
> +Worker Janitor runs this deletion. See
> :ref:`test-autobuilder-worker-janitor`.
>
>  .. _test-autobuilder-clone-cache:
>
> @@ -150,8 +165,8 @@ on the Autobuilder. We therefore have a stash of
> commonly used
>  repositories pre-cloned on the Workers. Data is fetched from these
>  during clones first, then "topped up" with later revisions from any
>  upstream when necesary. The cache is maintained by the Autobuilder
> -Worker Janitor. See `Autobuilder Worker
> -Janitor <#test-autobuilder-worker-janitor>`__.
> +Worker Janitor. See :ref:`Autobuilder Worker
> +Janitor`.
>
>  .. _test-autobuilder-worker-janitor:
>
> @@ -159,8 +174,8 @@ Autobuilder Worker Janitor
>  --------------------------
>
>  This is a process running on each Worker that performs two basic
> -operations, including background file deletion at IO idle (see `Target
> -Execution: clobberdir <#test-list-tgt-exec-clobberdir>`__) and
> +operations, including background file deletion at IO idle (see Target
> +Execution: clobberdir :ref:`test-list-tgt-exec-clobberdir`) and
>

the link and text look wrong here. the link is not on the 'text'


>  maintainenance of a cache of cloned repositories to improve the speed
>  the system can checkout repositories.
>
> @@ -216,9 +231,6 @@ are general setup steps that are run once and includ=
e:
>  For each step that is configured in ``config.json``, it will perform th=
e
>  following:
>
> -## WRITER's question: What does "logging in as stepXa" and others refer
> -to below? ##
>

you can keep comment with the ".. xxx" syntax.


> -
>  1. Add any layers that are specified using the
>     ``bitbake-layers add-layer`` command (logging as stepXa)
>
> @@ -235,9 +247,8 @@ to below? ##
>  6. Run the ``EXTRAPLAINCMDS`` command(s), which are run outside the
>     BitBake build environment (logging as stepXd)
>
> -7. Remove any layers added in `step
> -   1 <#test-run-config-add-layers-step>`__ using the
> -   ``bitbake-layers remove-layer`` command (logging as stepXa)
> +7. Remove any layers added in step
> +   1 using the ``bitbake-layers remove-layer`` command (logging as step=
Xa)
>

you removed a link here, no?

>
>  Once the execution steps above complete, ``run-config`` executes a set
>  of post-build steps, including:
> @@ -252,7 +263,7 @@ of post-build steps, including:
>     generated to the remote server.
>
>  4. Cleanup the build directory using
> -   ```clobberdir`` <#test-clobberdir>`__ if the build was successful,
> +   :ref:`test-clobberdir` if the build was successful,
>     else rename it to =E2=80=9Cbuild-renamed=E2=80=9D for potential futu=
re debugging.
>
>  .. _test-deploying-yp-autobuilder:
> @@ -279,11 +290,18 @@ The standard ``config.json`` minimally attempts to
> allow substitution of
>  the paths. The Helper script repository includes a
>  ``local-example.json`` file to show how you could override these from a
>  separate configuration file. Pass the following into the environment of
> -the Autobuilder:$ ABHELPER_JSON=3D"config.json local-example.json"As
> -another example, you could also pass the following into the
> -environment:$ ABHELPER_JSON=3D"config.json /some/location/local.json"On=
e
> -issue users often run into is validation of the ``config.json`` files. =
A
> +the Autobuilder::
> +
> +   $ ABHELPER_JSON=3D"config.json local-example.json"
> +
> +As another example, you could also pass the following into the
> +environment::
> +
> +   $ ABHELPER_JSON=3D"config.json /some/location/local.json"
> +
> +One issue users often run into is validation of the ``config.json``
> files. A
>  tip for minimizing issues from invalid json files is to use a Git
>  ``pre-commit-hook.sh`` script to verify the JSON file before committing
> -it. Create a symbolic link as follows:$ ln -s
> -../../scripts/pre-commit-hook.sh .git/hooks/pre-commit
> +it. Create a symbolic link as follows::
> +
> +   $ ln -s ../../scripts/pre-commit-hook.sh .git/hooks/pre-commit
> --
> 2.17.1
>
>=20
>

--000000000000f834bf05af53faa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi Mark,</div><div><br></div><div>many thanks for you=
r help!=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Sep 15, 2020 at 1:16 AM Mark Morton &lt;<a href=3D"mai=
lto:Mark.Morton@windriver.com">Mark.Morton@windriver.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Mark=
 Morton &lt;<a href=3D"mailto:mark.morton@windriver.com" target=3D"_blank">=
mark.morton@windriver.com</a>&gt;<br>
---<br>
=C2=A0documentation/conf.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../test-manual/test-manual-intro.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 266 +++++++++++-------<br>
=C2=A0.../test-manual-understand-autobuilder.rst=C2=A0 =C2=A0 | 102 ++++--=
-<br>
=C2=A03 files changed, 226 insertions(+), 146 deletions(-)<br>
<br>
diff --git a/documentation/conf.py b/documentation/conf.py<br>
index e1a7e5e3d..e825fbf6e 100644<br>
--- a/documentation/conf.py<br>
+++ b/documentation/conf.py<br>
@@ -42,8 +42,8 @@ sys.path.insert(0, os.path.abspath(&#39;sphinx&#39;))<br=
>
=C2=A0extensions =3D [<br>
=C2=A0 =C2=A0 =C2=A0&#39;sphinx.ext.autosectionlabel&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;sphinx.ext.extlinks&#39;,<br>
-=C2=A0 =C2=A0 &#39;sphinx.ext.intersphinx&#39;,<br>
-=C2=A0 =C2=A0 &#39;yocto-vars&#39;<br>
+=C2=A0 =C2=A0 &#39;sphinx.ext.intersphinx&#39;<br>
+ #=C2=A0 =C2=A0&#39;yocto-vars&#39;<br>
=C2=A0]<br></blockquote><div><br></div><div>This extension doesn&#39;t wor=
k with Python2. To be honest, I don&#39;t think i want to bother with Pytho=
n2 at this point. I am not even sure how well Sphinx is expected to work wi=
th Python2, so we should make clear=C2=A0 that our doc system requires Pyth=
on3, and we need to write clear instructions for users who have Python3 on =
their host as &#39;default&#39; vs users who still have Python2 (which is t=
he problem you faced)</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
=C2=A0autosectionlabel_prefix_document =3D True<br>
<br>
diff --git a/documentation/test-manual/test-manual-intro.rst b/documentati=
on/test-manual/test-manual-intro.rst<br>
index 2f11e2beb..d68ab73f4 100644<br>
--- a/documentation/test-manual/test-manual-intro.rst<br>
+++ b/documentation/test-manual/test-manual-intro.rst<br>
@@ -23,26 +23,25 @@ project core.<br>
<br>
=C2=A0Currently, the Yocto Project Test Environment Manual has no projecte=
d<br>
=C2=A0release date. This manual is a work-in-progress and is being initial=
ly<br>
-loaded with information from the `README &lt;&gt;`__ files and notes from=
 key<br>
+loaded with information from the README files and notes from key<br>
=C2=A0engineers:<br>
<br>
--=C2=A0 *``yocto-autobuilder2``:* This<br>
-=C2=A0 =C2=A0```README.md`<a href=3D"http://git.yoctoproject.org/clean/cg=
it.cgi/yocto-autobuilder2/tree/README.md" rel=3D"noreferrer" target=3D"_bla=
nk">http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobuilder2/tree/READ=
ME.md</a><br>
+-=C2=A0 *yocto-autobuilder2:* This<br>
+=C2=A0 =C2=A0`README.md &lt;<a href=3D"http://git.yoctoproject.org/clean/=
cgit.cgi/yocto-autobuilder2/tree/README.md" rel=3D"noreferrer" target=3D"_b=
lank">http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobuilder2/tree/RE=
ADME.md</a>&gt;`__<br></blockquote><div><br></div><div>that works. However =
for links to git trees, we are using the :yocto_git: extlink , such as (fro=
m the BSP guide):</div><div>:yocto_git:`README.md &lt;/cgit.cgi/meta-raspbe=
rrypi/tree/README.md&gt;`<br></div><div>We should standardize on that.</div=
><div>I think i will eventually make sure we don&#39;t even need /cgit.git =
in the link name, but for now it&#39;s needed.=C2=A0</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 is the main README which detials how to set up the Yocto Pro=
ject<br>
=C2=A0 =C2=A0 Autobuilder. The ``yocto-autobuilder2`` repository represent=
s the<br>
=C2=A0 =C2=A0 Yocto Project&#39;s console UI plugin to Buildbot and the co=
nfiguration<br>
=C2=A0 =C2=A0 necessary to configure Buildbot to perform the testing the p=
roject<br>
=C2=A0 =C2=A0 requires.<br>
<br>
--=C2=A0 *``yocto-autobuilder-helper``:* This<br>
-=C2=A0 =C2=A0```README`<a href=3D"http://git.yoctoproject.org/clean/cgit.=
cgi/yocto-autobuilder-helper/tree/README" rel=3D"noreferrer" target=3D"_bla=
nk">http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobuilder-helper/tre=
e/README</a><br>
+-=C2=A0 *yocto-autobuilder-helper:* This `README &lt;<a href=3D"http://gi=
t.yoctoproject.org/clean/cgit.cgi/yocto-autobuilder-helper/tree/README/" re=
l=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/clean/cgit.c=
gi/yocto-autobuilder-helper/tree/README/</a>&gt;`__<br>
=C2=A0 =C2=A0 and repository contains Yocto Project Autobuilder Helper scr=
ipts and<br>
=C2=A0 =C2=A0 configuration. The ``yocto-autobuilder-helper`` repository c=
ontains<br>
=C2=A0 =C2=A0 the &quot;glue&quot; logic that defines which tests to run a=
nd how to run them.<br>
=C2=A0 =C2=A0 As a result, it can be used by any Continuous Improvement (C=
I) system<br>
=C2=A0 =C2=A0 to run builds, support getting the correct code revisions, c=
onfigure<br>
=C2=A0 =C2=A0 builds and layers, run builds, and collect results. The code=
 is<br>
-=C2=A0 =C2=A0independent of any CI system, which means the code can work =
Buildbot,<br>
+=C2=A0 =C2=A0independent of any CI system, which means the code can work =
`Buildbot &lt;<a href=3D"https://docs.buildbot.net/0.9.15.post1/" rel=3D"no=
referrer" target=3D"_blank">https://docs.buildbot.net/0.9.15.post1/</a>&gt;=
`__,<br></blockquote><div><br></div><div>this is a new link you created whi=
ch was not in the original Docbook, right? Perhaps best to have that in a s=
eparate patch if you think it&#39;s needed.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 Jenkins, or others. This repository has a branch per release=
 of the<br>
=C2=A0 =C2=A0 project defining the tests to run on a per release basis.<br=
>
<br>
@@ -66,9 +65,9 @@ that the Yocto Project customizes using code from the<br=
>
=C2=A0resulting UI plug-in allows you to visualize builds in a way suited =
to<br>
=C2=A0the project&#39;s needs.<br>
<br>
-A ``helper`` layer provides configuration and job management through<br>
+A helper layer provides configuration and job management through<br></blo=
ckquote><div><br></div><div>Why? &#39;helper&#39; is inside a &lt;filename&=
gt; tag in docbook to make it verbatim in the output, why did you remove it=
?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0scripts found in the ``yocto-autobuilder-helper`` repository. The<br=
>
-``helper`` layer contains the bulk of the build configuration<br>
+helper layer contains the bulk of the build configuration<br>
=C2=A0information and is release-specific, which makes it highly customiza=
ble<br>
=C2=A0on a per-project basis. The layer is CI system-agnostic and contains=
 a<br>
=C2=A0number of Helper scripts that can generate build configurations from=
<br>
@@ -124,18 +123,21 @@ thefollowing types of tests:<br>
=C2=A0 =C2=A0 ensure we have no single point of failure and can ensure the=
<br>
=C2=A0 =C2=A0 different distros work effectively.<br>
<br>
--=C2=A0 *eSDK Testing:* Image tests initiated through the following comma=
nd:<br>
-=C2=A0 =C2=A0$ bitbake image -c testsdkext The tests utilize the ``testsd=
kext``<br>
-=C2=A0 =C2=A0class and the ``do_testsdkext`` task.<br>
+-=C2=A0 *eSDK Testing:* Image tests initiated through the following comma=
nd::<br></blockquote><div><br></div><div>does that work? I&#39;ve always do=
ne &quot;: ::&quot; to keep the semi column, and I thought the :: needed a =
space before.=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+<br>
+=C2=A0 =C2=A0$ bitbake image -c testsdkext <br></blockquote><div>Indentat=
ion is not typical here. you need 3 space starting from the previous indent=
ation level.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0The tests utilize the ``testsdkext`` class and the ``do_test=
sdkext`` task.<br></blockquote><div>this sentence above is no in the code-b=
lock, it should not be at the same indentation level as the code block.</di=
v><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0-=C2=A0 *Feature Testing:* Various scenario-based tests are run thro=
ugh the<br>
-=C2=A0 =C2=A0`OpenEmbedded<br>
-=C2=A0 =C2=A0Self-Test &lt;&amp;YOCTO_DOCS_REF_URL;#testing-and-quality-a=
ssurance&gt;`__<br>
-=C2=A0 =C2=A0(oe-selftest). We test oe-selftest on each of the main distr=
ubutions<br>
+=C2=A0 =C2=A0:ref:`OpenEmbedded Self test (oe-selftest) &lt;ref-manual/re=
f-release-process:Testing and Quality Assurance&gt;`. We test oe-selftest o=
n each of the main distrubutions<br>
=C2=A0 =C2=A0 we support.<br></blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
--=C2=A0 *Image Testing:* Image tests initiated through the following comm=
and:<br>
-=C2=A0 =C2=A0$ bitbake image -c testimage The tests utilize the<br>
+-=C2=A0 *Image Testing:* Image tests initiated through the following comm=
and::<br>
+<br>
+=C2=A0 =C2=A0$ bitbake image -c testimage <br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0The tests utilize the<br></blockquote><div>Need to fix inden=
tation here</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
=C2=A0 =C2=A0 :ref:`testimage* &lt;ref-classes-testimage*&gt;`<br>
=C2=A0 =C2=A0 classes and the<br>
=C2=A0 =C2=A0 :ref:`ref-tasks-testimage` task.<br>
@@ -147,8 +149,8 @@ thefollowing types of tests:<br>
<br>
=C2=A0-=C2=A0 *Package Testing:* A Package Test (ptest) runs tests against=
 packages<br>
=C2=A0 =C2=A0 built by the OpenEmbedded build system on the target machine=
. See the<br>
-=C2=A0 =C2=A0&quot;`Testing Packages With<br>
-=C2=A0 =C2=A0ptest &lt;&amp;YOCTO_DOCS_DEV_URL;#testing-packages-with-pte=
st&gt;`__&quot; section<br>
+=C2=A0 =C2=A0:ref:`Testing Packages With<br>
+=C2=A0 =C2=A0ptest &lt;dev-manual/dev-manual-common-tasks:Testing Package=
s With ptest&gt;` section<br>
=C2=A0 =C2=A0 in the Yocto Project Development Tasks Manual and the<br>
=C2=A0 =C2=A0 &quot;:yocto_wiki:`Ptest &lt;/wiki/Ptest&gt;`&quot; Wiki pag=
e for more<br>
=C2=A0 =C2=A0 information on Ptest.<br>
@@ -159,8 +161,8 @@ thefollowing types of tests:<br>
=C2=A0 =C2=A0 the ``do_testsdk`` task.<br>
<br>
=C2=A0-=C2=A0 *Unit Testing:* Unit tests on various components of the syst=
em run<br>
-=C2=A0 =C2=A0through ``oe-selftest`` and<br>
-=C2=A0 =C2=A0```bitbake-selftest`` &lt;&amp;YOCTO_DOCS_REF_URL;#testing-a=
nd-quality-assurance&gt;`__.<br>
+=C2=A0 =C2=A0through :ref:`bitbake-selftest &lt;ref-manual/ref-release-pr=
ocess:Testing and Quality Assurance&gt;` and<br>
+=C2=A0 =C2=A0:ref:`oe-selftest &lt;ref-manual/ref-release-process:Testing=
 and Quality Assurance&gt;`.<br></blockquote><div><br></div><div>the link i=
s on bitbake-selftest, not oe-selftest (you added it).</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0-=C2=A0 *Automatic Upgrade Helper:* This target tests whether new ve=
rsions of<br>
=C2=A0 =C2=A0 software are available and whether we can automatically upgr=
ade to<br>
@@ -174,36 +176,43 @@ How Tests Map to Areas of Code<br>
<br>
=C2=A0Tests map into the codebase as follows:<br>
<br>
--=C2=A0 *bitbake-selftest*:<br>
+-=C2=A0 *bitbake-selftest:*<br>
<br>
=C2=A0 =C2=A0 These tests are self-contained and test BitBake as well as i=
ts APIs,<br>
=C2=A0 =C2=A0 which include the fetchers. The tests are located in<br>
=C2=A0 =C2=A0 ``bitbake/lib/*/tests``.<br>
<br>
-=C2=A0 =C2=A0From within the BitBake repository, run the following: $<br>
-=C2=A0 =C2=A0bitbake-selftest<br>
+=C2=A0 =C2=A0From within the BitBake repository, run the following::=C2=
=A0 =C2=A0<br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0$ bitbake-selftest<br></blockquote><div><br></div><div>inden=
tation and use of :: are not right (please check all other occurrences)</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 To skip tests that access the Internet, use the ``BB_SKIP_NE=
TTEST``<br>
-=C2=A0 =C2=A0variable when running &quot;bitbake-selftest&quot; as follow=
s: $<br>
-=C2=A0 =C2=A0BB_SKIP_NETTEST=3Dyes bitbake-selftest<br>
+=C2=A0 =C2=A0variable when running &quot;bitbake-selftest&quot; as follow=
s:: <br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0$ BB_SKIP_NETTEST=3Dyes bitbake-selftest<br>
<br>
=C2=A0 =C2=A0 The default output is quiet and just prints a summary of wha=
t was<br>
-=C2=A0 =C2=A0run. To see more information, there is a verbose option:$<br=
>
-=C2=A0 =C2=A0bitbake-selftest -v<br>
+=C2=A0 =C2=A0run. To see more information, there is a verbose option::<br=
>
+=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0$ bitbake-selftest -v<br>
<br>
=C2=A0 =C2=A0 Use this option when you wish to skip tests that access the =
network,<br>
=C2=A0 =C2=A0 which are mostly necessary to test the fetcher modules. To s=
pecify<br>
=C2=A0 =C2=A0 individual test modules to run, append the test module name =
to the<br>
=C2=A0 =C2=A0 &quot;bitbake-selftest&quot; command. For example, to specif=
y the tests for the<br>
-=C2=A0 =C2=A0bb.data.module, run: $ bitbake-selftest bb.test.data.moduleY=
ou can<br>
-=C2=A0 =C2=A0also specify individual tests by defining the full name and =
module<br>
-=C2=A0 =C2=A0plus the class path of the test, for example: $ bitbake-self=
test<br>
-=C2=A0 =C2=A0bb.tests.data.TestOverrides.test_one_override<br>
+=C2=A0 =C2=A0bb.data.module, run:: <br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0$ bitbake-selftest bb.test.data.module<br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0You can also specify individual tests by defining the full n=
ame and module<br>
+=C2=A0 =C2=A0plus the class path of the test, for example:: <br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0$ bitbake-selftest bb.tests.data.TestOverrides.test_one_over=
ride<br>
<br>
=C2=A0 =C2=A0 The tests are based on `Python<br>
=C2=A0 =C2=A0 unittest &lt;<a href=3D"https://docs.python.org/3/library/un=
ittest.html" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/3=
/library/unittest.html</a>&gt;`__.<br>
<br>
--=C2=A0 *oe-selftest*:<br>
+-=C2=A0 *oe-selftest:*<br>
<br>
=C2=A0 =C2=A0 -=C2=A0 These tests use OE to test the workflows, which incl=
ude testing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0specific features, behaviors of tasks, and API =
unit tests.<br>
@@ -219,16 +228,25 @@ Tests map into the codebase as follows:<br>
=C2=A0 =C2=A0 -=C2=A0 The code for the tests resides in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0``meta/lib/oeqa/selftest/cases/``.<br>
<br>
-=C2=A0 =C2=A0-=C2=A0 To run all the tests, enter the following command: $=
 oe-selftest<br>
-=C2=A0 =C2=A0 =C2=A0 -a<br>
+=C2=A0 =C2=A0-=C2=A0 To run all the tests, enter the following command:: =
<br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 $ oe-selftest -a<br>
<br>
=C2=A0 =C2=A0 -=C2=A0 To run a specific test, use the following command fo=
rm where<br>
-=C2=A0 =C2=A0 =C2=A0 testname is the name of the specific test: $ oe-self=
test -r<br>
-=C2=A0 =C2=A0 =C2=A0 testname For example, the following command would ru=
n the tinfoil<br>
-=C2=A0 =C2=A0 =C2=A0 getVar API test:$ oe-selftest -r<br>
-=C2=A0 =C2=A0 =C2=A0 tinfoil.TinfoilTests.test_getvarIt is also possible =
to run a set<br>
+=C2=A0 =C2=A0 =C2=A0 testname is the name of the specific test:: <br>
+=C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 $ oe-selftest -r &lt;testname&gt; <br>
+=C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 For example, the following command would run the tin=
foil<br>
+=C2=A0 =C2=A0 =C2=A0 getVar API test::<br>
+=C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 $ oe-selftest -r tinfoil.TinfoilTests.test_getvar<br=
>
+=C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 It is also possible to run a set<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0of tests. For example the following command wil=
l run all of the<br>
-=C2=A0 =C2=A0 =C2=A0 tinfoil tests:$ oe-selftest -r tinfoil<br>
+=C2=A0 =C2=A0 =C2=A0 tinfoil tests::<br>
+=C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 $ oe-selftest -r tinfoil<br>
<br>
=C2=A0-=C2=A0 *testimage:*<br>
<br>
@@ -240,10 +258,13 @@ Tests map into the codebase as follows:<br>
<br>
=C2=A0 =C2=A0 -=C2=A0 You need to set the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0:term:`IMAGE_CLASSES`<br>
-=C2=A0 =C2=A0 =C2=A0 variable as follows: IMAGE_CLASSES +=3D &quot;testim=
age&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 variable as follows::<br>
+=C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 IMAGE_CLASSES +=3D &quot;testimage&quot;<br>
<br>
-=C2=A0 =C2=A0-=C2=A0 Run the tests using the following command form: $ bi=
tbake image -c<br>
-=C2=A0 =C2=A0 =C2=A0 testimage<br>
+=C2=A0 =C2=A0-=C2=A0 Run the tests using the following command form::<br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 $ bitbake image -c testimage<br>
<br>
=C2=A0-=C2=A0 *testsdk:*<br>
<br>
@@ -252,8 +273,9 @@ Tests map into the codebase as follows:<br>
<br>
=C2=A0 =C2=A0 -=C2=A0 The code for these tests resides in ``meta/lib/oeqa/=
sdk/cases/``.<br>
<br>
-=C2=A0 =C2=A0-=C2=A0 Run the test using the following command form: $ bit=
bake image -c<br>
-=C2=A0 =C2=A0 =C2=A0 testsdk<br>
+=C2=A0 =C2=A0-=C2=A0 Run the test using the following command form::<br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 $ bitbake image -c testsdk<br>
<br>
=C2=A0-=C2=A0 *testsdk_ext:*<br>
<br>
@@ -262,8 +284,9 @@ Tests map into the codebase as follows:<br>
<br>
=C2=A0 =C2=A0 -=C2=A0 The code for these tests resides in ``meta/lib/oeqa/=
esdk``.<br>
<br>
-=C2=A0 =C2=A0-=C2=A0 To run the tests, use the following command form: $ =
bitbake image<br>
-=C2=A0 =C2=A0 =C2=A0 -c testsdkext<br>
+=C2=A0 =C2=A0-=C2=A0 To run the tests, use the following command form::<b=
r>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 $ bitbake image -c testsdkext<br>
<br>
=C2=A0-=C2=A0 *oe-build-perf-test:*<br>
<br>
@@ -272,8 +295,11 @@ Tests map into the codebase as follows:<br>
<br>
=C2=A0 =C2=A0 -=C2=A0 The code for these tests resides in ``meta/lib/oeqa/=
buildperf``.<br>
<br>
-=C2=A0 =C2=A0-=C2=A0 To run the tests, use the following command form: $<=
br>
-=C2=A0 =C2=A0 =C2=A0 oe-build-perf-test optionsThe command takes a number=
 of options,<br>
+=C2=A0 =C2=A0-=C2=A0 To run the tests, use the following command form::<b=
r>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 $ oe-build-perf-test &lt;options&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 The command takes a number of options,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0such as where to place the test results. The Au=
tobuilder Helper<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Scripts include the ``build-perf-test-wrapper``=
 script with<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0examples of how to use the oe-build-perf-test f=
rom the command<br>
@@ -308,14 +334,20 @@ directory.<br>
=C2=A0``bitbake-selftest``<br>
=C2=A0--------------------<br>
<br>
-A simple test example from ``lib/bb/tests/data.py`` is: class<br>
-DataExpansions(unittest.TestCase): def setUp(self): self.d =3D<br>
-bb.data.init() self.d[&quot;foo&quot;] =3D &quot;value_of_foo&quot; self.=
d[&quot;bar&quot;] =3D<br>
-&quot;value_of_bar&quot; self.d[&quot;value_of_foo&quot;] =3D &quot;value=
_of_&#39;value_of_foo&#39;&quot; def<br>
-test_one_var(self): val =3D self.d.expand(&quot;${foo}&quot;)<br>
-self.assertEqual(str(val), &quot;value_of_foo&quot;)<br>
+A simple test example from ``lib/bb/tests/data.py`` is::<br>
<br>
-In this example, a ```DataExpansions`` &lt;&gt;`__ class of tests is crea=
ted,<br>
+=C2=A0 =C2=A0class DataExpansions(unittest.TestCase): <br>
+=C2=A0 =C2=A0 =C2=A0 def setUp(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.d =3D bb.data.init() <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.d[&quot;foo&quot;] =3D &qu=
ot;value_of_foo&quot; <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.d[&quot;bar&quot;] =3D &qu=
ot;value_of_bar&quot; <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.d[&quot;value_of_foo&quot;=
] =3D &quot;value_of_&#39;value_of_foo&#39;&quot; <br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 def test_one_var(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D self.d.expand(&quot;${f=
oo}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(str(val), &quo=
t;value_of_foo&quot;)<br>
+<br>
+In this example, a ``DataExpansions`` class of tests is created,<br>
=C2=A0derived from standard python unittest. The class has a common ``setU=
p``<br>
=C2=A0function which is shared by all the tests in the class. A simple tes=
t is<br>
=C2=A0then added to test that when a variable is expanded, the correct val=
ue<br>
@@ -334,14 +366,15 @@ These tests are more complex due to the setup requir=
ed behind the scenes<br>
=C2=A0for full builds. Rather than directly using Python&#39;s unittest, t=
he code<br>
=C2=A0wraps most of the standard objects. The tests can be simple, such as=
<br>
=C2=A0testing a command from within the OE build environment using the<br>
-following example:class BitbakeLayers(OESelftestTestCase): def<br>
-test_bitbakelayers_showcrossdepends(self): result =3D<br>
-runCmd(&#39;bitbake-layers show-cross-depends&#39;) self.assertTrue(&#39;=
aspell&#39; in<br>
-result.output, msg =3D &quot;No dependencies were shown. bitbake-layers<b=
r>
-show-cross-depends output: %s&quot;% result.output)<br>
+following example::<br>
+<br>
+=C2=A0 =C2=A0class BitbakeLayers(OESelftestTestCase): <br>
+=C2=A0 =C2=A0 =C2=A0 def test_bitbakelayers_showcrossdepends(self): <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;bitbake-=
layers show-cross-depends&#39;) <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(&#39;aspell&#39=
; in result.output, msg =3D &quot;No dependencies were shown. bitbake-layer=
s show-cross-depends output: %s&quot;% result.output)<br>
<br>
=C2=A0This example, taken from ``meta/lib/oeqa/selftest/cases/bblayers.py`=
`,<br>
-creates a testcase from the ```OESelftestTestCase`` &lt;&gt;`__ class, de=
rived<br>
+creates a testcase from the ``OESelftestTestCase`` class, derived<br>
=C2=A0from ``unittest.TestCase``, which runs the ``bitbake-layers`` comman=
d<br>
=C2=A0and checks the output to ensure it contains something we know should=
 be<br>
=C2=A0here.<br>
@@ -367,7 +400,7 @@ so tests within a given test class should always run i=
n the same build,<br>
=C2=A0while tests in different classes or modules may be split into differ=
ent<br>
=C2=A0builds. There is no data store available for these tests since the t=
ests<br>
=C2=A0launch the ``bitbake`` command and exist outside of its context. As =
a<br>
-result, common bitbake library functions (bb.*) are also unavailable.<br>
+result, common bitbake library functions (bb.\*) are also unavailable.<br=
>
<br>
=C2=A0.. _testimage-example:<br>
<br>
@@ -378,14 +411,18 @@ These tests are run once an image is up and running,=
 either on target<br>
=C2=A0hardware or under QEMU. As a result, they are assumed to be running =
in a<br>
=C2=A0target image environment, as opposed to a host build environment. A<=
br>
=C2=A0simple example from ``meta/lib/oeqa/runtime/cases/python.py`` contai=
ns<br>
-the following:class PythonTest(OERuntimeTestCase):<br>
-@OETestDepends([&#39;ssh.SSHTest.test_ssh&#39;]) @OEHasPackage([&#39;pyth=
on3-core&#39;])<br>
-def test_python3(self): cmd =3D &quot;python3 -c \\&quot;import codecs;<b=
r>
-print(codecs.encode(&#39;Uryyb, jbeyq&#39;, &#39;rot13&#39;))\&quot;&quot=
; status, output =3D<br>
-self.target.run(cmd) msg =3D &#39;Exit status was not 0. Output: %s&#39; =
% output<br>
-self.assertEqual(status, 0, msg=3Dmsg)<br>
-<br>
-In this example, the ```OERuntimeTestCase`` &lt;&gt;`__ class wraps<br>
+the following::<br>
+<br>
+=C2=A0 =C2=A0class PythonTest(OERuntimeTestCase):<br>
+=C2=A0 =C2=A0 =C2=A0 @OETestDepends([&#39;ssh.SSHTest.test_ssh&#39;]) <br=
>
+=C2=A0 =C2=A0 =C2=A0 @OEHasPackage([&#39;python3-core&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 def test_python3(self): <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;python3 -c \\&quot;import=
 codecs; print(codecs.encode(&#39;Uryyb, jbeyq&#39;, &#39;rot13&#39;))\&quo=
t;&quot; <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status, output =3D self.target.run(cmd)=
 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &#39;Exit status was not 0. Out=
put: %s&#39; % output<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(status, 0, msg=3Dmsg)<=
br>
+<br>
+In this example, the ``OERuntimeTestCase`` class wraps<br>
=C2=A0``unittest.TestCase``. Within the test, ``self.target`` represents t=
he<br>
=C2=A0target system, where commands can be run on it using the ``run()``<b=
r>
=C2=A0method.<br>
@@ -402,19 +439,30 @@ the image.<br>
<br>
=C2=A0These tests are run against built extensible SDKs (eSDKs). The tests=
 can<br>
=C2=A0assume that the eSDK environment has already been setup. An example =
from<br>
-``meta/lib/oeqa/sdk/cases/devtool.py`` contains the following:class<br>
-DevtoolTest(OESDKExtTestCase): @classmethod def setUpClass(cls):<br>
-myapp_src =3D os.path.join(cls.tc.esdk_files_dir, &quot;myapp&quot;) cls.=
myapp_dst =3D<br>
-os.path.join(cls.tc.sdk_dir, &quot;myapp&quot;) shutil.copytree(myapp_src=
,<br>
-cls.myapp_dst) subprocess.check_output([&#39;git&#39;, &#39;init&#39;, &#=
39;.&#39;],<br>
-cwd=3Dcls.myapp_dst) subprocess.check_output([&#39;git&#39;, &#39;add&#39=
;, &#39;.&#39;],<br>
-cwd=3Dcls.myapp_dst) subprocess.check_output([&#39;git&#39;, &#39;commit&=
#39;, &#39;-m&#39;,<br>
-&quot;&#39;test commit&#39;&quot;], cwd=3Dcls.myapp_dst) @classmethod def=
<br>
-tearDownClass(cls): shutil.rmtree(cls.myapp_dst) def<br>
-\_test_devtool_build(self, directory): self._run(&#39;devtool add myapp %=
s&#39;<br>
-% directory) try: self._run(&#39;devtool build myapp&#39;) finally:<br>
-self._run(&#39;devtool reset myapp&#39;) def test_devtool_build_make(self=
):<br>
-self._test_devtool_build(self.myapp_dst)In this example, the ``devtool``<=
br>
+``meta/lib/oeqa/sdk/cases/devtool.py`` contains the following::<br>
+<br>
+=C2=A0 =C2=A0class DevtoolTest(OESDKExtTestCase): <br>
+=C2=A0 =C2=A0 =C2=A0 @classmethod def setUpClass(cls):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0myapp_src =3D os.path.join(cls.tc.esdk_=
files_dir, &quot;myapp&quot;) <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cls.myapp_dst =3D os.path.join(cls.tc.s=
dk_dir, &quot;myapp&quot;) <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copytree(myapp_src, cls.myapp_ds=
t)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output([&#39;git&#39;,=
 &#39;init&#39;, &#39;.&#39;], cwd=3Dcls.myapp_dst) <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output([&#39;git&#39;,=
 &#39;add&#39;, &#39;.&#39;], cwd=3Dcls.myapp_dst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output([&#39;git&#39;,=
 &#39;commit&#39;, &#39;-m&#39;, &quot;&#39;test commit&#39;&quot;], cwd=3D=
cls.myapp_dst) <br>
+=C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 @classmethod <br>
+=C2=A0 =C2=A0 =C2=A0 def tearDownClass(cls): <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.rmtree(cls.myapp_dst) <br>
+=C2=A0 =C2=A0 =C2=A0 def _test_devtool_build(self, directory): <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._run(&#39;devtool add myapp %s&#39=
; % directory) <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try: <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._run(&#39;devtool build myapp&#39;=
) <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0finally:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._run(&#39;devtool reset myapp&#39;=
) <br>
+=C2=A0 =C2=A0 =C2=A0 def test_devtool_build_make(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._test_devtool_build(self.myapp_dst=
)<br>
+=C2=A0 =C2=A0 =C2=A0 <br>
+In this example, the ``devtool``<br>
=C2=A0command is tested to see whether a sample application can be built w=
ith<br>
=C2=A0the ``devtool build`` command within the eSDK.<br>
<br>
@@ -426,14 +474,20 @@ the ``devtool build`` command within the eSDK.<br>
=C2=A0These tests are run against built SDKs. The tests can assume that an=
 SDK<br>
=C2=A0has already been extracted and its environment file has been sourced=
. A<br>
=C2=A0simple example from ``meta/lib/oeqa/sdk/cases/python2.py`` contains =
the<br>
-following:class Python3Test(OESDKTestCase): def setUp(self): if not<br>
-(self.tc.hasHostPackage(&quot;nativesdk-python3-core&quot;) or<br>
-self.tc.hasHostPackage(&quot;python3-core-native&quot;)): raise<br>
-unittest.SkipTest(&quot;No python3 package in the SDK&quot;) def<br>
-test_python3(self): cmd =3D &quot;python3 -c \\&quot;import codecs;<br>
-print(codecs.encode(&#39;Uryyb, jbeyq&#39;, &#39;rot13&#39;))\&quot;&quot=
; output =3D self._run(cmd)<br>
-self.assertEqual(output, &quot;Hello, world\n&quot;)In this example, if<b=
r>
-nativesdk-python3-core has been installed into the SDK, the code runs<br>
+following::<br>
+<br>
+=C2=A0 =C2=A0class Python3Test(OESDKTestCase): <br>
+=C2=A0 =C2=A0 =C2=A0 def setUp(self): <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (self.tc.hasHostPackage(=
&quot;nativesdk-python3-core&quot;) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.ha=
sHostPackage(&quot;python3-core-native&quot;)): <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise unittest.Ski=
pTest(&quot;No python3 package in the SDK&quot;) <br>
+=C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 def test_python3(self): <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;python3 -c \\&quo=
t;import codecs; print(codecs.encode(&#39;Uryyb, jbeyq&#39;, &#39;rot13&#39=
;))\&quot;&quot; <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D self._run(cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(output, &quot;=
Hello, world\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
+In this example, if nativesdk-python3-core has been installed into the SD=
K, the code runs<br>
=C2=A0the python3 interpreter with a basic command to check it is working<=
br>
=C2=A0correctly. The test would only run if python3 is installed in the SD=
K.<br>
<br>
@@ -444,17 +498,25 @@ correctly. The test would only run if python3 is ins=
talled in the SDK.<br>
<br>
=C2=A0The performance tests usually measure how long operations take and t=
he<br>
=C2=A0resource utilisation as that happens. An example from<br>
-``meta/lib/oeqa/buildperf/test_basic.py`` contains the following:class<br=
>
-Test3(BuildPerfTestCase): def test3(self): &quot;&quot;&quot;Bitbake pars=
ing (bitbake<br>
--p)&quot;&quot;&quot; # Drop all caches and parse self.rm_cache()<br>
-oe.path.remove(os.path.join(self.bb_vars[&#39;TMPDIR&#39;], &#39;cache&#3=
9;), True)<br>
-self.measure_cmd_resources([&#39;bitbake&#39;, &#39;-p&#39;], &#39;parse_=
1&#39;, &#39;bitbake -p (no<br>
-caches)&#39;) # Drop tmp/cache<br>
-oe.path.remove(os.path.join(self.bb_vars[&#39;TMPDIR&#39;], &#39;cache&#3=
9;), True)<br>
-self.measure_cmd_resources([&#39;bitbake&#39;, &#39;-p&#39;], &#39;parse_=
2&#39;, &#39;bitbake -p (no<br>
-tmp/cache)&#39;) # Parse with fully cached data<br>
-self.measure_cmd_resources([&#39;bitbake&#39;, &#39;-p&#39;], &#39;parse_=
3&#39;, &#39;bitbake -p<br>
-(cached)&#39;)This example shows how three specific parsing timings are<b=
r>
+``meta/lib/oeqa/buildperf/test_basic.py`` contains the following::<br>
+<br>
+=C2=A0 =C2=A0class Test3(BuildPerfTestCase): <br>
+=C2=A0 =C2=A0 =C2=A0 def test3(self): <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Bitbake parsi=
ng (bitbake -p)&quot;&quot;&quot; <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Drop all caches and parse <br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.rm_cache()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.remove(os.path.join(sel=
f.bb_vars[&#39;TMPDIR&#39;], &#39;cache&#39;), True)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.measure_cmd_resources([&#3=
9;bitbake&#39;, &#39;-p&#39;], &#39;parse_1&#39;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&#39;bitbake -p (no caches)&#39;)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Drop tmp/cache<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.remove(os.path.join(sel=
f.bb_vars[&#39;TMPDIR&#39;], &#39;cache&#39;), True)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.measure_cmd_resources([&#3=
9;bitbake&#39;, &#39;-p&#39;], &#39;parse_2&#39;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&#39;bitbake -p (no tmp/cache)&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Parse with fully cached data<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.measure_cmd_resources([&#3=
9;bitbake&#39;, &#39;-p&#39;], &#39;parse_3&#39;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&#39;bitbake -p (cached)&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+This example shows how three specific parsing timings are<br>
=C2=A0measured, with and without various caches, to show how BitBake=E2=80=
=
=99s parsing<br>
=C2=A0performance trends over time.<br>
<br>
diff --git a/documentation/test-manual/test-manual-understand-autobuilder.=
rst b/documentation/test-manual/test-manual-understand-autobuilder.rst<br>
index 8d3c84415..0d987d245 100644<br>
--- a/documentation/test-manual/test-manual-understand-autobuilder.rst<br>
+++ b/documentation/test-manual/test-manual-understand-autobuilder.rst<br>
@@ -20,32 +20,48 @@ each of those targets on a seperate buildbot worker. T=
o understand the<br>
=C2=A0configuration, you need to look at the entry on ``config.json`` file=
<br>
=C2=A0within the ``yocto-autobuilder-helper`` repository. The targets are<=
br>
=C2=A0defined in the =E2=80=98overrides=E2=80=99 section, a quick example =
could be qemux86-64<br>
-which looks like:&quot;qemux86-64&quot; : { &quot;MACHINE&quot; : &quot;q=
emux86-64&quot;, &quot;TEMPLATE&quot; :<br>
-&quot;arch-qemu&quot;, &quot;step1&quot; : { &quot;extravars&quot; : [ &q=
uot;IMAGE_FSTYPES_append =3D &#39; wic<br>
-wic.bmap&#39;&quot; ] } },And to expand that, you need the =E2=80=9Carch-=
qemu=E2=80=9D entry from<br>
-the =E2=80=9Ctemplates=E2=80=9D section, which looks like:&quot;arch-qemu=
&quot; : { &quot;BUILDINFO&quot; :<br>
-true, &quot;BUILDHISTORY&quot; : true, &quot;step1&quot; : { &quot;BBTARG=
ETS&quot; : &quot;core-image-sato<br>
-core-image-sato-dev core-image-sato-sdk core-image-minimal<br>
-core-image-minimal-dev core-image-sato:do_populate_sdk&quot;, &quot;SANIT=
YTARGETS&quot;<br>
-: &quot;core-image-minimal:do_testimage core-image-sato:do_testimage<br>
-core-image-sato-sdk:do_testimage core-image-sato:do_testsdk&quot; }, &quo=
t;step2&quot;<br>
-: { &quot;SDKMACHINE&quot; : &quot;x86_64&quot;, &quot;BBTARGETS&quot; :<=
br>
-&quot;core-image-sato:do_populate_sdk core-image-minimal:do_populate_sdk_=
ext<br>
-core-image-sato:do_populate_sdk_ext&quot;, &quot;SANITYTARGETS&quot; :<br=
>
-&quot;core-image-sato:do_testsdk core-image-minimal:do_testsdkext<br>
-core-image-sato:do_testsdkext&quot; }, &quot;step3&quot; : { &quot;BUILDH=
ISTORY&quot; : false,<br>
-&quot;EXTRACMDS&quot; : [&quot;${SCRIPTSDIR}/checkvnc; DISPLAY=3D:1 oe-se=
lftest<br>
-${HELPERSTMACHTARGS} -j 15&quot;], &quot;ADDLAYER&quot; :<br>
-[&quot;${BUILDDIR}/../meta-selftest&quot;] } },Combining these two entrie=
s you can<br>
-see that =E2=80=9Cqemux86-64=E2=80=9D is a three step build where the<br>
-``bitbake BBTARGETS`` would be run, then ``bitbake<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SANITYTARGETS`` f=
or each step; all for<br>
+which looks like::<br>
+<br>
+=C2=A0 =C2=A0&quot;qemux86-64&quot; : { <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;MACHINE&quot; : &quot;qemux86-64&=
quot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;TEMPLATE&quot; : &quot;arch-qemu&=
quot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;step1&quot; : { <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;extravars&qu=
ot; : [ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&quot;IMAGE_FSTYPES_append =3D &#39; wic wic.bmap&#39;&quot; <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] <=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } <br>
+=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0<br>
+And to expand that, you need the =E2=80=9Carch-qemu=E2=80=9D entry from<b=
r>
+the =E2=80=9Ctemplates=E2=80=9D section, which looks like::<br>
+<br>
+=C2=A0 =C2=A0&quot;arch-qemu&quot; : { <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;BUILDINFO&quot; : true, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;BUILDHISTORY&quot; : true, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;step1&quot; : { <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;BBTARGETS&qu=
ot; : &quot;core-image-sato core-image-sato-dev core-image-sato-sdk core-im=
age-minimal core-image-minimal-dev core-image-sato:do_populate_sdk&quot;, <=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;SANITYTARGETS&quot; : &quot;core-=
image-minimal:do_testimage core-image-sato:do_testimage core-image-sato-sdk=
:do_testimage core-image-sato:do_testsdk&quot; <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;step2&quot; : { <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;SDKMACHINE&q=
uot; : &quot;x86_64&quot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;BBTARGETS&qu=
ot; : &quot;core-image-sato:do_populate_sdk core-image-minimal:do_populate_=
sdk_ext core-image-sato:do_populate_sdk_ext&quot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;SANITYTARGET=
S&quot; : &quot;core-image-sato:do_testsdk core-image-minimal:do_testsdkext=
 core-image-sato:do_testsdkext&quot; <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;step3&quot; : { <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;BUILDHISTORY=
&quot; : false, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;EXTRACMDS&qu=
ot; : [&quot;${SCRIPTSDIR}/checkvnc; DISPLAY=3D:1 oe-selftest ${HELPERSTMAC=
HTARGS} -j 15&quot;], <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ADDLAYER&quo=
t; : [&quot;${BUILDDIR}/../meta-selftest&quot;] <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} <br>
+=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0<br>
+Combining these two entries you can see that =E2=80=9Cqemux86-64=E2=80=9D=
 is a three step build where the<br>
+``bitbake BBTARGETS`` would be run, then ``bitbake SANITYTARGETS`` for ea=
ch step; all for<br>
=C2=A0``MACHINE=3D=E2=80=9Dqemx86-64=E2=80=9D`` but with differing SDKMACH=
INE settings. In step<br>
=C2=A01 an extra variable is added to the ``auto.conf`` file to enable wic=
<br>
=C2=A0image generation.<br>
<br>
=C2=A0While not every detail of this is covered here, you can see how the<=
br>
-templating mechanism allows quite complex configurations to be built up<b=
r>
+template mechanism allows quite complex configurations to be built up<br>=
</blockquote><div><br></div><div>why? let&#39;s stick to the original=C2=A0=
.xml file, we can fix the doc later.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
=C2=A0yet allows duplication and repetition to be kept to a minimum.<br>
<br>
=C2=A0The different build targets are designed to allow for parallelisatio=
n,<br>
@@ -70,7 +86,7 @@ roughly consist of:<br>
<br>
=C2=A0 =C2=A0 This cleans out any previous build. Old builds are left arou=
nd to<br>
=C2=A0 =C2=A0 allow easier debugging of failed builds. For additional info=
rmation,<br>
-=C2=A0 =C2=A0see ```clobberdir`` &lt;#test-clobberdir&gt;`__.<br>
+=C2=A0 =C2=A0see :ref:`test-clobberdir`.<br></blockquote><div><br></div><=
div>It works. However we are now using autosectionlabel which creates secti=
ons labels for headings automatically. So I would like to get rid of all cu=
stom labels, as much as possible. the following is preferred:</div><div>:re=
f:`test-manual/test-manual-understand-autobuilder:clobberdir&gt;`<br></div>=
<div><br></div><div>I know we&#39;ve left some links like that in other man=
uals. So it&#39;s not strictly required to change it now.=C2=A0</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A02. *Obtain yocto-autobuilder-helper*<br>
<br>
@@ -94,7 +110,7 @@ roughly consist of:<br>
=C2=A0 =C2=A0 from the ``layerinfo.json`` file to help understand the<br>
=C2=A0 =C2=A0 configuration. It will also use a local cache of repositorie=
s to<br>
=C2=A0 =C2=A0 speed up the clone checkouts. For additional information, se=
e<br>
-=C2=A0 =C2=A0`Autobuilder Clone Cache &lt;#test-autobuilder-clone-cache&g=
t;`__.<br>
+=C2=A0 =C2=A0:ref:`test-autobuilder-clone-cache`.<br></blockquote><div><b=
r></div><div>same here (and probably in other places)</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 This step has two possible modes of operation. If the build =
is part<br>
=C2=A0 =C2=A0 of a parent build, its possible that all the repositories ne=
eded may<br>
@@ -137,8 +153,7 @@ special script that moves files to a special location,=
 rather than<br>
=C2=A0deleting them. Files in this location are deleted by an ``rm`` comma=
nd,<br>
=C2=A0which is run under ``ionice -c 3``. For example, the deletion only<b=
r>
=C2=A0happens when there is idle IO capacity on the Worker. The Autobuilde=
r<br>
-Worker Janitor runs this deletion. See `Autobuilder Worker<br>
-Janitor &lt;#test-autobuilder-worker-janitor&gt;`__.<br>
+Worker Janitor runs this deletion. See :ref:`test-autobuilder-worker-jani=
tor`.<br>
<br>
=C2=A0.. _test-autobuilder-clone-cache:<br>
<br>
@@ -150,8 +165,8 @@ on the Autobuilder. We therefore have a stash of commo=
nly used<br>
=C2=A0repositories pre-cloned on the Workers. Data is fetched from these<b=
r>
=C2=A0during clones first, then &quot;topped up&quot; with later revisions=
 from any<br>
=C2=A0upstream when necesary. The cache is maintained by the Autobuilder<b=
r>
-Worker Janitor. See `Autobuilder Worker<br>
-Janitor &lt;#test-autobuilder-worker-janitor&gt;`__.<br>
+Worker Janitor. See :ref:`Autobuilder Worker<br>
+Janitor`.<br>
<br>
=C2=A0.. _test-autobuilder-worker-janitor:<br>
<br>
@@ -159,8 +174,8 @@ Autobuilder Worker Janitor<br>
=C2=A0--------------------------<br>
<br>
=C2=A0This is a process running on each Worker that performs two basic<br>
-operations, including background file deletion at IO idle (see `Target<br=
>
-Execution: clobberdir &lt;#test-list-tgt-exec-clobberdir&gt;`__) and<br>
+operations, including background file deletion at IO idle (see Target<br>
+Execution: clobberdir :ref:`test-list-tgt-exec-clobberdir`) and<br></bloc=
kquote><div><br></div><div>the link and text look wrong here. the link is n=
ot on the &#39;text&#39;</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
=C2=A0maintainenance of a cache of cloned repositories to improve the spee=
d<br>
=C2=A0the system can checkout repositories.<br>
<br>
@@ -216,9 +231,6 @@ are general setup steps that are run once and include:=
<br>
=C2=A0For each step that is configured in ``config.json``, it will perform=
 the<br>
=C2=A0following:<br>
<br>
-## WRITER&#39;s question: What does &quot;logging in as stepXa&quot; and =
others refer<br>
-to below? ##<br></blockquote><div><br></div><div>you can keep comment wit=
h the &quot;.. xxx&quot; syntax.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
-<br>
=C2=A01. Add any layers that are specified using the<br>
=C2=A0 =C2=A0 ``bitbake-layers add-layer`` command (logging as stepXa)<br>
<br>
@@ -235,9 +247,8 @@ to below? ##<br>
=C2=A06. Run the ``EXTRAPLAINCMDS`` command(s), which are run outside the<=
br>
=C2=A0 =C2=A0 BitBake build environment (logging as stepXd)<br>
<br>
-7. Remove any layers added in `step<br>
-=C2=A0 =C2=A01 &lt;#test-run-config-add-layers-step&gt;`__ using the<br>
-=C2=A0 =C2=A0``bitbake-layers remove-layer`` command (logging as stepXa)<=
br>
+7. Remove any layers added in step<br>
+=C2=A0 =C2=A01 using the ``bitbake-layers remove-layer`` command (logging=
 as stepXa)<br></blockquote><div><br></div><div>you removed a link here, no=
?=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0Once the execution steps above complete, ``run-config`` executes a s=
et<br>
=C2=A0of post-build steps, including:<br>
@@ -252,7 +263,7 @@ of post-build steps, including:<br>
=C2=A0 =C2=A0 generated to the remote server.<br>
<br>
=C2=A04. Cleanup the build directory using<br>
-=C2=A0 =C2=A0```clobberdir`` &lt;#test-clobberdir&gt;`__ if the build was=
 successful,<br>
+=C2=A0 =C2=A0:ref:`test-clobberdir` if the build was successful,<br>
=C2=A0 =C2=A0 else rename it to =E2=80=9Cbuild-renamed=E2=80=9D for potent=
ial future debugging.<br>
<br>
=C2=A0.. _test-deploying-yp-autobuilder:<br>
@@ -279,11 +290,18 @@ The standard ``config.json`` minimally attempts to a=
llow substitution of<br>
=C2=A0the paths. The Helper script repository includes a<br>
=C2=A0``local-example.json`` file to show how you could override these fro=
m a<br>
=C2=A0separate configuration file. Pass the following into the environment=
 of<br>
-the Autobuilder:$ ABHELPER_JSON=3D&quot;config.json local-example.json&qu=
ot;As<br>
-another example, you could also pass the following into the<br>
-environment:$ ABHELPER_JSON=3D&quot;config.json /some/location/local.json=
&quot;One<br>
-issue users often run into is validation of the ``config.json`` files. A<=
br>
+the Autobuilder::<br>
+<br>
+=C2=A0 =C2=A0$ ABHELPER_JSON=3D&quot;config.json local-example.json&quot;=
<br>
+=C2=A0 =C2=A0<br>
+As another example, you could also pass the following into the<br>
+environment::<br>
+<br>
+=C2=A0 =C2=A0$ ABHELPER_JSON=3D&quot;config.json /some/location/local.jso=
n&quot;<br>
+=C2=A0 =C2=A0<br>
+One issue users often run into is validation of the ``config.json`` files=
. A<br>
=C2=A0tip for minimizing issues from invalid json files is to use a Git<br=
>
=C2=A0``pre-commit-hook.sh`` script to verify the JSON file before committ=
ing<br>
-it. Create a symbolic link as follows:$ ln -s<br>
-../../scripts/pre-commit-hook.sh .git/hooks/pre-commit<br>
+it. Create a symbolic link as follows:: <br>
+<br>
+=C2=A0 =C2=A0$ ln -s ../../scripts/pre-commit-hook.sh .git/hooks/pre-comm=
it<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000f834bf05af53faa4--
