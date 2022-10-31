Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6534ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 13:21:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.9089.1667222485029202186
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Oct 2022 06:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OetCOCnU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D82011BF208;
	Mon, 31 Oct 2022 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667222483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e5OzPncuKn57iYxCmA1fVN2lYybNT8jskd+7UHvO91M=;
	b=OetCOCnUa9g6RpHX2VEcr9+M2/Ht+15pzxvONvQNuVFAJV4lbKNLQILQAW4wBh/HzeIBgu
	XFiz7HqfhoTXdRLmWAsFTBKVjWDSB3WIoD61qS4cBGRbQF+epyLmDeOkntT3IvM4JOh23K
	53cxFVQJouKoZN36ae3RC19EBtMbITC8f0SuMfVK1YgmVVgJQ3+Z1KK34g1hdfTy4eqxUE
	7OIJNzyZQ9JfL1EkCy4DjLRU5m8haT5rxyaSKcodpcjAPWZ/BLg/wDGfW2P8jp2MRIEPUy
	8mhGB1hPVfVsGnRI5v/Jx4zjC5RIKHZlfOvDDBzNVe5OpgKPXD1xuiZNnsmz8Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: schnitzeltony@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: document "mime-xdg" class and MIME_XDG_PACKAGES
Date: Mon, 31 Oct 2022 14:21:13 +0100
Message-Id: <20221031132113.745643-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Oct 2022 13:21:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3448

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/migration-3.1.rst        |  2 +-
 documentation/ref-manual/classes.rst          | 21 +++++++++++++++++++
 documentation/ref-manual/qa-checks.rst        |  8 +++----
 documentation/ref-manual/variables.rst        |  7 +++++++
 4 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index a6106eefae..7fdd3b88a6 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -238,7 +238,7 @@ Warnings will now be shown at :ref:`ref-tasks-package_qa` time in the following
 circumstances:
 
 -  A recipe installs ``.desktop`` files containing ``MimeType`` keys but
-   does not inherit the new ``mime-xdg`` class
+   does not inherit the new :ref:`mime-xdg <ref-classes-mime-xdg>` class
 
 -  A recipe installs ``.xml`` files into ``${datadir}/mime/packages``
    but does not inherit the :ref:`mime <ref-classes-mime>` class
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3b33783c58..afe483e2a9 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1586,6 +1586,27 @@ The :ref:`mime <ref-classes-mime>` class generates the proper post-install and p
 These scriptlets call ``update-mime-database`` to add the MIME types to
 the shared database.
 
+.. _ref-classes-mime-xdg:
+
+``mime-xdg.bbclass``
+====================
+
+The :ref:`mime-xdg <ref-classes-mime-xdg>` class generates the proper
+post-install and post-remove (postinst/postrm) scriptlets for packages
+that install ``.desktop`` files containing ``MimeType`` entries.
+These scriptlets call ``update-desktop-database`` to add the MIME types
+to the database of MIME types handled by desktop files.
+
+Thanks to this class, when users open a file through a file browser
+on recently created images, they don't have to choose the application
+to open the file from the pool of all known applications, even the ones
+that cannot open the selected file.
+
+If you have recipes installing their ``.desktop`` files as absolute
+symbolic links, the detection of such files cannot be done by the current
+implementation of this class. In this case, you have to add the corresponding
+package names to the :term:`MIME_XDG_PACKAGES` variable.
+
 .. _ref-classes-mirrors:
 
 ``mirrors.bbclass``
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index fb31dc16f9..3947dcfc17 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -590,10 +590,10 @@ Errors and Warnings
 - ``package contains desktop file with key 'MimeType' but does not inhert mime-xdg: <packagename> path '<file>' [mime-xdg]``
 
     The specified package contains a .desktop file with a 'MimeType' key
-    present, but does not inherit the mime-xdg class that is required in
-    order for that to be activated. Either add ``inherit mime`` to the
-    recipe or remove the files at the :ref:`ref-tasks-install` step if they are not
-    needed.
+    present, but does not inherit the :ref:`mime-xdg <ref-classes-mime-xdg>`
+    class that is required in order for that to be activated. Either add
+    ``inherit mime`` to the recipe or remove the files at the
+    :ref:`ref-tasks-install` step if they are not needed.
 
 
 .. _qa-check-src-uri-bad:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index dc6eccb314..4150464161 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4894,6 +4894,13 @@ system and gives an overview of their function and contents.
       The revision currently checked out for the OpenEmbedded-Core layer (path
       determined by :term:`COREBASE`).
 
+   :term:`MIME_XDG_PACKAGES`
+      The current implementation of the :ref:`mime-xdg <ref-classes-mime-xdg>`
+      class cannot detect ``.desktop`` files installed through absolute
+      symbolic links. Use this setting to make the class create post-install
+      and post-remove scripts for these packages anyway, to invoke the
+      ``update-destop-database`` command.
+
    :term:`MIRRORS`
       Specifies additional paths from which the OpenEmbedded build system
       gets source code. When the build system searches for source code, it
-- 
2.34.1


