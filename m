Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.10879.1616755791057036467
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 03:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 259FE60003;
	Fri, 26 Mar 2021 10:49:48 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] SDK manual: fix reference to appendix
Date: Fri, 26 Mar 2021 11:49:42 +0100
Message-Id: <20210326104942.13304-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=14307

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 documentation/sdk-manual/extensible.rst | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index d2ed9a9b8..f1a114368 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -1271,11 +1271,9 @@ To update your installed SDK, use ``devtool`` as follows:
    $ devtool sdk-update
 
 The previous command assumes your SDK provider has set the
-default update URL for you through the
-:term:`SDK_UPDATE_URL`
-variable as described in the "`Providing Updates to the Extensible SDK
-After
-Installation <#sdk-providing-updates-to-the-extensible-sdk-after-installation>`__"
+default update URL for you through the :term:`SDK_UPDATE_URL`
+variable as described in the
+":ref:`sdk-manual/appendix-customizing:Providing Updates to the Extensible SDK After Installation`"
 section. If the SDK provider has not set that default URL, you need to
 specify it yourself in the command as follows: $ devtool sdk-update
 path_to_update_directory
-- 
2.25.1

