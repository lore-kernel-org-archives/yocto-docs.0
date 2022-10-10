Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EB5C4707A
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.4254.1665393876943746127
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=C4rfo2xU;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 0732320EC321; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0732320EC321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=6XsNm0/0DvNV0RrMbBznAtExzPuAZ2skbln/LL8Lk0g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C4rfo2xUsb/C/32w9vFgW/WS6+Va2wLB6B5c+KkY9t0ymZ3AfiZ/UHBXo2ilZmIHI
	 L1TdSERUjamXq1QgCZOaiYyR0bEbzDd+sfgtdfm6JXfb+P4FhtiD5xAAR90F5yroqe
	 ry/uuGWoJNWrLQcJHYo7Arl8IhILXRu44RAUPMQs=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 05/34] ref-manual: correct default for BUILDHISTORY_COMMIT
Date: Mon, 10 Oct 2022 02:23:51 -0700
Message-Id: 
 <be535d6eaf53a4099460413b5391825270bb9874.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3315

From: Paul Eggleton <paul.eggleton@microsoft.com>

The default changed to "1" back in 2017 (OE-Core revision
8018a2349b7ad5ab27731c93a49603adf5f72fc2). It seems I missed updating
the documentation to match.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9eb453c..81a4ab1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -920,10 +920,10 @@ system and gives an overview of their function and contents.
       and sdk). If you want to track changes to build history over time,
       you should set this value to "1".
 
-      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class does not commit the build
-      history output in a local Git repository::
+      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class
+      enables committing the buildhistory output in a local Git repository::
 
-         BUILDHISTORY_COMMIT ?= "0"
+         BUILDHISTORY_COMMIT ?= "1"
 
    :term:`BUILDHISTORY_COMMIT_AUTHOR`
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
-- 
1.8.3.1


