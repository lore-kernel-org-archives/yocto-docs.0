Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.1082.1616177662790598959
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 11:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from localhost (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 24EB9240006;
	Fri, 19 Mar 2021 18:14:19 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/1] Update documentation URL
Date: Fri, 19 Mar 2021 19:13:22 +0100
Message-Id: <20210319181321.45758-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319181321.45758-1-michael.opdenacker@bootlin.com>
References: <20210319181321.45758-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 README                                       | 2 +-
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index bab81057f..b3836baba 100644
--- a/README
+++ b/README
@@ -5,7 +5,7 @@ This repository contains documentation materials for a variety of the Yocto
 Project components. In particular see the README under documentation/.
 
 An online version of the documentation can be found at:
-    http://yoctoproject.org/documentation
+    https://docs.yoctoproject.org
 
 Where to Send Patches
 =====================
diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 63083cb13..11d8766ab 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -189,7 +189,7 @@ an entire Linux distribution, including the toolchain, from source.
 
       The Yocto Project has extensive documentation about OE including a reference
       manual which can be found at:
-          http://yoctoproject.org/documentation
+          https://docs.yoctoproject.org
 
       For more information about OpenEmbedded see their website:
           http://www.openembedded.org/
-- 
2.25.1

