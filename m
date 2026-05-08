Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5842CCD37B4
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:45 +0000 (UTC)
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1621.1778259580159804186
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=VSppjfTi;
 spf=pass (domain: 0leil.net, ip: 45.157.188.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMZ3xz7zBYq;
	Fri,  8 May 2026 18:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259578;
	bh=pGpOzfEa7HN5maW+35U3ic7M5K8VYIJPl5Rw6YMvmSI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VSppjfTioTDv1eNto8UkG0VBDejylOj/wSBNX8EGLFi+x4tEjOmqaweCKTYwq/udy
	 vPJeUv+CYssoZNxB1P3XL3yiyshB4x40v3Kh4V+Sr0gObtcBVy1u16P+6rQsjkTR1Z
	 u7DiR4jgRB/DAcKFIZ52Dvue/LFyDJTOa+CeKLz5P1DGHlBqw5YRHySZIXPnVo0OOW
	 K4SRq9Bo0gKgwkklgY0M8rdnzHg+vGZ9ZlNt1yDJhIGVq7mQyu9fQ/17xRBhGbeD1V
	 2nIz+hoA5joQ2dq4bxb7kwQVz6CoHMBUWYh1s3Jv4DubAp/IQNjiDVvvLmtet4vhtJ
	 cMyRHhSat3Zgw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMZ0zGnzmSP;
	Fri,  8 May 2026 18:59:38 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:28 +0200
Subject: [PATCH 04/11] migration-guides: migration-6.0: fix grammar and
 missing word
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-4-8fb61b5358cc@cherry.de>
References: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
In-Reply-To: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 16:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9408

From: Quentin Schulz <quentin.schulz@cherry.de>

Replace "previous" with "previously" so it makes sense.

Add missing "inherited" to specify how to build an image recipe "with
this class".

Fixes: 8a29e23d144e ("migration-guides: update 6.0 (Wrynose) release notes")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/migration-guides/migration-6.0.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index 1c8e7e540..793ae3301 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -259,9 +259,9 @@ See commit :oecore_rev:`68d2d38483efada7bc2409e10508b03a7431caff` for more infor
 ------------------------------------------------------------
 
 Image recipes that inherit the :ref:`ref-classes-vex` class have an extra JSON
-document generated which was previous ending with the ``.json`` suffix. For
+document generated which was previously ending with the ``.json`` suffix. For
 example, a build for the ``core-image-minimal`` image recipe with this class
-would have resulted in a file named::
+inherited would have resulted in a file named::
 
    core-image-minimal-qemuarm64.rootfs.json
 

-- 
2.54.0


