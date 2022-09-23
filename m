Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E29FC6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.585.1663955627679860721
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QK7xGLBi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8F4B2240006;
	Fri, 23 Sep 2022 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9uYMZQ/EiIfKvUeLMcSast5karGj6JDSBw3LFxOeKrw=;
	b=QK7xGLBisJhBoez95W7b1A6tQBojndE4lEh9ujBdXSNSGOClGR0/oLLRKn/7jxR/4LDJsQ
	lx4kT2iL8B9spEG4O0v6hEUNl8Ma7EmPFb68UPBksTxU7QCkdugdezsa4/Z9FfFF92yVEX
	ECuxmvFlrModCcYH8I5t75NPHx+npmZR5F2lnI+4tOqNJ9PANMb/BjQHo4BGhKDnHndtro
	BfXlaD8+0usI+/Am3PlumysjNsCcAz26YL4n0Z0v0ZdAFXphDHQ9AOxwtSug02aG+sBRqs
	RSrSYX9sW2Ctkhjy+RrsRNwHuScItqbmw25VlIoloVASsqgpOy8ZxQjA0fMPCQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 22/30] dev-manual: common-tasks.rst: add reference to
 "do_listtasks" task
Date: Fri, 23 Sep 2022 19:52:11 +0200
Message-Id: <20220923175219.6652-23-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3237

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index efed327cea..8b77568d83 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9724,7 +9724,7 @@ task dependency mechanisms.
 
 
 You can view a list of tasks in a given package by running the
-``do_listtasks`` task as follows::
+:ref:`ref-tasks-listtasks` task as follows::
 
    $ bitbake matchbox-desktop -c listtasks
 
-- 
2.34.1


