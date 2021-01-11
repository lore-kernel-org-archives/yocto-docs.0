Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.32938.1610366989199495078
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Jan 2021 04:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.100.75
Received: from localhost.localdomain (80-110-100-75.cgn.dynamic.surfer.at [80.110.100.75])
	(Authenticated sender: foss@0leil.net)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPA id 0E97E1C0002;
	Mon, 11 Jan 2021 12:09:46 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] documentation: sphinx-static: switchers.js: add release name in dropdown menu
Date: Mon, 11 Jan 2021 13:09:38 +0100
Message-Id: <20210111120938.20633-1-foss@0leil.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up until now, only the version of a Yocto release was printed, which
isn't very user-friendly.

Add the release name too so that it's obvious to users which release of
Yocto the currently open docs are applying to.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/sphinx-static/switchers.js | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 754de2e6a..fd4dd607d 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,10 +3,10 @@
 
   var all_versions = {
     'dev': 'dev (3.3)',
-    '3.2.1': '3.2.1',
-    '3.1.4': '3.1.4',
-    '3.0.4': '3.0.4',
-    '2.7.4': '2.7.4',
+    '3.2.1': 'gatesgarth (3.2.1)',
+    '3.1.4': 'dunfell (3.1.4)',
+    '3.0.4': 'zeus (3.0.4)',
+    '2.7.4': 'warrior (2.7.4)',
   };
 
   var all_doctypes = {
-- 
2.29.2

