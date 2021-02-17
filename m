Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.2789.1613531363685650996
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Feb 2021 19:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lCDDO-0002Qv-3G; Wed, 17 Feb 2021 04:09:22 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lCDDN-0001O8-35; Wed, 17 Feb 2021 04:09:21 +0100
From: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 1/3] README: fix 'git send-email' command
Date: Wed, 17 Feb 2021 04:09:08 +0100
Message-Id: <20210217030910.5289-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 6a7f3abe63f9..bab81057fd14 100644
--- a/README
+++ b/README
@@ -17,7 +17,7 @@ The To header can be set as default for this repository:
 
 $ git config sendemail.to docs@lists.yoctoproject.org
 
-Now you can just do 'git send-email origin/master' to send all local patches.
+Now you can just do 'git send-email origin/master..' to send all local patches.
 
 Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
 Mailing list: docs@lists.yoctoproject.org
-- 
2.29.2

