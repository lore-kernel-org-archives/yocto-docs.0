Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E43CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 10:04:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.7370.1712311456337904285
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 03:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TmwP0A3n;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7493C0002;
	Fri,  5 Apr 2024 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712311455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdGfexjqYpB3XiYTa0uKJDzyW1Tpby2InGYH++9ZzMU=;
	b=TmwP0A3nU20ufsNYxwYZrqrSs44gAfgI4hpPAV7055Z4KgxCH0yQiJNOw578J3w+drT54c
	hXdmLhYmYL6IXEcnsmLQELd2WKUIi9UlAPc5DnELZAPExbimyDAsR1B/uOv211BoPbF+VC
	PMejbhxRzIEPqkyy8spV9Lp8zVd4Cqv7wfEW/1wGZG6mWFbwvyMjEHE8ntwJx9TsZQ7cau
	fyboydLTFYFUW6kUt1E3fG21rXxVE6GT1qVxUCWvRTMFroeJ4AqSCttkP9CEcFy05V/Yed
	tYDH3ZCshVAAxVVomKYIXL84aKS5zIWsCRw0HfEJT8/9SVj/SovdFizhKh2eKQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 3/3] migration: add Go language changes
Date: Fri,  5 Apr 2024 12:03:54 +0200
Message-ID: <20240405100355.2268926-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405100355.2268926-1-joaomarcos.costa@bootlin.com>
References: <20240405100355.2268926-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 10:04:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5071

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index a9075c298..902cc11bf 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -52,6 +52,10 @@ See :ref:`all supported distributions <system-requirements-supported-distros>`.
 Go language changes
 ~~~~~~~~~~~~~~~~~~~
 
+The ``linkmode`` flag was dropped from ``GO_LDFLAGS`` for ``nativesdk`` and
+``cross-canadian``. Also, dynamic linking was disabled for the whole set of
+(previously) supported architectures in the ``goarch`` class.
+
 .. _migration-5.0-systemd-changes:
 
 systemd changes
-- 
2.43.0


