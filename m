Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979A1C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 13:03:10 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.6218.1654174980667071627
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 06:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id C71A5200002;
	Thu,  2 Jun 2022 13:02:57 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] docs: set_versions.py: remove honister from active releases
 list
Date: Thu,  2 Jun 2022 15:02:38 +0200
Message-Id: <20220602130238.337261-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jun 2022 13:03:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2956

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Honister 3.4.4 is the last release of the series and the series is now
considered obsolete.

Let's remove honister from the list of active releases.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/set_versions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index c409d5ea8..9049c1a68 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -23,7 +23,7 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["kirkstone", "honister", "dunfell"]
+activereleases = ["kirkstone", "dunfell"]
 devbranch = "langdale"
 ltsseries = ["kirkstone", "dunfell"]
 
-- 
2.36.1


