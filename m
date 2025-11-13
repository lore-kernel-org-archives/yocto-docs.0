Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75DBCD5BA3
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 08:55:26 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19529.1763024120455717228
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 00:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vJT6s-0001ff-SD; Thu, 13 Nov 2025 09:55:18 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vJT6s-000E0X-2B;
	Thu, 13 Nov 2025 09:55:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vJT6s-00000004TqJ-2PDR;
	Thu, 13 Nov 2025 09:55:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: ejo@pengutronix.de,
	yocto@pengutronix.de,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH] migration-guides: 5.3: mention barebox migration guides
Date: Thu, 13 Nov 2025 09:55:14 +0100
Message-ID: <20251113085516.1067909-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 08:55:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8027

Inspired by the Yocto migration guides in this repository, I have been
maintaining release migration guides for barebox going back to
v2024.09.0, the first release after barebox was added to OE-core.

These contain actionable advice for users, e.g., rename of CONFIG options
or differences in the shell environment.

Reference the barebox migration guides from the Yocto migration guide
to help users with their updates.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Unsure about the placement; Are the release-notes a better place for this?
Or given that this would be a recurring aspect for future releases, just
add it once to the class documentation?
---
 documentation/migration-guides/migration-5.3.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index e59bc8c6389a..8ba9cb4f12b6 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -311,3 +311,7 @@ Miscellaneous changes
 
    Recipes currently using the ``fcntl-lock`` command should replace these by
    ``flock --fcntl``.
+
+- ``barebox`` has been updated from v2025.02.0 to v2025.09.0. Refer to the
+  `upstream migration guides <https://barebox.org/doc/latest/migration-guides/>`__
+  for migration advice.
-- 
2.47.3


