Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC91FC3527B
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.3387.1650591648706538563
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Fc8r36Hw;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id C619C20E657C; Thu, 21 Apr 2022 18:40:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C619C20E657C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1650591647;
	bh=CHAcLQmkdLLGhkgTffk7Oqb/1234dz4yEPYo2weNrGg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fc8r36Hw3Gm3Ic49Y8HLIiTfrqoi7TX/e+x+buakJrwz7OKEwr4MOGrmTXHFyi4fp
	 bNS4FD/cC/dWWhGYr23mMArwH3ZwpEQdB661oKwuPb0oRqjhjoyOTff9WErak9BUJl
	 FJz1hbe2PeZC/LG+m3B49gctG04cMEyxyY2eooxI=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 5/9] ref-manual: add KERNEL_DEBUG_TIMESTAMPS
Date: Thu, 21 Apr 2022 18:40:38 -0700
Message-Id: 
 <a314940592419f70ac7ae1cace1f8dde96d883a5.1650591341.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2826

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable in kirkstone.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0b8c44f..b9448b8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3953,6 +3953,11 @@ system and gives an overview of their function and contents.
       custom kernel image types with the :ref:`kernel <ref-classes-kernel>` class using this
       variable.
 
+   :term:`KERNEL_DEBUG_TIMESTAMPS`
+      If set to "1", enables timestamping functionality during building
+      the kernel. The default is "0" to disable this for reproducibility
+      reasons.
+
    :term:`KERNEL_DEVICETREE`
       Specifies the name of the generated Linux kernel device tree (i.e.
       the ``.dtb``) file.
-- 
1.8.3.1


