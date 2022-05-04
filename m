Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD174C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:29:28 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.97.1651674562360214582
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WvmktEPb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A399720012;
	Wed,  4 May 2022 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651674559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qqxb4vb478Fd4ZuHOeT+xc/SpQyWfPaB+Ky1vJGMymE=;
	b=WvmktEPb3I/7RCFRpDDpdlFjoFdTul7or3Bf9zgLCWoeUUWhZuUHK9bdxL3VL2yzgp9yBd
	M1rV3mTDbMnUGao3ruxaEB6ZN45WuOxi3qTtOo5KyPVRWnOYGIz/c1lqISftW9fAkC8Aw+
	806YDSPSuxcKWJXZoqKr9HPuGfnQvuXgJeJ6Z08pJJWd2UYwW7IFzoFOOYemkzTDf9ODYp
	kjGZqaLpXZ/4DJem+fjxABl+wfVQXC/3CY/cBCKRrT9WZ2XYKzLhRFeuGE+0TmpvGaRwIm
	qUxR2nfj3mu/NyE2oWFyVPNGypPCtxdRu2N+qI7klkR3aMMvB/jOeKEQcGScBQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: fix name capitalization issues
Date: Wed,  4 May 2022 16:29:18 +0200
Message-Id: <20220504142918.682815-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 14:29:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2907

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Using "BitBake" instead of "Bitbake" or "bitbake", aligning with the
  title of the "BitBake User Manual".
- Using "OpenEmbedded" instead of "Openembedded"
- Using "Python" instead of "python"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst       |  4 ++--
 documentation/conf.py                              |  6 +++---
 documentation/dev-manual/common-tasks.rst          | 14 +++++++-------
 documentation/dev-manual/start.rst                 |  2 +-
 documentation/kernel-dev/common.rst                |  2 +-
 documentation/kernel-dev/concepts-appx.rst         |  2 +-
 documentation/migration-guides/migration-2.2.rst   |  2 +-
 documentation/migration-guides/migration-2.7.rst   |  2 +-
 documentation/migration-guides/migration-3.0.rst   |  2 +-
 documentation/migration-guides/migration-3.2.rst   |  4 ++--
 documentation/migration-guides/migration-3.3.rst   |  4 ++--
 documentation/migration-guides/migration-3.4.rst   |  2 +-
 .../migration-guides/release-notes-3.4.1.rst       |  2 +-
 documentation/profile-manual/usage.rst             |  6 +++---
 documentation/ref-manual/tasks.rst                 |  2 +-
 documentation/ref-manual/variables.rst             |  2 +-
 documentation/sphinx/yocto-vars.py                 |  2 +-
 documentation/test-manual/intro.rst                |  8 ++++----
 documentation/toaster-manual/start.rst             |  2 +-
 documentation/what-i-wish-id-known.rst             |  2 +-
 20 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 12cab1db76..7179f25022 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -424,9 +424,9 @@ information including the website, wiki pages, and user manuals:
    development documentation, and access to a rich Yocto Project
    Development Community into which you can tap.
 
--  **Video Seminar:** The `Introduction to the Yocto Project and Bitbake, Part 1
+-  **Video Seminar:** The `Introduction to the Yocto Project and BitBake, Part 1
    <https://youtu.be/yuE7my3KOpo>`__ and
-   `Introduction to the Yocto Project and Bitbake, Part 2
+   `Introduction to the Yocto Project and BitBake, Part 2
    <https://youtu.be/iZ05TTyzGHk>`__ videos offer a video seminar
    introducing you to the most important aspects of developing a
    custom embedded Linux distribution with the Yocto Project.
diff --git a/documentation/conf.py b/documentation/conf.py
index a7cdf415f8..baf550e3e3 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -19,7 +19,7 @@ try:
     import yaml
 except ImportError:
     sys.stderr.write("The Yocto Project Sphinx documentation requires PyYAML.\
-    \nPlease make sure to install pyyaml python package.\n")
+    \nPlease make sure to install pyyaml Python package.\n")
     sys.exit(1)
 
 # current_version = "dev"
