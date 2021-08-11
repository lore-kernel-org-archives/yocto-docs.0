Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.7950.1628690733815046216
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 07:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0C40BFF804;
	Wed, 11 Aug 2021 14:05:31 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] Manuals: replace "file name" by "filename"
Date: Wed, 11 Aug 2021 16:05:27 +0200
Message-Id: <20210811140527.161382-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are many more instances of "filename" or "filenames" than
of "file name" or "file names".

The winner takes it all!

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst        | 8 ++++----
 documentation/migration-guides/migration-1.5.rst | 2 +-
 documentation/ref-manual/qa-checks.rst           | 2 +-
 documentation/ref-manual/variables.rst           | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 37077d72d4..382dbc727f 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -465,7 +465,7 @@ have to manually merge changes as they occur.
 When you create an append file, you must use the same root name as the
 corresponding recipe file. For example, the append file
 ``someapp_3.1.bbappend`` must apply to ``someapp_3.1.bb``. This
-means the original recipe and append file names are version
+means the original recipe and append filenames are version
 number-specific. If the corresponding recipe is renamed to update to a
 newer version, you must also rename and possibly update the
 corresponding ``.bbappend`` as well. During the build process, BitBake
@@ -6618,7 +6618,7 @@ optional arguments::
       instead of the default False which appends them
    match_path
       match file_regex on the whole relative path to
-      the root rather than just the file name
+      the root rather than just the filename
    aux_files_pattern_verbatim
       Extra item(s) to be added to FILES for each
       package, using the actual derived module name
@@ -11154,7 +11154,7 @@ way is to use a patch filename that matches the below pattern::
 
 As shown in the example above, multiple CVE IDs can appear in a patch filename,
 but the :ref:`cve-check <ref-classes-cve-check>` class will only consider
-the last CVE ID in the file name as patched.
+the last CVE ID in the filename as patched.
 
 The second way to recognize a patched CVE ID is when a line matching the
 below pattern is found in any patch file provided by the recipe::
@@ -11180,7 +11180,7 @@ find unpatched CVE IDs.
 
 First the code goes through each patch file provided by a recipe. If a valid CVE ID
 is found in the name of the file, the corresponding CVE is considered as patched.
-Don't forget that if multiple CVE IDs are found in the file name, only the last
+Don't forget that if multiple CVE IDs are found in the filename, only the last
 one is considered. Then, the code looks for ``CVE: CVE-ID`` lines in the patch
 file. The found CVE IDs are also considered as patched.
 
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index e1ba4a9a13..11c821265c 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -144,7 +144,7 @@ Shortened Git ``SRCREV`` Values
 
 BitBake will now shorten revisions from Git repositories from the normal
 40 characters down to 10 characters within :term:`SRCPV`
-for improved usability in path and file names. This change should be
+for improved usability in path and filenames. This change should be
 safe within contexts where these revisions are used because the chances
 of spatially close collisions is very low. Distant collisions are not a
 major issue in the way the values are used.
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 0ef203c70f..e761395d4d 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -539,7 +539,7 @@ Errors and Warnings
    when a recipe has been renamed. However, if that is not the case, the
    message might indicate that a private version of a library is being
    erroneously picked up as the provider for a common library. If that
-   is the case, you should add the library's ``.so`` file name to
+   is the case, you should add the library's ``.so`` filename to
    :term:`PRIVATE_LIBS` in the recipe that provides
    the private version of the library.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f6d248a193..842f7db470 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3155,7 +3155,7 @@ system and gives an overview of their function and contents.
          IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
    :term:`IMAGE_NAME_SUFFIX`
-      Suffix used for the image output file name - defaults to ``".rootfs"``
+      Suffix used for the image output filename - defaults to ``".rootfs"``
       to distinguish the image file from other files created during image
       building; however if this suffix is redundant or not desired you can
       clear the value of this variable (set the value to ""). For example,
-- 
2.25.1

