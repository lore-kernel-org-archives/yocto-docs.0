Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617ADC6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:54:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.550.1663955641034419003
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I29VxsY6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2C652240002;
	Fri, 23 Sep 2022 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=INUFoNUKPTPvU9S3eChp08O9fbv6EnEJCMq2170Ct74=;
	b=I29VxsY6leGLaL7hPuyHnJO/d5ToYM31kfUq1AS8OofFdS5wj3shvv6kcC8MAmYQq9YqhX
	xL4i+aFmBuTkSXl2eYUGIA+qyeyYYO0gLehQE7nhBFVKJL1mgps4YFR+ORDyIG4H/DlL+n
	ZoLniJrmPosO/f5qYWneOrUhH+xSTwMD/LMIwq2E3zfZnN03MIHaTqPhBTx3p4OBNEYvyg
	GHn5dmiHLqKMW3vX9gjJX/txwcgVxydU1rTQS94+6hMINPoxaVKOim/AUkP1IfkPhG9kyg
	xg1TLz39g/C+nJhhIb7E8Cv71lc+1b0kGWD4Su1zIBZlzDvVrOH65JoS5gmjmA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 30/30] ref-manual: tasks.rst: add reference to the
 "do_validate_branches" task
Date: Fri, 23 Sep 2022 19:52:19 +0200
Message-Id: <20220923175219.6652-31-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:54:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3245

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index ce900119ef..d54bb35bb5 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -791,4 +791,4 @@ After the kernel is unpacked but before it is patched, this task makes
 sure that the machine and metadata branches as specified by the
 :term:`SRCREV` variables actually exist on the specified
 branches. Otherwise, if :term:`AUTOREV` is not being used, the
-``do_validate_branches`` task fails during the build.
+:ref:`ref-tasks-validate_branches` task fails during the build.
-- 
2.34.1


