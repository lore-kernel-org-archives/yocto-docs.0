Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.12897.1620404501468912036
 for <docs@lists.yoctoproject.org>;
 Fri, 07 May 2021 09:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id D74CE200004;
	Fri,  7 May 2021 16:21:38 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: BBFILES_DYNAMIC - fix punctuation, spacing and quoting issues
Date: Fri,  7 May 2021 18:21:36 +0200
Message-Id: <20210507162136.149225-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0b61f77cb4..9fe27cf4c5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -642,8 +642,10 @@ system and gives an overview of their function and contents.
       introduce a hard dependency on those other layers.
 
       Use the following form for ``BBFILES_DYNAMIC``:
-      collection_name:filename_pattern The following example identifies two
-      collection names and two filename patterns::
+      ``collection_name:filename_pattern``.
+
+      The following example identifies two collection names and two
+      filename patterns::
 
          BBFILES_DYNAMIC += " \
             clang-layer:${LAYERDIR}/bbappends/meta-clang/*/*/*.bbappend \
-- 
2.25.1

