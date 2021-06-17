Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.514.1623937845258002694
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 06:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C9DD81BF207;
	Thu, 17 Jun 2021 13:50:43 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] sdk-manual: add missing index references
Date: Thu, 17 Jun 2021 15:50:39 +0200
Message-Id: <20210617135039.252239-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/sdk-manual/appendix-customizing.rst | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 8c635d1662..73ec7c5e8f 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -128,8 +128,7 @@ adjustments:
    .. note::
 
       You must also reflect this change in the value used for the
-      COREBASE_FILES
-      variable as previously described.
+      :term:`COREBASE_FILES` variable as previously described.
 
 Changing the Extensible SDK Installer Title
 ===========================================
@@ -270,8 +269,7 @@ source, you need to do a number of things:
 
       SSTATE_MIRRORS = "file://.* http://example.com/some_path/sstate-cache/PATH"
 
-   You can set the
-   ``SSTATE_MIRRORS`` variable in two different places:
+   You can set the :term:`SSTATE_MIRRORS` variable in two different places:
 
    -  If the mirror value you are setting is appropriate to be set for
       both the OpenEmbedded build system that is actually building the
-- 
2.25.1

