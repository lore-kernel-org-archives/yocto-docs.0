Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.14831.1591373842492189686
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 09:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mark.morton@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 055GHKND025310
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Fri, 5 Jun 2020 09:17:21 -0700 (PDT)
Received: from san-mmorton-lx1.corp.ad.wrs.com (147.11.4.21) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Fri, 5 Jun 2020 09:17:01 -0700
From: "Mark Morton" <Mark.Morton@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] Updated Makefile to build new test-manual
Date: Fri, 5 Jun 2020 09:12:58 -0700
Message-ID: <20200605161258.31442-1-mark.morton@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Mark Morton <mark.morton@windriver.com>
---
 documentation/Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/Makefile b/documentation/Makefile
index 2f7292214..3bdf32b89 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -357,6 +357,15 @@ FIGURES = figures
 STYLESHEET = $(DOC)/*.css
 endif
 
+ifeq ($(DOC),test-manual)
+XSLTOPTS = --xinclude
+ALLPREQ = html tarball
+TARFILES = test-manual.html test-manual-style.css \
+	   figures/test-manual-title.png figures/ab-test-stack.png
+MANUALS = $(DOC)/$(DOC).html
+FIGURES = figures
+STYLESHEET = $(DOC)/*.css
+endif
 
 ##
 # These URI should be rewritten by your distribution's xml catalog to
-- 
2.17.1

