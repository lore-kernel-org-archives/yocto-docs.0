Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8012DCD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 09:11:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31045.1782465078807653834
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 02:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=SSCiVN8e;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8yCsrk3Ckc8q0WlC7lW99J6aQLey7TJ0icV9iALzSs4=; b=SSCiVN8e63OzNarTxOP428KP8N
	8F5aqVBY8gkl2t9pZv0s4Wqo8KU5+YPjQFZeblD1rwUQ2On2HgolmeOePO5//817ublVHHGpbcb1z
	0dYL77PG5Cme5td88MATBPhjukX9j1Dl6Yw7UKX9MREKJwPkHWPmECoDobADI6qX2e9NdQ5wNMAYX
	76LhUDnAwznvnWiPrXcojim2JzzCpqYALNMiigjn7nfmdRpBRyNLh0InGpztMoMJENYVJdv3A9I6C
	5HDUbzOpoI+anlrYVeQuk2qM54YQ78EWQtstA7boZUU7EsLmBKWAY5lfPSJ33mAIdKi7MxDYxsXg+
	BkdqiyKg==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:37784 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wd2ad-00000002eyW-1WDQ
	for docs@lists.yoctoproject.org;
	Fri, 26 Jun 2026 05:11:17 -0400
Date: Fri, 26 Jun 2026 05:11:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add intro content to Ref Manual "Tasks"
 section
Message-ID: <be80b3e5-3887-e388-cf4d-8c947775c10f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 09:11:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9907


As in done in the "Classes" section, add a couple paragraphs to
explain how the developer can examine the tasks for a recipe.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e6301e708..7c8bd0a82 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -9,6 +9,35 @@ tasks to complete configuring, compiling, and packaging software. This
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
+   .. etc etc ...
+
+In addition, once a recipe has been built, you can find in that recipe's
+``${WORKDIR}/temp/`` directory not only all of the "run" and "log" files
+for every task executed for that recipe, but a ``log.task_order`` file
+that lists the order of execution of those tasks:
+
+.. code-block:: console
+
+   $ cat log.task_order
+   20260626-045459.439754 do_fetch (3798706): log.do_fetch.3798706
+   20260626-045459.805253 do_unpack (3798765): log.do_unpack.3798765
+   20260626-045501.005518 do_patch (3798918): log.do_patch.3798918
+   20260626-045501.012781 do_prepare_recipe_sysroot (3798919): log.do_prepare_recipe_sysroot.3798919
+   20260626-045501.210527 do_populate_lic (3798933): log.do_populate_lic.3798933
+   ... etc etc ...
+
 Normal Recipe Build Tasks
 =========================


