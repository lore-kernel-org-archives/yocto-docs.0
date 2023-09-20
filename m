Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A89CCE79BD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:07:06 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.34234.1695204416480951001
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 03:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu6f-0007b7-Pj; Wed, 20 Sep 2023 12:06:53 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu6f-007erB-6g; Wed, 20 Sep 2023 12:06:53 +0200
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu6f-004MIl-0M;
	Wed, 20 Sep 2023 12:06:53 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de,
	Roland Hieber <rhi@pengutronix.de>
Subject: [PATCH 2/4] contributor-guide: recipe-style-guide: add some more patch tagging examples
Date: Wed, 20 Sep 2023 12:06:45 +0200
Message-Id: <20230920100647.1038583-2-rhi@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230920100647.1038583-1-rhi@pengutronix.de>
References: <20230920100647.1038583-1-rhi@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 10:07:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4266

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 .../contributor-guide/recipe-style-guide.rst     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 52ab4523c49f..4faadcd122d8 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -347,6 +347,22 @@ Here's an example of a patch that has been submitted upstream::
 A future update can change the value to ``Accepted`` or ``Denied`` as
 appropriate.
 
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
+Here's a patch that has been backported from a pull request::
+
+   include missing sys/file.h for LOCK_EX
+
+   Upstream-Status: Backport [https://github.com/systemd/systemd/pull/28651]
+
 This should be the header of patch that fixes CVE-2015-8370 in GRUB2::
 
    grub2: Fix CVE-2015-8370
-- 
2.39.2


