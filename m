Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAA0C47087
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4267.1665393876825426983
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=JHgd/R9a;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 4356820EC332; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4356820EC332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=0GHbyd7ZhYPA838CgD3l6CCvwGXsbDChJDkMzN4RAeQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JHgd/R9a1XcMHwW+/F1fWaJAL1ILJ/ePHCJqYdH7ho4Tdu5DZZD2MqX3sDYiIQu8E
	 Or+xE8Z/KK+fRMFyQIhs05EI4n/GeSjgmfy6XI9FRPmnvBjsT3V7j8MHmK/mFFnoyI
	 eZvWzKYOn/FZ7KvLsyEUQBLmc+xvQ0RczWfOfBZE=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 10/34] ref-manual: add UBOOT_MKIMAGE_SIGN
Date: Mon, 10 Oct 2022 02:23:56 -0700
Message-Id: 
 <dc2732f75dd21ca4fcf40c8ba78808209eb00274.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3307

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index bdc8e3b..7707f5a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8564,6 +8564,10 @@ system and gives an overview of their function and contents.
       If :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then kernel-fitimage will not
       pass the ``-D`` option to mkimage.
 
+   :term:`UBOOT_MKIMAGE_KERNEL_TYPE`
+      Specifies the type argument for the kernel as passed to ``uboot-mkimage``.
+      The default value is "kernel".
+
    :term:`UBOOT_MKIMAGE_SIGN`
       Specifies the name of the mkimage command as used by the
       :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to sign
-- 
1.8.3.1


