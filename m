Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978F8C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 15:10:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.77797.1669993794766539402
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 07:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l6TmxdBy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3FC8A4000F;
	Fri,  2 Dec 2022 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669993792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lORBx/W0rLRGGHz+ULk6nzRCCzUd+4iZCyaHl/AE7GI=;
	b=l6TmxdByLN2BfYnUySaha9JTQP7j6aZKUSiSVc6znqntuXCbdxtS+6Ojq3gVIbcH4RbJnI
	sTwtItsInSqIoqbm9tu2/Ml0kl6muxsrCTK+PnuQIEZy1s6Z9PkpP0um5gRySdXORpapu+
	mffAserjzcXeFpM89dCkYH0G/l7z+0IPSymWJRqUc38Y5nEWBIFWc6Aupoe+7ku7+/tOoO
	TUNG/OSHnDQ6NIAUWAA5jf0A0ilOgbEpBwSAHtwoaMSWCl6CGmfthy6Dn4yl6dcEYCNt4G
	yiK5bBkMbKbUzozvzFSAqqRuC9e/cOM7EXu1VoEdd35Wy8DWPeWgxvyxeab+tw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] [kirkstone] SPDX and CVE documentation updates
Date: Fri,  2 Dec 2022 16:09:47 +0100
Message-Id: <20221202150947.337605-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Dec 2022 15:10:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3515

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Backporting from master the ones that are applicable to kirkstone.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/conf.py                     |   1 +
 documentation/dev-manual/common-tasks.rst | 291 ++++++++++++++++------
 documentation/ref-manual/classes.rst      |  96 ++++++-
 documentation/ref-manual/terms.rst        |  28 +++
 documentation/ref-manual/variables.rst    | 109 +++++++-
 5 files changed, 442 insertions(+), 83 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index a7cdf415f8..203b85dc7e 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -106,6 +106,7 @@ extlinks = {
     'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
     'oe_layerindex': ('https://layers.openembedded.org%s', None),
     'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
+    'wikipedia': ('https://en.wikipedia.org/wiki/%s', None),
 }
 
 # Intersphinx config to use cross reference with Bitbake user manual
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 65f94432ab..1b91ada0a1 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11426,39 +11426,6 @@ layers (recipes, configuration files, and so forth) enables you to meet
 your requirements to include the scripts to control compilation as well
 as any modifications to the original source.
 
-Providing spdx files
-~~~~~~~~~~~~~~~~~~~~~~~~~
-
-The spdx module has been integrated to a layer named meta-spdxscanner.
-meta-spdxscanner provides several kinds of scanner. If you want to enable
-this function, you have to follow the following steps:
-
-1. Add meta-spdxscanner layer into ``bblayers.conf``. 
-
-2. Refer to the README in meta-spdxscanner to setup the environment (e.g, 
-   setup a fossology server) needed for the scanner.
-
-3. Meta-spdxscanner provides several methods within the bbclass to create spdx files.
-   Please choose one that you want to use and enable the spdx task. You have to
-   add some config options in ``local.conf`` file in your :term:`Build
-   Directory`. Here is an example showing how to generate spdx files
-   during bitbake using the fossology-python.bbclass::
-
-      # Select fossology-python.bbclass.
-      INHERIT += "fossology-python"
-      # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
-      # Fossology server, you have to create a token.
-      TOKEN = "eyJ0eXAiO..."
-      # The fossology server is necessary for fossology-python.bbclass.
-      FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
-      # If you want to upload the source code to a special folder:
-      FOLDER_NAME = "xxxx" //Optional
-      # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
-      SPDX_DEPLOY_DIR = "${DEPLOY_DIR}" //Optional
-
-For more usage information refer to :yocto_git:`the meta-spdxscanner repository
-</meta-spdxscanner/>`.
-
 Compliance Limitations with Executables Built from Static Libraries
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -11499,21 +11466,92 @@ the license from the fetched source::
 Checking for Vulnerabilities
 ============================
 
-Vulnerabilities in images
--------------------------
+Vulnerabilities in Poky and OE-Core
+-----------------------------------
 
 The Yocto Project has an infrastructure to track and address unfixed
 known security vulnerabilities, as tracked by the public
