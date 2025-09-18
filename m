Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F49CAC5A9
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:25:02 +0000 (UTC)
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
 by mx.groups.io with SMTP id smtpd.web11.10709.1758191092569775228
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 03:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cSBb70ykxzLS5;
	Thu, 18 Sep 2025 12:24:51 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cSBb658FJzMFX;
	Thu, 18 Sep 2025 12:24:50 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 18 Sep 2025 12:24:41 +0200
Subject: [PATCH 3/7] contributor-guide: submit-changes: align CC tag
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-submit-patches-v1-3-28abd2919df0@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7546

From: Quentin Schulz <quentin.schulz@cherry.de>

The other tag descriptions have the double colon outside of the
highlight, and start the sentence with a lowercase word, so let's align
the CC tag with those.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 35da2dbc70d402eb5b8c6ed450e12f46bb7fcede..2c450625c6d6009802c814db9d523a0343ee6e73 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -223,7 +223,7 @@ to add the upgraded version.
       or are submitting an unmodified patch again as part of a
       new iteration of your patch series.
 
-   -  ``CC:`` Name and email of people you want to send a copy
+   -  ``CC``: name and email of people you want to send a copy
       of your changes to. This field will be used by ``git send-email``.
 
    See `more guidance about using such tags

-- 
2.51.0


