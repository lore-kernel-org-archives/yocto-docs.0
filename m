Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.12412.1620402739689285891
 for <docs@lists.yoctoproject.org>;
 Fri, 07 May 2021 08:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8E6F220005;
	Fri,  7 May 2021 15:52:17 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: improve SSTATE_MIRRORS documentation
Date: Fri,  7 May 2021 17:52:09 +0200
Message-Id: <20210507155209.147892-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mention the Yocto Project mirrors
Use a more sensible order for such mirrors (dev, latest, latest - 1)
Assign the variable through "?=" (for consistency)

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst      |  7 +++----
 documentation/overview-manual/concepts.rst        |  5 +++++
 documentation/ref-manual/variables.rst            | 10 ++++++++++
 documentation/sdk-manual/appendix-customizing.rst |  7 ++++++-
 4 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 6a12b19ca0..ad26ad05ea 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -240,14 +240,13 @@ an entire Linux distribution, including the toolchain, from source.
       failures by using mirrors. To use mirrors, add these lines to your
       local.conf file in the Build directory::
 
-         SSTATE_MIRRORS = "\
+         SSTATE_MIRRORS ?= "\
          file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH \n \
-         file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION_MINUS_ONE;/PATH;downloadfilename=PATH \n \
          file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH \n \
+         file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION_MINUS_ONE;/PATH;downloadfilename=PATH \n \
          "
 
-
-      The previous examples showed how to add sstate paths for Yocto Project
+      The previous examples showed how to add sstate mirrors for Yocto Project
       &YOCTO_DOC_VERSION_MINUS_ONE;, &YOCTO_DOC_VERSION;, and a development
       area. For a complete index of sstate locations, see http://sstate.yoctoproject.org/.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 2e3f1af442..00aa502855 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1924,6 +1924,11 @@ shared state files. Here is an example::
        file://.\* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
        file://.\* file:///some/local/dir/sstate/PATH"
 
+It's also possible to directly take advantage of Yocto Project's own mirrors,
+for example, for the latest release::
+
+   SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
+
 .. note::
 
    The shared state directory (``SSTATE_DIR``) is organized into two-character
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 957362bb6d..0a8ccdca3c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7117,6 +7117,16 @@ system and gives an overview of their function and contents.
       cache (sstate-cache) results from previous builds. The sstate-cache
       you point to can also be from builds on other machines.
 
+      The simplest configuration is to directly take advantage of Yocto
+      Project's own mirrors, for example, for the development, latest and
+      previous releases::
+
+         SSTATE_MIRRORS ?= "\
+            file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH \n \
+            file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH \n \
+            file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION_MINUS_ONE;/PATH;downloadfilename=PATH \n \
+         "
+
       When pointing to sstate build artifacts on another machine that uses
       a different GCC version for native builds, you must configure
       ``SSTATE_MIRRORS`` with a regular expression that maps local search
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index fb2d78452b..ddc8850dbf 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -269,7 +269,12 @@ source, you need to do a number of things:
    to find the configuration. The variable you need to set is
    :term:`SSTATE_MIRRORS`::
 
-      SSTATE_MIRRORS = "file://.* http://example.com/some_path/sstate-cache/PATH"
+      SSTATE_MIRRORS ?= "file://.* http://example.com/some_path/sstate-cache/PATH"
+
+   It's even possible to directly take advantage of Yocto Project's own mirrors,
+   for example for the current release::
+
+      SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
 
    You can set the
    ``SSTATE_MIRRORS`` variable in two different places:
-- 
2.25.1

