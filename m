Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F770CD5BB8
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:58:34 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.7814.1695128311710221679
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 05:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiaJC-0000jS-5p; Tue, 19 Sep 2023 14:58:30 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiaJB-007SX0-Lc; Tue, 19 Sep 2023 14:58:29 +0200
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiaJB-006cEq-1z;
	Tue, 19 Sep 2023 14:58:29 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: Roland Hieber <rhi@pengutronix.de>
Subject: [RESEND] [PATCH] ref-manual: point outdated link to the new location
Date: Tue, 19 Sep 2023 14:57:57 +0200
Message-Id: <20230919125757.1571746-3-rhi@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919125757.1571746-1-rhi@pengutronix.de>
References: <20230919125757.1571746-1-rhi@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Sep 2023 12:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4230

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 documentation/ref-manual/qa-checks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 6fdb0fbde9a8..fbab5a1d7bdf 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -762,8 +762,8 @@ Errors and Warnings
     recipes in OE-Core) and ``patch-status-noncore`` (for recipes in any other
     layer).
 
-    For more information on setting Upstream-Status see:
-    https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
+    For more information on setting Upstream-Status see
+    :ref:`upstream-status`.
 
 
 - ``Malformed Upstream-Status in patch <patchfile> Please correct according to <url> [patch-status-core/patch-status-noncore]``

