Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA72FA373E
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 13:12:23 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web09.7413.1666789937847809612
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 06:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ongCd-00CFsx-Lt; Wed, 26 Oct 2022 16:12:16 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ongCd-00FLjL-BJ; Wed, 26 Oct 2022 16:12:15 +0300
From: mikko.rapeli@linaro.org
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 4/4] common-tasks.rst: refactor and improve "Checking for Vulnerabilities" section
Date: Wed, 26 Oct 2022 16:12:07 +0300
Message-Id: <20221026131207.3655961-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20221026131207.3655961-1-mikko.rapeli@linaro.org>
References: <20221026131207.3655961-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221026131207.3655961-5-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 13:12:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3410

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Add sub section to how Poky and OE-Core handle CVE security issues. This
is a generic intro chapter. Also add note that this is a process which
needs quite a bit of review and iteration to keep products and SW stack
secure, a process not a product.

Then change "Vulnerabilites in images" chapter to
"Vulnerability check at build time" since the process applies to
anything compiled with bitbake, not just images.

Explain details of how to work with cve-check.bbclass, especially
the states Patched, Unpatched and Ignored in the generated reports.

Rename recipe chapter to "Fixing CVE product name and version mappings"
since CVE check has some default which works for all recipes
but generated reports may be completely broken. Fixes are then done with
CVE_PRODUCT and CVE_VERSION.

Give some hints how to analyze "Unpatched" CVEs by checking what happens
in other Linux distros etc.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/dev-manual/common-tasks.rst | 176 +++++++++++++++++-----
 1 file changed, 135 insertions(+), 41 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index dff7e1fd5c..1972af72e2 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11502,8 +11502,8 @@ the license from the fetched source::
 Checking for Vulnerabilities
 ============================
 
-Vulnerabilities in images
--------------------------
+Vulnerabilities in Poky and OE-Core
+-----------------------------------
 
 The Yocto Project has an infrastructure to track and address unfixed
 known security vulnerabilities, as tracked by the public
@@ -11516,14 +11516,78 @@ for packages in Poky and OE-Core, tracking the evolution of the number of
 unpatched CVEs and the status of patches. Such information is available for
 the current development version and for each supported release.
 
-To know which packages are vulnerable to known security vulnerabilities
-in the specific image you are building, add the following setting to your
-configuration::
+Security is a process, not a product, and thus at any time, a number of security
+issues may be impacting Poky and OE-Core. It is up to the maintainers, users,
+contributors and anyone interested in the issues to investigate and possibly fix them by
+updating SW components to newer versions or by applying patches to address them.
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
+With this CVE check enabled, BitBake build will try to map each compiled SW component
+recipe name and version information to the CVE database and generate recipe and
+image specific reports. These reports will contain:
+
+ - meta data about the SW component like names and versions
+
+ - metadata about the CVE issue such as description and NVD link
+
+ - for each SW component, a list of CVEs which possibly impacting this version
+
+ - status of the each CVE: ``Patched``, ``Unpatched`` or ``Ignored``
+
+The status ``Patched`` means that a patch file to address the security issue has been
+applied. ``Unpatched`` status means that no patches to address the issue have been
+applied and that the issue needs to be investigated. ``Ignored`` means that after
+analysis, it has been deemed to ignore the issue as it e.g. affects
+the SW component on a different operating system platform.
+
+After build with CVE check enabled, reports for each compiled source recipe will be
+found from ``build/tmp/deploy/cve``.
+
+For example CVE check report for flex-native recipe looks like::
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
+generated in textual and json format. These ``.cve`` and ``.json`` reports can be found
+in the ``tmp/deploy/images`` directory for each compiled image.
+
+At build time CVE check will also also throw warnings about ``Unpatched`` CVEs::
 
    WARNING: flex-2.6.4-r0 do_cve_check: Found unpatched CVE (CVE-2019-6293), for more information check /poky/build/tmp/work/core2-64-poky-linux/flex/2.6.4-r0/temp/cve.log
    WARNING: libarchive-3.5.1-r0 do_cve_check: Found unpatched CVE (CVE-2021-36976), for more information check /poky/build/tmp/work/core2-64-poky-linux/libarchive/3.5.1-r0/temp/cve.log
@@ -11532,21 +11596,46 @@ It is also possible to check the CVE status of individual packages as follows::
 
    bitbake -c cve_check flex libarchive
 
-Note that OpenEmbedded-Core keeps a list of known unfixed CVE issues which can
-be ignored. You can pass this list to the check as follows::
+Fixing CVE product name and version mappings
+--------------------------------------------
 
-   bitbake -c cve_check libarchive -R conf/distro/include/cve-extra-exclusions.inc
+By default, :ref:`cve-check <ref-classes-cve-check>` uses the recipe name :term:`BPN` as CVE
+product name when querying the CVE database. If this mapping contains false positives, e.g.
+some reported CVEs are not for the SW component in question, or false negatives like
+some CVEs are not found to impact the recipe when they should, then the problems can be
+in the recipe name to CVE product mapping. These mapping issues can be fixed by setting
+the :term:`CVE_PRODUCT` variable inside the recipe. This defines the name of SW component in the
+upstream `NIST CVE database <https://nvd.nist.gov/>`__.
 
