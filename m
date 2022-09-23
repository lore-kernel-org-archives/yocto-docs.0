Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D06C07E9D
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.544.1663955623812067820
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pmuCCvu7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3C3361BF204;
	Fri, 23 Sep 2022 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRIXT8nu04+gqOhX4kEiet9v6UnFrYKniKFlSUhyMdM=;
	b=pmuCCvu7+O0h/XX4eXpri0OWkFKL8qa12qPADI1PJykYXTLv2t5JvOgy7wGoCematPWWit
	Nlk7VzQQFDgo1edvw8rAxE/iHX8x6CHZga9LVzEVPtan2hGQgaLAxoVz77b0IiQavhNqBc
	uMKd8XvCXWe15/3r8S62gzPw9K6U6nCd76GXnpltAddCeA33pgT0Q93JFXW+YXp5ig+lwe
	RHpErzoROisNs4MsY/kChJPizGmmKdQiYpvzxzd542p1hlx/LVlRVQFLnEnHEwdLzUChlI
	6fe6Zj4Oohs9JExtPUhoT3EBZkY5gCLetSGHymhFOBCBgm6alkpDwx+Q6vu/hg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 20/30] ref-manual: tasks.rst: add references to the
 "do_cleansstate" task
Date: Fri, 23 Sep 2022 19:52:09 +0200
Message-Id: <20220923175219.6652-21-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3235

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 7eb48dcba3..7c4be3e86f 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -492,7 +492,7 @@ task.
 
 Removes all output files and shared state
 (:ref:`sstate <overview-manual/concepts:shared state cache>`) cache for a
-target. Essentially, the ``do_cleansstate`` task is identical to the
+target. Essentially, the :ref:`ref-tasks-cleansstate` task is identical to the
 :ref:`ref-tasks-clean` task with the added removal of
 shared state (:ref:`sstate <overview-manual/concepts:shared state cache>`)
 cache.
@@ -501,13 +501,13 @@ You can run this task using BitBake as follows::
 
    $ bitbake -c cleansstate recipe
 
-When you run the ``do_cleansstate`` task, the OpenEmbedded build system
+When you run the :ref:`ref-tasks-cleansstate` task, the OpenEmbedded build system
 no longer uses any sstate. Consequently, building the recipe from
 scratch is guaranteed.
 
 .. note::
 
-   The ``do_cleansstate`` task cannot remove sstate from a remote sstate
+   The :ref:`ref-tasks-cleansstate` task cannot remove sstate from a remote sstate
    mirror. If you need to build a target from scratch using remote mirrors, use
    the "-f" option as follows::
 
-- 
2.34.1


