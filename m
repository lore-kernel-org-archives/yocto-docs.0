Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE9EC4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 08:56:44 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.8947.1670489795762021338
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Dec 2022 00:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k9sdK5km;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AB6E8100008;
	Thu,  8 Dec 2022 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670489793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=at5pRvYNluD9lYxnbaxVl7ZGFtGpgt5VPizVXnjb4z4=;
	b=k9sdK5kmHns4XZwLCrCdGs5F8x6xlRQ7DJT+W42w6JyvSyxzFOEYdKR2XJM0HZHPwAK+ai
	m1xLPsJ8XYftIQkrABTJ+7zQ2e407wbnmeE9dWiUTCuRr+JUZw/tQ3CmG1IJTpP8wicI4A
	VfZXGRvJNjPyV4txG/yipZoCyEgX8HmPvPp1jP9SKeFsPWIl/ZW6+uoqw0oS8QiDmCKKJw
	nO+eaXjhOqSpi6GIkU88kvCmBPALz72D6jFkh7ESeTsyS8gyeJJ9id6INuRan6nEL/vGqz
	vOfpjgVm0kFAf/4fh76j4mSweoOVIIG3FQTuUhkb00d56a5ZXPwP9mDbtuaV0g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: add missing SPDX license header to source files
Date: Thu,  8 Dec 2022 09:56:29 +0100
Message-Id: <20221208085629.527920-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Dec 2022 08:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3522

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/boilerplate.rst                          | 2 ++
 documentation/genindex.rst                             | 2 ++
 documentation/migration-guides/migration-1.4.rst       | 2 ++
 documentation/migration-guides/migration-1.5.rst       | 2 ++
 documentation/migration-guides/migration-1.6.rst       | 2 ++
 documentation/migration-guides/migration-1.7.rst       | 2 ++
 documentation/migration-guides/migration-1.8.rst       | 2 ++
 documentation/migration-guides/migration-2.0.rst       | 2 ++
 documentation/migration-guides/migration-2.1.rst       | 2 ++
 documentation/migration-guides/migration-2.2.rst       | 2 ++
 documentation/migration-guides/migration-2.3.rst       | 2 ++
 documentation/migration-guides/migration-2.4.rst       | 2 ++
 documentation/migration-guides/migration-2.5.rst       | 2 ++
 documentation/migration-guides/migration-2.6.rst       | 2 ++
 documentation/migration-guides/migration-2.7.rst       | 2 ++
 documentation/migration-guides/migration-3.0.rst       | 2 ++
 documentation/migration-guides/migration-3.1.rst       | 2 ++
 documentation/migration-guides/migration-3.2.rst       | 2 ++
 documentation/migration-guides/migration-3.3.rst       | 2 ++
 documentation/migration-guides/migration-3.4.rst       | 2 ++
 documentation/migration-guides/migration-4.0.rst       | 2 ++
 documentation/migration-guides/migration-4.1.rst       | 2 ++
 documentation/migration-guides/migration-general.rst   | 2 ++
 documentation/migration-guides/release-3.4.rst         | 2 ++
 documentation/migration-guides/release-4.0.rst         | 2 ++
 documentation/migration-guides/release-4.1.rst         | 2 ++
 documentation/migration-guides/release-notes-3.4.1.rst | 2 ++
 documentation/migration-guides/release-notes-3.4.2.rst | 2 ++
 documentation/migration-guides/release-notes-3.4.3.rst | 2 ++
 documentation/migration-guides/release-notes-3.4.4.rst | 2 ++
 documentation/migration-guides/release-notes-3.4.rst   | 2 ++
 documentation/migration-guides/release-notes-4.0.1.rst | 2 ++
 documentation/migration-guides/release-notes-4.0.2.rst | 2 ++
 documentation/migration-guides/release-notes-4.0.3.rst | 2 ++
 documentation/migration-guides/release-notes-4.0.4.rst | 2 ++
 documentation/migration-guides/release-notes-4.0.5.rst | 2 ++
 documentation/migration-guides/release-notes-4.0.rst   | 2 ++
 documentation/migration-guides/release-notes-4.1.1.rst | 2 ++
 documentation/migration-guides/release-notes-4.1.rst   | 2 ++
 39 files changed, 78 insertions(+)

diff --git a/documentation/boilerplate.rst b/documentation/boilerplate.rst
index ad7bb64956..6b7f956707 100644
--- a/documentation/boilerplate.rst
+++ b/documentation/boilerplate.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 .. include:: <xhtml1-lat1.txt>
 .. include:: <xhtml1-symbol.txt>
 
