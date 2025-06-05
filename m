Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A74C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 14:10:50 +0000 (UTC)
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
 by mx.groups.io with SMTP id smtpd.web10.8542.1749132645192738925
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 07:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bCmZC2vzdz88j;
	Thu,  5 Jun 2025 16:10:43 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bCmZC0JBDzjLf;
	Thu,  5 Jun 2025 16:10:43 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 05 Jun 2025 16:10:23 +0200
Subject: [PATCH 1/2] docs: README: specify how to contribute instead of
 pointing at another file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-readme-contrib-v1-1-c51b8cc57b7a@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7008

From: Quentin Schulz <quentin.schulz@cherry.de>

This repository is partially included in another repository: poky.

However its README isn't making it, so documentation/README pointing at
the README at the root of the git repository would lead the contributor
nowhere.

Instead, let's include the appropriate information directly in
documentation/README which does make it to the poky git repo.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/README | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/documentation/README b/documentation/README
index 8a47fd4a3fd07d41d61a7d681d82bd13ac74527d..02037e0f7ecf5c7ea18688e8ffbcfbd60c859f1c 100644
--- a/documentation/README
+++ b/documentation/README
@@ -406,5 +406,22 @@ both the Yocto Project and BitBake manuals:
 Submitting documentation changes
 ================================
 
-Please see the top level README file in this repository for details of where
-to send patches.
+Please refer to our contributor guide here: https://docs.yoctoproject.org/contributor-guide/
+for full details on how to submit changes.
+
+As a quick guide, patches should be sent to docs@lists.yoctoproject.org
+The git command to do that would be:
+
+     git send-email -M -1 --to docs@lists.yoctoproject.org
+
+The 'To' header can be set as default for this repository:
+
+     git config sendemail.to docs@lists.yoctoproject.org
+
+Now you can just do 'git send-email origin/master..' to send all local patches.
+
+Read the other sections in this document and documentation/standards.md for
+rules to follow when contributing to the documentation.
+
+Git repository: https://git.yoctoproject.org/yocto-docs
+Mailing list: docs@lists.yoctoproject.org

-- 
2.49.0


