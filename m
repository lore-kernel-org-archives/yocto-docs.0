Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FFEC54F3F
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8452.1650633215813788623
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 06:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 296E61BF207;
	Fri, 22 Apr 2022 13:13:32 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/2] docs: migration-guides: migration-3.4: mention that
 hardcoded password are supported if hashed
Date: Fri, 22 Apr 2022 15:13:16 +0200
Message-Id: <20220422131316.283346-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422131316.283346-1-foss+yocto@0leil.net>
References: <20220422131316.283346-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2852

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Plaintext/clear passwords are not supported anymore but hashed passwords
still are. Mention that in the migration guide and point to the
appropriate location of documentation.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/migration-guides/migration-3.4.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index dead6bc66..c22ea814d 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -270,6 +270,8 @@ Miscellaneous
   It was being implemented using a custom patch to the ``shadow`` recipe
   which clashed with a ``-P`` option that was added upstream in
   ``shadow`` version 4.9, and in any case is fundamentally insecure.
+  Hardcoded passwords are still supported but they need to be hashed, see
+  examples in :term:`EXTRA_USERS_PARAMS`.
 
 
 .. include:: release-notes-3.4.rst
-- 
2.35.1


