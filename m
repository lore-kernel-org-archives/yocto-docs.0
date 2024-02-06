Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA02C4829B
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:31:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.24056.1707233490820535938
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TR7sNXD2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BA7B1C000B;
	Tue,  6 Feb 2024 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aaDRODOpU6FnzSf3cqYUPv51M8Bj/LZsHBRK/JPfkE=;
	b=TR7sNXD2yBOPl9UQvmA8x1hH/CewO6X8g/76HSKZfnnHcozcK7hHr2xyU514xCfeD+FNS+
	/abjUWA6jzXZqsRffG4qothr6pKVOHiym2dBL9xG6mFpAD+PGNF5Qy9smE930U3Y2FKc6d
	89/ds28Mdx729232AnZXSROeumwxMS5/SufHhGxRjWw+YxNTyX0p6Sys+nka2kk09fgVUI
	dH9RX8oxZ3YSJmT1q0hcIuL3Jey3sD711lkLCc5rSjUkr0D8aN8kxqu6jTTHpb8inbqbVh
	zk+7BjUjEU1LngX9j66tH3DA3/E3u++R7UDr19bjtF7pIWOb15uMaDgMHgYXdQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [kirkstone][PATCH 1/3] dev-manual: gen-tapdevs need iptables installed
Date: Tue,  6 Feb 2024 16:31:09 +0100
Message-Id: <20240206153111.77153-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206153111.77153-1-michael.opdenacker@bootlin.com>
References: <20240206153111.77153-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:31:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4820

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Simone Weiß <simone.p.weiss@posteo.com>

Add the hint to the test setup that runqemu-gen-tapdevs will need the
iptables package installed.

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
---
 documentation/dev-manual/runtime-testing.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index b9aa6759d1..7b9345fb79 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -52,6 +52,8 @@ In order to run tests, you need to do the following:
          -  Be sure to use an absolute path when calling this script
             with sudo.
 
+         -  Ensure that your host has the package ``iptables`` installed.
+
          -  The package recipe ``qemu-helper-native`` is required to run
             this script. Build the package using the following command::
 
-- 
2.34.1


