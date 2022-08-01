Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4F3C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 10:35:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.23289.1659350146670895015
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 03:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id C2A4CC0008;
	Mon,  1 Aug 2022 10:35:44 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/4] docs: conf.py: update yocto_git base URL
Date: Mon,  1 Aug 2022 12:35:27 +0200
Message-Id: <20220801103529.2053164-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801103529.2053164-1-foss+yocto@0leil.net>
References: <20220801103529.2053164-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Aug 2022 10:35:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3096

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The URLs are actually redirected from
https://git.yoctoproject.org/cgit/cgit.cgi to
https://git.yoctoproject.org so let's save the user a redirection and
use the most up-to-date URL.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 2a017569f..07a15ce7d 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -98,7 +98,7 @@ extlinks = {
     'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
     'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
     'yocto_docs': ('https://docs.yoctoproject.org%s', None),
-    'yocto_git': ('https://git.yoctoproject.org/cgit/cgit.cgi%s', None),
+    'yocto_git': ('https://git.yoctoproject.org%s', None),
     'yocto_sstate': ('http://sstate.yoctoproject.org%s', None),
     'oe_home': ('https://www.openembedded.org%s', None),
     'oe_lists': ('https://lists.openembedded.org%s', None),
-- 
2.37.1


