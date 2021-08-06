Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.6333.1628264100354853544
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 08:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3CF6F2000A;
	Fri,  6 Aug 2021 15:34:53 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] manuals: further documentation for cve-check
Date: Fri,  6 Aug 2021 17:34:47 +0200
Message-Id: <20210806153447.59835-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1698BF9C32F2ACEF.15765@lists.yoctoproject.org>
References: <1698BF9C32F2ACEF.15765@lists.yoctoproject.org>
MIME-Version: 1.0
X-Spam-Flag: yes
X-Spam-Level: *********
X-GND-Spam-Score: 144
X-GND-Status: SPAM
Content-Transfer-Encoding: 8bit

This adds details about the actual implementation
of vulnerability checks, about how to fix or ignore
vulnerabilities in recipes, and documents the
CVE_CHECK_PN_WHITELIST and CVE_CHECK_WHITELIST variables.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 73 ++++++++++++++++++++++-
 documentation/ref-manual/classes.rst      | 12 ++++
 documentation/ref-manual/variables.rst    | 13 +++-
 3 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 7fa0df4d39..7b6704184d 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10508,7 +10508,7 @@ Submitting Changes to Stable Release Branches
 
 The process for proposing changes to a Yocto Project stable branch differs
 from the steps described above. Changes to a stable branch must address
-identified bugs or CVEs and should be made carefully in order to avoid the
+identified bugs or CVE and should be made carefully in order to avoid the
 risk of introducing new bugs or breaking backwards compatibility. Typically
 bug fixes must already be accepted into the master branch before they can be
 backported to a stable branch unless the bug in question does not affect the
@@ -11110,7 +11110,7 @@ add the following setting to your configuration::
 
    INHERIT += "cve-check"
 
-This way, at build time, BitBake will warn you about known CVEs
+This way, at build time, BitBake will warn you about known CVE
 as in the example below::
 
    WARNING: flex-2.6.4-r0 do_cve_check: Found unpatched CVE (CVE-2019-6293), for more information check /poky/build/tmp/work/core2-64-poky-linux/flex/2.6.4-r0/temp/cve.log
@@ -11131,6 +11131,75 @@ Enabling vulnerabily tracking in recipes
 The :term:`CVE_PRODUCT` variable defines the name used to match the recipe name
 against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
 
+Editing recipes to fix vulnerabilities
+--------------------------------------
+
+To fix a given known vulnerability, you need to add a patch file to your recipe. Here's
+an example from the :oe_layerindex:`ffmpeg recipe</layerindex/recipe/47350>`::
+
+   SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+              file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
+              file://fix-CVE-2020-20446.patch \
+              file://fix-CVE-2020-20453.patch \
+              file://fix-CVE-2020-22015.patch \
+              file://fix-CVE-2020-22021.patch \
+              file://fix-CVE-2020-22033-CVE-2020-22019.patch \
+              file://fix-CVE-2021-33815.patch \
+
+The :ref:`cve-check <ref-classes-cve-check>` class defines two ways of
+supplying a patch for a given CVE. The first
+way is to use a patch filename that matches the below pattern::
+
+   cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+
+As shown in the example above, multiple CVE IDs can appear in a patch filename,
+but the :ref:`cve-check <ref-classes-cve-check>` class will only consider
+the last CVE ID in the file name as patched.
+
+The second way to recognize a patched CVE ID is when a line matching the
+below pattern is found in any patch file provided by the recipe::
+
+  cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
+
+This allows a single patch file to address multiple CVE IDs at the same time.
+
+Of course, another way to fix vulnerabilities is to upgrade to a version
+of the package which is not impacted, typically a more recent one.
+The NIST database knows which versions are vulnerable and which ones
+are not.
+
+Last but not least, you can choose to ignore vulnerabilities through
+the :term:`CVE_CHECK_PN_WHITELIST` and :term:`CVE_CHECK_WHITELIST`
+variables.
+
+Implementation details
+----------------------
+
+Here's what the :ref:`cve-check <ref-classes-cve-check>` class does to
+find unpatched CVE IDs.
+
+First the code goes through each patch file provided by a recipe. If a valid CVE ID
+is found in the name of the file, the corresponding CVE is considered as patched.
+Don't forget that if multiple CVE IDs are found in the file name, only the last
+one is considered. Then, the code looks for ``CVE: CVE-ID`` lines in the patch
+file. The found CVE IDs are also considered as patched.
+
+Then, the code looks up all the CVE IDs in the NIST database for all the
+products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
+
+ - If the package name (:term:`PN`) is part of
+   :term:`CVE_CHECK_PN_WHITELIST`, it is considered as patched.
+
+ - If the CVE ID is part of :term:`CVE_CHECK_WHITELIST`, it is
+   considered as patched too.
+
+ - If the CVE ID is part of the patched CVE for the recipe, it is
+   already considered as patched.
+
+ - Otherwise, the code checks whether the recipe version (:term:`PV`)
+   is within the range of versions impacted by the CVE. If so, the CVE
+   is considered as unpatched.
+
 The CVE database is stored in :term:`DL_DIR` and can be inspected using
 ``sqlite3`` command as follows::
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 49905f2725..274ea19e6e 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -404,6 +404,18 @@ cross-compilation tools used for building SDKs. See the
 section in the Yocto Project Overview and Concepts Manual for more
 discussion on these cross-compilation tools.
 
+.. _ref-classes-cve-check:
+
+``cve-check.bbclass``
+=====================
+
+The ``cve-check`` class looks for known CVE (Common Vulnerabilities
+and Exposures) while building an image. You can also look for
+vulnerabilities in specific packages by passing ``-c cve_check``
+to BitBake. You will find details in the
+":ref:`dev-manual/common-tasks:checking for vulnerabilities`"
+section in the Development Tasks Manual.
+
 .. _ref-classes-debian:
 
 ``debian.bbclass``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1150940133..27c4bc4ff7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1471,11 +1471,22 @@ system and gives an overview of their function and contents.
          variable only in certain contexts (e.g. when building for kernel
          and kernel module recipes).
 
+   :term:`CVE_CHECK_PN_WHITELIST`
+      The list of package names (:term:`PN`) for which
+      CVE (Common Vulnerabilities and Exposures) are ignored.
+
+   :term:`CVE_CHECK_WHITELIST`
+      The list of CVE IDs which are ignored. Here is
+      an example from the :oe_layerindex:`Python3 recipe</layerindex/recipe/23823>`::
+
+         # This is windows only issue.
+         CVE_CHECK_WHITELIST += "CVE-2020-15523"
+
    :term:`CVE_PRODUCT`
       In a recipe, defines the name used to match the recipe name
       against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
 
-      The default is ${:term:`BPN`}. If it does not match the name in NIST CVE
+      The default is ${:term:`BPN`}. If it does not match the name in the NIST CVE
       database or matches with multiple entries in the database, the default
       value needs to be changed.
 
-- 
2.25.1

