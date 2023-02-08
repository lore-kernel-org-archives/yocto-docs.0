Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608DBC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 15:30:45 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.686.1675870237114512764
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 07:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F7VXeJVZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DE5C8FF804;
	Wed,  8 Feb 2023 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675870235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rHNC4DkRcG5GTskeT6RBws3GXxg4hQLpCYL1Ns8lSnM=;
	b=F7VXeJVZQJBOjoZ8S+8csM8+/NQ594MCN+knXqUV66CZOFYu6q+tGT/fTgO4L1o7X4pD1A
	nC28WhPLIzJQU+lyZaiAqP+VgzZSH4pBbbBFzsphFRS9lAaUJ3rpxcgzDp9Nb8rw3MROzy
	F2s/aDwnHujZSD26NjQGePUo0U/oRGyF7A3dtX6UMvc+1RqWq/z2w5iBOItdZX7rsSPXmN
	E1iisjf5GBLezWv6QIEm++EbNPrIKitqr4zBdxtziR0nGl32OaEs5JbGgYaEP7FmUjJYEU
	tZZZE4XShdWlu58hgCDsNwu3B6P1zVOAY8LNswY45P3MOQnUATX0C0TcJOrseQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] profile-manual: update WireShark hyperlinks
Date: Wed,  8 Feb 2023 16:30:32 +0100
Message-Id: <20230208153032.94510-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Feb 2023 15:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3649

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 1e31019897..703ac459a0 100644
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


