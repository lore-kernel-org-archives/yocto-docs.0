Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDEDCD4F4A
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:00:29 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.18258.1695376824374757773
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 03:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjcxS-0001rO-QG; Fri, 22 Sep 2023 12:00:22 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjcxR-0088Jp-Ci; Fri, 22 Sep 2023 12:00:21 +0200
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjcxR-003BFC-15;
	Fri, 22 Sep 2023 12:00:21 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de,
	Roland Hieber <rhi@pengutronix.de>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2 5/5] contributor-guide: style-guide: discourage using Pending patch status
Date: Fri, 22 Sep 2023 12:00:06 +0200
Message-Id: <20230922100006.756477-5-rhi@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922100006.756477-1-rhi@pengutronix.de>
References: <20230922100006.756477-1-rhi@pengutronix.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4289

Suggested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
PATCH v2:
 * new patch in v2, based on feedback by Michael Opdenacker in v1
   https://lore.kernel.org/yocto-docs/12ef125b-5466-408c-ec8c-c5bef1510bc7@bootlin.com/
   and Alexander Kanavin in
   https://lore.kernel.org/yocto-docs/CANNYZj-7C_DeNgVCyRuHRCXZNX-2JPcnysKLn7gQq8w-4aAkNA@mail.gmail.com/
---
 documentation/contributor-guide/recipe-style-guide.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index c69e4a92c992..c24ec267d394 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -271,7 +271,13 @@ Then, you should also add an ``Upstream-Status:`` tag containing one of the
 following status strings:
 
 ``Pending``
-   No determination has been made yet or not yet submitted to upstream.
+   No determination has been made yet, or patch has not yet been submitted to
+   upstream.
+
+   Keep in mind that every patch submitted upstream reduces the maintainance
+   burden in Yocto in the long run, so this patch status should only be used in
+   exceptional cases if there are genuine obstacles to submitting a patch
+   upstream; the reason for that should be included in the patch.
 
 ``Submitted [where]``
    Submitted to upstream, waiting for approval. Optionally include where
-- 
2.39.2


