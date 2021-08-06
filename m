Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.3092.1628246244970474632
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 03:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 299B6E0004;
	Fri,  6 Aug 2021 10:37:22 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: further documentation for cve-check
Date: Fri,  6 Aug 2021 12:37:20 +0200
Message-Id: <20210806103720.50047-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
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
 documentation/dev-manual/common-tasks.rst | 67 +++++++++++++++++++++++
 documentation/ref-manual/variables.rst    | 13 ++++-
 2 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 7fa0df4d39..a7eb4642de 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11131,6 +11131,73 @@ Enabling vulnerabily tracking in recipes
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
+``cve-check.bbclass`` defines two ways of supplying a patch for a given CVE. The first
+way is to use a patch file name that matches the below pattern::
+
+   cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+
+As shown in the example above, multiple CVE IDs can appear in a patch file name,
+but the ``cve-check.bbclass`` code will only consider the last CVE ID in the
+file name as patched.
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
+Here's what ``cve-check.bbclass`` does to find unpatched CVE IDs.
+
+First the code goes through each patch file provided by a recipe. If a valid CVE ID
+is found in the name of the file, the corresponding CVE is considered as patched.
+Don't forget that if multiple CVE IDs are found in the file name, only the last
+one is considered. Then, the code looks for ``CVE: CVE-ID`` lines in the patch
+file. The found CVE IDs are also considered as patched.
+
+Then, the code looks-up all the CVE IDs in the NIST database for all the
+products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
+
+ - If the package name (:term:`PN`) is part of
+   :term:`CVE_CHECK_PN_WHITELIST`, it is considered as patched.
+
+ - If the CVE ID is part of :term:`CVE_CHECK_WHITELIST`, it is
+   considered as patched too.
+
+ - If the CVE ID is part of the patched CVEs for the recipe, it is
+   already considered as patched.
+
+ - Otherwise, the code checks whether the recipe version (:term:`PV`)
+   is within the range of versions impacted by the CVE. If so, the CVE
+   is considered as unpatched.
+
 The CVE database is stored in :term:`DL_DIR` and can be inspected using
 ``sqlite3`` command as follows::
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1150940133..cc7be01fc5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1471,11 +1471,22 @@ system and gives an overview of their function and contents.
          variable only in certain contexts (e.g. when building for kernel
          and kernel module recipes).
 
+   :term:`CVE_CHECK_PN_WHITELIST`
+      The list of package names (:term:`PN`) for which
+      CVE vulnerabilities are ignored.
+
+   :term:`CVE_CHECK_WHITELIST`
+      The list of vulnerability CVE IDs which are ignored. Here is
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

