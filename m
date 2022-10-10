Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FFEC41535
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4277.1665393876871503044
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=i9/825b4;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 34D1F20EC324; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 34D1F20EC324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393877;
	bh=sVam1SlDm5NRFo4ne4LKUNuXMBM8/ffupiflimNpOgw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i9/825b4UNnHksV/rTnU4JCjScYeEp1sg4Ll9XL3iIt5hwNikrWJiS2H2d2AZ3PWh
	 8x+sTW/d5u5ftbXplfLwLoPzZ0kiPKl3nzrI6uYjbvArASjpYLR677elcBFN24CVgU
	 N1KLqnXm2spEQ112paGLbzawGd9IlibGbVnW9cvI=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 29/34] ref-manual: add OVERLAYFS_ETC_EXPOSE_LOWER
Date: Mon, 10 Oct 2022 02:24:15 -0700
Message-Id: 
 <e19baa845707208f1203e4e304f70bbfa4d920e5.1665392836.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3327

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9c510b8..503926b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5238,6 +5238,12 @@ system and gives an overview of their function and contents.
 
          OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p2"
 
+   :term:`OVERLAYFS_ETC_EXPOSE_LOWER`
+      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      inherited, if set to "1" then a read-only access to the original
+      ``/etc`` content will be provided as a ``lower/`` subdirectory of
+      :term:`OVERLAYFS_ETC_MOUNT_POINT`. The default value is "0".
+
    :term:`OVERLAYFS_ETC_FSTYPE`
       When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
       inherited, specifies the file system type for the read/write
-- 
1.8.3.1


