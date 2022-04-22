Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AE3C3E8A8
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8245.1650633258566373315
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 06:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.200,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 15A8A20004;
	Fri, 22 Apr 2022 13:14:15 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/2] docs: migration-guides: release-notes-4.0: fix risc-v
 typo
Date: Fri, 22 Apr 2022 15:14:03 +0200
Message-Id: <20220422131404.283476-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2853

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

It's RISC-V and not RiscV, c.f. https://riscv.org/ (yes, no dash in the
domain name...).

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/migration-guides/release-notes-4.0.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 6f12c73ff..c8885cadd 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -152,7 +152,7 @@ New Features / Enhancements in 4.0
       - rust: add support for big endian 64-bit PowerPC
       - rust: Add snapshot checksums for powerpc64le
 
-   - RiscV:
+   - RISC-V:
 
       - libunwind: Enable for rv64
       - systemtap: Enable for riscv64
-- 
2.35.1


