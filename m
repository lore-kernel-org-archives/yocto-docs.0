Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.5342.1628674209285096535
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 02:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7EE2E1C0004;
	Wed, 11 Aug 2021 09:30:07 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: fix grammar in post-install script explanations
Date: Wed, 11 Aug 2021 11:30:05 +0200
Message-Id: <20210811093005.157190-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 37077d72d4..38c9fbabfb 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -7737,9 +7737,9 @@ It is very important that you make sure all post-Installation
 (``pkg_postinst``) scripts for packages that are installed into the
 image can be run at the time when the root filesystem is created during
 the build on the host system. These scripts cannot attempt to run during
-first-boot on the target device. With the "read-only-rootfs" feature
-enabled, the build system checks during root filesystem creation to make
-sure all post-installation scripts succeed. If any of these scripts
+the first boot on the target device. With the "read-only-rootfs" feature
+enabled, the build system makes sure that all post-installation scripts
+succeed at file system creation time. If any of these scripts
 still need to be run after the root filesystem is created, the build
 immediately fails. These build-time checks ensure that the build fails
 rather than the target device fails later during its initial boot
-- 
2.25.1

