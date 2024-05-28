Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB477C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 13:57:42 +0000 (UTC)
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
 by mx.groups.io with SMTP id smtpd.web11.22923.1716904659910381823
 for <docs@lists.yoctoproject.org>;
 Tue, 28 May 2024 06:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VpYxG0j3XzHbJ;
	Tue, 28 May 2024 15:57:38 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4VpYxF5Kn1zS31;
	Tue, 28 May 2024 15:57:37 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 28 May 2024 15:57:21 +0200
Subject: [PATCH] migration-5.1.rst: fix incorrect title, Styhead is not an
 LTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-styhead-not-lts-v1-1-189c031e0152@cherry.de>
X-B4-Tracking: v=1; b=H4sIAMDiVWYC/x3MTQqAIBBA4avErBtQ6Y+uEi2kxhoIDUeikO6et
 PwW72UQikwCY5Uh0sXCwRfouoJlt34j5LUYjDKNas2Akp6d7Io+JDyS4NBTT6qzVmkHpTojOb7
 /4zS/7weKa96RYQAAAA==
To: docs@lists.yoctoproject.org, foss+yocto@0leil.net
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 May 2024 13:57:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5256

From: Quentin Schulz <quentin.schulz@cherry.de>

Or at the very least it wasn't publicly announced.

Fixes: ae12a6711a06 ("migration-guides: placeholder files for 5.1")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/migration-guides/migration-5.1.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index 84ef35e28..c1cc711a4 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-Release 5.1 LTS (styhead)
-===========================
+Release 5.1 (styhead)
+=====================
 
 Migration notes for 5.1 (styhead)
 ------------------------------------

---
base-commit: b2e1ec551a73e1d0ecf980324a8ec400c9cf5586
change-id: 20240528-styhead-not-lts-87e7e06aa01f

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


