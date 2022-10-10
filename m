Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDAEC4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.4253.1665393876872641113
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Lpo6URh7;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 6537820EC338; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6537820EC338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393877;
	bh=BVxKigMqDcjk+DigZlYvqGGO1WMDVa1wYlnZTFkLUuQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Lpo6URh78SuUMLF97tJYJyrXJ3IHehsaNse4z554MrrUMycjqAK3x8juyLqGTPX0u
	 dYYOYA09xGmF92xgO+z9KNiZQzD/7yQHYm/kIguR8cofMeci9rHsjqYK8Gzst/w+pQ
	 lF/I7pkBE4tcMEgRXJO2F3vKf1CZBD0Wy9XUsvSk=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 33/34] ref-manual: add OVERLAYFS_QA_SKIP
Date: Mon, 10 Oct 2022 02:24:19 -0700
Message-Id: 
 <34667fb82a40d4aaa9fe802f4677e9fac1b3e46c.1665392836.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3335

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 00d51e5..c5ab0ff 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5290,6 +5290,19 @@ system and gives an overview of their function and contents.
          inherited by individual recipes, :term:`OVERLAYFS_MOUNT_POINT`
          should be set in your machine configuration.
 
+   :term:`OVERLAYFS_QA_SKIP`
+      When inheriting the :ref:`overlayfs <ref-classes-overlayfs>` class,
+      provides the ability to disable QA checks for particular overlayfs
+      mounts. For example::
+
+         OVERLAYFS_QA_SKIP[data] = "mount-configured"
+
+      .. note::
+
+         Although the :ref:`overlayfs <ref-classes-overlayfs>` class is
+         inherited by individual recipes, :term:`OVERLAYFS_QA_SKIP`
+         should be set in your machine configuration.
+
    :term:`OVERLAYFS_WRITABLE_PATHS`
       When inheriting the :ref:`overlayfs <ref-classes-overlayfs>` class,
       specifies writable paths used at runtime for the recipe. For
-- 
1.8.3.1


