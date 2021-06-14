Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.29951.1623678756652906190
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 06:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0E230100006;
	Mon, 14 Jun 2021 13:52:33 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] manuals: clarify supported and outdated releases
Date: Mon, 14 Jun 2021 15:52:29 +0200
Message-Id: <20210614135229.180986-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16887684E2AB1F25.10009@lists.yoctoproject.org>
References: <16887684E2AB1F25.10009@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
---
 documentation/releases.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index 56f2def0c5..3db5ede7b2 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-=========================
- Current Release Manuals
-=========================
+===========================
+ Supported Release Manuals
+===========================
 
 *******************************
 3.3 'hardknott' Release Series
@@ -36,7 +36,7 @@
 - :yocto_docs:`3.1.8 Documentation </3.1.8>`
 
 ==========================
- Previous Release Manuals
+ Outdated Release Manuals
 ==========================
 
 *************************
-- 
2.25.1

