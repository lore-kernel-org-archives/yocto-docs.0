Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83038CAC5AE
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:25:02 +0000 (UTC)
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
 by mx.groups.io with SMTP id smtpd.web11.10708.1758191092241390515
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 03:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cSBb62GWSzKd4;
	Thu, 18 Sep 2025 12:24:50 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cSBb569W6zLGV;
	Thu, 18 Sep 2025 12:24:49 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 18 Sep 2025 12:24:39 +0200
Subject: [PATCH 1/7] contributor-guide: submit-changes: fix improper bold
 string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-submit-patches-v1-1-28abd2919df0@cherry.de>
References: <20250918-submit-patches-v1-0-28abd2919df0@cherry.de>
In-Reply-To: <20250918-submit-patches-v1-0-28abd2919df0@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Barne Carstensen <barne.carstensen@danfoss.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 10:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7545

From: Quentin Schulz <quentin.schulz@cherry.de>

I don't know what was the initial intent but this doesn't seem right, so
let's remove the bold formatting.

Fixes: 4abe87cb20d3 ("contributor-guide: submit-changes: detail commit and patch creation")
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index adb78fa08d8ec783ccdabff41a3ea69f16e7e3a0..e1215a5550f03f780da6478076d665bfe60c0641 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -123,7 +123,7 @@ to add the upgraded version.
 
       $ git commit -s file1 file2 dir1 dir2 ...
 
-   To include **a**\ ll staged files::
+   To include all staged files::
 
       $ git commit -sa
 

-- 
2.51.0


