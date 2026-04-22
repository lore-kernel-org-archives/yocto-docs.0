Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0710F9EDF5
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83714.1776867780357607372
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=esHS5Adm;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3CEE8C5C3CD
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68B615FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4C70104609BF;
	Wed, 22 Apr 2026 16:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1qbwAjqaX2jYYKq5kBpxlxhEJygcY+22c0pjU9rT4jU=;
	b=esHS5AdmXkVGvAV3XBcWV8opwmS8fRvM7vlI9hozr8K+hQXiTIFK5y5bP3yTm+0Z91g3Z2
	DnoTE6mMd1FLuZp8rLmSa39883qWhUB/rqo9LhuUegwKp1ohlVUwYa+MaNwUGdEG1zfFK0
	bUpFG39o62s9p/NK+H56lazQ0XCO+zlPrmLB9XE4/8eprHCxiJrYQ0UF7VGUdRrbzfrajQ
	ZlShGjf65Ivf3Me8ofRTWc70Yobfz+6hyzYbWo9786n5NQp4LFj9qXht8PBbSNm8G4fDZq
	gbrrJb4KGdLLw9ivYYAxH9iRtNJiBqMkDAeUv7w+EXDQhps2Wk07fncaaxzQxg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:42 +0200
Subject: [PATCH 09/16] security-manual/vulnerabilities.rst: refresh the
 document after cve-check removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-9-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=19437;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iekRIJzJTK/PLgahojCVLZiuRkEgsBwmb/QDkOSMycQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm5kqZKHk3Ty2mNRdCJAeuSYTAB6pcagUwlr
 KGK5TuJ++2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZuQAKCRDRgEFAKaOo
 NvIDD/oC6DT4Mx5MaLTEMJQuH4F9etdz3Ax5J87kRroCSYbIZhf8T7+NKm9eYTGoW4WTvIP+I6V
 +zvFm1lAyoQwQuTebJ/6ulBvHumqcwEkKP43ZydOw33FHJ5fSsWZUfI949jBxGuLWZ9Ma7RFYpo
 MvQQSyLyM/PFVs7miaQQrYBbZEKUkeGhS4sSfntrL4Nj4WCDBS93htG0DorY7ZxLCb+z7pL9iFO
 hxBmGy9gnVAiMWIRwZBiKHQvX1jGKHmJ2M+4DQeGKLkoUrCfxYDIMijkO4EQRe+GAn025v268f6
 MTbaw+U5EWZa836R8Re4MeoKc3lozbtxOzf5rtx3+nQaRN9BPtAnbYydYrLz0EgjzGyhnc/XAW8
 4AiiHc2Bj3UR3u8+AMgp6Dr8OuIG3/XG4YbOHDRCEaZlyN+EsFToeATK2hGaaN2LWB3pogtZbJW
 C0zxPvc8C3a+OhkUE4CsnI7rMZTeKwIcjLS+L6RFsKITUu4sqz5oJ/igF3rNLE9cfyKfAdeYfq8
 Y0Hf0+w+yRJGz7cOwitjcY2wPsy2LF8QvH3IUUdFQI2Nzj5J4d+6kLsRJdUoTSkOX7X1GPrNsJ9
 ZkENBwvgHkDpAnfWAD9Gp+xmj1VvWRRse8xaZfl3WS0sdCbeoc/igVLe+J+rHG3eFVcNow7o3n/
 rHL6jSA79zhJhWQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9318

