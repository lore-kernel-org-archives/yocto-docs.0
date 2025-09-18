Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D05CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:56:50 +0000 (UTC)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
 by mx.groups.io with SMTP id smtpd.web10.9186.1758185808396389841
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 01:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cS8dW14Wlzhry;
	Thu, 18 Sep 2025 10:56:47 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cS8dV5YpcztWk;
	Thu, 18 Sep 2025 10:56:46 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 18 Sep 2025 10:56:34 +0200
Subject: [PATCH 1/2] tools: build-docs-container: remove comment for
 unsupported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-dev-supported-distros-v1-1-aa1dc6b54c30@cherry.de>
References: <20250918-dev-supported-distros-v1-0-aa1dc6b54c30@cherry.de>
In-Reply-To: <20250918-dev-supported-distros-v1-0-aa1dc6b54c30@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 08:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7540

From: Quentin Schulz <quentin.schulz@cherry.de>

Ubuntu 18.04 and 20.04 are not supported distros, so let's remove the
comment listing the reason we don't support them.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/tools/build-docs-container | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 6b4d4254342bd00a1c1ba6758075bd1720334888..108809838e53a70bb79b7de46314fa42928f6a50 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -118,9 +118,6 @@ main ()
       docs_pdf=opensuse_docs_pdf.sh
       pip3=pip3_docs.sh
       ;;
-    # Missing python3-saneyaml
-    # "ubuntu:18.04"*|\
-    # "ubuntu:20.04"*|\
     # Cannot fetch packages anymore
     # "ubuntu:23.04"*|\
     "ubuntu:22.04"*|\

-- 
2.51.0


