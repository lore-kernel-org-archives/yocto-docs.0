Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web09.2759.1613531363795154040
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Feb 2021 19:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lCDDO-0002Qx-3G; Wed, 17 Feb 2021 04:09:22 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lCDDN-0001OD-4M; Wed, 17 Feb 2021 04:09:21 +0100
From: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 3/3] common-tasks.rst: fix typo
Date: Wed, 17 Feb 2021 04:09:10 +0100
Message-Id: <20210217030910.5289-3-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217030910.5289-1-u.oelmann@pengutronix.de>
References: <20210217030910.5289-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 documentation/ref-manual/variables.rst    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 29956e069fe3..b7b59c1727d0 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5908,7 +5908,7 @@ the existing kernel, and then inserts a new kernel:
               $ wic help ls
 
 
-   The following command shows what is in Partition one:
+   The following command shows what is in partition one:
    ::
 
         $ wic ls tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2cb37b6a2b08..2c1af81db4c7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8787,7 +8787,7 @@ system and gives an overview of their function and contents.
       The ``WKS_FILE_DEPENDS`` variable is similar to the
       :term:`DEPENDS` variable. When you use the variable in
       your recipe that builds the Wic image, dependencies you list in the
-      ``WIC_FILE_DEPENDS`` variable are added to the ``DEPENDS`` variable.
+      ``WKS_FILE_DEPENDS`` variable are added to the ``DEPENDS`` variable.
 
       With the ``WKS_FILE_DEPENDS`` variable, you have the possibility to
       specify a list of additional dependencies (e.g. native tools,
-- 
2.29.2

