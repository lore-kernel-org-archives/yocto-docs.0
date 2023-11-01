Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A738C41535
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:27:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.93.1698859637846606462
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 10:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DB212F4;
	Wed,  1 Nov 2023 10:27:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE2943F738;
	Wed,  1 Nov 2023 10:27:16 -0700 (PDT)
From: ross.burton@arm.com
To: docs@lists.yoctoproject.org,
	michael.opdenacker@bootlin.com
Cc: nd@arm.com
Subject: [PATCH 04/14] remove non-notable change
Date: Wed,  1 Nov 2023 17:26:56 +0000
Message-Id: <20231101172706.81576-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101172706.81576-1-ross.burton@arm.com>
References: <20231101172706.81576-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Nov 2023 17:27:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4550

From: Ross Burton <ross.burton@arm.com>

---
 documentation/migration-guides/migration-4.3.rst | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documenta=
tion/migration-guides/migration-4.3.rst
index 60aea2521..278697545 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -165,14 +165,6 @@ QEMU changes
    This change was made to avoid exceeding two serial ports, which inter=
feres
    with automated testing.
=20
-.. _migration-4.3-qa-changes:
-
-QA check changes
-~~~~~~~~~~~~~~~~
-
--  The fetcher in ``lib/bb/tests/fetch.py`` now uses the ``https`` proto=
col
-   instead of ``git``, whenever possible.
-
 .. _migration-4.3-misc-changes:
=20
 Miscellaneous changes
--=20
2.34.1


