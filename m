Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3942C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 08:43:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.5279.1685436184385829910
 for <docs@lists.yoctoproject.org>;
 Tue, 30 May 2023 01:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L7tpGnU7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685436182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=npm1+viL6IPmHycedafuYbK3ZoeFgtQvB04USaaJutk=;
	b=L7tpGnU7+v8UEE+i9REC/2JTIWYHzJnDaDAVMHG92K3HgfhDo8QJ8YBRHW/WaPe5FSgtEX
	HvCthThKM7osj+WRfv3qGI7zWc612NT/gqjTI413WpOOwAk7LoOD5K0i5VrLbgNtBuEhnb
	T++vXqSG13s2azaoJFqFU7hrTQEp4diiDXrboTVjwSxnoL2SuDSEJYzAA8fXgiWR1TTvbB
	0FOeaV8q/+sJ0bcc+l+Jh8OFK2S81JuHp+U4Qh/MltYkaA58OF2NeXrg7Exb7tJy55Zpm7
	5eqoafR3A0f81Edm7QsGt7gTLkv2L2uEFx8ytvxYw4i2J47IpttkzC5DTyzeUQ==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45C241C0016;
	Tue, 30 May 2023 08:43:01 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Tom Isaacson <tom.isaacson@teknique.com>
Subject: [PATCH v2] sdk-manual: fix Makefile example
Date: Tue, 30 May 2023 10:42:41 +0200
Message-Id: <20230530084241.1980529-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANNYZj8nnq8Kw0A8WvQyqfTQy_eyPTyzGdU5m7-J6v+0qHWCMw@mail.gmail.com>
References: <CANNYZj8nnq8Kw0A8WvQyqfTQy_eyPTyzGdU5m7-J6v+0qHWCMw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 May 2023 08:43:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3978

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Tom Isaacson <tom.isaacson@teknique.com>

"module.h" should be part of the dependency line
Space fixes too

Signed-off-by: Tom Isaacson <tom.isaacson@teknique.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/sdk-manual/working-projects.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 9a0db0099d..b9af33393b 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -293,11 +293,11 @@ example:
       # CC=i586-poky-linux-gcc -m32 -march=i586 --sysroot=/opt/poky/2.5/sysroots/i586-poky-linux
       # CC="gcc"
       all: main.o module.o
-      	${CC} main.o module.o -o target_bin
+        ${CC} main.o module.o -o target_bin
       main.o: main.c module.h
       	${CC} -I . -c main.c
-      module.o: module.c
-      	module.h ${CC} -I . -c module.c
+      module.o: module.c module.h
+        ${CC} -I . -c module.c
       clean:
       	rm -rf *.o
       	rm target_bin
-- 
2.34.1


