Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B949CC35294
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.3541.1650591648769500562
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=iEvGSNeF;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id D1C0D20E6581; Thu, 21 Apr 2022 18:40:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D1C0D20E6581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1650591647;
	bh=cqValLlopt3+5pZppTOURGwZuoOjf+oZc31O1KgZ6jQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iEvGSNeFEszbi0uPnk8jqT3mFfyD1jc/NrrqeCRsqeGKbinCos+19aYl6+6+T8IMa
	 qeW/oT3IhO2ypYHYJJTCZxArFBg3XL0rM1Oo2r44nDhaNaiMweYkYR/vTv7vAkMYy8
	 hr7ZEAfF11xi9i5YvOq+ecOS7GOAr1kIZuWq4uKo=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 6/9] ref-manual: add XZ_THREADS and ZSTD_THREADS
Date: Thu, 21 Apr 2022 18:40:39 -0700
Message-Id: 
 <fde984bfa988c26cf7ef4cacf4ac830d974129b0.1650591341.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2828

From: Paul Eggleton <paul.eggleton@microsoft.com>

ZSTD_THREADS is new for kirkstone, XZ_THREADS was introduced in dunfell.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b9448b8..4803578 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8737,4 +8737,15 @@ system and gives an overview of their function and contents.
 
       The default value of :term:`XSERVER`, if not specified in the machine
       configuration, is "xserver-xorg xf86-video-fbdev xf86-input-evdev".
-   
+
+   :term:`XZ_THREADS`
+      Specifies the number of parallel threads that should be used when
+      using xz compression. By default this scales with core count, but
+      is never set less than 2 to ensure that multi-threaded mode is
+      always used (so that the output file contents are deterministic).
+
+   :term:`ZSTD_THREADS`
+      Specifies the number of parallel threads that should be used when
+      using ZStandard compression. By default this scales with core count,
+      but is never set less than 2 to ensure that multi-threaded mode is
+      always used (so that the output file contents are deterministic).
-- 
1.8.3.1


