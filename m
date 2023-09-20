Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D4DCE79B9
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:07:06 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.34183.1695204416680570314
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 03:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu6f-0007b8-TT; Wed, 20 Sep 2023 12:06:54 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu6f-007erD-7m; Wed, 20 Sep 2023 12:06:53 +0200
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu6f-004MIt-0T;
	Wed, 20 Sep 2023 12:06:53 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de,
	Roland Hieber <rhi@pengutronix.de>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/4] contributor-guide: deprecate "Accepted" patch status
Date: Wed, 20 Sep 2023 12:06:47 +0200
Message-Id: <20230920100647.1038583-4-rhi@pengutronix.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4264

This is in accordance with the Release Notes of the gatesgarth release:

  > In the ``Upstream-Status`` header convention for patches,
  > ``Accepted`` has | been replaced with ``Backport`` as these almost
  > always mean the same thing i.e. the patch is already upstream and
  > may need to be removed in a future recipe upgrade. If you are adding
  > these headers to your own patches then use Backport to indicate that
  > the patch has been sent upstream.

  <https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes>

Suggested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 .../contributor-guide/recipe-style-guide.rst       | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index bc14c58a9759..ab3b94f02e7e 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -277,13 +277,13 @@ following status strings:
    Submitted to upstream, waiting for approval. Optionally include where
    it was submitted, such as the author, mailing list, etc.
 
-``Accepted``
-   Accepted in upstream, expect it to be removed at next update, include
-   expected version info.
+``Backport [version]``
+   Accepted upstream and included in the next release, or backported from newer
+   upstream version, because we are at a fixed version.
+   Include upstream version info (e.g. commit ID or next expected version).
 
-``Backport``
-   Backported from new upstream version, because we are at a fixed version,
-   include upstream version info.
+   Note: historically, ``Accepted`` was another way to mark such patches, but
+   this status is now deprecated.
 
 ``Denied``
    Not accepted by upstream, include reason in patch.
@@ -342,7 +342,7 @@ Here's an example of a patch that has been submitted upstream::
 
    Signed-off-by: Joe Developer <joe.developer@example.com>
 
-A future update can change the value to ``Accepted`` or ``Denied`` as
+A future update can change the value to ``Backport`` or ``Denied`` as
 appropriate.
 
 Another example of a patch that is specific to OpenEmbedded::
-- 
2.39.2


