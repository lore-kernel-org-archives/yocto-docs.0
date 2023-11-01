Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD3CC4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:27:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.102.1698859644868167908
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 10:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C7802F4;
	Wed,  1 Nov 2023 10:28:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08BEA3F738;
	Wed,  1 Nov 2023 10:27:23 -0700 (PDT)
From: ross.burton@arm.com
To: docs@lists.yoctoproject.org,
	michael.opdenacker@bootlin.com
Cc: nd@arm.com
Subject: [PATCH 13/14] packaging changes
Date: Wed,  1 Nov 2023 17:27:05 +0000
Message-Id: <20231101172706.81576-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101172706.81576-1-ross.burton@arm.com>
References: <20231101172706.81576-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Nov 2023 17:27:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4559

From: Ross Burton <ross.burton@arm.com>

---
 .../migration-guides/release-notes-4.3.rst        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/docum=
entation/migration-guides/release-notes-4.3.rst
index 757592751..10c5e50a4 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -170,6 +170,21 @@ New Features / Enhancements in 4.3
=20
 -  Packaging changes:
=20
+   -  ``FILES`` now accepts ``**``, which matches zero or more subdirect=
ories.
+ =20
+   -  The X server packagroup now defaults to using the ``modesetting`` =
X
+      driver, which obsoletes the ``fbdev`` driver.
+ =20
+   -  If a recipe uses ``LICENSE_FLAGS`` and the licenses are not accept=
ed, it
+      can set a custom message with ``LICENSE_FLAGS_DETAILS`` to be disp=
layed to
+      the users.
+
+   -  Recipes that fetch specific revisions no longer need to explictly =
add
+      ``SRCPV`` to ``PV`` as BitBake will now automatically add the revi=
sion
+      infomation to ``PKGV`` if needed.
+
+   -  The default ``PR`` values in many recipes have been removed.
+ =20
 -  Security improvements:
=20
    -  Most repositories now include a :yocto_git:`SECURITY.md
--=20
2.34.1


