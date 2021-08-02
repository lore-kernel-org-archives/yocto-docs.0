Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.20902.1627916108570057713
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 07:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8CD7C40002;
	Mon,  2 Aug 2021 14:55:06 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] manuals: initial documentation for CVE management
Date: Mon,  2 Aug 2021 16:54:54 +0200
Message-Id: <20210802145454.12521-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <169784CA8E208BFA.17923@lists.yoctoproject.org>
References: <169784CA8E208BFA.17923@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This starts to document vulnerability management
and the use of the CVE_PRODUCT variable

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 45 +++++++++++++++++++++++
 documentation/ref-manual/variables.rst    | 12 ++++++
 2 files changed, 57 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 9a6f4e1a8e..5905a650ba 100644
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
@@ -11090,6 +11093,48 @@ the license from the fetched source::
 
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
+be ignored. You can pass this list to the check as follows::
+
+   bitbake -c cve_check libarchive -R conf/distro/include/cve-extra-exclusions.inc
+
+Enabling vulnerabily tracking in recipes
+----------------------------------------
+
+The :term:`CVE_PRODUCT` variable defines the name used to match the recipe name
+against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
+
+The CVE database is stored in :term:`DL_DIR` and can be inspected using
+``sqlite3`` command as follows::
+
+   sqlite3 downloads/CVE_CHECK/nvdcve_1.1.db .dump | grep CVE-2021-37462
+
 Using the Error Reporting Tool
 ==============================
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b61de1993d..1150940133 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1471,6 +1471,18 @@ system and gives an overview of their function and contents.
          variable only in certain contexts (e.g. when building for kernel
          and kernel module recipes).
 
+   :term:`CVE_PRODUCT`
+      In a recipe, defines the name used to match the recipe name
+      against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
+
+      The default is ${:term:`BPN`}. If it does not match the name in NIST CVE
+      database or matches with multiple entries in the database, the default
+      value needs to be changed.
+
+      Here is an example from the :oe_layerindex:`Berkeley DB recipe </layerindex/recipe/544>`::
+
+         CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
+
    :term:`CVSDIR`
       The directory in which files checked out under the CVS system are
       stored.
-- 
2.25.1

