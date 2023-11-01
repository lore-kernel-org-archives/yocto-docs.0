Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3862EC0018C
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:27:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.79.1698859641063164944
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 10:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83BEDC15;
	Wed,  1 Nov 2023 10:28:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 202943F738;
	Wed,  1 Nov 2023 10:27:20 -0700 (PDT)
From: ross.burton@arm.com
To: docs@lists.yoctoproject.org,
	michael.opdenacker@bootlin.com
Cc: nd@arm.com
Subject: [PATCH 08/14] obsolete SERIAL_CONSOLES_CHECK
Date: Wed,  1 Nov 2023 17:27:00 +0000
Message-Id: <20231101172706.81576-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101172706.81576-1-ross.burton@arm.com>
References: <20231101172706.81576-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Nov 2023 17:27:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4554

From: Ross Burton <ross.burton@arm.com>

---
 documentation/migration-guides/release-notes-4.3.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/docum=
entation/migration-guides/release-notes-4.3.rst
index 40a923f36..aab63f65f 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -89,7 +89,7 @@ New Features / Enhancements in 4.3
=20
    -  `ttyrun <https://github.com/ibm-s390-linux/s390-tools>`__, starts
       ``getty`` programs only when a terminal exists, preventing respawn=
s
-      through the ``init`` program.
+      through the ``init`` program. This obsoletes ``SERIAL_CONSOLES_CHE=
CK``.
=20
 -  New classes:
=20
--=20
2.34.1