-`Common Vulnerabilities and Exposures (CVE) <https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures>`__
+:wikipedia:`Common Vulnerabilities and Exposures (CVE) <Common_Vulnerabilities_and_Exposures>`
 database.
 
-To know which packages are vulnerable to known security vulnerabilities,
-add the following setting to your configuration::
+The Yocto Project maintains a `list of known vulnerabilities
+<https://autobuilder.yocto.io/pub/non-release/patchmetrics/>`__
+for packages in Poky and OE-Core, tracking the evolution of the number of
+unpatched CVEs and the status of patches. Such information is available for
+the current development version and for each supported release.
+
+Security is a process, not a product, and thus at any time, a number of security
+issues may be impacting Poky and OE-Core. It is up to the maintainers, users,
+contributors and anyone interested in the issues to investigate and possibly fix them by
+updating software components to newer versions or by applying patches to address them.
+It is recommended to work with Poky and OE-Core upstream maintainers and submit
+patches to fix them, see ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`" for details.
+
+Vulnerability check at build time
+---------------------------------
+
+To enable a check for CVE security vulnerabilities using :ref:`cve-check <ref-classes-cve-check>` in the specific image
+or target you are building, add the following setting to your configuration::
 
    INHERIT += "cve-check"
 
-This way, at build time, BitBake will warn you about known CVEs
-as in the example below::
+The CVE database contains some old incomplete entries which have been
+deemed not to impact Poky or OE-Core. These CVE entries can be excluded from the
+check using build configuration::
+
+   include conf/distro/include/cve-extra-exclusions.inc
+
+With this CVE check enabled, BitBake build will try to map each compiled software component
+recipe name and version information to the CVE database and generate recipe and
+image specific reports. These reports will contain:
+
+-  metadata about the software component like names and versions
+
+-  metadata about the CVE issue such as description and NVD link
+
+-  for each software component, a list of CVEs which are possibly impacting this version
+
+-  status of each CVE: ``Patched``, ``Unpatched`` or ``Ignored``
+
+The status ``Patched`` means that a patch file to address the security issue has been
+applied. ``Unpatched`` status means that no patches to address the issue have been
+applied and that the issue needs to be investigated. ``Ignored`` means that after
+analysis, it has been deemed to ignore the issue as it for example affects
+the software component on a different operating system platform.
+
+After a build with CVE check enabled, reports for each compiled source recipe will be
+found in ``build/tmp/deploy/cve``.
+
+For example the CVE check report for the ``flex-native`` recipe looks like::
+
+   $ cat poky/build/tmp/deploy/cve/flex-native
+   LAYER: meta
+   PACKAGE NAME: flex-native
+   PACKAGE VERSION: 2.6.4
+   CVE: CVE-2016-6354
+   CVE STATUS: Patched
+   CVE SUMMARY: Heap-based buffer overflow in the yy_get_next_buffer function in Flex before 2.6.1 might allow context-dependent attackers to cause a denial of service or possibly execute arbitrary code via vectors involving num_to_read.
+   CVSS v2 BASE SCORE: 7.5
+   CVSS v3 BASE SCORE: 9.8
+   VECTOR: NETWORK
+   MORE INFORMATION: https://nvd.nist.gov/vuln/detail/CVE-2016-6354
+
+   LAYER: meta
+   PACKAGE NAME: flex-native
+   PACKAGE VERSION: 2.6.4
+   CVE: CVE-2019-6293
+   CVE STATUS: Ignored
+   CVE SUMMARY: An issue was discovered in the function mark_beginning_as_normal in nfa.c in flex 2.6.4. There is a stack exhaustion problem caused by the mark_beginning_as_normal function making recursive calls to itself in certain scenarios involving lots of '*' characters. Remote attackers could leverage this vulnerability to cause a denial-of-service.
+   CVSS v2 BASE SCORE: 4.3
+   CVSS v3 BASE SCORE: 5.5
+   VECTOR: NETWORK
+   MORE INFORMATION: https://nvd.nist.gov/vuln/detail/CVE-2019-6293
+
+For images, a summary of all recipes included in the image and their CVEs is also
+generated in textual and JSON formats. These ``.cve`` and ``.json`` reports can be found
+in the ``tmp/deploy/images`` directory for each compiled image.
+
+At build time CVE check will also throw warnings about ``Unpatched`` CVEs::
 
    WARNING: flex-2.6.4-r0 do_cve_check: Found unpatched CVE (CVE-2019-6293), for more information check /poky/build/tmp/work/core2-64-poky-linux/flex/2.6.4-r0/temp/cve.log
    WARNING: libarchive-3.5.1-r0 do_cve_check: Found unpatched CVE (CVE-2021-36976), for more information check /poky/build/tmp/work/core2-64-poky-linux/libarchive/3.5.1-r0/temp/cve.log
@@ -11522,21 +11560,46 @@ It is also possible to check the CVE status of individual packages as follows::
 
    bitbake -c cve_check flex libarchive
 
-Note that OpenEmbedded-Core keeps a list of known unfixed CVE issues which can
-be ignored. You can pass this list to the check as follows::
+Fixing CVE product name and version mappings
+--------------------------------------------
+
+By default, :ref:`cve-check <ref-classes-cve-check>` uses the recipe name :term:`BPN` as CVE
+product name when querying the CVE database. If this mapping contains false positives, e.g.
+some reported CVEs are not for the software component in question, or false negatives like
+some CVEs are not found to impact the recipe when they should, then the problems can be
+in the recipe name to CVE product mapping. These mapping issues can be fixed by setting
+the :term:`CVE_PRODUCT` variable inside the recipe. This defines the name of the software component in the
+upstream `NIST CVE database <https://nvd.nist.gov/>`__.
 
