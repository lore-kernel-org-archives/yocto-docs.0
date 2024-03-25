Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776A1C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:29:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.52095.1711373371998174274
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YSy0fHcj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B53C1BF20F;
	Mon, 25 Mar 2024 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XR0tRL7SuRsUFTI+xWMGnuoHPsQ6pz3KvCAsGJSxZsE=;
	b=YSy0fHcjs1mC/0R7UqPekz0pu2H159h/4D28Tq3AMPSPTqIke15OZ2MCsTbPG0qvB8Z+63
	q0vUEgtLK8PT6HYpcmacvng1mroxubPCoF63ddwnz87eNbzEm/WBgsLYE7urAY6oZ5YYrm
	THubciG7/JYK4Es4fxvQfIGCRW2npnQCkeJ/MfyXYD9NtYFK0QHuBmulFldd84weC4s+SU
	byiHZcCTg4GRR4CMoh+66Apz2P37UyBGkWtFst9RGFwCnfApHD3HdFpAxvd1ZhbYEC42oZ
	0i91MWXh0OeLfp6pVPPwZapDZJfhi7j9SkiTnQLfJT77oX67SDH1EfOE/nzf+g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 04/11] profile-manual: usage.rst: fix reference to bug report
Date: Mon, 25 Mar 2024 14:29:19 +0100
Message-Id: <20240325132926.3018186-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
References: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:29:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5011

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Allowing to remove nested parentheses in the text!

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 768349512a..0d368792b5 100644
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


