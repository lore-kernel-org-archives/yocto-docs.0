Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386DBC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 14:35:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.9137.1651070094313023646
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 07:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WSeGiNd7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3839BFF804;
	Wed, 27 Apr 2022 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651070091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NNpHK5LT9bkQZ+H/r9LvJTdUDZo+QeBjABvfF6hbrHw=;
	b=WSeGiNd7Hd7ZLZeByL+uS3KNHvZc9dEkGdSG2Udqk4bEDZuHatz5BsM0uXSTgG73AhVGLx
	7Qwjy8TOnK+tjiTV3HNli5ZEa/hKTnEjn7FoJ1RYEHrvpPI/4Efwo6gri+IPXdgtiFRw/i
	9iY6uYDHMexTOd1eWpf19Ny7k2kACzW7UMZ1wzTayB2ujEDK+H/kHomNNE2eadb2/7TpYl
	zZkW8z+2A0EL8AwVQHN5KDW39uXJ7mGxGF0d7N4M5sXenA/V6XpoUFvz527HLMtcN6bH7X
	2awBSKU1fVnGLte77QVSHb2OacLCg5DmQr+GRs90frUGVhkmnYwT88E28bzx1w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [kirkstone] migration-guides: release-notes-4.0: mention LTS
 release
Date: Wed, 27 Apr 2022 16:34:44 +0200
Message-Id: <20220427143444.237299-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 14:35:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2894

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.0.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 799a819147..eaa40f9317 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -1,6 +1,8 @@
 Release notes for 4.0 (kirkstone)
 ---------------------------------
 
+This is a Long Term Support release, published in April 2022, and supported at least for two years (April 2024).
+
 New Features / Enhancements in 4.0
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.25.1


