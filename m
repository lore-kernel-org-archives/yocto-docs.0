Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A720DCD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 14:35:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.13744.1712327708507484207
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 07:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iGit+6RK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA8FDC0008;
	Fri,  5 Apr 2024 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712327707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jL5vaHNlVQqGyp75WEMOgHFhDwcfY2TirgLEKwXydlo=;
	b=iGit+6RKCkhA5hxhYOjuU756UFxeiPGOqnsn0gZc5izuxfoV0EcMXFF+KbhL7hbPYZcmaL
	rYC8mYVSpwdHuzy5QlNyHbkZ2tH0jS+3nAU6YYYOwaS1eKapvCaHLhqj6H4pweEvjydUpQ
	wZHdo7IEMttjGKm3EGBxZFGuwjd7xmYbWOkec9RyL5sKF1jZz04NS9kXVvVCe+MVGV/pxu
	b0sEamE2F7DRfjcJFizTk3Q3bccx5PKwmdrKd733k3XgFLK43msKTkjqPQn+QwJEP99u9I
	znbkQq2qXVMBZAJfsjYiHn7M++AjUvTuwF7S50tVaZSg656i4BlaBlo8S9yWdA==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 2/6] migration: add QEMU changes
Date: Fri,  5 Apr 2024 16:34:49 +0200
Message-ID: <20240405143453.2281900-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
References: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 14:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5077

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index ab6b191cf..72af77083 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -121,6 +121,10 @@ No classes have been removed in this release.
 QEMU changes
 ~~~~~~~~~~~~
 
+In ``tune-core2``, the cpu models ``n270`` and ``core2duo`` are no longer
+passed to QEMU, since its documentation recommends not using them with ``-cpu``
+option. Therefore, from now on, ``Nehalem`` model is used instead.
+
 .. _migration-5.0-misc-changes:
 
 Miscellaneous changes
-- 
2.43.0


