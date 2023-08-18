Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197EBC7EE43
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3.1692378644880591361
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ATch/CZz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7C161C0002;
	Fri, 18 Aug 2023 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2XFVNNH+J8OmF8kpGwzidYZQ2sObJqhwrIIeoc92MgI=;
	b=ATch/CZzzSxloCYTQ0OY1hwqIXLfXN8KMurIYhNvVInumasEUnYdL0fKgcsjOFDbqUFAKN
	DJ6Y2o9v2Z9z/BV0fw8/WmEJdHe59nBa23+19H4g7+qH906pIK8PcSCFGrWIAXm7Ou62GL
	LSIJlPg4jEaOBRG6rV1Bgxu704OAithQebo/K4oTPJJ5z0C4XNUkjVsiMNp6c27ubUt/iM
	yw6O4p3QEEippDerq8xKDY4I6Qg7XJ+YtA5nOSFWeRqO47BywFyZjtN86JLIJEaEYlEV1z
	aV3efIvV048S6Y+u3aoLcPZF2r60G/PhU/DJkKTJQBylt0ccBNV9xrwScqBRLQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 09/10] contributor-guide: submit-changes: commit guidelines for recipes
Date: Fri, 18 Aug 2023 19:10:04 +0200
Message-Id: <20230818171005.92381-10-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
References: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 17:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4174

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Adding text currently on
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 31674d313d..677885e3cf 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -101,6 +101,11 @@ corresponding to each of the patches you will eventually submit.
 See `further guidance <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes>`__
 in the Linux kernel documentation if needed.
 
+For example, when you intend to add multiple new recipes, each recipe
+should be added in a separate commit. For upgrades to existing recipes,
+the previous version should usually be deleted as part of the same commit
+to add the upgraded version.
+
 #. *Stage Your Changes:* Stage your changes by using the ``git add``
    command on each file you modified. If you want to stage all the
    files you modified, you can even use the ``git add -A`` command.
-- 
2.34.1


