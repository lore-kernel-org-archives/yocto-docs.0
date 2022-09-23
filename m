Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627EAC6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:52:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.583.1663955553176757560
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MCnIAqEo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 704FD2000A;
	Fri, 23 Sep 2022 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AKT+Gmfqtm4M7F3T6jOLXBDFbLRYRsbbmpo4ErjZy/4=;
	b=MCnIAqEozA54eKlz3/bAcq9wEGaOz+6W8goFsx/vgUrgbk5CRUkIAmFp6zK9fgbg5MkBkz
	wEtns8j69vnw5moSSDdEEQ81ZYGT9QdkPLm7aNosvK9UOWqKr3Loagbgc5UAUiveb4VYP0
	qiQvzdKTIdbrYO3LKXJ7Dgg32GfoBQV00ih8Nj9Nu56qnZuDV/X+i97AjLdWuVE2FKgkqs
	IDk/qTQwhpNCjXjTSArEoK3YOyCuiqCNXPlzTc2il43BuQe4XFlf8RqTIoJDgVqdW2i8w4
	6ae5rbCNMikgByyFLjY083FEZBKYOtiHZayvaHpwP+MYYqSq/sQQjFowm+t/uQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 01/30] manuals: add references to the "do_fetch" task
Date: Fri, 23 Sep 2022 19:51:50 +0200
Message-Id: <20220923175219.6652-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:52:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3216

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
---
 documentation/dev-manual/common-tasks.rst        | 2 +-
 documentation/migration-guides/migration-3.2.rst | 2 +-
 documentation/migration-guides/migration-4.0.rst | 4 ++--
 documentation/overview-manual/concepts.rst       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 559709d6f3..3b25c9f950 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9633,7 +9633,7 @@ Running Specific Tasks
 ----------------------
 
 Any given recipe consists of a set of tasks. The standard BitBake
-behavior in most cases is: ``do_fetch``, ``do_unpack``, ``do_patch``,
+behavior in most cases is: :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
 ``do_configure``, ``do_compile``, ``do_install``, ``do_package``,
 ``do_package_write_*``, and ``do_build``. The default task is
 ``do_build`` and any tasks on which it depends build first. Some tasks,
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index 92b7f91f2c..71778f3e26 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -191,7 +191,7 @@ Globbing no longer supported in ``file://`` entries in ``SRC_URI``
 
 Globbing (``*`` and ``?`` wildcards) in ``file://`` URLs within :term:`SRC_URI`
 did not properly support file checksums, thus changes to the source files
-would not always change the do_fetch task checksum, and consequently would
+would not always change the :ref:`ref-tasks-fetch` task checksum, and consequently would
 not ensure that the changed files would be incorporated in subsequent builds.
 
 Unfortunately it is not practical to make globbing work generically here, so
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index 79e53f89ac..ce3212a464 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -93,8 +93,8 @@ Fetching changes
 
      do_mytask[network] = "1"
 
-  This is allowed by default from ``do_fetch`` but not from any of our other standard
-  tasks. Recipes shouldn't be accessing the network outside of ``do_fetch`` as it
+  This is allowed by default from :ref:`ref-tasks-fetch` but not from any of our other standard
+  tasks. Recipes shouldn't be accessing the network outside of :ref:`ref-tasks-fetch` as it
   usually undermines fetcher source mirroring, image and licence manifests, software
   auditing and supply chain security.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 8e0303f0e0..fa060ce0de 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1208,7 +1208,7 @@ end result.
 The build system has knowledge of the relationship between these tasks
 and other preceding tasks. For example, if BitBake runs
 ``do_populate_sysroot_setscene`` for something, it does not make sense
-to run any of the ``do_fetch``, ``do_unpack``, ``do_patch``,
+to run any of the :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
 ``do_configure``, ``do_compile``, and ``do_install`` tasks. However, if
 ``do_package`` needs to be run, BitBake needs to run those other tasks.
 
-- 
2.34.1


