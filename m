Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F67C04FF8
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:20:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.3519.1713118831488037452
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 11:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nR9XtheO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E88E5FF804;
	Sun, 14 Apr 2024 18:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713118830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9DIY/fN/eqMuHu3nfmCg5Z9L9cc75EexGUtAil6cWWI=;
	b=nR9XtheOi4hV1mczIF4uCEm1EZU2/s+aOpeOb8OElfMFmg/0K4pDJcEN7WWGnvWOe0SMNc
	sEY9+/0HCy3+wZJPDorZYM16BuFNJm1mKBqNEssqKP5vKY5KXjL5cgUYGyd5K137z0iEwW
	mnupDX0yyHFKxevcHkcJpc2tgsHpDLU95XBLn+udqZzQF3o95Q0LrPGJQsQBfQ+4w5vt88
	Ps9ioYleSlpbno+njbfTreSn3i3laqbSi0EVuQETDDLv4dn+wgB7+eqTSUGu0lJrp3NxBb
	b+lJecEIRgWdrq3zm9E7GrbHLQ81rNKd+EzsqC7/oI6y8C1DZztmblFrHYwwEw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 8/9] kernel-dev: join mkdir commands with -p
Date: Sun, 14 Apr 2024 20:20:10 +0200
Message-Id: <20240414182011.994356-9-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
References: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 18:20:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5131

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Jörg Sommer <joerg.sommer@navimatix.de>

To make it more obvious which directories are needed, pass only these to
*mkdir* and use the option `-p` to create the missing parents.

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/kernel-dev/common.rst | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index cbcb30281a..3f9d8d48e4 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -383,11 +383,7 @@ home directory:
 
 1. *Create Structure*: Create the layer's structure::
 
-      $ mkdir meta-mylayer
-      $ mkdir meta-mylayer/conf
-      $ mkdir meta-mylayer/recipes-kernel
-      $ mkdir meta-mylayer/recipes-kernel/linux
-      $ mkdir meta-mylayer/recipes-kernel/linux/linux-yocto
+      $ mkdir -p meta-mylayer/conf meta-mylayer/recipes-kernel/linux/linux-yocto
 
    The ``conf`` directory holds your configuration files, while the
    ``recipes-kernel`` directory holds your append file and eventual
@@ -1044,9 +1040,7 @@ Section.
    additional structure to your layer using the following commands::
 
       $ cd ~/meta-mylayer
-      $ mkdir recipes-kernel
-      $ mkdir recipes-kernel/linux
-      $ mkdir recipes-kernel/linux/linux-yocto
+      $ mkdir -p recipes-kernel recipes-kernel/linux/linux-yocto
 
    Once you have created this
    hierarchy in your layer, you can move the patch file using the
-- 
2.34.1


