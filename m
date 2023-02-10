Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6283BC636D3
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 08:30:24 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.9579.1676017814622490717
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 00:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SxVFtYs3;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DF02F10000B;
	Fri, 10 Feb 2023 08:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676017812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M54BO2Ou4RM/CSiGy9lsTo0uWZfySncE+VItJpK7RUE=;
	b=SxVFtYs3UcKzf0foIIJi1RImC3dhzUa0/PFpwTjRpf4bUw4rvG9giyEorl0ayb29exmL8U
	TLYTmiQQ6vvyzp4KVz8VlAOr5fdBw8aN2uUKxUN5pkxO9P1cwLL50EBgFKbUZSIuhh7rUe
	rzZJC8CJURLsyerWZbyGUntjTQXkgErPP2zkUZ2XxXUvqWxyVNLTydeXl9zGvxgVLBqiNh
	1rgRVtksEQV39b1d2jrsGuMqbYGO+dOfvFvqioc1hBZtXsnd6S6QvqZGHYQi77fp5hEETi
	fIqc+KEnrS2YEM/Aw63a4r/IHX3H3yImQDACecDFxk9bVZEEZBRwcOoiSFpQ4A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [langdale] profile-manual: update WireShark hyperlinks
Date: Fri, 10 Feb 2023 09:30:08 +0100
Message-Id: <20230210083008.212669-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Feb 2023 08:30:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3659

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 49f8af4a74..5493a2b45b 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1738,7 +1738,7 @@ events':
 
 The tool is pretty self-explanatory, but for more detailed information
 on navigating through the data, see the `kernelshark
-website <https://rostedt.homelinux.com/kernelshark/>`__.
+website <https://kernelshark.org/Documentation.html>`__.
 
 ftrace Documentation
 --------------------
@@ -1767,8 +1767,8 @@ There is a nice series of articles on using ftrace and trace-cmd at LWN:
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


