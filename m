Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85018C4708E
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:27:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.100.1698859644080144970
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 10:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A054814BF;
	Wed,  1 Nov 2023 10:28:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C6C33F738;
	Wed,  1 Nov 2023 10:27:23 -0700 (PDT)
From: ross.burton@arm.com
To: docs@lists.yoctoproject.org,
	michael.opdenacker@bootlin.com
Cc: nd@arm.com
Subject: [PATCH 12/14] bitbake notes
Date: Wed,  1 Nov 2023 17:27:04 +0000
Message-Id: <20231101172706.81576-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101172706.81576-1-ross.burton@arm.com>
References: <20231101172706.81576-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Nov 2023 17:27:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4558

From: Ross Burton <ross.burton@arm.com>

---
 documentation/migration-guides/release-notes-4.3.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/docum=
entation/migration-guides/release-notes-4.3.rst
index 7cea241ec..757592751 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -158,9 +158,16 @@ New Features / Enhancements in 4.3
=20
 -  BitBake improvements:
=20
+   -  A fetcher for the Google Cloud Platform (``gs://``) was added.
+
    -  The BitBake Cooker log now contains notes when the caches are
       invalidated which is useful for memory resident bitbake debugging.
=20
+   -  BitBake no longer watches files with inotify for changes, as under=
 load
+      this can lead to races causing build instability.
+
+   -  Toaster's dependencies were upgraded to current releases, specific=
ally to Django 4.2.
+
 -  Packaging changes:
=20
 -  Security improvements:
--=20
2.34.1


