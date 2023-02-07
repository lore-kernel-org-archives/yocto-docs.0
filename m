Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0786CC636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 18:14:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.91122.1675793659355992064
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 10:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Skm6L0pC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 498E6FF806;
	Tue,  7 Feb 2023 18:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675793657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=61iCKDiAMXuokIGCuNEKJp67eVJDqBSxhGbvKA5xOao=;
	b=Skm6L0pCjPygvq/pGqDajQ6B0Kxps9iw64zXAiSwHBtciZt2SRGQ8kKj/BHbFaVnRM4chu
	Rf/ClX2DD4dK+An4+z+BM4h4nmY5tT7soxzkCaLvECw9gCFcTLhwxQH7LhdF1Keb9GH2aV
	MAChh/JJefE5XtjsLAEzYyD4ZSRVZetCcF+UDtcE314iMG6PQRGngCgsQFEWlRxDfC+VYO
	DCcpE+7lCD+O0TzNuMOmPPVV/u4pjAomKluUuyGWhDo/KpUmuekc/6qCWVuKjSWz24dN5T
	mO4Yu2K4TY7CGixiXKFJ41xy6k5s5FmLfOHdslLLlSpmB0YbQH/wLLO013/71A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] [langdale] dev-manual: fix old override syntax
Date: Tue,  7 Feb 2023 19:14:12 +0100
Message-Id: <20230207181412.59877-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Feb 2023 18:14:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3643

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/dev-manual/common-tasks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 648037d28b..9bc65b722e 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5092,9 +5092,9 @@ default :term:`FILES` variables in ``bitbake.conf``::
 
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


