Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59D2C61CE7
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 14:10:50 +0000 (UTC)
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
 by mx.groups.io with SMTP id smtpd.web11.8769.1749132645332997617
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 07:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bCmZC5YNMz5Nq;
	Thu,  5 Jun 2025 16:10:43 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bCmZC2trRz2bm;
	Thu,  5 Jun 2025 16:10:43 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 05 Jun 2025 16:10:24 +0200
Subject: [PATCH 2/2] deduplicate README
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-readme-contrib-v1-2-c51b8cc57b7a@cherry.de>
References: <20250605-readme-contrib-v1-0-c51b8cc57b7a@cherry.de>
In-Reply-To: <20250605-readme-contrib-v1-0-c51b8cc57b7a@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jun 2025 14:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7009

From: Quentin Schulz <quentin.schulz@cherry.de>

Having a README at the root of the repo is a good practice so we should
keep it. However, it contains information that is now duplicated in
documentation/README. Additionally, this file isn't included in poky
while what's under documentation/ directory is.

Avoid having to maintain both by simply making the root README into a
symlink to documentation/README.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 README | 32 +-------------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/README b/README
deleted file mode 100644
index 88d7fc55305e060729dac740f6cc49c25e7d4ed2..0000000000000000000000000000000000000000
--- a/README
+++ /dev/null
@@ -1,31 +0,0 @@
-Yocto Project Documentation
-===========================
-
-This repository contains documentation materials for a variety of the Yocto
-Project components. In particular see the README file under documentation/.
-
-An online version of the documentation can be found at:
-    https://docs.yoctoproject.org
-
-Contributing
-============
-
-Please refer to our contributor guide here: https://docs.yoctoproject.org/contributor-guide/
-for full details on how to submit changes.
-
-As a quick guide, patches should be sent to docs@lists.yoctoproject.org
-The git command to do that would be:
-
-     git send-email -M -1 --to docs@lists.yoctoproject.org
-
-The 'To' header can be set as default for this repository:
-
-     git config sendemail.to docs@lists.yoctoproject.org
-
-Now you can just do 'git send-email origin/master..' to send all local patches.
-
-Read the documentation/README and documentation/standards.md files
-for rules to follow when contributing to the documentation.
-
-Git repository: https://git.yoctoproject.org/yocto-docs
-Mailing list: docs@lists.yoctoproject.org
diff --git a/README b/README
new file mode 120000
index 0000000000000000000000000000000000000000..c59facf2e91b1f176ae96669b0d89b9732645d3e
--- /dev/null
+++ b/README
@@ -0,0 +1 @@
+documentation/README
\ No newline at end of file

-- 
2.49.0


