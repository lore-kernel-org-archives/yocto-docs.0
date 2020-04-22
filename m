Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.6813.1587575506506884623
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2020 10:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mark.morton@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03MHBPiP029658
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2020 10:11:35 -0700
Received: from san-mmorton-lx1.corp.ad.wrs.com (147.11.4.21) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 22 Apr 2020 10:11:14 -0700
From: "Mark Morton" <Mark.Morton@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] [docs] Updated patch for publishing
Date: Wed, 22 Apr 2020 10:07:22 -0700
Message-ID: <20200422170722.20375-2-mark.morton@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422170722.20375-1-mark.morton@windriver.com>
References: <20200422170722.20375-1-mark.morton@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

---
 documentation/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 1a33c771f..15644bf92 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -419,8 +419,8 @@ publish:
             echo " "; \
             echo "******** Publishing "$(DOC)".html"; \
             echo " "; \
-            scp -r $(MANUALS) $(STYLESHEET) docs.yp:/var/www/www.yoctoproject.org-docs/$(VER)/$(DOC); \
-            cd $(DOC); scp -r $(FIGURES) docs.yp:/var/www/www.yoctoproject.org-docs/$(VER)/$(DOC); \
+            scp -r $(MANUALS) $(STYLESHEET) www.yoctoproject.org:/var/www/www.yoctoproject.org-docs/$(VER)/$(DOC); \
+            cd $(DOC); scp -r $(FIGURES) www.yoctoproject.org:/var/www/www.yoctoproject.org-docs/$(VER)/$(DOC); \
 	else \
           echo " "; \
           echo $(DOC)".html missing.  Generate the file first then try again."; \
-- 
2.17.1

