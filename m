Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCC7C001B0
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:27:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89.1698859636271754373
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 10:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C49032F4;
	Wed,  1 Nov 2023 10:27:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5FA8D3F738;
	Wed,  1 Nov 2023 10:27:15 -0700 (PDT)
From: ross.burton@arm.com
To: docs@lists.yoctoproject.org,
	michael.opdenacker@bootlin.com
Cc: nd@arm.com
Subject: [PATCH 02/14] edgerouter removed
Date: Wed,  1 Nov 2023 17:26:54 +0000
Message-Id: <20231101172706.81576-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101172706.81576-1-ross.burton@arm.com>
References: <20231101172706.81576-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Nov 2023 17:27:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4548

From: Ross Burton <ross.burton@arm.com>

---
 documentation/migration-guides/migration-4.3.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documenta=
tion/migration-guides/migration-4.3.rst
index 599940005..40150d888 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -69,6 +69,13 @@ On the other hand, some earlier distributions are no l=
onger supported:
=20
 See :ref:`all supported distributions <system-requirements-supported-dis=
tros>`.
=20
+.. _migration-4.3-removed-machines:
+
+Removed machines
+~~~~~~~~~~~~~~~~
+
+The ``edgerouter`` BSP in ``meta-yocto-bsp`` has been removed.
+
 .. _migration-4.3-go-changes:
=20
 Go language changes
--=20
2.34.1


