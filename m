Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A17CD1284
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:52 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.51973.1711373267056792115
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NqY8O+c/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9908A24000F;
	Mon, 25 Mar 2024 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PgfXx36XQu/4AfpvWNfYrBxFrF2/nJKieod6XR+irMU=;
	b=NqY8O+c/AqPWQUDZYe5ifRPgO6amURfg/QfDmuQPQ/cSvmPRrwFRinraQpWiu/filfHrJ2
	bh3QaeJbiEedFSZwrQjVk05NTN+8vKiyDxtsRKLOoPpG0cnq7ccmHZTbxsakdeU3DDb6lb
	VFn1NlSKnwKtgRG7ZjoTo6bA4my2qmDccyFtkNnkxoU5EPfU1csRurM5OqF32b1fNFbtMZ
	+J2DbRxCYAkQk3dhBYWrfEb37Ep75WSs/CcVb8GFcudCNJicerAUj4pTBUgTypK1pTjAwi
	PfY5gD+6qfTd1NMRMQUCKBXIxIp7/2aYfX1Rc+/51puM/aUQjo8FBkHOIxL42g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 4/9] profile-manual: usage.rst: fix reference to bug report
Date: Mon, 25 Mar 2024 14:27:32 +0100
Message-Id: <20240325132737.3018073-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
References: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:27:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5001

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Allowing to remove nested parentheses in the text!

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 41a2d9ba3f..28dcb969a0 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -131,9 +131,9 @@ the summed counts at the end of the run::
 
         59.836627620 seconds time elapsed
 
-Many times such a simple-minded test doesn't yield much of
-interest, but sometimes it does (see Real-world Yocto bug (slow
-loop-mounted write speed)).
+Such a simple-minded test doesn't always yield much of interest, but sometimes
+it does (see the :yocto_bugs:`Slow write speed on live images with denzil
+</show_bug.cgi?id=3049>` bug report).
 
 Also, note that ``perf stat`` isn't restricted to a fixed set of counters
 --- basically any event listed in the output of ``perf list`` can be tallied
-- 
2.34.1