The cve-check class was removed with 00de455f8d3a ("classes/cve-check:
remove class") in OE-Core. The sbom-cve-check class replaces it. And
while it can generate the same report (with the same format), the
vulnerabilities document needed an update to reflect the changes.

Notable differences:

- The output report has a different name (but same format)
- There is also an enriched SPDX report containing the vulnerabilities.
  We do not go in details about this one as this is tied to the SPDX
  specification, and much more complicated.
- The sbom-cve-check does not produce warnings when Unpatched CVEs are
  found.
- The implementation details is removed as this is part of the
  sbom-cve-check documentation (add a link to it instead).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/security-manual/vulnerabilities.rst | 218 ++++++++++------------
 1 file changed, 96 insertions(+), 122 deletions(-)

diff --git a/documentation/security-manual/vulnerabilities.rst b/documentation/security-manual/vulnerabilities.rst
index 6121d4d7d..f776edd08 100644
--- a/documentation/security-manual/vulnerabilities.rst
+++ b/documentation/security-manual/vulnerabilities.rst
@@ -27,125 +27,130 @@ patches to fix them, see ":doc:`/contributor-guide/submit-changes`" for details.
 Vulnerability check at build time
 =================================
 
-To enable a check for CVE security vulnerabilities using
-``cve-check`` in the specific image or target you are building,
-add the following setting to your configuration::
+To enable a check for CVE security vulnerabilities in the specific image or
+target you are building, run the following command from your :term:`Build
+Directory`:
 
-   INHERIT += "cve-check"
+.. code-block:: console
 
-The CVE database contains some old incomplete entries which have been
-deemed not to impact :term:`OpenEmbedded-Core (OE-Core)`. These CVE entries can be excluded from the
-check using build configuration::
+   $ bitbake-config-build enable-fragment core/yocto/sbom-cve-check
+
+Or add the following statement to a :term:`configuration file`::
+
+   OE_FRAGMENTS += "core/yocto/sbom-cve-check"
+
+This will enable the :ref:`ref-classes-sbom-cve-check` class and set the
+recommended settings to use it.
+
+The CVE database contains some old incomplete entries which have been deemed not
+to impact :term:`OpenEmbedded-Core (OE-Core)`. These CVE entries can be excluded
+from the check by adding the following statement::
 
    include conf/distro/include/cve-extra-exclusions.inc
 
-With this CVE check enabled, BitBake build will try to map each compiled software component
-recipe name and version information to the CVE database and generate recipe and
-image specific reports. These reports will contain:
+With the :ref:`ref-fragments-core-yocto-sbom-cve-check` fragment enabled, the
+:term:`BitBake` build of an image will try to map each compiled software
+component recipe name and version information to the CVE database and generate
+reports in the deployment directory (:term:`DEPLOY_DIR_IMAGE`), one of which
+being: ``tmp/deploy/images/<machine>/<image-name>-<machine>.rootfs.sbom-cve-check.yocto.json``,
+a report containing:
 
--  metadata about the software component like names and versions
+   -  Metadata about the software component like names and versions
+   -  Metadata about the CVE issue such as description and NVD link
+   -  For each software component, a list of CVEs which are possibly impacting this version
+   -  Status of each CVE: ``Patched``, ``Unpatched`` or ``Ignored``
 
--  metadata about the CVE issue such as description and NVD link
+.. note::
 
--  for each software component, a list of CVEs which are possibly impacting this version
+   Another report named ``<image-name>-<machine>.rootfs.sbom-cve-check.spdx.json``
+   is also generated: this is the enriched :term:`SPDX` file of the image
+   containing the same information contained in the previous point, and a lot
+   more metadata information on the packages included in the image. For more
+   information on :term:`SPDX`, see the :doc:`/dev-manual/sbom` section of the
+   Yocto Project Development Tasks Manual.
 
--  status of each CVE: ``Patched``, ``Unpatched`` or ``Ignored``
+Each item in the ``"package"`` list corresponds to a package installed on the
+built image. Each of these packages contain a number of CVE entries under the
+``"issue"`` sub-list. These CVE can have the following statuses:
 
-The status ``Patched`` means that a patch file to address the security issue has been
-applied. ``Unpatched`` status means that no patches to address the issue have been
-applied and that the issue needs to be investigated. ``Ignored`` means that after
-analysis, it has been deemed to ignore the issue as it for example affects
-the software component on a different operating system platform.
+-  ``Patched`` means that a patch file to address the security issue
+   has been applied.
 
-By default, no NVD API key is used to retrieve data from the CVE database, which
-results in larger delays between NVD API requests. See the ``NVDCVE_API_KEY``
-documentation on how to request and set a NVD API key.
+-  ``Unpatched`` means that no patches to address the issue have been
+   applied and that the issue needs to be investigated.
 
-After a build with CVE check enabled, reports for each compiled source recipe will be
-found in ``build/tmp/deploy/cve``.
+-  ``Ignored`` means that after analysis, it has been deemed to ignore the issue
+   as it for example affects the software component on a different operating
+   system platform.
 
-For example the CVE check report for the ``flex-native`` recipe looks like::
+For example, the report for the ``glibc`` package looks like this (simplified):
+
+.. code-block:: json
 
-   $ cat ./tmp/deploy/cve/flex-native_cve.json
    {
      "version": "1",
      "package": [
        {
-         "name": "flex-native",
-         "layer": "meta",
-         "version": "2.6.4",
+         "name": "glibc",
+         "layer": "core",
+         "version": "2.43+git",
          "products": [
            {
-             "product": "flex",
-             "cvesInRecord": "No"
-           },
-           {
-             "product": "flex",
+             "product": "glibc",
              "cvesInRecord": "Yes"
            }
          ],
          "issue": [
            {
-             "id": "CVE-2006-0459",
-             "status": "Patched",
-             "link": "https://nvd.nist.gov/vuln/detail/CVE-2006-0459",
-             "summary": "flex.skl in Will Estes and John Millaway Fast Lexical Analyzer Generator (flex) before 2.5.33 does not allocate enough memory for grammars containing (1) REJECT statements or (2) trailing context rules, which causes flex to generate code that contains a buffer overflow that might allow context-dependent attackers to execute arbitrary code.",
-             "scorev2": "7.5",
+             "id": "CVE-2010-4756",
+             "status": "Unpatched",
+             "link": "https://nvd.nist.gov/vuln/detail/CVE-2010-4756",
+             "summary": "The glob implementation in the GNU C Library (aka glibc or libc6) allows remote authenticated users to cause a denial of service (CPU and memory consumption) via crafted glob expressions that do not match any pathnames, as demonstrated by glob expressions in STAT commands to an FTP daemon, a different vulnerability than CVE-2010-2632.",
+             "scorev2": "4.0",
              "scorev3": "0.0",
              "scorev4": "0.0",
-             "modified": "2024-11-21T00:06Z",
+             "modified": "2025-11-03T22:15:41.000",
              "vector": "NETWORK",
-             "vectorString": "AV:N/AC:L/Au:N/C:P/I:P/A:P",
-             "detail": "version-not-in-range"
+             "vectorString": "AV:N/AC:L/Au:S/C:N/I:N/A:P",
+             "detail": "no-version-ranges",
+             "description": "Check package version"
            },
            {
-             "id": "CVE-2016-6354",
+             "id": "CVE-2018-6551",
              "status": "Patched",
-             "link": "https://nvd.nist.gov/vuln/detail/CVE-2016-6354",
-             "summary": "Heap-based buffer overflow in the yy_get_next_buffer function in Flex before 2.6.1 might allow context-dependent attackers to cause a denial of service or possibly execute arbitrary code via vectors involving num_to_read.",
+             "link": "https://nvd.nist.gov/vuln/detail/CVE-2018-6551",
+             "summary": "The malloc implementation in the GNU C Library (aka glibc or libc6), from version 2.24 to 2.26 on powerpc, and only in version 2.26 on i386, did not properly handle malloc calls with arguments close to SIZE_MAX and could return a pointer to a heap region that is smaller than requested, eventually leading to heap corruption.",
              "scorev2": "7.5",
              "scorev3": "9.8",
              "scorev4": "0.0",
-             "modified": "2024-11-21T02:55Z",
+             "modified": "2024-11-21T04:10:53.000",
              "vector": "NETWORK",
-             "vectorString": "AV:N/AC:L/Au:N/C:P/I:P/A:P",
+             "vectorString": "CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H",
              "detail": "version-not-in-range"
            },
            {
-             "id": "CVE-2019-6293",
+             "id": "CVE-2019-1010022",
              "status": "Ignored",
-             "link": "https://nvd.nist.gov/vuln/detail/CVE-2019-6293",
-             "summary": "An issue was discovered in the function mark_beginning_as_normal in nfa.c in flex 2.6.4. There is a stack exhaustion problem caused by the mark_beginning_as_normal function making recursive calls to itself in certain scenarios involving lots of '*' characters. Remote attackers could leverage this vulnerability to cause a denial-of-service.",
-             "scorev2": "4.3",
-             "scorev3": "5.5",
+             "link": "https://nvd.nist.gov/vuln/detail/CVE-2019-1010022",
+             "summary": "GNU Libc current is affected by: Mitigation bypass. The impact is: Attacker may bypass stack guard protection. The component is: nptl. The attack vector is: Exploit stack buffer overflow vulnerability and use this bypass vulnerability to bypass stack guard. NOTE: Upstream comments indicate \"this is being treated as a non-security bug and no real threat.",
+             "scorev2": "7.5",
+             "scorev3": "9.8",
              "scorev4": "0.0",
-             "modified": "2024-11-21T04:46Z",
+             "modified": "2024-11-21T04:17:55.000",
              "vector": "NETWORK",
-             "vectorString": "AV:N/AC:M/Au:N/C:N/I:N/A:P",
-             "detail": "upstream-wontfix",
-             "description": "there is stack exhaustion but no bug and it is building the parser, not running it, effectively similar to a compiler ICE. Upstream no plans to address this."
+             "vectorString": "CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H",
+             "description": "Upstream glibc maintainers dispute there is any issue and have no plans to address it further. this is being treated as a non-security bug and no real threat."
            }
-         ]
+         ],
+         "cpes": ["cpe:2.3:*:*:glibc:2.43:*:*:*:*:*:*:*"]
        }
      ]
    }
 
