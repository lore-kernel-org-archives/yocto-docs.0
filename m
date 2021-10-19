Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD79EC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 14:18:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.10219.1634653115731570683
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 07:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 34A4660014;
	Tue, 19 Oct 2021 14:18:34 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/3] test-manual: how to enable reproducible builds
Date: Tue, 19 Oct 2021 16:18:24 +0200
Message-Id: <20211019141824.1980728-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
References: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Oct 2021 14:18:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2002

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/reproducible-builds.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 349cd1953e..01980d083e 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -44,6 +44,18 @@ same.
    before finalizing your production images. It would be too late if you
    only address this issue when the first updates are required.
 
+================
+How to enable it
+================
+
+You can enable build reproducibility by inheriting the
+:ref:`reproducible-build <ref-classes-reproducible-build>` class
+in the configuration for your distribution.
+
+This is what the Poky reference distribution does::
+
+   INHERIT += "reproducible_build"
+
 ===================
 How we implement it
 ===================
-- 
2.25.1


