Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.5.1623938152284543353
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 06:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 793AF1BF208;
	Thu, 17 Jun 2021 13:55:50 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] sdk-manual: fix wrong word
Date: Thu, 17 Jun 2021 15:55:46 +0200
Message-Id: <20210617135546.252412-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/sdk-manual/working-projects.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 27c69ca7dd..276daa9bb6 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -135,7 +135,7 @@ project:
 
       To learn about environment variables established when you run the
       cross-toolchain environment setup script and how they are used or
-      overridden when the Makefile, see the
+      overridden by the Makefile, see the
       :ref:`sdk-manual/working-projects:makefile-based projects` section.
 
    This next command is a simple way to verify the installation of your
-- 
2.25.1