diff --git a/documentation/genindex.rst b/documentation/genindex.rst
index a4af06f656..149e2d36b5 100644
--- a/documentation/genindex.rst
+++ b/documentation/genindex.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 =====
 Index
 =====
diff --git a/documentation/migration-guides/migration-1.4.rst b/documentation/migration-guides/migration-1.4.rst
index 471bfb0f2a..6db2a035b8 100644
--- a/documentation/migration-guides/migration-1.4.rst
+++ b/documentation/migration-guides/migration-1.4.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 1.4 (dylan)
 ===================
 
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 7ddbc01766..e566785b73 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 1.5 (dora)
 ==================
 
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index 06414ba121..1baf8b311a 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 1.6 (daisy)
 ===================
 
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index 0c13e182cb..4dc45ef090 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 1.7 (dizzy)
 ===================
 
diff --git a/documentation/migration-guides/migration-1.8.rst b/documentation/migration-guides/migration-1.8.rst
index 35a2a21e5b..6a1f9ed56d 100644
--- a/documentation/migration-guides/migration-1.8.rst
+++ b/documentation/migration-guides/migration-1.8.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 1.8 (fido)
 ==================
 
diff --git a/documentation/migration-guides/migration-2.0.rst b/documentation/migration-guides/migration-2.0.rst
index 7217853779..66b3c632f9 100644
--- a/documentation/migration-guides/migration-2.0.rst
+++ b/documentation/migration-guides/migration-2.0.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 2.0 (jethro)
 ====================
 
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index 0e266a7ff3..c2fe2e9528 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 2.1 (krogoth)
 =====================
 
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 16e48cc87c..82c8e52df5 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 2.2 (morty)
 ===================
 
diff --git a/documentation/migration-guides/migration-2.3.rst b/documentation/migration-guides/migration-2.3.rst
index 071a1945d3..6126af857d 100644
--- a/documentation/migration-guides/migration-2.3.rst
+++ b/documentation/migration-guides/migration-2.3.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 2.3 (pyro)
 ==================
 
diff --git a/documentation/migration-guides/migration-2.4.rst b/documentation/migration-guides/migration-2.4.rst
index 8904495022..74149f8058 100644
--- a/documentation/migration-guides/migration-2.4.rst
+++ b/documentation/migration-guides/migration-2.4.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 2.4 (rocko)
 ===================
 
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index df117616bc..8456c2306a 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 2.5 (sumo)
 ==================
 
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index 3d5ee18cbd..8e79a3edc9 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 2.6 (thud)
 ==================
 
diff --git a/documentation/migration-guides/migration-2.7.rst b/documentation/migration-guides/migration-2.7.rst
index 1b8f1ce1bb..6b17ceb90b 100644
--- a/documentation/migration-guides/migration-2.7.rst
+++ b/documentation/migration-guides/migration-2.7.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 2.7 (warrior)
 =====================
 
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 967c7e0de8..5ecfe2d54a 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 3.0 (zeus)
 ==================
 
diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index 7fdd3b88a6..cbad40112b 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 3.1 (dunfell)
 =====================
 
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index 630d5c2b94..a5fd8acb62 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 3.2 (gatesgarth)
 ========================
 
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index e8e5935e19..4ba39d6e32 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 3.3 (hardknott)
 =======================
 
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index ac4d08e051..efa4a6d097 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Migration notes for 3.4 (honister)
 ----------------------------------
 
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index 17b1d3c619..b3d30d2a5e 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 4.0 (kirkstone)
 =======================
 
diff --git a/documentation/migration-guides/migration-4.1.rst b/documentation/migration-guides/migration-4.1.rst
index d56fceba0b..14263f70c7 100644
--- a/documentation/migration-guides/migration-4.1.rst
+++ b/documentation/migration-guides/migration-4.1.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 4.1 (langdale)
 ======================
 
diff --git a/documentation/migration-guides/migration-general.rst b/documentation/migration-guides/migration-general.rst
index 4d9dfbe617..c350a4df97 100644
--- a/documentation/migration-guides/migration-general.rst
+++ b/documentation/migration-guides/migration-general.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Introduction
 ============
 
diff --git a/documentation/migration-guides/release-3.4.rst b/documentation/migration-guides/release-3.4.rst
index 66023108c7..043fdd1c9f 100644
--- a/documentation/migration-guides/release-3.4.rst
+++ b/documentation/migration-guides/release-3.4.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 3.4 (honister)
 ======================
 
diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index eb0744cc76..bb9c1a7b2b 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 4.0 (kirkstone)
 =======================
 