-   bitbake -c cve_check libarchive -R conf/distro/include/cve-extra-exclusions.inc
+The variable supports using vendor and product names like this::
 
-Enabling vulnerabily tracking in recipes
-----------------------------------------
+   CVE_PRODUCT = "flex_project:flex"
 
-The :term:`CVE_PRODUCT` variable defines the name used to match the recipe name
-against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
+In this example the vendor name used in the CVE database is ``flex_project`` and the
+product is ``flex``. With this setting the ``flex`` recipe only maps to this specific
+product and not products from other vendors with same name ``flex``.
 
-Editing recipes to fix vulnerabilities
---------------------------------------
+Similarly, when the recipe version :term:`PV` is not compatible with software versions used by
+the upstream software component releases and the CVE database, these can be fixed using
+the :term:`CVE_VERSION` variable.
+
+Note that if the CVE entries in the NVD database contain bugs or have missing or incomplete
+information, it is recommended to fix the information there directly instead of working
+around the issues possibly for a long time in Poky and OE-Core side recipes. Feedback to
+NVD about CVE entries can be provided through the `NVD contact form <https://nvd.nist.gov/info/contact-form>`__.
+
+Fixing vulnerabilities in recipes
+---------------------------------
+
+If a CVE security issue impacts a software component, it can be fixed by updating to a newer
+version of the software component or by applying a patch. For Poky and OE-Core master branches, updating
+to a newer software component release with fixes is the best option, but patches can be applied
+if releases are not yet available.
 
-To fix a given known vulnerability, you need to add a patch file to your recipe. Here's
+For stable branches, it is preferred to apply patches for the issues. For some software
+components minor version updates can also be applied if they are backwards compatible.
+
+Here is an example of fixing CVE security issues with patch files,
 an example from the :oe_layerindex:`ffmpeg recipe</layerindex/recipe/47350>`::
 
    SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
@@ -11548,31 +11611,21 @@ an example from the :oe_layerindex:`ffmpeg recipe</layerindex/recipe/47350>`::
               file://fix-CVE-2020-22033-CVE-2020-22019.patch \
               file://fix-CVE-2021-33815.patch \
 
