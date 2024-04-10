Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAF5CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 14:52:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1809.1712760710528033215
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 07:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TEh7MI2x;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 523F41BF203;
	Wed, 10 Apr 2024 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712760708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WrXpYh7rifRr4iImbXEJWWgVFqr3qUlTXXBS7EG59jQ=;
	b=TEh7MI2xhsUyaWKn92tc4+vIFjIHYq2oE4Gfo5wFOigwGNTBvAdeEZY6wzuAW0Ce/VWtbM
	bgVOukegTaX64/emcn8hkVPFKXyIdIU6dK42YcjYNoqHhxOJvbQiISWfkjUXgeBWqE5FaN
	WbYlqOuAsE1c8jg3b7rM9zRxqDbA7NGAErA/5uTGq5BanrFiCMT+o4PtFq6y9s/mopwv4M
	s5XKKTQa/iSWWLCEhL/hgqjQ9aSo3vCX8wykg8KDVE6wgD3qe53b+GfjwHe+ZQHPT4xWcd
	Ri76uh1SwIW8U4LMxCM+CxR7qUn8ohgmSMhVF6O4YPubSk43FOVQDLaAWVYqjg==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: adrian.freihofer@gmail.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1] release-notes: mention cmake-qemu.bbclass
Date: Wed, 10 Apr 2024 16:51:36 +0200
Message-ID: <20240410145136.2994587-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 14:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5108

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Mention this new class in QEMU section.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 1898b537a..c9d7a09c3 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -106,6 +106,9 @@ New Features / Enhancements in 5.0
    -  ``runqemu``: match ".rootfs." in addition to "-image-" for the root
       filesystem.
 
+   -  :ref:`ref-classes-cmake-qemu`: a new class allowing to execute cross-compiled
+      binaries using QEMU user-mode emulation.
+
 -  Rust improvements:
 
    -  Rust has been upgraded to version 1.75
-- 
2.43.0


