Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.30332.1623680032574213228
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 07:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 617421BF204;
	Mon, 14 Jun 2021 14:13:50 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 2/2] releases: put release number after "Release Series"
Date: Mon, 14 Jun 2021 16:13:42 +0200
Message-Id: <20210614141342.181491-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614141342.181491-1-michael.opdenacker@bootlin.com>
References: <1688773A2888DDDA.28580@lists.yoctoproject.org>
 <20210614141342.181491-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids a confusion because of the way other manuals
are numbered, and aligns with the way the migration guides
are listed.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
---
 documentation/releases.rst | 54 +++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index 3db5ede7b2..890cd037ff 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -4,15 +4,15 @@
  Supported Release Manuals
 ===========================
 
-*******************************
-3.3 'hardknott' Release Series
-*******************************
+******************************
+Release Series 3.3 (hardknott)
+******************************
 
 - :yocto_docs:`3.3 Documentation </3.3>`
 - :yocto_docs:`3.3.1 Documentation </3.3.1>`
 
 *******************************
-3.2 'gatesgarth' Release Series
+Release Series 3.2 (gatesgarth)
 *******************************
 
 - :yocto_docs:`3.2 Documentation </3.2>`
@@ -22,7 +22,7 @@
 - :yocto_docs:`3.2.4 Documentation </3.2.4>`
 
 ****************************
-3.1 'dunfell' Release Series
+Release Series 3.1 (dunfell)
 ****************************
 
 - :yocto_docs:`3.1 Documentation </3.1>`
@@ -40,7 +40,7 @@
 ==========================
 
 *************************
-3.0 'zeus' Release Series
+Release Series 3.0 (zeus)
 *************************
 
 - :yocto_docs:`3.0 Documentation </3.0>`
@@ -50,7 +50,7 @@
 - :yocto_docs:`3.0.4 Documentation </3.0.4>`
 
 ****************************
-2.7 'warrior' Release Series
+Release Series 2.7 (warrior)
 ****************************
 
 - :yocto_docs:`2.7 Documentation </2.7>`
@@ -60,7 +60,7 @@
 - :yocto_docs:`2.7.4 Documentation </2.7.4>`
 
 *************************
-2.6 'thud' Release Series
+Release Series 2.6 (thud)
 *************************
 
 - :yocto_docs:`2.6 Documentation </2.6>`
@@ -70,16 +70,16 @@
 - :yocto_docs:`2.6.4 Documentation </2.6.4>`
 
 *************************
-2.5 'sumo' Release Series
+Release Series 2.5 (sumo)
 *************************
 
 - :yocto_docs:`2.5 Documentation </2.5>`
 - :yocto_docs:`2.5.1 Documentation </2.5.1>`
 - :yocto_docs:`2.5.2 Documentation </2.5.2>`
 - :yocto_docs:`2.5.3 Documentation </2.5.3>`
- 
+
 **************************
-2.4 'rocko' Release Series
+Release Series 2.4 (rocko)
 **************************
 
 - :yocto_docs:`2.4 Documentation </2.4>`
@@ -89,7 +89,7 @@
 - :yocto_docs:`2.4.4 Documentation </2.4.4>`
 
 *************************
-2.3 'pyro' Release Series
+Release Series 2.3 (pyro)
 *************************
 
 - :yocto_docs:`2.3 Documentation </2.3>`
@@ -99,7 +99,7 @@
 - :yocto_docs:`2.3.4 Documentation </2.3.4>`
 
 **************************
-2.2 'morty' Release Series
+Release Series 2.2 (morty)
 **************************
 
 - :yocto_docs:`2.2 Documentation </2.2>`
@@ -108,7 +108,7 @@
 - :yocto_docs:`2.2.3 Documentation </2.2.3>`
 
 ****************************
-2.1 'krogoth' Release Series
+Release Series 2.1 (krogoth)
 ****************************
 
 - :yocto_docs:`2.1 Documentation </2.1>`
@@ -117,7 +117,7 @@
 - :yocto_docs:`2.1.3 Documentation </2.1.3>`
 
 ***************************
-2.0 'jethro' Release Series
+Release Series 2.0 (jethro)
 ***************************
 
 - :yocto_docs:`1.9 Documentation </1.9>`
@@ -127,7 +127,7 @@
 - :yocto_docs:`2.0.3 Documentation </2.0.3>`
 
 *************************
-1.8 'fido' Release Series
+Release Series 1.8 (fido)
 *************************
 
 - :yocto_docs:`1.8 Documentation </1.8>`
@@ -135,7 +135,7 @@
 - :yocto_docs:`1.8.2 Documentation </1.8.2>`
 
 **************************
-1.7 'dizzy' Release Series
+Release Series 1.7 (dizzy)
 **************************
 
 - :yocto_docs:`1.7 Documentation </1.7>`
@@ -144,16 +144,16 @@
 - :yocto_docs:`1.7.3 Documentation </1.7.3>`
 
 **************************
-1.6 'daisy' Release Series
+Release Series 1.6 (daisy)
 **************************
 
 - :yocto_docs:`1.6 Documentation </1.6>`
 - :yocto_docs:`1.6.1 Documentation </1.6.1>`
 - :yocto_docs:`1.6.2 Documentation </1.6.2>`
 - :yocto_docs:`1.6.3 Documentation </1.6.3>`
- 
+
 *************************
-1.5 'dora' Release Series
+Release Series 1.5 (dora)
 *************************
 
 - :yocto_docs:`1.5 Documentation </1.5>`
@@ -163,7 +163,7 @@
 - :yocto_docs:`1.5.4 Documentation </1.5.4>`
 
 **************************
-1.4 'dylan' Release Series
+Release Series 1.4 (dylan)
 **************************
 
 - :yocto_docs:`1.4 Documentation </1.4>`
@@ -172,9 +172,9 @@
 - :yocto_docs:`1.4.3 Documentation </1.4.3>`
 - :yocto_docs:`1.4.4 Documentation </1.4.4>`
 - :yocto_docs:`1.4.5 Documentation </1.4.5>`
- 
+
 **************************
-1.3 'danny' Release Series
+Release Series 1.3 (danny)
 **************************
 
 - :yocto_docs:`1.3 Documentation </1.3>`
@@ -182,7 +182,7 @@
 - :yocto_docs:`1.3.2 Documentation </1.3.2>`
 
 ***************************
-1.2 'denzil' Release Series
+Release Series 1.2 (denzil)
 ***************************
 
 - :yocto_docs:`1.2 Documentation </1.2>`
@@ -190,7 +190,7 @@
 - :yocto_docs:`1.2.2 Documentation </1.2.2>`
 
 ***************************
-1.1 'edison' Release Series
+Release Series 1.1 (edison)
 ***************************
 
 - :yocto_docs:`1.1 Documentation </1.1>`
@@ -198,7 +198,7 @@
 - :yocto_docs:`1.1.2 Documentation </1.1.2>`
 
 ****************************
-1.0 'bernard' Release Series
+Release Series 1.0 (bernard)
 ****************************
 
 - :yocto_docs:`1.0 Documentation </1.0>`
@@ -206,7 +206,7 @@
 - :yocto_docs:`1.0.2 Documentation </1.0.2>`
 
 ****************************
-0.9 'laverne' Release Series
+Release Series 0.9 (laverne)
 ****************************
 
 - :yocto_docs:`0.9 Documentation </0.9>`
-- 
2.25.1

