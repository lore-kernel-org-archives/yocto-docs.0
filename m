Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28010C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 18:48:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.292.1675795717946394859
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 10:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ACaTqcm/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7653720008;
	Tue,  7 Feb 2023 18:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675795715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cSqEKKV3W0yVYrDX1ex5hKZdquctxd3ALs7VwlJFRD0=;
	b=ACaTqcm/VE6/0OGw3KpVPLeJZIcURj7Paz7Dzi6uGA+np0Pis0tAHq7mHzD7+ApUghR3GD
	FEzBMMkJUebFkNSfBnU3HWhYQXsTGjIC0oWLwisXyCe3K3Os2BGQfVZmfKddNfIKduISgp
	qvbd2S0AHntZ4Biac/k2llX+2e4TQPctvAjJCaZIOUjb3i5+Kux5G8RMytmUrLF3iWza23
	ESEYJ1dPy8c0gBkXL5EypkKU8MTHBmgYZJeYOTETVrz9l9DptpDM0HthkOu5gfNKJ74tRT
	OFMu/dU3KPK2WMsdFCk5/pQtcBAaP4BdBI3+MOXeAH1EvVgsZKKhJYXJTwm1xQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] [kirkstone] dev-manual: fix old override syntax
Date: Tue,  7 Feb 2023 19:48:22 +0100
Message-Id: <20230207184822.62656-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Feb 2023 18:48:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3644

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/dev-manual/common-tasks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index ce7eb6c9dd..aab50e4078 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5091,9 +5091,9 @@ default :term:`FILES` variables in ``bitbake.conf``::
 
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
2.37.2


