Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF39C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 16:18:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.29288.1658161080635870537
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 09:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.194,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id CAF6640009;
	Mon, 18 Jul 2022 16:17:57 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paul Eggleton <paul.eggleton@microsoft.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [dunfell][PATCH] ref-manual: Add XZ_THREADS and XZ_MEMLIMIT
Date: Mon, 18 Jul 2022 18:17:45 +0200
Message-Id: <20220718161745.652970-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Jul 2022 16:18:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3062

From: Richard Purdie <richard.purdie@linuxfoundation.org>

XZ_THREADS and XZ_MEMLIMIT were introduced in dunfell.

[RP improved an original patch from Paul]
Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/ref-variables.rst | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 49e756cfb..c5facfa98 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -8745,4 +8745,23 @@ system and gives an overview of their function and contents.
 
       The default value of ``XSERVER``, if not specified in the machine
       configuration, is "xserver-xorg xf86-video-fbdev xf86-input-evdev".
-   
+
+   :term:`XZ_THREADS`
+      Specifies the number of parallel threads that should be used when
+      using xz compression.
+
+      By default this scales with core count, but is never set less than 2
+      to ensure that multi-threaded mode is always used so that the output
+      file contents are deterministic. Builds will work with a value of 1
+      but the output will differ compared to the output from the compression
+      generated when more than one thread is used.
+
+      On systems where many tasks run in parallel, setting a limit to this
+      can be helpful in controlling system resource usage.
+
+    :term:`XZ_MEMLIMIT`
+      Specifies the maximum memory the xz compression should use as a percentage
+      of system memory. If unconstrained the xz compressor can use large amounts of
+      memory and become problematic with parallelism elsewhere in the build.
+      "50%" has been found to be a good value.
+
-- 
2.36.1


