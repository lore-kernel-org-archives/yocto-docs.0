Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977D4C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 10:49:05 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.63024.1680000539973122786
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Mar 2023 03:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1ph6sr-00048R-KF; Tue, 28 Mar 2023 12:48:57 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1ph6sr-007HlA-0B; Tue, 28 Mar 2023 12:48:57 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1ph6sq-007xa5-6x; Tue, 28 Mar 2023 12:48:56 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 2/2] ref-manual: classes.rst: fix typo
Date: Tue, 28 Mar 2023 12:48:53 +0200
Message-Id: <20230328104853.1897266-2-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328104853.1897266-1-u.oelmann@pengutronix.de>
References: <20230328104853.1897266-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Mar 2023 10:49:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3817

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/ref-manual/classes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index e8dec31b0078..f8172e6b2904 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -137,7 +137,7 @@ The :ref:`ref-classes-base` class is special in that every ``.bb`` file implicit
 inherits the class. This class contains definitions for standard basic
 tasks such as fetching, unpacking, configuring (empty by default),
 compiling (runs any ``Makefile`` present), installing (empty by default)
-and packaging (empty by default). These classes are often overridden or
+and packaging (empty by default). These tasks are often overridden or
 extended by other classes such as the :ref:`ref-classes-autotools` class or the
 :ref:`ref-classes-package` class.
 
-- 
2.39.2


