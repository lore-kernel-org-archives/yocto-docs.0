Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A29C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 00:43:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.6330.1642466619482336508
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 16:43:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.200, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id D059B20003;
	Tue, 18 Jan 2022 00:43:36 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: docs@lists.yoctoproject.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] dev-manual/common-tasks: Fix typo
Date: Mon, 17 Jan 2022 16:42:50 -0800
Message-Id: <20220118004250.1083005-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jan 2022 00:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2419

direction -> directory

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index ed6b1446f..d465c2f44 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -7032,7 +7032,7 @@ variables were set.
 
 The ``opkg`` application uses configuration files to find available
 package databases. Thus, you need to create a configuration file inside
-the ``/etc/opkg/`` direction, which informs ``opkg`` of any repository
+the ``/etc/opkg/`` directory, which informs ``opkg`` of any repository
 you want to use.
 
 As an example, suppose you are serving packages from a ``ipk/``
-- 
2.34.1


