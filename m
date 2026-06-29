Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEACC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:29:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34691.1782728971543300031
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 03:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=TIoKdY1Q;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D2iZqcUj7EqWY/SInG4r5PBO7RN3pEEbdX2huOcwaVY=; b=TIoKdY1Q28ZTs1eVbf2SVIl07Z
	AXqU7tdSYAsG5n0oV4ZL8wuZD6gwb8r2NW0Hwr3lxn71tTnQMjma3+fFl08sc2R8gbR54PnOw/BhB
	3HUVyNXnK2SuQp4R84gtr2qHsgva21wcYH8sCGetr4afi4USLqcQ37EpB/b8qzbSkZw91Pfll0xF0
	kkjjpRiPwr8RGueqPSjBJBqNVh9B1XOaRLTcFqsfdVs1QfLsTq66viznil7pAxCPnWWzLCC5OK03x
	ABVESfWh0krNe3+uBU+ztrJXFNeaBSY/ycBrKgn1P6jWeWn0ZeW7MWoSbWD6PlyGENOz7WRFMs7OQ
	TO4KWuTg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:53694 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1we9F3-0000000Ajgv-1gij
	for docs@lists.yoctoproject.org;
	Mon, 29 Jun 2026 06:29:29 -0400
Date: Mon, 29 Jun 2026 06:29:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] ref-manual: add intro content to Ref Manual "Tasks"
 section
Message-ID: <8eb71c37-59f9-2901-f988-9c57b9a9bcca@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 10:29:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9969


Add a couple introductory paragraphs to show how to list the tasks for
a recipe, and examine the "log" and "run" files for a recipe.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e6301e708..d10674766 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -9,6 +9,33 @@ tasks to complete configuring, compiling, and packaging software. This
 chapter provides a reference of the tasks defined in the OpenEmbedded
 build system.

+To see the tasks defined (in alphabetical order) for a given recipe,
+you can run:
+
+.. code-block:: console
+
+   $ bitbake -c listtasks recipename
+   do_build                              Default task for a recipe - depends on all other normal tasks required to 'build' a recipe
+   do_checkuri                           Validates the SRC_URI value
+   do_clean                              Removes all output files for a target
+   do_cleanall                           Removes all output files, shared state cache, and downloaded source files for a target
+   do_cleansstate                        Removes all output files and shared state cache for a target
+   do_compile                            Compiles the source in the compilation directory
+   ...
+
+In addition, once a recipe has been built, you can examine the
+resulting task information in that recipe's ``${WORKDIR}/temp/``
+directory, which will consist of the following:
+
+-  for each task, a ``run`` file that represents the code that
+   was executed for that task
+
+-  for each task, a corresponding ``log`` file showing the result of
+   task execution
+
+-  a single ``log.task_order`` file showing the execution order
+   of all tasks for that recipe
+
 Normal Recipe Build Tasks
 =========================