-For images, a summary of all recipes included in the image and their CVEs is also
-generated in the JSON format. These ``.json`` reports can be found
-in the ``tmp/deploy/images`` directory for each compiled image.
-
-At build time CVE check will also throw warnings about ``Unpatched`` CVEs::
-
-   WARNING: qemu-native-9.2.0-r0 do_cve_check: Found unpatched CVE (CVE-2023-1386)
-
-It is also possible to check the CVE status of individual packages as follows::
-
-   bitbake -c cve_check flex libarchive
-
 Fixing CVE product name and version mappings
 ============================================
 
-By default, ``cve-check`` uses the recipe name :term:`BPN` as CVE
+By default, :ref:`ref-classes-sbom-cve-check` uses the recipe name :term:`BPN` as CVE
 product name when querying the CVE database. If this mapping contains false positives, e.g.
 some reported CVEs are not for the software component in question, or false negatives like
 some CVEs are not found to impact the recipe when they should, then the problems can be
@@ -175,7 +180,7 @@ Fixing vulnerabilities in recipes
 
 Suppose a CVE security issue impacts a software component. In that case, it can
 be fixed by updating to a newer version, by applying a patch, or by marking it
-as patched via :term:`CVE_STATUS` variable flag. For OE-Core master
+as patched via :term:`CVE_STATUS` variable flag. For :term:`OpenEmbedded-Core (OE-Core)` master
 branches, updating to a more recent software component release with fixes is
 the best option, but patches can be applied if releases are not yet available.
 
