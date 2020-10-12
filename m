Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
 by mx.groups.io with SMTP id smtpd.web11.32778.1602474287898734988
 for <docs@lists.yoctoproject.org>;
 Sun, 11 Oct 2020 20:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 211.128.242.40, mailfrom: ubinux@fujitsu.com)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by mgwym01.jp.fujitsu.com with smtp
	 id 0ead_0ada_c52f9ea7_a606_4e88_a30a_94f923214c2b;
	Mon, 12 Oct 2020 12:44:41 +0900
Received: from pumpkin.openstacklocal (pumpkin.fct.css.fujitsu.com [10.130.70.189])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id DE69CAC009C
	for <docs@lists.yoctoproject.org>; Mon, 12 Oct 2020 12:44:40 +0900 (JST)
Received: by pumpkin.openstacklocal (Postfix, from userid 1001)
	id 8B51B1305; Mon, 12 Oct 2020 12:42:58 +0900 (JST)
From: "leimaohui" <leimaohui@cn.fujitsu.com>
To: docs@lists.yoctoproject.org
Cc: Lei Maohui <leimaohui@cn.fujitsu.com>
Subject: [docs] [PATCH] docs: Updated the status of spdx module.
Date: Mon, 12 Oct 2020 12:42:53 +0900
Message-Id: <20201012034255.2186713-1-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

- Deleted content about old spdx.bbclass.
- Added usage of meta-spdxscanner.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 38 +++++++++++++++++++
 documentation/ref-manual/ref-classes.rst      | 13 -------
 documentation/ref-manual/ref-tasks.rst        | 14 -------
 3 files changed, 38 insertions(+), 27 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index bef8bf840f..80fd23e960 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -11401,6 +11401,8 @@ to be covered by assuming that three main areas of concern exist:
 -  Compilation scripts and modifications to the source code must be
    provided.
 
+-  spdx files can be provided.
+
 There are other requirements beyond the scope of these three and the
 methods described in this section (e.g. the mechanism through which
 source code is distributed).
@@ -11595,6 +11597,42 @@ layers (recipes, configuration files, and so forth) enables you to meet
 your requirements to include the scripts to control compilation as well
 as any modifications to the original source.
 
+Providing spdx files
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The spdx module has been integrated to a layer named meta-spdxscanner.
+meta-spdxscanner provides several kinds of scanner. If you want to enable
+this function, you have to do the following steps:
+
+1. Added meta-spdxscanner layer into ``bblayers.conf``. 
+
+2. Reference to README of meta-spdxscanner, setup the environment(e.g, 
+   setup a fossology server) of scanner.
+
+3. Meta-spdxscanner provids several methods(bbclass) to create spdx files.
+   Please choose one that you want to use and enable the spdx task. You have to
+   add some config options in 
+``local.conf`` file in your
+:term:`Build Directory`.
+The following is an example about how to get spdx files during bitbake 
+by fossology-python.bbclass:
+::
+
+   # Selet fossology-python.bbclass.
+   INHERIT += "fossology-python"
+   # For fossology-python.bbclass, TOKEN is necessary, so, after setup a 
+   # Fossology server, you have to create a token.
+   TOKEN = "eyJ0eXAiO..."
+   # The fossology server is necessary for fossology-python.bbclass.
+   FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo" //Optional
+   # If you want to upload the source code to a special folder.
+   FOLDER_NAME = "xxxx" //Optional
+   # If you don't want to put spdx files in tmp/deploy/spdx, you can change.
+   SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
+
+More usage of meta-spdxscanner, which you can find at:
+https://git.yoctoproject.org/cgit/cgit.cgi/meta-spdxscanner/.
+
 Copying Licenses that Do Not Exist
 ----------------------------------
 
diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 756df2a60f..7277c6bb9d 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -2380,19 +2380,6 @@ Autotools automatically picks up.
 The class also provides variables like ``SITEINFO_ENDIANNESS`` and
 ``SITEINFO_BITS`` that can be used elsewhere in the metadata.
 
-.. _ref-classes-spdx:
-
-``spdx.bbclass``
-================
-
-The ``spdx`` class integrates real-time license scanning, generation of
-SPDX standard output, and verification of license information during the
-build.
-
-.. note::
-
-   This class is currently at the prototype stage in the 1.6 release.
-
 .. _ref-classes-sstate:
 
 ``sstate.bbclass``
diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
index 2569306fc5..ea145644f7 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/ref-tasks.rst
@@ -859,17 +859,3 @@ sure that the machine and metadata branches as specified by the
 branches. If these branches do not exist and
 :term:`AUTOREV` is not being used, the
 ``do_validate_branches`` task fails during the build.
-
-Miscellaneous Tasks
-===================
-
-The following sections describe miscellaneous tasks.
-
-.. _ref-tasks-spdx:
-
-``do_spdx``
------------
-
-A build stage that takes the source code and scans it on a remote
-FOSSOLOGY server in order to produce an SPDX document. This task applies
-only to the :ref:`spdx <ref-classes-spdx>` class.
-- 
2.25.1

