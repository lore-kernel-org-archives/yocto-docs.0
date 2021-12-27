Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2EAC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 19:00:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.29806.1640631621185695239
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Dec 2021 11:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.194, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E110040002;
	Mon, 27 Dec 2021 19:00:14 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: docs@lists.yoctoproject.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] ref-manual: Fix module_conf typo
Date: Mon, 27 Dec 2021 10:58:54 -0800
Message-Id: <20211227185854.1125884-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Dec 2021 19:00:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2324

Modules specified as part of module_conf must be listed in
KERNEL_MODULE_PROBECONF, not KERNEL_MODULE_AUTOLOAD.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e5216b3f3..59d98927e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4734,7 +4734,7 @@ system and gives an overview of their function and contents.
       configuration file, a distribution configuration file, an append file
       for the recipe, or the recipe itself). If you use this variable, you
       must also be sure to list the module name in the
-      :term:`KERNEL_MODULE_AUTOLOAD`
+      :term:`KERNEL_MODULE_PROBECONF`
       variable.
 
       Here is the general syntax::
-- 
2.33.1


