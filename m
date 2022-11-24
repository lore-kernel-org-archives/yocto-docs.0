Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C0EC433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 18:07:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.30393.1669313212793669980
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Nov 2022 10:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PalRkfYu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C092F1BF206;
	Thu, 24 Nov 2022 18:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669313211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LGHXsyef1k86yI2eQ/YGjT+wCuXK9R31/VRnyroUc9o=;
	b=PalRkfYu7iVn5xRjV6VASYA/7GnFqS0YZOu/YMlvQ2zmIcOs8et0kL5AzHEGk0JegFjop+
	lZs7o9E6ok76xT9bWqDBm2tvoi5pNdYCwz6creYHzMvhpymo6uFSu4HKdtYl7scPEhc73Y
	CYGwe/7/rijg9TfEO6v9SZXpOoVSFnuk2dU1vSQ8QiH99MVwCMeXx0aT2y48zdmPhLeQ3h
	LFs2H+oxt00y/i3OGi0Y+3p+GdNqwYpICxFfn4IaMEOH/vKdrS4BQ7UeMW8KlOS+y1+cGv
	AP11UE58whSwC/kv3hY3jVe0kPSzFxQ7J2xYT8MI8TmEQbVOBlOBj6Ge7zR4Jg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [langdale]: backport SPDX documentation and vulnerability improvements
Date: Thu, 24 Nov 2022 19:06:48 +0100
Message-Id: <20221124180648.2481559-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Nov 2022 18:07:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3504

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/conf.py                     |   1 +
 documentation/dev-manual/common-tasks.rst | 289 ++++++++++++++++------
 documentation/ref-manual/terms.rst        |  28 +++
 documentation/ref-manual/variables.rst    |  94 +++++++
 4 files changed, 330 insertions(+), 82 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 07a15ce7de..bd45a73fa6 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -106,6 +106,7 @@ extlinks = {
     'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
     'oe_layerindex': ('https://layers.openembedded.org%s', None),
     'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
+    'wikipedia': ('https://en.wikipedia.org/wiki/%s', None),
 }
 
 # Intersphinx config to use cross reference with BitBake user manual
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 53e7686633..f301ffc693 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11229,8 +11229,6 @@ to be covered by assuming that there are three main areas of concern:
 -  Compilation scripts and modifications to the source code must be
    provided.
 
--  spdx files can be provided.
-
 There are other requirements beyond the scope of these three and the
 methods described in this section (e.g. the mechanism through which
 source code is distributed).
@@ -11422,39 +11420,6 @@ layers (recipes, configuration files, and so forth) enables you to meet
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
-   during BitBake using the fossology-python.bbclass::
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
 
@@ -11495,12 +11460,12 @@ the license from the fetched source::
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
 
 The Yocto Project maintains a `list of known vulnerabilities
@@ -11509,14 +11474,78 @@ for packages in Poky and OE-Core, tracking the evolution of the number of
 unpatched CVEs and the status of patches. Such information is available for
 the current development version and for each supported release.
 
-To know which packages are vulnerable to known security vulnerabilities
-in the specific image you are building, add the following setting to your
-configuration::
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
@@ -11525,21 +11554,46 @@ It is also possible to check the CVE status of individual packages as follows::
 
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
@@ -11551,31 +11605,21 @@ an example from the :oe_layerindex:`ffmpeg recipe</layerindex/recipe/47350>`::
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
@@ -11592,24 +11636,105 @@ file. The found CVE IDs are also considered as patched.
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
+more information in the output :term:`SPDX` data, such as making the generated
+files more human readable (:term:`SPDX_PRETTY`), adding compressed archives of
+the files in the generated target packages (:term:`SPDX_ARCHIVE_PACKAGED`),
+adding a description of the source files handled by the target recipes
+(:term:`SPDX_INCLUDE_SOURCES`) and adding archives of these source files
+themselves (:term:`SPDX_ARCHIVE_SOURCES`).
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
 
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 1e3f718a8f..7e5295a646 100644
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
    :term:`Sysroot`
       When cross-compiling, the target file system may be differently laid
       out and contain different things compared to the host system. The concept
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71e8c272a7..f17960e0e9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1508,6 +1508,18 @@ system and gives an overview of their function and contents.
 
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
@@ -7278,6 +7290,88 @@ system and gives an overview of their function and contents.
 
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
+   :term:`SPDX_PRETTY`
+      This option makes the SPDX output more human-readable, using
+      identation and newlines, instead of the default output in a
+      single line::
+
+         SPDX_PRETTY = "1"
+
+      The generated SPDX files are approximately 20% bigger, but
+      this option is recommended if you want to inspect the SPDX
+      output files with a text editor.
+
    :term:`SPDXLICENSEMAP`
       Maps commonly used license names to their SPDX counterparts found in
       ``meta/files/common-licenses/``. For the default :term:`SPDXLICENSEMAP`
-- 
2.34.1


