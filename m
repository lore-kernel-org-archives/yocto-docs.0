Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.327.1618595764311254573
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 10:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 76E95100004;
	Fri, 16 Apr 2021 17:56:02 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 1/3] dev-manual: fix code insertion
Date: Fri, 16 Apr 2021 19:55:47 +0200
Message-Id: <20210416175549.161851-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416175549.161851-1-michael.opdenacker@bootlin.com>
References: <20210416175549.161851-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a misaligned code insertion statement, causing
the code block to be misaligned compared to the other ones
in subsequent paragraphs

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 176025f9e8..b3ee2b13b4 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9351,7 +9351,7 @@ automatically for a given task, you can list the variable dependencies
 BitBake has determined by doing the following:
 
 1. Build the recipe containing the task:
-::
+   ::
 
    $ bitbake recipename
 
-- 
2.25.1

