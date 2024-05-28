Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F441C25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 15:21:53 +0000 (UTC)
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
 by mx.groups.io with SMTP id smtpd.web10.24919.1716909707680985733
 for <docs@lists.yoctoproject.org>;
 Tue, 28 May 2024 08:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VpbpK5yh4z8cY;
	Tue, 28 May 2024 17:21:45 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4VpbpK30v3zDhM;
	Tue, 28 May 2024 17:21:45 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 28 May 2024 17:21:33 +0200
Subject: [PATCH v2] migration-5.1.rst: fix incorrect title, Styhead is not
 an LTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-styhead-not-lts-v2-1-72cdb9ba8905@cherry.de>
X-B4-Tracking: v=1; b=H4sIAHz2VWYC/3WNwQ7CIBBEf6XZsxhAa9GT/2F6IGUrmxgwCyGSh
 n8XezdzepPMmw0SMmGC27ABY6FEMXTQhwEWb8MTBbnOoKU+y1EbkXL1aJ0IMYtXTsJMOKG8WCv
 VCn31Zlzpsxsfc2dPKUeu+0FRv/a/qyjRY66LPCmUatT3xSNzPTqEubX2BRETfhuuAAAA
To: foss+yocto@0leil.net, docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 May 2024 15:21:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5260

From: Quentin Schulz <quentin.schulz@cherry.de>

Styhead is not an LTS so remove the mention from the section title.

Fixes: ae12a6711a06 ("migration-guides: placeholder files for 5.1")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- update commit log to not let people assume Styhead could become an LTS
- Link to v1: https://lore.kernel.org/r/20240528-styhead-not-lts-v1-1-189c031e0152@cherry.de
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


