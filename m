Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AA5C6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 14:44:03 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.8257.1663944241877816992
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 07:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=W1jjCUc0;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8C9ED24000B;
	Fri, 23 Sep 2022 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663944239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ny3fXSsygFZqxnR3oVzVduLTLqcZK4tSskynUWOypi0=;
	b=W1jjCUc0OldJ77G0K8MDWuKzVhikQnndeIXKj1tnGe3B9KKoV46LJD5z1lodvXTe4o7hkI
	ydoaixAq44z8MxKcvBDopa3vtDe7jY+6sC/4ZU9f5HeQRBCh6LX4hLO3WusXlwBhbA97fQ
	d9IjB5jaT5X+djl6+zXWPHl3gUDpT/Zd7Io0wcV0MdnO3+FixsT6cyboomC6nzYoFzMteA
	8R/Hc4qLLILllAIBZGGgXL8dVDSbivlaWq63ANBkFrRBjJyBuapEt99gKolYTE83c0LDKX
	aHbidVsk7m8qukJBlSqyYohB8gQk2LpOJl+kH/CjSzoQ6zYjaORMYgwDQm0T/Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] overview-manual: concepts.rst: fix formating and add
 references
Date: Fri, 23 Sep 2022 16:43:53 +0200
Message-Id: <20220923144353.2463680-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 14:44:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3214

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 8e0303f0e0..c93f71f8c8 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -703,16 +703,12 @@ the source files and unpack them into the
 
 .. note::
 
-   For every local file (e.g.
-   file://
-   ) that is part of a recipe's
-   SRC_URI
-   statement, the OpenEmbedded build system takes a checksum of the file
-   for the recipe and inserts the checksum into the signature for the
-   do_fetch
-   task. If any local file has been modified, the
-   do_fetch
-   task and all tasks that depend on it are re-executed.
+   For every local file (e.g. ``file://``) that is part of a recipe's
+   :term:`SRC_URI` statement, the OpenEmbedded build system takes a
+   checksum of the file for the recipe and inserts the checksum into
+   the signature for the :ref:`ref-tasks-fetch` task. If any local
+   file has been modified, the :ref:`ref-tasks-fetch` task and all
+   tasks that depend on it are re-executed.
 
 By default, everything is accomplished in the Build Directory, which has
 a defined structure. For additional general information on the Build
-- 
2.34.1


