Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.2040.1627671278605241528
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 11:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D3439240003;
	Fri, 30 Jul 2021 18:54:36 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: initial documentation for CVE management
Date: Fri, 30 Jul 2021 20:54:33 +0200
Message-Id: <20210730185433.188851-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This starts to document vulnerability management
and the use of the CVE_PRODUCT variable

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 46 +++++++++++++++++++++++
 documentation/ref-manual/variables.rst    | 11 ++++++
 2 files changed, 57 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 9a6f4e1a8e..aa296850f8 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10528,6 +10528,9 @@ follows:
 1. *Identify the bug or CVE to be fixed:* This information should be
    collected so that it can be included in your submission.
 
+   See :ref:`dev-manual/common-tasks:checking for vulnerabilities`
+   for details about CVE tracking.
+
 2. *Check if the fix is already present in the master branch:* This will
    result in the most straightforward path into the stable branch for the
    fix.
@@ -11090,6 +11093,49 @@ the license from the fetched source::
 
    NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"
 
+Checking for Vulnerabilities
+============================
+
+Vulnerabilities in images
+-------------------------
+
+The Yocto Project has an infrastructure to track and address unfixed
+known security vulnerabilities, as tracked by the public
+`Common Vulnerabilities and Exposures (CVE) <https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures>`__
+database.
+
+To know which packages are vulnerable to known security vulnerabilities,
+add the following setting to your configuration::
+
+   INHERIT += "cve-check"
+
+This way, at build time, BitBake will warn you about known CVEs
+as in the example below::
+
+   WARNING: flex-2.6.4-r0 do_cve_check: Found unpatched CVE (CVE-2019-6293), for more information check /poky/build/tmp/work/core2-64-poky-linux/flex/2.6.4-r0/temp/cve.log
+   WARNING: libarchive-3.5.1-r0 do_cve_check: Found unpatched CVE (CVE-2021-36976), for more information check /poky/build/tmp/work/core2-64-poky-linux/libarchive/3.5.1-r0/temp/cve.log
+
+It is also possible to check the CVE status of individual packages as follows::
+
+   bitbake -c cve_check flex libarchive
+
+Note that OpenEmbedded-Core keeps a list of known unfixed CVE issues which can
+be ignore. You can pass this list to the check as follows::
+
+   bitbake -c cve_check libarchive -R conf/distro/include/cve-extra-exclusions.inc
+
+Enabling vulnerabily tracking in recipes
+----------------------------------------
+
+The :term:`CVE_PRODUCT` variable defines the name used to match the recipe name
+against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
+
+The CVE database is created by a recipe and stored in :term:`DL_DIR`.
+For example, you can look inside the database using the ``sqlite3`` command
+as follows::
+
+   sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
+
 Using the Error Reporting Tool
 ==============================
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b61de1993d..72e1c832c6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1471,6 +1471,17 @@ system and gives an overview of their function and contents.
          variable only in certain contexts (e.g. when building for kernel
          and kernel module recipes).
 
+   :term:`CVE_PRODUCT`
+      In a recipe, defines the name used to match the recipe name
+      against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
+
+      This is only needed in case of a mitmatch, or if the
+      recipes matches with multiples entries in the database.
+
+      Here is an example from the Berkeley DB recipe (``db_${PV}.bb``)::
+
+         CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
+
    :term:`CVSDIR`
       The directory in which files checked out under the CVS system are
       stored.
-- 
2.25.1

