Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.9109.1628695391830896416
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 08:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 965EB20004;
	Wed, 11 Aug 2021 15:23:09 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] sdk-manual: reference obsolete reference to ADT
Date: Wed, 11 Aug 2021 17:23:06 +0200
Message-Id: <20210811152306.221199-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/sdk-manual/intro.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index 2f94aaf874..802d3f3d42 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -12,16 +12,6 @@ Software Development Kit (eSDK) manual. This manual
 explains how to use both the Yocto Project extensible and standard
 SDKs to develop applications and images.
 
-.. note::
-
-   Prior to the 2.0 Release of the Yocto Project, application
-   development was primarily accomplished through the use of the
-   Application Development Toolkit (ADT) and the availability of
-   stand-alone cross-development toolchains and other tools. With the
-   2.1 Release of the Yocto Project, application development has
-   transitioned to within a tool-rich extensible SDK and the more
-   traditional standard SDK.
-
 All SDKs consist of the following:
 
 -  *Cross-Development Toolchain*: This toolchain contains a compiler,
-- 
2.25.1

