Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB5AC71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:04:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.903.1750089858406368844
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jun 2025 09:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8009A150C
	for <docs@lists.yoctoproject.org>; Mon, 16 Jun 2025 09:03:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 915CB3F673
	for <docs@lists.yoctoproject.org>; Mon, 16 Jun 2025 09:04:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual/yocto-project-supported-features: add a contact for meta-arm
Date: Mon, 16 Jun 2025 17:04:11 +0100
Message-ID: <20250616160411.990767-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Jun 2025 16:04:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7072

Set the contact address for meta-arm.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/yocto-project-supported-features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/yocto-project-supported-features.rs=
t b/documentation/ref-manual/yocto-project-supported-features.rst
index bc1a8139381..57bd789ba4e 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -78,7 +78,7 @@ Below is a list of primary tested features, their maint=
ainer(s) and builder(s):
      - meta-agl-core
    * - `meta-arm <https://git.yoctoproject.org/meta-arm>`__
      - meta-arm layer testing
-     - TBD
+     - meta-arm mailing list <meta-arm@lists.yoctoproject.org>
      - meta-arm
    * - `meta-aws <https://github.com/aws4embeddedlinux/meta-aws>`__
      - meta-aws layer testing
--=20
2.43.0


