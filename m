Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BBFCAC5AD
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:25:02 +0000 (UTC)
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
 by mx.groups.io with SMTP id smtpd.web11.10707.1758191092215207463
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 03:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.174, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cSBb65d2lzJK5;
	Thu, 18 Sep 2025 12:24:50 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cSBb626dwzMNt;
	Thu, 18 Sep 2025 12:24:50 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 18 Sep 2025 12:24:40 +0200
Subject: [PATCH 2/7] contributor-guide: submit-changes: clarify example
 with Yocto bug ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-submit-patches-v1-2-28abd2919df0@cherry.de>
References: <20250918-submit-patches-v1-0-28abd2919df0@cherry.de>
In-Reply-To: <20250918-submit-patches-v1-0-28abd2919df0@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Barne Carstensen <barne.carstensen@danfoss.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 10:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7544

From: Quentin Schulz <quentin.schulz@cherry.de>

The example could be understood as the content of the commit message
once the editor (git config core.editor) opens, where the first
line is the actual commit title and not the commit description.

This example would make the Fixes line the commit title, which is not
what we want.

In short, according to my understanding of git-commit(1):

The following is a git commit message:

"""
git commit title

git commit description
"""

Reported-by: Barne Carstensen <barne.carstensen@danfoss.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/contributor-guide/submit-changes.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index e1215a5550f03f780da6478076d665bfe60c0641..35da2dbc70d402eb5b8c6ed450e12f46bb7fcede 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -198,6 +198,8 @@ to add the upgraded version.
       description. Be sure to use the actual bug-tracking ID from
       Bugzilla for bug-id::
 
+         single-line summary of change
+
          Fixes [YOCTO #bug-id]
 
          detailed description of change

-- 
2.51.0


