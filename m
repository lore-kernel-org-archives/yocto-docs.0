Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB952C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 08:41:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.5777.1667896901452608699
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 00:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QT0c1nhO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7245B1BF206;
	Tue,  8 Nov 2022 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667896899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qPJMiWxwOtLgt086qfWS+KX1jQMOUJC5h3W5fwpToZo=;
	b=QT0c1nhOStv+clb2O9agx32OaZ0diZ49+PLUyCVRRSFLSx4MsD43lqXo3Uj8wwriuz/Nw5
	GfwtsNxLLWW83m61iQLVcMhu2tHP7yGC3Mpsmh/lJMlZQNG+dbGYoRGtRCvWMffLhm/A71
	lmdhjBrdWVP9EoFEIBkztwzotJ1O1pjCMIlIROLqS2oRQFHPl64B+AF5NvGRpRxlgRpYdF
	w+ID6dIkHdsbqiiOaGxrj1AXkksV4i2FN0Mh1bMnuE9ECnZjIttkYZlQ2w8y5ZPXipxF9e
	9EwVyxqdnLFa8eQEnYMvrsjtFEIM/nocIBlEifIUkefF5FSbpOhL230bNa0rKg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] release-notes: fix links to git.yoctoproject.org repositories
Date: Tue,  8 Nov 2022 09:41:37 +0100
Message-Id: <20221108084137.440012-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 08:41:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3469

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.0.2.rst | 8 ++++----
 documentation/migration-guides/release-notes-4.0.3.rst | 8 ++++----
 documentation/migration-guides/release-notes-4.0.4.rst | 8 ++++----
 documentation/migration-guides/release-notes-4.0.rst   | 8 ++++----
 documentation/migration-guides/release-notes-4.1.rst   | 6 +++---
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.0.2.rst b/documentation/migration-guides/release-notes-4.0.2.rst
index 632af11297..66779515e6 100644
--- a/documentation/migration-guides/release-notes-4.0.2.rst
+++ b/documentation/migration-guides/release-notes-4.0.2.rst
@@ -230,7 +230,7 @@ Repositories / Downloads for Yocto-4.0.2
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: https://git.yoctoproject.org/poky
 -  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.2 </poky/log/?h=yocto-4.0.2>`
 -  Git Revision: :yocto_git:`a5ea426b1da472fc8549459fff3c1b8c6e02f4b5 </poky/commit/?id=a5ea426b1da472fc8549459fff3c1b8c6e02f4b5>`
@@ -254,7 +254,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: https://git.yoctoproject.org/meta-mingw
 -  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.2 </meta-mingw/log/?h=yocto-4.0.2>`
 -  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
@@ -266,7 +266,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/git/meta-gplv2
+-  Repository Location: https://git.yoctoproject.org/meta-gplv2
 -  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.2 </meta-gplv2/log/?h=yocto-4.0.2>`
 -  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
@@ -290,7 +290,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: https://git.yoctoproject.org/yocto-docs
 -  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.2 </yocto-docs/log/?h=yocto-4.0.2>`
 -  Git Revision: :yocto_git:`662294dccd028828d5c7e9fd8f5c8e14df53df4b </yocto-docs/commit/?id=662294dccd028828d5c7e9fd8f5c8e14df53df4b>`
diff --git a/documentation/migration-guides/release-notes-4.0.3.rst b/documentation/migration-guides/release-notes-4.0.3.rst
index 83e12a64ef..5c89b7c9ba 100644
--- a/documentation/migration-guides/release-notes-4.0.3.rst
+++ b/documentation/migration-guides/release-notes-4.0.3.rst
@@ -247,7 +247,7 @@ Repositories / Downloads for Yocto-4.0.3
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: https://git.yoctoproject.org/poky
 -  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.3 </poky/log/?h=yocto-4.0.3>`
 -  Git Revision: :yocto_git:`387ab5f18b17c3af3e9e30dc58584641a70f359f </poky/commit/?id=387ab5f18b17c3af3e9e30dc58584641a70f359f>`
@@ -271,7 +271,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: https://git.yoctoproject.org/meta-mingw
 -  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.3 </meta-mingw/log/?h=yocto-4.0.3>`
 -  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
@@ -283,7 +283,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/git/meta-gplv2
+-  Repository Location: https://git.yoctoproject.org/meta-gplv2
 -  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.3 </meta-gplv2/log/?h=yocto-4.0.3>`
 -  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
@@ -307,7 +307,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: https://git.yoctoproject.org/yocto-docs
 -  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.3 </yocto-docs/log/?h=yocto-4.0.3>`
 -  Git Revision: :yocto_git:`d9b3dcf65ef25c06f552482aba460dd16862bf96 </yocto-docs/commit/?id=d9b3dcf65ef25c06f552482aba460dd16862bf96>`
