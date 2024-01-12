Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A58FC47258
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:55:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.12649.1705078506535256170
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cp2g2E7F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EFAE40007;
	Fri, 12 Jan 2024 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ynjHt0q7rUYR9vwyRejrZ4VBTp5sYVECJdB2LNEDxTU=;
	b=cp2g2E7FWz68SzEqsf5Yho3FOQ8NhS0ZEdmEDGDGva+BIKezgG1Uvd/QzfcsSvBKvNpGwr
	bDjpEqLD0xhkW4hg37eCas6bZTO81l65B01T/OgORjLHAzCnY4RGvqRVW+P1IbtQUfAbfv
	VaMO3SxxBlh2FeB+w2G0kgmaRd49oncH0JnA4FL7w/9aFarLfPLfY0OXgTTKVTv3ikCfV8
	wcg4z1VCQiRSZDXLxyjSo76RJmOXec/2Bs/YD5SeG0G6J8yt+JLPntpIiabCrcttblctUQ
	Iwds4ww+GdMNReW0dyHLA8tdRVDLDpHmJdEWGfDf10gryR/bgSto9+b5buWHgQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Maxin John <maxin.john@gmail.com>
Subject: [dunfell][PATCH 2/2] ref-manual: classes: remove insserv bbclass
Date: Fri, 12 Jan 2024 17:54:59 +0100
Message-Id: <20240112165459.3554452-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112165459.3554452-1-michael.opdenacker@bootlin.com>
References: <20240112165459.3554452-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:55:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4781

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Maxin B. John <maxin.john@gmail.com>

insserv.bbclass was removed from oe-core:

commit e6bb5dbb62257a7de730ea9085dfd89520f3e47d
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sun May 10 12:30:49 2015 +0100

insserv: Remove

Signed-off-by: Maxin John <maxin.john@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/ref-classes.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index e657fe0e55..dea27eea88 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -1315,16 +1315,6 @@ The following list shows the tests you can list with the ``WARN_QA`` and
    automatically get these versions. Consequently, you should only need
    to explicitly add dependencies to binary driver recipes.
 
-.. _ref-classes-insserv:
-
-``insserv.bbclass``
-===================
-
-The ``insserv`` class uses the ``insserv`` utility to update the order
-of symbolic links in ``/etc/rc?.d/`` within an image based on
-dependencies specified by LSB headers in the ``init.d`` scripts
-themselves.
-
 .. _ref-classes-kernel:
 
 ``kernel.bbclass``
-- 
2.34.1


