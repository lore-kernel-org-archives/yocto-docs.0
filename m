Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABA5C19F2C
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 10:35:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.23288.1659350146203841883
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 03:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id E0BD3C0009;
	Mon,  1 Aug 2022 10:35:43 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/4] README: fix Git repository URL
Date: Mon,  1 Aug 2022 12:35:26 +0200
Message-Id: <20220801103529.2053164-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Aug 2022 10:35:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3095

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/ actually
redirects (301) to https://git.yoctoproject.org/yocto-docs/.

Moreover, git cloning the original URL fails with the following error:
fatal: repository 'https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/' not found
while it works with the newer URL, so let's switch to the newer URL.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 31119905e..85d8d837b 100644
--- a/README
+++ b/README
@@ -28,5 +28,5 @@ $ git config sendemail.to docs@lists.yoctoproject.org
 
 Now you can just do 'git send-email origin/master..' to send all local patches.
 
-Git repository: https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
+Git repository: https://git.yoctoproject.org/yocto-docs
 Mailing list: docs@lists.yoctoproject.org
-- 
2.37.1


