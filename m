Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.70.1627060702749617932
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jul 2021 10:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id F28DE200002;
	Fri, 23 Jul 2021 17:18:20 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] quick start manual: update "source oe-init-build-env" output
Date: Fri, 23 Jul 2021 19:18:12 +0200
Message-Id: <20210723171812.94176-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index b92b0d33d9..8e2f2d423c 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -207,7 +207,7 @@ an entire Linux distribution, including the toolchain, from source.
           https://docs.yoctoproject.org
 
       For more information about OpenEmbedded see their website:
-          http://www.openembedded.org/
+          https://www.openembedded.org/
 
       ### Shell environment set up for builds. ###
 
@@ -215,12 +215,19 @@ an entire Linux distribution, including the toolchain, from source.
 
       Common targets are:
           core-image-minimal
+          core-image-full-cmdline
           core-image-sato
+          core-image-weston
           meta-toolchain
           meta-ide-support
 
       You can also run generated QEMU images with a command like 'runqemu qemux86-64'
 
+      Other commonly useful commands are:
+       - 'devtool' and 'recipetool' handle common recipe tasks
+       - 'bitbake-layers' handles common layer tasks
+       - 'oe-pkgdata-util' handles common target package tasks
+
    Among other things, the script creates the :term:`Build Directory`, which is
    ``build`` in this case and is located in the :term:`Source Directory`.  After
    the script runs, your current working directory is set to the Build
-- 
2.25.1

