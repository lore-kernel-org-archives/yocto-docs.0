Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9706CC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 09:33:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10557.1676021574610034094
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 01:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bT885ZCm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7EA4F4001F;
	Fri, 10 Feb 2023 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676021571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4mL9Xpg5IYGaNhB42lnidKuhYNnQCRtZnhCVPOGiA14=;
	b=bT885ZCmpWEc3etvONnRi2eMjIGJw3feRAtL7qRs1NmutasAITD49bm0axdi/flOXHt6zR
	icjIP9tm5H4dYpl0XZp0BajGjHKozC0zQC1po4GKQuJInyOeZuaOV9wl+OJ/niuQ2rQKgN
	ILPMbh7iG+56YLSMUhnfh9aznj8z0SDvmGJxDnWqxa82FGTii0Sd9eBN458OgMwjlQNruX
	s+vLGhfPLm50x/tCHSxXd0GZffNalVZiEvIKDtlRWYfjqC+/gMJ25cild1ZHk1Yp2lXxDW
	edkSvkTwuzWNR6HlYZIzrFR9NHproN/dTe3enVtQUHqdWfqph5kNNrPj25P7Sw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [dunfell] profile-manual: update WireShark hyperlinks
Date: Fri, 10 Feb 2023 10:32:49 +0100
Message-Id: <20230210093249.217509-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Feb 2023 09:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3661

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/profile-manual-usage.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/profile-manual/profile-manual-usage.rst b/documentation/profile-manual/profile-manual-usage.rst
index 15cf1efe1c..e389a13fc0 100644
--- a/documentation/profile-manual/profile-manual-usage.rst
+++ b/documentation/profile-manual/profile-manual-usage.rst
@@ -1734,7 +1734,7 @@ events':
 
 The tool is pretty self-explanatory, but for more detailed information
 on navigating through the data, see the `kernelshark
-website <http://rostedt.homelinux.com/kernelshark/>`__.
+website <https://kernelshark.org/Documentation.html>`__.
 
 .. _ftrace-documentation:
 
@@ -1765,8 +1765,8 @@ There is a nice series of articles on using ftrace and trace-cmd at LWN:
 -  `trace-cmd: A front-end for
    Ftrace <https://lwn.net/Articles/410200/>`__
 
-There's more detailed documentation kernelshark usage here:
-`KernelShark <http://rostedt.homelinux.com/kernelshark/>`__
+See also `KernelShark's documentation <https://kernelshark.org/Documentation.html>`__
+for further usage details.
 
 An amusing yet useful README (a tracing mini-HOWTO) can be found in
 ``/sys/kernel/debug/tracing/README``.
-- 
2.37.2


