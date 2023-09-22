Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815C9CD4F4E
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:00:29 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.18259.1695376824398127852
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 03:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjcxS-0001rM-7j; Fri, 22 Sep 2023 12:00:22 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjcxR-0088Jm-BB; Fri, 22 Sep 2023 12:00:21 +0200
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjcxM-003Aqt-0p;
	Fri, 22 Sep 2023 12:00:16 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de,
	Roland Hieber <rhi@pengutronix.de>
Subject: [PATCH v2 1/5] contributor-guide: recipe-style-guide: add more patch tagging examples
Date: Fri, 22 Sep 2023 12:00:02 +0200
Message-Id: <20230922100006.756477-1-rhi@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Sep 2023 10:00:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4292

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
PATCH v2:
 * reorder before the patch adding the CVE section
 * use commit URL instead of pull request URL in Backport example

PATCH v1: https://lore.kernel.org/yocto-docs/20230920100647.1038583-2-rhi@pengutronix.de/
---
 .../contributor-guide/recipe-style-guide.rst  | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 99105179a6b9..0a2a3581a77e 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -321,7 +321,10 @@ the status should be changed to ``Submitted [where]``, and an additional
 ``Signed-off-by:`` line should be added to the patch by the person claiming
 responsibility for upstreaming.
 
-For example, if the patch has been submitted upstream::
+Examples
+--------
+
+Here's an example of a patch that has been submitted upstream::
 
    rpm: Adjusted the foo setting in bar
 
@@ -336,3 +339,19 @@ For example, if the patch has been submitted upstream::
 
 A future update can change the value to ``Accepted`` or ``Denied`` as
 appropriate.
+
+Another example of a patch that is specific to OpenEmbedded::
+
+   Do not treat warnings as errors
+
+   There are additional warnings found with musl which are
+   treated as errors and fails the build, we have more combinations
+   than upstream supports to handle.
+
+   Upstream-Status: Inappropriate [oe specific]
+
+Here's a patch that has been backported from an upstream commit::
+
+   include missing sys/file.h for LOCK_EX
+
+   Upstream-Status: Backport [https://github.com/systemd/systemd/commit/ac8db36cbc26694ee94beecc8dca208ec4b5fd45]
-- 
2.39.2


