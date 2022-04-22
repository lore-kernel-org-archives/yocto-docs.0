Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08D8C4167E
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.3366.1650591648342238266
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=jxSXHeVv;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 96F3520E6564; Thu, 21 Apr 2022 18:40:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 96F3520E6564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1650591647;
	bh=b4jDqjdiOLLuZTCw+VS7hQBcKJlwdLZhxnEua9QX8yM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jxSXHeVvuOOO0/EVhfydG9UhNImS/yj1qzxI5NReXCegmGfUeoMfl5pVCmp7hcY7L
	 yt1QFvwYpL0ANLOW8srwBwTkSSj43Ly5aM/dGCOAkCaV1hojkJ6BPTQhpEm4enc/pa
	 zAANEdTtaoGvhk+0SOtm96Tj1yubK4c5sAHtKlRg=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/9] migration-3.4: add missing entry on EXTRA_USERS_PARAMS
Date: Thu, 21 Apr 2022 18:40:34 -0700
Message-Id: 
 <ba92472ebfa6fad1a0ca73327093afaa9e30374b.1650591341.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2823

From: Paul Eggleton <paul.eggleton@microsoft.com>

We missed noting this in 3.4 but I noticed the documentation was
recently updated, so note the removal.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/migration-guides/migration-3.4.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 139b2bf..dead6bc 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -265,6 +265,13 @@ Miscellaneous
   built-in override support in the fetcher or overrides in general
   instead.
 
+- The ``-P`` (``--clear-password``) option can no longer be used with
+  ``useradd`` and ``usermod`` entries in :term:`EXTRA_USERS_PARAMS`.
+  It was being implemented using a custom patch to the ``shadow`` recipe
+  which clashed with a ``-P`` option that was added upstream in
+  ``shadow`` version 4.9, and in any case is fundamentally insecure.
+
+
 .. include:: release-notes-3.4.rst
 .. include:: release-notes-3.4.1.rst
 .. include:: release-notes-3.4.2.rst
-- 
1.8.3.1