@@ -228,7 +233,7 @@ is::
     1 file changed, 12 insertions(+), 4 deletions(-)
 
 
-For the correct operations of the ``cve-check``, it requires the CVE
+For the correct operations of :ref:`ref-classes-sbom-cve-check`, it requires the CVE
 identification in a ``CVE:`` tag of the patch file commit message using
 the format::
 
@@ -265,8 +270,8 @@ With the additional information, the header of the patch file in OE-core becomes
 A good practice is to include the CVE identifier in the patch file name, the patch file
 commit message and optionally in the recipe commit message.
 
-CVE checker will then capture this information and change the CVE status to ``Patched``
-in the generated reports.
+:ref:`ref-classes-sbom-cve-check` will then capture this information and change the CVE
+status to ``Patched`` in the generated reports.
 
 If analysis shows that the CVE issue does not impact the recipe due to configuration, platform,
 version or other reasons, the CVE can be marked as ``Ignored`` by using
@@ -282,44 +287,6 @@ to fix those issues in the CVE database (NVD in the case of
 Note that if there are many CVEs with the same status and reason, those can be
 shared by using the :term:`CVE_STATUS_GROUPS` variable.
 
-Recipes can be completely skipped by CVE check by including the recipe name in
-the :term:`CVE_CHECK_SKIP_RECIPE` variable.
-
-Implementation details
-======================
-
-Here's what the ``cve-check`` class does to find unpatched CVE IDs.
-
-First the code goes through each patch file provided by a recipe. If a valid CVE ID
-is found in the name of the file, the corresponding CVE is considered as patched.
-Don't forget that if multiple CVE IDs are found in the filename, only the last
-one is considered. Then, the code looks for ``CVE: CVE-ID`` lines in the patch
-file. The found CVE IDs are also considered as patched.
-Additionally ``CVE_STATUS`` variable flags are parsed for reasons mapped to ``Patched``
-and these are also considered as patched.
-
-Then, the code looks up all the CVE IDs in the NIST database for all the
-products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
-
--  If the package name (:term:`PN`) is part of
-   :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as ``Patched``.
-
--  If the CVE ID has status ``CVE_STATUS[<CVE ID>] = "ignored"`` or if it's set to
-   any reason which is mapped to status ``Ignored`` via ``CVE_CHECK_STATUSMAP``,
-   it is  set as ``Ignored``.
-
--  If the CVE ID is part of the patched CVE for the recipe, it is
-   already considered as ``Patched``.
-
--  Otherwise, the code checks whether the recipe version (:term:`PV`)
-   is within the range of versions impacted by the CVE. If so, the CVE
-   is considered as ``Unpatched``.
-
-The CVE database is stored in :term:`DL_DIR` and can be inspected using
-``sqlite3`` command as follows::
-
-   sqlite3 downloads/CVE_CHECK2/nvd*.db .dump | grep CVE-2021-37462
-
 When analyzing CVEs, it is recommended to:
 
 -  study the latest information in `CVE database <https://nvd.nist.gov/vuln/search>`__.
@@ -335,6 +302,12 @@ When analyzing CVEs, it is recommended to:
 -  follow public `open source security mailing lists <https://oss-security.openwall.org/wiki/mailing-lists>`__ for
    discussions and advance notifications of CVE bugs and software releases with fixes.
 
+Implementation details
+======================
+
+As :ref:`ref-classes-sbom-cve-check` is an external tool, its implementation is detailed on
+the official documentation: https://sbom-cve-check.readthedocs.io/en/latest/index.html
+
 Linux kernel vulnerabilities
 ============================
 
@@ -396,15 +369,16 @@ Then the CVE information will automatically be added in the
 
 The ``openembedded-core/scripts/contrib/improve_kernel_cve_report.py`` script
 leverages CVE kernel metadata and the :term:`SPDX_INCLUDE_COMPILED_SOURCES`
-variable to update a ``cve-summary.json`` file. It reduces CVE false
-positives by 70%-80% and provide detailed responses for all kernel-related
-CVEs by analyzing the files used to build the kernel. The script is decoupled from
-the build and can be run outside of the :term:`BitBake` environment.
+variable to update an output ``.sbom-cve-check.yocto.json`` report file (see
+section :ref:`security-manual/vulnerabilities:Vulnerability check at build time`
+for details on these report files). It reduces CVE false positives by 70%-80%
+and provide detailed responses for all kernel-related CVEs by analyzing the
+files used to build the kernel. The script is decoupled from the build and
+can be run outside of the :term:`BitBake` environment.
 
-The script uses the output from the :ref:`ref-classes-vex` or
-``cve-check`` class as input, together with CVE information from
-the Linux kernel CNA to enrich the ``cve-summary.json`` file with updated CVE
-information.
+The script uses the output from the :ref:`ref-classes-vex` as input, together
+with CVE information from the Linux kernel CNA to enrich the
+report file with updated CVE information.
 
 The file name can be specified as argument. Optionally, it can also use the
 list of compiled files from the kernel :term:`SPDX` to ignore CVEs that are
@@ -465,7 +439,7 @@ the first two examples, using the old cve-summary.json.
       $ python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.py \
          --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.json \
          --datadir ~/vulns \
-         --old-cve-report build/tmp/log/cve/cve-summary.json
+         --old-cve-report build/tmp/deploy/images/<machine>/<image-name>-<machine>.rootfs.sbom-cve-check.yocto.json
 
 -  Example using ``--debug-sources`` file instead of SPDX kernel file:
 
@@ -474,7 +448,7 @@ the first two examples, using the old cve-summary.json.
       $ python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.py \
          --debug-sources tmp/pkgdata/qemux86_64/debugsources/linux-yocto-debugsources.json.zstd \
          --datadir ~/vulns \
-         --old-cve-report build/tmp/log/cve/cve-summary.json
+         --old-cve-report build/tmp/deploy/images/<machine>/<image-name>-<machine>.rootfs.sbom-cve-check.yocto.json
 
 -  Example using the ``--kernel-version``:
 

-- 
2.53.0


