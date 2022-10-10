Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F178C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4265.1665393876279128583
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ahjb3md4;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id CB55820EC30B; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CB55820EC30B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393875;
	bh=pDUDYsTXVHYURBSC9/PSnFQvfA4aAawkbIazwJM+wT8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ahjb3md4Bl69t7t2YyxIWVC8wQ66h/9NR5nk6Iy6rs/Vkq6rL/4wFFvUb0r1MHBk9
	 ymowCCylEfFhtYYuevSOAa1mrxsfd6eIfS/DwW71IqcHDerRUYDN4Tw4XUZ1ZpAK0p
	 gdPYJ7WikpK/zdLLfJ1qlUJNkVrTuuO9sABXMm6I=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 01/34] migration-general: add section on using buildhistory
Date: Mon, 10 Oct 2022 02:23:47 -0700
Message-Id: 
 <6b333891e6614888bf6de5425db77e7ab856dabe.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3302

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a short section recommending the use of buildhistory to compare
the build output before and after migration.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 .../migration-guides/migration-general.rst         | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/documentation/migration-guides/migration-general.rst b/documentation/migration-guides/migration-general.rst
index 9eecf69..8b22508 100644
--- a/documentation/migration-guides/migration-general.rst
+++ b/documentation/migration-guides/migration-general.rst
@@ -70,3 +70,36 @@ any new Yocto Project release.
      bitbake-layers show-appends
 
 
+.. _migration-general-buildhistory:
+
+- *Checking Image / SDK Changes*:
+
+   The :ref:`buildhistory <ref-classes-buildhistory>` class can be used
+   if you wish to check the impact of changes to images / SDKs across
+   the migration (e.g. added/removed packages, added/removed files, size
+   changes etc.). To do this, follow these steps:
+
+   1. Enable buildhistory before the migration
+
+   2. Run a pre-migration build
+
+   3. Capture the buildhistory output (as specified by :term:`BUILDHISTORY_DIR`)
+      and ensure it is preserved for subsequent builds. How you would do this
+      depends how you are running your builds - if you are doing this all on
+      one workstation in the same build directory you may not need to do
+      anything other than not deleting the buildhistory output directory. For
+      builds in a pipeline it may be more complicated.
+
+   4. Set a tag in the buildhistory output (which is a git repository) before
+      migration, to make the commit from the pre-migration build easy to find
+      as you may end up running multiple builds during the migration.
+
+   5. Perform the migration
+
+   6. Run a build
+
+   7. Check the output changes between the previously set tag and HEAD in the
+      buildhistory output using ``git diff`` or ``buildhistory-diff``.
+
+   For more information on using buildhistory, see
+   :ref:`dev-manual/common-tasks:maintaining build output quality`.
-- 
1.8.3.1