-The :ref:`cve-check <ref-classes-cve-check>` class defines two ways of
-supplying a patch for a given CVE. The first
-way is to use a patch filename that matches the below pattern::
-
-   cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
-
-As shown in the example above, multiple CVE IDs can appear in a patch filename,
-but the :ref:`cve-check <ref-classes-cve-check>` class will only consider
-the last CVE ID in the filename as patched.
-
-The second way to recognize a patched CVE ID is when a line matching the
-below pattern is found in any patch file provided by the recipe::
+A good practice is to include the CVE identifier in both the patch file name
+and inside the patch file commit message using the format::
 
-  cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
+   CVE: CVE-2020-22033
 
-This allows a single patch file to address multiple CVE IDs at the same time.
+CVE checker will then capture this information and change the CVE status to ``Patched``
+in the generated reports.
 
-Of course, another way to fix vulnerabilities is to upgrade to a version
-of the package which is not impacted, typically a more recent one.
-The NIST database knows which versions are vulnerable and which ones
-are not.
+If analysis shows that the CVE issue does not impact the recipe due to configuration, platform,
+version or other reasons, the CVE can be marked as ``Ignored`` using the :term:`CVE_CHECK_IGNORE` variable.
+As mentioned previously, if data in the CVE database is wrong, it is recommend to fix those
+issues in the CVE database directly.
 
-Last but not least, you can choose to ignore vulnerabilities through
-the :term:`CVE_CHECK_SKIP_RECIPE` and :term:`CVE_CHECK_IGNORE`
-variables.
+Recipes can be completely skipped by CVE check by including the recipe name in
+the :term:`CVE_CHECK_SKIP_RECIPE` variable.
 
 Implementation details
 ----------------------
@@ -11589,24 +11642,104 @@ file. The found CVE IDs are also considered as patched.
 Then, the code looks up all the CVE IDs in the NIST database for all the
 products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
 
- - If the package name (:term:`PN`) is part of
-   :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as patched.
+-  If the package name (:term:`PN`) is part of
+   :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as ``Patched``.
 
- - If the CVE ID is part of :term:`CVE_CHECK_IGNORE`, it is
-   considered as patched too.
+-  If the CVE ID is part of :term:`CVE_CHECK_IGNORE`, it is
+   set as ``Ignored``.
 
- - If the CVE ID is part of the patched CVE for the recipe, it is
-   already considered as patched.
+-  If the CVE ID is part of the patched CVE for the recipe, it is
+   already considered as ``Patched``.
 
- - Otherwise, the code checks whether the recipe version (:term:`PV`)
+-  Otherwise, the code checks whether the recipe version (:term:`PV`)
    is within the range of versions impacted by the CVE. If so, the CVE
-   is considered as unpatched.
+   is considered as ``Unpatched``.
 
 The CVE database is stored in :term:`DL_DIR` and can be inspected using
 ``sqlite3`` command as follows::
 
    sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
 
