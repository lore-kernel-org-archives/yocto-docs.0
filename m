Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE78C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 08:17:35 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.7377.1651133845018127081
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 01:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id CFCE9C0004;
	Thu, 28 Apr 2022 08:17:22 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] docs: set_versions.py: remove hardknott from active releases
 list
Date: Thu, 28 Apr 2022 10:17:06 +0200
Message-Id: <20220428081706.526839-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Apr 2022 08:17:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2900

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Hardknott 3.3.6 is the last release of the series and the release is now
obsolete.

Let's remove hardknott from the list of active releases.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/set_versions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index cd02cc739..c4be1ae41 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -23,7 +23,7 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["kirkstone", "honister", "hardknott", "dunfell"]
+activereleases = ["kirkstone", "honister", "dunfell"]
 devbranch = "langdale"
 ltsseries = ["kirkstone", "dunfell"]
 
-- 
2.35.1