diff --git a/documentation/migration-guides/release-4.1.rst b/documentation/migration-guides/release-4.1.rst
index c91724c5e1..10e8d5a2d5 100644
--- a/documentation/migration-guides/release-4.1.rst
+++ b/documentation/migration-guides/release-4.1.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 4.1 (langdale)
 ======================
 
diff --git a/documentation/migration-guides/release-notes-3.4.1.rst b/documentation/migration-guides/release-notes-3.4.1.rst
index 914cbf74ed..097c249a90 100644
--- a/documentation/migration-guides/release-notes-3.4.1.rst
+++ b/documentation/migration-guides/release-notes-3.4.1.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for 3.4.1 (honister)
 ----------------------------------
 
diff --git a/documentation/migration-guides/release-notes-3.4.2.rst b/documentation/migration-guides/release-notes-3.4.2.rst
index 2940d457e8..5ff42d3900 100644
--- a/documentation/migration-guides/release-notes-3.4.2.rst
+++ b/documentation/migration-guides/release-notes-3.4.2.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for 3.4.2 (honister)
 ----------------------------------
 
diff --git a/documentation/migration-guides/release-notes-3.4.3.rst b/documentation/migration-guides/release-notes-3.4.3.rst
index 5e9a1b3958..2af802307d 100644
--- a/documentation/migration-guides/release-notes-3.4.3.rst
+++ b/documentation/migration-guides/release-notes-3.4.3.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for 3.4.3 (honister)
 ----------------------------------
 
diff --git a/documentation/migration-guides/release-notes-3.4.4.rst b/documentation/migration-guides/release-notes-3.4.4.rst
index 01d6ccc01a..0bf9a16209 100644
--- a/documentation/migration-guides/release-notes-3.4.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.4.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for 3.4.4 (honister)
 ----------------------------------
 
diff --git a/documentation/migration-guides/release-notes-3.4.rst b/documentation/migration-guides/release-notes-3.4.rst
index 43638fd60a..6b2b7eade6 100644
--- a/documentation/migration-guides/release-notes-3.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for 3.4 (honister)
 --------------------------------
 
diff --git a/documentation/migration-guides/release-notes-4.0.1.rst b/documentation/migration-guides/release-notes-4.0.1.rst
index 65cbdf7347..c46142a08a 100644
--- a/documentation/migration-guides/release-notes-4.0.1.rst
+++ b/documentation/migration-guides/release-notes-4.0.1.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for 4.0.1 (kirkstone)
 -----------------------------------
 
diff --git a/documentation/migration-guides/release-notes-4.0.2.rst b/documentation/migration-guides/release-notes-4.0.2.rst
index 3490e1f52f..2f724e33c4 100644
--- a/documentation/migration-guides/release-notes-4.0.2.rst
+++ b/documentation/migration-guides/release-notes-4.0.2.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for Yocto-4.0.2 (Kirkstone)
 -----------------------------------------
 
diff --git a/documentation/migration-guides/release-notes-4.0.3.rst b/documentation/migration-guides/release-notes-4.0.3.rst
index d71733aff2..46fe858cb7 100644
--- a/documentation/migration-guides/release-notes-4.0.3.rst
+++ b/documentation/migration-guides/release-notes-4.0.3.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for Yocto-4.0.3 (Kirkstone)
 -----------------------------------------
 
diff --git a/documentation/migration-guides/release-notes-4.0.4.rst b/documentation/migration-guides/release-notes-4.0.4.rst
index 05e3e71785..bb4cc8b185 100644
--- a/documentation/migration-guides/release-notes-4.0.4.rst
+++ b/documentation/migration-guides/release-notes-4.0.4.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Releae notes for Yocto-4.0.4 (Kirkstone)
 -----------------------------------------
 
diff --git a/documentation/migration-guides/release-notes-4.0.5.rst b/documentation/migration-guides/release-notes-4.0.5.rst
index 246d2260c5..172b8b800d 100644
--- a/documentation/migration-guides/release-notes-4.0.5.rst
+++ b/documentation/migration-guides/release-notes-4.0.5.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for Yocto-4.0.5 (Kirkstone)
 -----------------------------------------
 
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 8f14f8dcdc..b1f89cf0a7 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for 4.0 (kirkstone)
 ---------------------------------
 
diff --git a/documentation/migration-guides/release-notes-4.1.1.rst b/documentation/migration-guides/release-notes-4.1.1.rst
index c5cc7d6792..4f31fbf1c7 100644
--- a/documentation/migration-guides/release-notes-4.1.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.1.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for Yocto-4.1.1 (Langdale)
 ----------------------------------------
 
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index 4ffcb7d6f0..b85a18c32c 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release notes for 4.1 (langdale)
 ---------------------------------
 
-- 
2.37.2


