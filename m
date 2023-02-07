Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC3FC636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 12:19:11 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.81804.1675772348095098267
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 04:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pPMwE-0000Ld-5r; Tue, 07 Feb 2023 13:19:06 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pPMwC-003HSq-70; Tue, 07 Feb 2023 13:19:05 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pPMwC-003p0R-LU; Tue, 07 Feb 2023 13:19:04 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] dev-manual: fix old override syntax
Date: Tue,  7 Feb 2023 13:19:01 +0100
Message-Id: <20230207121901.911003-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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
 <docs@lists.yoctoproject.org>; Tue, 07 Feb 2023 12:19:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3640

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/dev-manual/prebuilt-libraries.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
index ca4346382008..b80a844e9372 100644
--- a/documentation/dev-manual/prebuilt-libraries.rst
+++ b/documentation/dev-manual/prebuilt-libraries.rst
@@ -153,9 +153,9 @@ default :term:`FILES` variables in ``bitbake.conf``::
 
    SOLIBS = ".so.*"
    SOLIBSDEV = ".so"
-   FILES_${PN} = "... ${libdir}/lib*${SOLIBS} ..."
+   FILES:${PN} = "... ${libdir}/lib*${SOLIBS} ..."
    FILES_SOLIBSDEV ?= "... ${libdir}/lib*${SOLIBSDEV} ..."
-   FILES_${PN}-dev = "... ${FILES_SOLIBSDEV} ..."
+   FILES:${PN}-dev = "... ${FILES_SOLIBSDEV} ..."
 
 :term:`SOLIBS` defines a pattern that matches real shared object libraries.
 :term:`SOLIBSDEV` matches the development form (unversioned symlink). These two
-- 
2.30.2


