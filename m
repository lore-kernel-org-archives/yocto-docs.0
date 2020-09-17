Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.4649.1600377051453062016
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 14:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPA id 8E98F200004;
	Thu, 17 Sep 2020 21:10:46 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 1/2] docs: static: theme_overrides.css: fix responsive design on <640px screens
Date: Thu, 17 Sep 2020 23:09:46 +0200
Message-Id: <20200917210947.51974-1-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From experience the body takes the whole space anyway and the text stays
within the screen boundaries by default, no need to make the min-width
640px then.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/sphinx-static/theme_overrides.css | 2 --
 1 file changed, 2 deletions(-)

diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index c18053398..55da38a2b 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -4,8 +4,6 @@
 
 body {
   font-family: Verdana, Sans, sans-serif;
-
-  min-width: 640px;
   margin:  0em auto;
   color: #333;
 }
-- 
2.26.2

