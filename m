Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0A5ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 12:06:35 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.69750.1661774794915028968
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 05:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Dcsxm18z;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0A3EA200012;
	Mon, 29 Aug 2022 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661774793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I82AbVVdYjS8YtCWQ9YJi1oEGmenbydHJMzW1gzWo3A=;
	b=Dcsxm18zbZhuobcJV6dwe6ljGbCuI7EGhsdrVaruT0UJwGEsM4Z5+s5kcO7M49BvEpNaUg
	kg4Reez9LELwfw+fYO1GL29h5aaNp/gLg4dnx4kV0cUYAuNk/WkcFPKQhuG1A9mdVDaU1f
	8n1PAhr+7ampqeL7szqG5jcjkNxdL5cCWXeTnI/Nx4nhTqmcYq+B+25Ro2yUJbBoWxc7zl
	HRKTySMb0zDubGxxSRyyPmJZ65yOf4ZOsbqWvmer62wJjH2CsN5wbbwnOOxqKt1GCTw/CP
	hCNt+3T/4P9TIQsPJLIk5KYPyF8/tSi/pAwBU8SggCzL8DdWwbB/2VmOBoJcjA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Jon Mason <jdmason@kudzu.us>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] [dunfell] ref-manual: add numa to machine features
Date: Mon, 29 Aug 2022 14:06:26 +0200
Message-Id: <20220829120626.38883-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Aug 2022 12:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3126

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Jon Mason <jdmason@kudzu.us>

numa is an existing machine feature, add it to the list so that users
are aware of it.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
---
 documentation/ref-manual/ref-features.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/ref-features.rst
index f28ad2bb4c..be3a9e3a3e 100644
--- a/documentation/ref-manual/ref-features.rst
+++ b/documentation/ref-manual/ref-features.rst
@@ -63,6 +63,8 @@ Project metadata:
 
 -  *keyboard:* Hardware has a keyboard
 
+-  *numa:* Hardware has non-uniform memory access
+
 -  *pcbios:* Support for booting through BIOS
 
 -  *pci:* Hardware has a PCI bus
-- 
2.34.1