+When analyzing CVEs, it is recommended to:
+
+-  study the latest information in `CVE database <https://nvd.nist.gov/vuln/search>`__.
+
+-  check how upstream developers of the software component addressed the issue, e.g.
+   what patch was applied, which upstream release contains the fix.
+
+-  check what other Linux distributions like `Debian <https://security-tracker.debian.org/tracker/>`__
+   did to analyze and address the issue.
+
+-  follow security notices from other Linux distributions.
+
+-  follow public `open source security mailing lists <https://oss-security.openwall.org/wiki/mailing-lists>`__ for
+   discussions and advance notifications of CVE bugs and software releases with fixes.
+
+Creating a Software Bill of Materials
+=====================================
+
+Once you are able to build an image for your project, once the licenses for
+each software component are all identified (see
+":ref:`dev-manual/common-tasks:working with licenses`") and once vulnerability
+fixes are applied (see ":ref:`dev-manual/common-tasks:checking
+for vulnerabilities`"), the OpenEmbedded build system can generate
+a description of all the components you used, their licenses, their dependencies,
+the changes that were applied and the known vulnerabilities that were fixed.
+
+This description is generated in the form of a *Software Bill of Materials*
+(:term:`SBOM`), using the :term:`SPDX` standard.
+
+When you release software, this is the most standard way to provide information
+about the Software Supply Chain of your software image and SDK. The
+:term:`SBOM` tooling is often used to ensure open source license compliance by
+providing the license texts used in the product which legal departments and end
+users can read in standardized format.
+
+:term:`SBOM` information is also critical to performing vulnerability exposure
+assessments, as all the components used in the Software Supply Chain are listed.
+
+The OpenEmbedded build system doesn't generate such information by default.
+To make this happen, you must inherit the
+:ref:`create-spdx <ref-classes-create-spdx>` class from a configuration file::
+
+   INHERIT += "create-spdx"
+
+You then get :term:`SPDX` output in JSON format as an
+``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` inside the
+:term:`Build Directory`.
+
+This is a toplevel file accompanied by an ``IMAGE-MACHINE.spdx.index.json``
+containing an index of JSON :term:`SPDX` files for individual recipes, together
+with an ``IMAGE-MACHINE.spdx.tar.zst`` compressed archive containing all such
+files.
+
+The :ref:`create-spdx <ref-classes-create-spdx>` class offers options to include
+more information in the output :term:`SPDX` data, such as adding compressed
+archives of the files in the generated target packages
+(:term:`SPDX_ARCHIVE_PACKAGED`), adding a description of the source files
+handled by the target recipes (:term:`SPDX_INCLUDE_SOURCES`) and adding archives
+of these source files themselves (:term:`SPDX_ARCHIVE_SOURCES`).
+
+Though the toplevel :term:`SPDX` output is available in
+``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
+generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such as:
+
+-  The individual :term:`SPDX` JSON files in the ``IMAGE-MACHINE.spdx.tar.zst``
+   archive.
+
+-  Compressed archives of the files in the generated target packages,
+   in ``packages/packagename.tar.zst`` (when :term:`SPDX_ARCHIVE_PACKAGED`
+   is set).
+
+-  Compressed archives of the source files used to build the host tools
+   and the target packages in ``recipes/recipe-packagename.tar.zst``
+   (when :term:`SPDX_ARCHIVE_SOURCES` is set). Those are needed to fulfill
+   "source code access" license requirements.
+
+See the `tools page <https://spdx.dev/resources/tools/>`__ on the :term:`SPDX`
+project website for a list of tools to consume and transform the :term:`SPDX`
+data generated by the OpenEmbedded build system.
+
 Using the Error Reporting Tool
 ==============================
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a6dafe8f90..6e73c5d4fb 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -361,6 +361,32 @@ authors used.
 Both build methods inherit the ``cpan-base`` class for basic Perl
 support.
 
+.. _ref-classes-create-spdx:
+
+``create-spdx.bbclass``
+=======================
+
+The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for
+automatically creating :term:`SPDX` :term:`SBOM` documents based upon image
+and SDK contents.
+
+This class is meant to be inherited globally from a configuration file::
+
+   INHERIT += "create-spdx"
+
+The toplevel :term:`SPDX` output file is generated in JSON format as a
+``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` inside the
+:term:`Build Directory`. There are other related files in the same directory,
+as well as in ``tmp/deploy/spdx``.
+
+The exact behaviour of this class, and the amount of output can be controlled
+by the :term:`SPDX_ARCHIVE_PACKAGED`, :term:`SPDX_ARCHIVE_SOURCES` and
+:term:`SPDX_INCLUDE_SOURCES` variables.
+
+See the description of these variables and the
+":ref:`dev-manual/common-tasks:creating a software bill of materials`"
+section in the Yocto Project Development Manual for more details.
+
 .. _ref-classes-cross:
 
 ``cross.bbclass``
@@ -396,14 +422,62 @@ discussion on these cross-compilation tools.
 ``cve-check.bbclass``
 =====================
 
-The ``cve-check`` class looks for known CVEs (Common Vulnerabilities
-and Exposures) while building an image. This class is meant to be
+The :ref:`cve-check <ref-classes-cve-check>` class looks for known CVEs (Common Vulnerabilities
+and Exposures) while building with BitBake. This class is meant to be
 inherited globally from a configuration file::
 
    INHERIT += "cve-check"
 
+To filter out obsolete CVE database entries which are known not to impact software from Poky and OE-Core,
+add following line to the build configuration file::
+
+   include cve-extra-exclusions.inc
+
 You can also look for vulnerabilities in specific packages by passing
-``-c cve_check`` to BitBake. You will find details in the
+``-c cve_check`` to BitBake.
+
+After building the software with Bitbake, CVE check output reports are available in ``tmp/deploy/cve``
+and image specific summaries in ``tmp/deploy/images/*.cve`` or ``tmp/deploy/images/*.json`` files.
+
+When building, the CVE checker will emit build time warnings for any detected
+issues which are in the state ``Unpatched``, meaning that CVE issue seems to affect the software component
+and version being compiled and no patches to address the issue are applied. Other states
+for detected CVE issues are: ``Patched`` meaning that a patch to address the issue is already
+applied, and ``Ignored`` meaning that the issue can be ignored.
+
+The ``Patched`` state of a CVE issue is detected from patch files with the format
+``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` and using
+CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch file.
+
+If the recipe lists the ``CVE-ID`` in :term:`CVE_CHECK_IGNORE` variable, then the CVE state is reported
+as ``Ignored``. Multiple CVEs can be listed separated by spaces. Example::
+
+   CVE_CHECK_IGNORE += "CVE-2020-29509 CVE-2020-29511"
+
+If CVE check reports that a recipe contains false positives or false negatives, these may be
+fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUCT` and :term:`CVE_VERSION` variables.
+:term:`CVE_PRODUCT` defaults to the plain recipe name :term:`BPN` which can be adjusted to one or more CVE
+database vendor and product pairs using the syntax::
+
+   CVE_PRODUCT = "flex_project:flex"
+
+where ``flex_project`` is the CVE database vendor name and ``flex`` is the product name. Similarly
+if the default recipe version :term:`PV` does not match the version numbers of the software component
+in upstream releases or the CVE database, then the :term:`CVE_VERSION` variable can be used to set the
+CVE database compatible version number, for example::
+
+   CVE_VERSION = "2.39"
+
+Any bugs or missing or incomplete information in the CVE database entries should be fixed in the CVE database
+via the `NVD feedback form <https://nvd.nist.gov/info/contact-form>`__.
+
+Users should note that security is a process, not a product, and thus also CVE checking, analyzing results,
+patching and updating the software should be done as a regular process. The data and assumptions
+required for CVE checker to reliably detect issues are frequently broken in various ways.
+These can only be detected by reviewing the details of the issues and iterating over the generated reports,
+and following what happens in other Linux distributions and in the greater open source community.
+
+You will find some more details in the
 ":ref:`dev-manual/common-tasks:checking for vulnerabilities`"
 section in the Development Tasks Manual.
 
@@ -1975,6 +2049,22 @@ When inherited by a recipe, the ``perlnative`` class supports using the
 native version of Perl built by the build system rather than using the
 version provided by the build host.
 
+.. _ref-classes-pypi:
+
+``pypi.bbclass``
+================
+
+The :ref:`pypi <ref-classes-pypi>` class sets variables appropriately for recipes that build
+Python modules from `PyPI <https://pypi.org/>`__, the Python Package Index.
+By default it determines the PyPI package name based upon :term:`BPN`
+(stripping the "python-" or "python3-" prefix off if present), however in
+some cases you may need to set it manually in the recipe by setting
+:term:`PYPI_PACKAGE`.
+
+Variables set by the :ref:`pypi <ref-classes-pypi>` class include :term:`SRC_URI`, :term:`SECTION`,
+:term:`HOMEPAGE`, :term:`UPSTREAM_CHECK_URI`, :term:`UPSTREAM_CHECK_REGEX`
+and :term:`CVE_PRODUCT`.
+
 .. _ref-classes-python_flit_core:
 
 ``python_flit_core.bbclass``
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index cba514c345..a9c84fe3a5 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -323,6 +323,23 @@ universal, the list includes them just in case:
       :term:`build host<Build Host>` and other components, that can
       work on specific hardware.
 
+   :term:`SBOM`
+      This term means *Software Bill of Materials*. When you distribute
+      software, it offers a description of all the components you used,
+      their corresponding licenses, their dependencies, the changes that were
+      applied and the known vulnerabilities that were fixed.
+
+      This can be used by the recipients of the software to assess
+      their exposure to license compliance and security vulnerability issues.
+
+      See the :wikipedia:`Software Supply Chain <Software_supply_chain>`
+      article on Wikipedia for more details.
+
+      The OpenEmbedded Build System can generate such documentation for your
+      project, in :term:`SPDX` format, based on all the metadata it used to
+      build the software images. See the ":ref:`dev-manual/common-tasks:creating
+      a software bill of materials`" section of the Development Tasks manual.
+
    :term:`Source Directory`
      This term refers to the directory structure
      created as a result of creating a local copy of the ``poky`` Git
@@ -383,6 +400,17 @@ universal, the list includes them just in case:
      ":ref:`overview-manual/development-environment:repositories, tags, and branches`"
      section in the Yocto Project Overview and Concepts Manual.
 
+   :term:`SPDX`
+      This term means *Software Package Data Exchange*, and is used as a open
+      standard for providing a *Software Bill of Materials* (:term:`SBOM`).
+      This standard is developed through a `Linux Foundation project
+      <https://spdx.dev/>`__ and is used by the OpenEmbedded Build System to
+      provide an :term:`SBOM` associated to each a software image.
+
+      For details, see Wikipedia's :wikipedia:`SPDX page <Software_Package_Data_Exchange>`
+      and the ":ref:`dev-manual/common-tasks:creating a software bill of materials`"
+      section of the Development Tasks manual.
+
    :term:`Task`
       A per-recipe unit of execution for BitBake (e.g.
       :ref:`ref-tasks-compile`,
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 47462233c9..c182478a31 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1469,15 +1469,31 @@ system and gives an overview of their function and contents.
          # This is windows only issue.
          CVE_CHECK_IGNORE += "CVE-2020-15523"
 
+   :term:`CVE_CHECK_SHOW_WARNINGS`
+      Specifies whether or not the :ref:`cve-check <ref-classes-cve-check>`
+      class should generate warning messages on the console when unpatched
+      CVEs are found. The default is "1", but you may wish to set it to "0" if
+      you are already examining/processing the logs after the build has
+      completed and thus do not need the warning messages.
+
    :term:`CVE_CHECK_SKIP_RECIPE`
       The list of package names (:term:`PN`) for which
       CVEs (Common Vulnerabilities and Exposures) are ignored.
 
+   :term:`CVE_DB_UPDATE_INTERVAL`
+      Specifies the CVE database update interval in seconds, as used by
+      ``cve-update-db-native``. The default value is "86400" i.e. once a day
+      (24*60*60). If the value is set to "0" then the update will be forced
+      every time. Alternatively, a negative value e.g. "-1" will disable
+      updates entirely.
+
    :term:`CVE_PRODUCT`
       In a recipe, defines the name used to match the recipe name
       against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
 
-      The default is ${:term:`BPN`}. If it does not match the name in the NIST CVE
+      The default is ${:term:`BPN`} (except for recipes that inherit the
+      :ref:`pypi <ref-classes-pypi>` class where it is set based upon
+      :term:`PYPI_PACKAGE`). If it does not match the name in the NIST CVE
       database or matches with multiple entries in the database, the default
       value needs to be changed.
 
@@ -1492,6 +1508,18 @@ system and gives an overview of their function and contents.
 
          CVE_PRODUCT = "vendor:package"
 
+   :term:`CVE_VERSION`
+      In a recipe, defines the version used to match the recipe version
+      against the version in the `NIST CVE database <https://nvd.nist.gov/>`__
+      when usign :ref:`cve-check <ref-classes-cve-check>`.
+
+      The default is ${:term:`PV`} but if recipes use custom version numbers
+      which do not map to upstream software component release versions and the versions
+      used in the CVE database, then this variable can be used to set the
+      version number for :ref:`cve-check <ref-classes-cve-check>`. Example::
+
+          CVE_VERSION = "2.39"
+
    :term:`CVSDIR`
       The directory in which files checked out under the CVS system are
       stored.
@@ -6089,6 +6117,14 @@ system and gives an overview of their function and contents.
 
       :term:`PV` is the default value of the :term:`PKGV` variable.
 
+   :term:`PYPI_PACKAGE`
+      When inheriting the :ref:`pypi <ref-classes-pypi>` class, specifies the
+      `PyPI <https://pypi.org/>`__ package name to be built. The default value
+      is set based upon :term:`BPN` (stripping any "python-" or "python3-"
+      prefix off if present), however for some packages it will need to be set
+      explicitly if that will not match the package name (e.g. where the
+      package name has a prefix, underscores, uppercase letters etc.)
+
    :term:`PYTHON_ABI`
       When used by recipes that inherit the
       :ref:`setuptools3 <ref-classes-setuptools3>` class, denotes the
@@ -7058,6 +7094,77 @@ system and gives an overview of their function and contents.
 
          You can specify only a single URL in :term:`SOURCE_MIRROR_URL`.
 
+   :term:`SPDX_ARCHIVE_PACKAGED`
+      This option allows to add to :term:`SPDX` output compressed archives
+      of the files in the generated target packages.
+
+      Such archives are available in
+      ``tmp/deploy/spdx/MACHINE/packages/packagename.tar.zst``
+      under the :term:`Build Directory`.
+
+      Enable this option as follows::
+
+         SPDX_ARCHIVE_PACKAGED = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling this
+      option multiplied the size of the ``tmp/deploy/spdx`` directory by a
+      factor of 13 (+1.6 GiB for this image), compared to just using the
+      :ref:`create-spdx <ref-classes-create-spdx>` class with no option.
+
+      Note that this option doesn't increase the size of :term:`SPDX`
+      files in ``tmp/deploy/images/MACHINE``.
+
+   :term:`SPDX_ARCHIVE_SOURCES`
+      This option allows to add to :term:`SPDX` output compressed archives
+      of the sources for packages installed on the target. It currently
+      only works when :term:`SPDX_INCLUDE_SOURCES` is set.
+
+      This is one way of fulfilling "source code access" license
+      requirements.
+
+      Such source archives are available in
+      ``tmp/deploy/spdx/MACHINE/recipes/recipe-packagename.tar.zst``
+      under the :term:`Build Directory`.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_SOURCES = "1"
+         SPDX_ARCHIVE_SOURCES = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      these options multiplied the size of the ``tmp/deploy/spdx``
+      directory by a factor of 11 (+1.4 GiB for this image),
+      compared to just using the :ref:`create-spdx <ref-classes-create-spdx>`
+      class with no option.
+
+      Note that using this option only marginally increases the size
+      of the :term:`SPDX` output in ``tmp/deploy/images/MACHINE/``
+      (+ 0.07\% with the tested image), compared to just enabling
+      :term:`SPDX_INCLUDE_SOURCES`.
+
+   :term:`SPDX_INCLUDE_SOURCES`
+      This option allows to add a description of the source files used to build
+      the host tools and the target packages, to the ``spdx.json`` files in
+      ``tmp/deploy/spdx/MACHINE/recipes/`` under the :term:`Build Directory`.
+      As a consequence, the ``spdx.json`` files under the ``by-namespace`` and
+      ``packages`` subdirectories in ``tmp/deploy/spdx/MACHINE`` are also
+      modified to include references to such source file descriptions.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_SOURCES = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      this option multiplied the total size of the ``tmp/deploy/spdx``
+      directory by a factor of 3  (+291 MiB for this image),
+      and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
+      ``tmp/deploy/images/MACHINE`` by a factor of 130 (+15 MiB for this
+      image), compared to just using the
+      :ref:`create-spdx <ref-classes-create-spdx>` class with no option.
+
    :term:`SPDXLICENSEMAP`
       Maps commonly used license names to their SPDX counterparts found in
       ``meta/files/common-licenses/``. For the default :term:`SPDXLICENSEMAP`
-- 
2.34.1


