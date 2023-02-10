Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECBEC636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 08:36:04 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.9779.1676018158191432461
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 00:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AAxZCjMd;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 027F7240005;
	Fri, 10 Feb 2023 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676018156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gOuSKfOwrYfFpv3GxfKNrISI4A44UeXxJ5Jxojk8j4s=;
	b=AAxZCjMdPGSKEPY0zBZtbcs15lxRclDL4LWK1qpG6tzwH6lfD31XOhvY364JvDIOXPGGQ5
	zs2+rO+56fXoCLmdYhcTOIAeIYuOoZYiW4Ouzk8zYQ5OsIGHRA5Tm63X/CUIB/J2CmB1Ak
	Z71JrTwLoqtnoIUcrfj+B0WcEcK9UFkMfaGOmqn7XB+w5EMGbsibBiX/vvX6Xty/S/94H6
	C3Ke368s9xMbzarKQh75QuXcjqwbe5cLCo1mgmMnZeQy8I7RZZc2cuDQmS4ZDVK3SeUW5h
	gtE3xwFt/ZLjpgizuoxaP4f8XJ9OQnmapG1CvW6gbNYFYv7qtPZV1rq0ZG1AyA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [kirkstone] profile-manual: update WireShark hyperlinks
Date: Fri, 10 Feb 2023 09:35:44 +0100
Message-Id: <20230210083544.213065-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Feb 2023 08:36:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3660

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index fb1553d70d..5758b92852 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1719,7 +1719,7 @@ events':
 
 The tool is pretty self-explanatory, but for more detailed information
 on navigating through the data, see the `kernelshark
-website <https://rostedt.homelinux.com/kernelshark/>`__.
+website <https://kernelshark.org/Documentation.html>`__.
 
 ftrace Documentation
 --------------------
@@ -1748,8 +1748,8 @@ There is a nice series of articles on using ftrace and trace-cmd at LWN:
 -  `trace-cmd: A front-end for
    Ftrace <https://lwn.net/Articles/410200/>`__
 
-There's more detailed documentation kernelshark usage here:
-`KernelShark <https://rostedt.homelinux.com/kernelshark/>`__
+See also `KernelShark's documentation <https://kernelshark.org/Documentation.html>`__
+for further usage details.
 
 An amusing yet useful README (a tracing mini-HOWTO) can be found in
 ``/sys/kernel/debug/tracing/README``.
-- 
2.37.2


