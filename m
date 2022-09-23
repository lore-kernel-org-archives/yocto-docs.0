Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B09EC6FA83
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.595.1663955632659465310
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RDPS5ew3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0AD2160009;
	Fri, 23 Sep 2022 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M54nDVDFy8oOzIEkxUrFvSdcFKyY18RI4Bx4NXYPFow=;
	b=RDPS5ew3of9piX75st0w1ex63aTELInVf8FyAByqzSaRr7mR80mjBlpTFs+vQPyfuH7Qge
	4JsvoZ6Viqq24z18FHu1yhEP5wy5b9sCIeaJq3GwVQnjfTtNizkhjHNReC8kGr4qnNSxgi
	tVKahdWITpHO6UHQUqobYxnAAjNtKHZBfm1d59urTxzjp9UCPYyHd9PkN/3ApBUwwD2fhX
	csqUINVULEUk9fTs0lz5fQgVJ8+vgVYs6/VGyoeB5JUn05sOQFK86/9iMXvIeoeBXngQU2
	Kdwfts64LLmPw3qr09RaHnFWFdraqaVu2qDIU2m8SAXmmGsvta7yicniLLN8pQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 25/30] ref-manual: tasks.rst: add reference to the
 "do_kernel_checkout" task
Date: Fri, 23 Sep 2022 19:52:14 +0200
Message-Id: <20220923175219.6652-26-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3240

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 7c4be3e86f..673068a3e7 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -657,7 +657,7 @@ section in the Yocto Project Linux Kernel Development Manual.
 
 Converts the newly unpacked kernel source into a form with which the
 OpenEmbedded build system can work. Because the kernel source can be
-fetched in several different ways, the ``do_kernel_checkout`` task makes
+fetched in several different ways, the :ref:`ref-tasks-kernel_checkout` task makes
 sure that subsequent tasks are given a clean working tree copy of the
 kernel with the correct branches checked out.
 
-- 
2.34.1