@@ -108,7 +108,7 @@ extlinks = {
     'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
 }
 
-# Intersphinx config to use cross reference with Bitbake user manual
+# Intersphinx config to use cross reference with BitBake user manual
 intersphinx_mapping = {
     'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_version, None)
 }
@@ -129,7 +129,7 @@ try:
     }
 except ImportError:
     sys.stderr.write("The Sphinx sphinx_rtd_theme HTML theme was not found.\
-    \nPlease make sure to install the sphinx_rtd_theme python package.\n")
+    \nPlease make sure to install the sphinx_rtd_theme Python package.\n")
     sys.exit(1)
 
 html_logo = 'sphinx-static/YoctoProject_Logo_RGB.jpg'
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b228c75aab..7108333cdf 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5392,7 +5392,7 @@ create the properly partitioned image.
 
 The ``wic`` command generates partitioned images from existing
 OpenEmbedded build artifacts. Image generation is driven by partitioning
-commands contained in an Openembedded kickstart file (``.wks``)
+commands contained in an OpenEmbedded kickstart file (``.wks``)
 specified either directly on the command line or as one of a selection
 of canned kickstart files as shown with the ``wic list images`` command
 in the
@@ -5464,7 +5464,7 @@ system needs to meet the following requirements:
 
 -  You need to have the build artifacts already available, which
    typically means that you must have already created an image using the
-   Openembedded build system (e.g. ``core-image-minimal``). While it
+   OpenEmbedded build system (e.g. ``core-image-minimal``). While it
    might seem redundant to generate an image in order to create an image
    using Wic, the current version of Wic requires the artifacts in the
    form generated by the OpenEmbedded build system.
@@ -5546,7 +5546,7 @@ Operational Modes
 -----------------
 
 You can use Wic in two different modes, depending on how much control
-you need for specifying the Openembedded build artifacts that are used
+you need for specifying the OpenEmbedded build artifacts that are used
 for creating the image: Raw and Cooked:
 
 -  *Raw Mode:* You explicitly specify build artifacts through Wic
@@ -9214,7 +9214,7 @@ section:
    to run specific tasks in the build chain. It can be useful to run
    tasks "out-of-order" when trying isolate build issues.
 
--  ":ref:`dev-manual/common-tasks:general bitbake problems`" describes how
+-  ":ref:`dev-manual/common-tasks:general BitBake problems`" describes how
    to use BitBake's ``-D`` debug output option to reveal more about what
    BitBake is doing during the build.
 
