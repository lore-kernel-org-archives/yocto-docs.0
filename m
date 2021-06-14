Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.30331.1623680031632378044
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 07:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 054A01BF208;
	Mon, 14 Jun 2021 14:13:48 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 1/2] releases: clarify supported and outdated releases
Date: Mon, 14 Jun 2021 16:13:41 +0200
Message-Id: <20210614141342.181491-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1688773A2888DDDA.28580@lists.yoctoproject.org>
References: <1688773A2888DDDA.28580@lists.yoctoproject.org>
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