-Enabling vulnerabily tracking in recipes
-----------------------------------------
+The variable supports using vendor and product names like this::
 
-The :term:`CVE_PRODUCT` variable defines the name used to match the recipe name
-against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
+   CVE_PRODUCT = "flex_project:flex"
 
-Editing recipes to fix vulnerabilities
---------------------------------------
+In this example from the vendor name used in CVE database is ``flex_project`` and
+product is ``flex``. With this setting the ``flex`` recipe only maps to this specific
+product and not products from other vendors with same name ``flex``.
+
+Similary, when the recipe version :term:`PV` is not compatible with SW versions used by
+the upstream SW component releases and the CVE database, these can be fixed using
+:term:`CVE_VERSION` variable.
+
+Note that if the CVE entries in NVD databse contain bugs or have missing or incomplete
+information, it is recommended to fix the information there directly instead of working
+around the issues for a possibly long time in Poky and OE-Core side recipes. Feedback to
+NVD about CVEs entries can be provided through `NVD contact form <https://nvd.nist.gov/info/contact-form>`__.
+
+Fixing vulnerabilities in recipes
+---------------------------------
+
+If a CVE security issue impacts a SW component, it can be fixed by updating to a newer
+version of the SW component or by applying a patch. For Poky and OE-Core master branch, updating
+to newer SW component release with fixes is the best option, but patches can be applied
+if releases are not yet available.
+
+For stable branches, it is preferred to apply patches for the issues. For some SW
+components minor version updates can also applied if they are backwards compatible.
 
-To fix a given known vulnerability, you need to add a patch file to your recipe. Here's
+Here is an example of fixing CVE security issues with patch files,
 an example from the :oe_layerindex:`ffmpeg recipe</layerindex/recipe/47350>`::
 
    SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
@@ -11558,31 +11647,21 @@ an example from the :oe_layerindex:`ffmpeg recipe</layerindex/recipe/47350>`::
               file://fix-CVE-2020-22033-CVE-2020-22019.patch \
               file://fix-CVE-2021-33815.patch \
 
-The :ref:`cve-check <ref-classes-cve-check>` class defines two ways of
-supplying a patch for a given CVE. The first
-way is to use a patch filename that matches the below pattern::
+Best practice is to include the CVE identifier in both patch file name
+and inside the patch file commit message using format::
 
-   cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+   CVE: CVE-2020-22033
 
-As shown in the example above, multiple CVE IDs can appear in a patch filename,
-but the :ref:`cve-check <ref-classes-cve-check>` class will only consider
-the last CVE ID in the filename as patched.
+CVE checker will then capture this information and change the CVE status to ``Patched``
+in the generated reports.
 
-The second way to recognize a patched CVE ID is when a line matching the
-below pattern is found in any patch file provided by the recipe::
+If analysis shows that the CVE issue does not impact the recipe due to configuration, platform,
+version or other reasons, the CVE can be marked as ``Ignored`` using :term:`CVE_CHECK_IGNORE` variable.
+As mentioned previously, if data in the CVE database is wrong, it is recommend to fix those
+issues in the CVE database directly.
 
-  cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
-
-This allows a single patch file to address multiple CVE IDs at the same time.
-
-Of course, another way to fix vulnerabilities is to upgrade to a version
-of the package which is not impacted, typically a more recent one.
-The NIST database knows which versions are vulnerable and which ones
-are not.
-
-Last but not least, you can choose to ignore vulnerabilities through
-the :term:`CVE_CHECK_SKIP_RECIPE` and :term:`CVE_CHECK_IGNORE`
-variables.
+Recipes can be completely skipped from CVE check by including the recipe name in
+`CVE_CHECK_SKIP_RECIPE` variable.
 
 Implementation details
 ----------------------
@@ -11600,23 +11679,38 @@ Then, the code looks up all the CVE IDs in the NIST database for all the
 products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
 
  - If the package name (:term:`PN`) is part of
-   :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as patched.
+   :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as ``Patched``.
 
  - If the CVE ID is part of :term:`CVE_CHECK_IGNORE`, it is
-   considered as patched too.
+   set as ``Ignored``.
 
  - If the CVE ID is part of the patched CVE for the recipe, it is
    already considered as patched.
 
  - Otherwise, the code checks whether the recipe version (:term:`PV`)
    is within the range of versions impacted by the CVE. If so, the CVE
-   is considered as unpatched.
+   is considered as ``Unpatched``.
 
 The CVE database is stored in :term:`DL_DIR` and can be inspected using
 ``sqlite3`` command as follows::
 
    sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
 
+When analyzing CVEs, it is recommended to:
+
+ - study the latest information in `CVE database <https://nvd.nist.gov/vuln/search>`
+
+ - check how upstream developers of the SW component addressed the issue, e.g.
+   what patch was applied, which upstream release contains the fix
+
+ - check what other Linux distributions like `Debian <https://security-tracker.debian.org/tracker/>`
+   did to analyze and address the issue
+
+ - follow security notices from other Linux distributions
+
+ - follow public `open source security mailing lists <https://oss-security.openwall.org/wiki/mailing-lists>` for
+   discussions and advance notifications of CVE bugs and SW releases with fixes
+
 Using the Error Reporting Tool
 ==============================
 
-- 
2.35.1