diff --git a/documentation/migration-guides/release-notes-4.0.4.rst b/documentation/migration-guides/release-notes-4.0.4.rst
index 43f92cae84..1a6cefa483 100644
--- a/documentation/migration-guides/release-notes-4.0.4.rst
+++ b/documentation/migration-guides/release-notes-4.0.4.rst
@@ -233,7 +233,7 @@ Repositories / Downloads for Yocto-4.0.4
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: https://git.yoctoproject.org/poky
 -  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.4 </poky/log/?h=yocto-4.0.4>`
 -  Git Revision: :yocto_git:`d64bef1c7d713b92a51228e5ade945835e5a94a4 </poky/commit/?id=d64bef1c7d713b92a51228e5ade945835e5a94a4>`
@@ -257,7 +257,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: https://git.yoctoproject.org/meta-mingw
 -  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.4 </meta-mingw/log/?h=yocto-4.0.4>`
 -  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
@@ -269,7 +269,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/git/meta-gplv2
+-  Repository Location: https://git.yoctoproject.org/meta-gplv2
 -  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.4 </meta-gplv2/log/?h=yocto-4.0.4>`
 -  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
@@ -293,7 +293,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: https://git.yoctoproject.org/yocto-docs
 -  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.4 </yocto-docs/log/?h=yocto-4.0.4>`
 -  Git Revision: :yocto_git:`f632dad24c39778f948014029e74db3c871d9d21 </yocto-docs/commit/?id=f632dad24c39778f948014029e74db3c871d9d21>`
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 02cde0e3f3..45d1e01044 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -866,7 +866,7 @@ Repositories / Downloads for 4.0
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: https://git.yoctoproject.org/poky
 -  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0 </poky/tag/?h=yocto-4.0>`
 -  Git Revision: :yocto_git:`00cfdde791a0176c134f31e5a09eff725e75b905 </poky/commit/?id=00cfdde791a0176c134f31e5a09eff725e75b905>`
@@ -890,7 +890,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: https://git.yoctoproject.org/meta-mingw
 -  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0 </meta-mingw/tag/?h=yocto-4.0>`
 -  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
@@ -902,7 +902,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/git/meta-gplv2
+-  Repository Location: https://git.yoctoproject.org/meta-gplv2
 -  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0 </meta-gplv2/tag/?h=yocto-4.0>`
 -  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-mingw/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
@@ -926,7 +926,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: https://git.yoctoproject.org/yocto-docs
 -  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0 </yocto-docs/tag/?h=yocto-4.0>`
 -  Git Revision: :yocto_git:`a6f571ad5b087385cad8765ed455c4b4eaeebca6 </yocto-docs/commit/?id=a6f571ad5b087385cad8765ed455c4b4eaeebca6>`
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index d4ed23f63d..53ad78ef17 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -704,7 +704,7 @@ Repositories / Downloads for 4.1
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: https://git.yoctoproject.org/poky
 -  Branch: :yocto_git:`langdale </poky/log/?h=langdale>`
 -  Tag:  :yocto_git:`yocto-4.1 </poky/log/?h=yocto-4.1>`
 -  Git Revision: :yocto_git:`5200799866b92259e855051112520006e1aaaac0 </poky/commit/?id=5200799866b92259e855051112520006e1aaaac0>`
@@ -728,7 +728,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: https://git.yoctoproject.org/meta-mingw
 -  Branch: :yocto_git:`langdale </meta-mingw/log/?h=langdale>`
 -  Tag:  :yocto_git:`yocto-4.1 </meta-mingw/log/?h=yocto-4.1>`
 -  Git Revision: :yocto_git:`b0067202db8573df3d23d199f82987cebe1bee2c </meta-mingw/commit/?id=b0067202db8573df3d23d199f82987cebe1bee2c>`
@@ -752,7 +752,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: https://git.yoctoproject.org/yocto-docs
 -  Branch: :yocto_git:`langdale </yocto-docs/log/?h=langdale>`
 -  Tag: :yocto_git:`yocto-4.1 </yocto-docs/log/?h=yocto-4.1>`
 -  Git Revision: :yocto_git:`42d3e26a0d04bc5951e640b471686f347dc9b74a </yocto-docs/commit/?id=42d3e26a0d04bc5951e640b471686f347dc9b74a>`
-- 
2.34.1


