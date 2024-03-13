Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AE5C54E67
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:12:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1432.1710349932500801585
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 10:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gmxIfI5E;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D07C1C0007;
	Wed, 13 Mar 2024 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710349930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XR0tRL7SuRsUFTI+xWMGnuoHPsQ6pz3KvCAsGJSxZsE=;
	b=gmxIfI5Ea0XHAAcF6haB246PVEQWUjezer30fiQsY7PfsZC6v/XIIGgefpSRghsoqbEyXh
	4TRRlVtobkaqL3G6XIQ27EwYLwXBYC/xBagX0KenZ3d5uPs6TlsF1A1/15LGuIiWmaBKyN
	u/m1r7QXBuYANIBfntgKp0fgTjQi6wDisXC3bxEBI6Ch92j0ACUCeNlobZfBkRxsiuPTno
	KESwryBAWKCY9D+moJpS9UiP3Jp4DAoIveec/3jK4EISpKpvhu0elTJcxUcBq8lOHhtbcU
	/ktlDk7X+pSg7kNM3bc5r8HGbeUJiT+8RO82LwE84rqfXZoHPFlPpZOihs9S3g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/3] profile-manual: usage.rst: fix reference to bug report
Date: Wed, 13 Mar 2024 18:11:55 +0100
Message-Id: <20240313171155.64710-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313171155.64710-1-michael.opdenacker@bootlin.com>
References: <20240313171155.64710-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Mar 2024 17:12:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4958

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