@@ -9409,7 +9409,7 @@ format and can be converted to images (e.g. using the ``dot`` tool from
 
    -  DOT files use a plain text format. The graphs generated using the
       ``bitbake -g`` command are often so large as to be difficult to
-      read without special pruning (e.g. with Bitbake's ``-I`` option)
+      read without special pruning (e.g. with BitBake's ``-I`` option)
       and processing. Despite the form and size of the graphs, the
       corresponding ``.dot`` files can still be possible to read and
       provide useful information.
@@ -10565,7 +10565,7 @@ used testing branches for OpenEmbedded-Core are as follows:
 
 -  *poky "master-next" branch:* This branch is part of the
    :yocto_git:`poky </poky/>` repository and combines proposed
-   changes to bitbake, the core metadata and the poky distro.
+   changes to BitBake, the core metadata and the poky distro.
 
 Similarly, stable branches maintained by the project may have corresponding
 ``-next`` branches which collect proposed changes. For example,
@@ -11442,7 +11442,7 @@ this function, you have to follow the following steps:
    Please choose one that you want to use and enable the spdx task. You have to
    add some config options in ``local.conf`` file in your :term:`Build
    Directory`. Here is an example showing how to generate spdx files
-   during bitbake using the fossology-python.bbclass::
+   during BitBake using the fossology-python.bbclass::
 
       # Select fossology-python.bbclass.
       INHERIT += "fossology-python"
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 96fabac1aa..8cf3ebe316 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -496,7 +496,7 @@ your Yocto Project build host:
 
 6. *Optimize your WSLv2 storage often:* Due to the way storage is
    handled on WSLv2, the storage space used by the undelying Linux
-   distribution is not reflected immedately, and since bitbake heavily
+   distribution is not reflected immedately, and since BitBake heavily
    uses storage, after several builds, you may be unaware you are
    running out of space. WSLv2 uses a VHDX file for storage, this issue
    can be easily avoided by manually optimizing this file often, this
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index a5dd02ccf2..547da8a178 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1560,7 +1560,7 @@ source directory. Follow these steps to clean up the version string:
    on building the kernel image when using ``devtool``, see the
    ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
    section. For
-   information on building the kernel image when using Bitbake, see the
+   information on building the kernel image when using BitBake, see the
    ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
    section.
 
diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index 910318e0f9..8ec3d6be45 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -318,7 +318,7 @@ tree specific to your kernel from which to generate the new kernel
 image.
 
 The following figure shows the temporary file structure created on your
-host system when you build the kernel using Bitbake. This
+host system when you build the kernel using BitBake. This
 :term:`Build Directory` contains all the
 source files used during the build.
 
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 10aa2d0684..fe7bc2cf55 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -70,7 +70,7 @@ Metadata Must Now Use Python 3 Syntax
 
 The metadata is now required to use Python 3 syntax. For help preparing
 metadata, see any of the many Python 3 porting guides available.
-Alternatively, you can reference the conversion commits for Bitbake and
+Alternatively, you can reference the conversion commits for BitBake and
 you can use :term:`OpenEmbedded-Core (OE-Core)` as a guide for changes. Following are
 particular areas of interest:
 
diff --git a/documentation/migration-guides/migration-2.7.rst b/documentation/migration-guides/migration-2.7.rst
index ae70353bf7..1b8f1ce1bb 100644
--- a/documentation/migration-guides/migration-2.7.rst
+++ b/documentation/migration-guides/migration-2.7.rst
@@ -15,7 +15,7 @@ The following changes have been made to BitBake:
    functions (e.g. ``def funcname:``) in the metadata for tab
    indentation. If found, BitBake produces a warning.
 
--  Bitbake now checks
+-  BitBake now checks
    :term:`BBFILE_COLLECTIONS` for duplicate
    entries and triggers an error if any are found.
 
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 50d6758e71..1219edf921 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -152,7 +152,7 @@ by ``CVE_CHECK_WHITELIST`` (replaced by :term:`CVE_CHECK_IGNORE` in version 3.5)
 
 .. _migration-3.0-bitbake-changes:
 
-Bitbake Changes
+BitBake Changes
 ---------------
 
 The following BitBake changes have occurred.
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index d593effe97..470403a298 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -86,7 +86,7 @@ value to be explicitly prepended to package names being added as
 dependencies (e.g. in :term:`RDEPENDS` and :term:`RRECOMMENDS` values)
 where the dependency is conditionally added.
 
-If you have anonymous python or in-line python conditionally adding
+If you have anonymous Python or in-line Python conditionally adding
 dependencies in your custom recipes, and you intend for those recipes to
 work with multilib, then you will need to ensure that ``${MLPREFIX}``
 is prefixed on the package names in the dependencies, for example
@@ -149,7 +149,7 @@ the upstream documentation for ``dhcpcd`` and ``kea`` for further details.
 Packaging changes
 -----------------
 
-- ``python3``: the ``urllib`` python package has now moved into the core package, as it is used more commonly than just netclient (e.g. email, xml, mimetypes, pydoc). In addition, the ``pathlib`` module is now also part of the core package.
+- ``python3``: the ``urllib`` Python package has now moved into the core package, as it is used more commonly than just netclient (e.g. email, xml, mimetypes, pydoc). In addition, the ``pathlib`` module is now also part of the core package.
 
 - ``iptables``: ``iptables-apply`` and ``ip6tables-apply`` have been split out to their own package to avoid a bash dependency in the main ``iptables`` package
 
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index 1eb494c286..22562dacd4 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -76,7 +76,7 @@ Some example recipes where this change has been made: ``gpgme``, ``libcap-ng``,
 
 .. _migration-3.3-distutils-path:
 
-``setup.py`` path for python modules
+``setup.py`` path for Python modules
 ------------------------------------
 
 In a Python module, sometimes ``setup.py`` can be buried deep in the
@@ -133,7 +133,7 @@ unless you want to take advantage of the improved granularity:
 - ``procps``: split ``ps`` and ``sysctl`` into their own packages
 - ``rpm``: split build and extra functionality into separate packages
 - ``sudo``: split ``sudo`` binary into ``sudo-sudo`` and libs into ``sudo-lib``
-- ``systemtap``: examples, python scripts and runtime material split out
+- ``systemtap``: examples, Python scripts and runtime material split out
 - ``util-linux``: ``libuuid`` has been split out to its own
   ``util-linux-libuuid`` recipe (and corresponding packages) to avoid circular
   dependencies if ``libgcrypt`` support is enabled in ``util-linux``.
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index d57c955eb4..8db43a1454 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -233,7 +233,7 @@ Image / SDK generation changes
 Miscellaneous
 ~~~~~~~~~~~~~
 
-- Certificates are now properly checked when bitbake fetches sources
+- Certificates are now properly checked when BitBake fetches sources
   over HTTPS. If you receive errors as a result for your custom recipes,
   you will need to use a mirror or address the issue with the operators
   of the server in question.
diff --git a/documentation/migration-guides/release-notes-3.4.1.rst b/documentation/migration-guides/release-notes-3.4.1.rst
index b122887661..0503f29b2c 100644
--- a/documentation/migration-guides/release-notes-3.4.1.rst
+++ b/documentation/migration-guides/release-notes-3.4.1.rst
@@ -46,7 +46,7 @@ Fixes in 3.4.1
 -  bitbake: tests/fetch: Update pcre.org address after github changes
 -  bitbake: tests/runqueue: Ensure hashserv exits before deleting files
 -  bitbake: utils: Handle lockfile filenames that are too long for filesystems
--  bootchart2: Don't compile python modules
+-  bootchart2: Don't compile Python modules
 -  build-appliance-image: Update to honister head revision
 -  buildhistory: Fix package output files for SDKs
 -  busybox: 1.34.0 -> 1.34.1
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index fb1553d70d..0fd703d8a5 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -740,7 +740,7 @@ entry/exit events we recorded::
    root@crownbay:~# perf script -g python
    generated Python script: perf-script.py
 
-The skeleton script simply creates a python function for each event type in the
+The skeleton script simply creates a Python function for each event type in the
 perf.data file. The body of each function simply prints the event name along
 with its parameters. For example:
 
@@ -859,7 +859,7 @@ goes a little way to support the idea mentioned previously that given
 the right kind of trace data, higher-level profiling-type summaries can
 be derived from it.
 
-Documentation on using the `'perf script' python
+Documentation on using the `'perf script' Python
 binding <https://linux.die.net/man/1/perf-script-python>`__.
 
 System-Wide Tracing and Profiling
@@ -1149,7 +1149,7 @@ section can be found here:
 -  The `'perf script'
    manpage <https://linux.die.net/man/1/perf-script>`__.
 
--  Documentation on using the `'perf script' python
+-  Documentation on using the `'perf script' Python
    binding <https://linux.die.net/man/1/perf-script-python>`__.
 
 -  The top-level `perf(1) manpage <https://linux.die.net/man/1/perf>`__.
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index a2b8763e7c..cb08a75c90 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -522,7 +522,7 @@ scratch is guaranteed.
 Starts a shell in which an interactive Python interpreter allows you to
 interact with the BitBake build environment. From within this shell, you
 can directly examine and set bits from the data store and execute
-functions as if within the BitBake environment. See the ":ref:`dev-manual/common-tasks:using a python development shell`" section in
+functions as if within the BitBake environment. See the ":ref:`dev-manual/common-tasks:using a Python development shell`" section in
 the Yocto Project Development Tasks Manual for more information about
 using ``pydevshell``.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f8808cc052..f164b7317a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3551,7 +3551,7 @@ system and gives an overview of their function and contents.
 
       For more information on :term:`INHERIT`, see the
       :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\`\` configuration directive`"
-      section in the Bitbake User Manual.
+      section in the BitBake User Manual.
 
    :term:`INHERIT_DISTRO`
       Lists classes that will be inherited at the distribution level. It is
diff --git a/documentation/sphinx/yocto-vars.py b/documentation/sphinx/yocto-vars.py
index 8795eee0a0..643c0df904 100644
--- a/documentation/sphinx/yocto-vars.py
+++ b/documentation/sphinx/yocto-vars.py
@@ -13,7 +13,7 @@ try:
     import yaml
 except ImportError:
     sys.stderr.write("The Yocto Project Sphinx documentation requires PyYAML.\
-    \nPlease make sure to install pyyaml python package.\n")
+    \nPlease make sure to install pyyaml Python package.\n")
     sys.exit(1)
 
 __version__  = '1.0'
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 9c1a93cd40..17cde316b3 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -72,7 +72,7 @@ simple JSON files.
 .. note::
 
    The project uses Buildbot for historical reasons but also because
-   many of the project developers have knowledge of python. It is
+   many of the project developers have knowledge of Python. It is
    possible to use the outer layers from another Continuous Integration
    (CI) system such as
    `Jenkins <https://en.wikipedia.org/wiki/Jenkins_(software)>`__
@@ -335,12 +335,12 @@ A simple test example from ``lib/bb/tests/data.py`` is::
             self.assertEqual(str(val), "value_of_foo")
 
 In this example, a ``DataExpansions`` class of tests is created,
-derived from standard python unittest. The class has a common ``setUp``
+derived from standard Python unittest. The class has a common ``setUp``
 function which is shared by all the tests in the class. A simple test is
 then added to test that when a variable is expanded, the correct value
 is found.
 
-Bitbake selftests are straightforward python unittest. Refer to the
+BitBake selftests are straightforward Python unittest. Refer to the
 Python unittest documentation for additional information on writing
 these tests at: https://docs.python.org/3/library/unittest.html.
 
@@ -468,7 +468,7 @@ following::
 
 In this example, if nativesdk-python3-core has been installed into the SDK, the code runs
 the python3 interpreter with a basic command to check it is working
-correctly. The test would only run if python3 is installed in the SDK.
+correctly. The test would only run if Python3 is installed in the SDK.
 
 ``oe-build-perf-test``
 ----------------------
diff --git a/documentation/toaster-manual/start.rst b/documentation/toaster-manual/start.rst
index cab5d1f673..2d6474852a 100644
--- a/documentation/toaster-manual/start.rst
+++ b/documentation/toaster-manual/start.rst
@@ -40,7 +40,7 @@ command::
    $ pip3 install --user -r bitbake/toaster-requirements.txt
 
 The previous command installs the necessary Toaster modules into a local
-python 3 cache in your ``$HOME`` directory. The caches is actually
+Python 3 cache in your ``$HOME`` directory. The caches is actually
 located in ``$HOME/.local``. To see what packages have been installed
 into your ``$HOME`` directory, do the following::
 
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index dec5617173..0b81fa8033 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -179,7 +179,7 @@ contact us with other suggestions.
    * understand devtool and how it simplifies your workflow
    * improve build speeds with shared downloads and shared state cache
    * generate and understand a dependency graph
-   * generate and understand bitbake environment
+   * generate and understand BitBake environment
    * build an Extensible SDK for applications development
 
 #. **Depending on what you primary interests are with the Yocto Project, you
-- 
2.25.1


