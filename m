Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B1DC433FE
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 03:09:51 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.3339.1634872189956901610
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 20:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=LS0AsPzX;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id E604020B6C55; Thu, 21 Oct 2021 20:09:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E604020B6C55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1634872188;
	bh=JIFLiEb2fJdvnoLENZTNUDo19PPCNvLPw/B3tkjS39c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LS0AsPzXNjxOQb+9q630B0kBBxUHoPr6v9dpxrvDnuMwWO1i/FLTjp/iiW9VBdL9h
	 WTU4HVTIYgzS+33bW/LK4EL7aCUtwjWLYt5OqMUYFwjtMPSYHI6Ax4sk+XL0vqmrUi
	 lKOCpoQwhVWeKIsPXzg5/gyQ4ASXehBHnsDPjsIA=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] migration-3.4: add some extra packaging notes
Date: Thu, 21 Oct 2021 20:09:29 -0700
Message-Id: 
 <8b2fe561955a9ee80e2b419e30237d49f3fe7915.1634872024.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1634872024.git.paul.eggleton@linux.microsoft.com>
References: <cover.1634872024.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 03:09:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2034

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add some notes on minor packaging changes that I missed earlier.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/migration-guides/migration-3.4.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 797bfde..e785277 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -202,6 +202,15 @@ Package/recipe splitting
   in its own ``xwayland`` recipe. If you need Xwayland in your image
   then you may now need to add it explicitly.
 
+- The ``rpm`` package no longer has ``rpm-build`` in its :term:`RRECOMMENDS`;
+  if by chance  you still need rpm package building functionality in
+  your image and you have not already done so then you should add
+  ``rpm-build`` to your image explicitly.
+
+- The Python ``statistics`` standard module is now packaged in its own
+  ``python3-statistics`` package instead of ``python3-misc`` as
+  previously.
+
 
 Image / SDK generation changes
 ------------------------------
-- 
1.8.3.1


