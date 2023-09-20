Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C2DCE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:16:13 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.32328.1695197768402483669
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K0R4Jn98;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEEE54000A;
	Wed, 20 Sep 2023 08:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3G/B0qPtXN2x1tGNs4aULAsLiflVMBTXSSOlQMiQSg=;
	b=K0R4Jn98Df2sJXKDlP4UsZo8WJUZqBtmp2C7j7RnT9xEfetdCBqCNXMjbYuXXVK+iHDxEg
	4yKVo6UjLCdjsB+G2EoRyaVGTc+ePNUWiqZDHC7A4XD4yro4sIqB1H+PKiKeSRgCcCIbbW
	ZwyBTdTqVGZUm3bxOWFZP0z9P7szhuJVQhCachvAn200IuaH0nZjAO7b1zfMC6OiwQclPb
	t5En8b1NKNSqo7j3qPelZrAZRvExiaZdXf+tN9oRtAPbQhnFGYeThyfJylXlzdVaVqm4lh
	JYrSgUzUzhrKgBzkcr0LTsxPvP1NETz1Qx3U4RhyKBabveQ1+Sai1YMT19h9xQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 09/10] manuals: document "mime-xdg" class and MIME_XDG_PACKAGES
Date: Wed, 20 Sep 2023 10:15:43 +0200
Message-Id: <20230920081544.1226760-10-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
References: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4256

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/migration-3.1.rst        |  2 +-
 documentation/ref-manual/classes.rst          | 21 +++++++++++++++++++
 documentation/ref-manual/qa-checks.rst        |  2 +-
 documentation/ref-manual/variables.rst        |  7 +++++++
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index e3fdbbe425..53f6f1e03a 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -238,7 +238,7 @@ Warnings will now be shown at ``do_package_qa`` time in the following
 circumstances:
 
 -  A recipe installs ``.desktop`` files containing ``MimeType`` keys but
-   does not inherit the new ``mime-xdg`` class
+   does not inherit the new :ref:`mime-xdg <ref-classes-mime-xdg>` class
 
 -  A recipe installs ``.xml`` files into ``${datadir}/mime/packages``
    but does not inherit the :ref:`mime <ref-classes-mime>` class
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index d27deb8c08..139f854172 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1577,6 +1577,27 @@ The ``mime`` class generates the proper post-install and post-remove
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
index 4a02e7206a..1e5fe21b02 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -590,7 +590,7 @@ Errors and Warnings
 - ``package contains desktop file with key 'MimeType' but does not inhert mime-xdg: <packagename> path '<file>' [mime-xdg]``
 
     The specified package contains a .desktop file with a 'MimeType' key
-    present, but does not inherit the :ref:`ref-classes-mime-xdg`
+    present, but does not inherit the :ref:`mime-xdg <ref-classes-mime-xdg>`
     class that is required in order for that to be activated. Either add
     ``inherit mime`` to the recipe or remove the files at the
     :ref:`ref-tasks-install` step if they are not needed.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a043d20494..6fa400a574 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4852,6 +4852,13 @@ system and gives an overview of their function and contents.
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


