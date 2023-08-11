Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8162BC41513
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 17:55:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.49359.1691776541516767717
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 10:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aXA0gBUL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D55A1BF205;
	Fri, 11 Aug 2023 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691776540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nlwFh0IohGBDksZdgoKGw2jYvr93J5osBATbKAo5ig=;
	b=aXA0gBUL79MkYUGBsnj2f8nCygKH1bFczn7wNNfaRtXN+VNsnrkEnK3Ga5MO/+5dby0Xij
	BSIj73Lgm2Ya9eDqgcRPSKfHPNCCHTUzO/k/Kb5eBPRB7ZzT/Y2xB9vwqLvFOE/IxAJoP+
	kOLG2zBH0dpTFQVfiA3GZOtNLuh/OnJO9Gh9l8Xnh1Ya3NH6M4jLa9iowI4S3Qu0nUPgWW
	Oj8BYw8ETcZ9zOt2/DbRfO5XYs32Gx0k9o9AwOBzTipMzEY7t3YnTAGP7yNFpfCA2Euvdk
	WynefJGyhxwIUEmoz+qMvvycUh2phkAvzKxVS7arKP6SnGAkDscBzw7l44Rf5Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/5] contributor-guide: clarification about patchtest
Date: Fri, 11 Aug 2023 19:55:26 +0200
Message-Id: <20230811175527.1116864-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
References: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 17:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4149

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Highlight that patchtest still needs improving
- Fix reference to this tool

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-change.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/contributor-guide/submit-change.rst b/documentation/contributor-guide/submit-change.rst
index 3fd2b049cf..6bee423bfb 100644
--- a/documentation/contributor-guide/submit-change.rst
+++ b/documentation/contributor-guide/submit-change.rst
@@ -43,7 +43,7 @@ mailing list approach off-putting and would prefer a web-based GUI.
 Since we don’t believe that can work for us, the project is aiming to ensure
 `patchwork <https://patchwork.yoctoproject.org/>`__ is available to help track
 patch status and also looking at how tooling can provide more feedback to users
-about patch status. We are looking at tools such as ``patchtest`` to
+about patch status. We are looking at improving tools such as ``patchtest`` to
 test user contributions before they hit the mailing lists and also at better
 documenting how to use such workflows since we recognise that whilst this was
 common knowledge a decade ago, it might not be as familiar now.
@@ -299,7 +299,7 @@ The Yocto Project uses a `Patchwork instance <https://patchwork.yoctoproject.org
 to track the status of patches submitted to the various mailing lists and to
 support automated patch testing. Each submitted patch is checked for common
 mistakes and deviations from the expected patch format and submitters are
-notified by patchtest if such mistakes are found. This process helps to
+notified by ``patchtest`` if such mistakes are found. This process helps to
 reduce the burden of patch review on maintainers.
 
 .. note::
-- 
2.34.1


