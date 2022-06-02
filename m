Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8784FC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 13:03:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.6137.1654175019301209269
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 06:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id BD2FD1BF206;
	Thu,  2 Jun 2022 13:03:36 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] docs: set_versions.py: check for first latest release tag
Date: Thu,  2 Jun 2022 15:03:24 +0200
Message-Id: <20220602130324.337361-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jun 2022 13:03:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2957

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Let's not maintain manually which tag should be locally available before
asking the user to run git fetch --tags. Instead, let's check for the
latest release first tag (e.g. for Kirkstone, 4.0 even though 4.0.1 is
already out).

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/set_versions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 9049c1a68..a7ceb3455 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -86,7 +86,7 @@ docconfver = None
 
 # Test tags exist and inform the user to fetch if not
 try:
-    subprocess.run(["git", "show", "yocto-3.4.2"], capture_output=True, check=True)
+    subprocess.run(["git", "show", "yocto-%s" % release_series[activereleases[0]]], capture_output=True, check=True)
 except subprocess.CalledProcessError:
     sys.exit("Please run 'git fetch --tags' before building the documentation")
 
-- 
2.36.1


