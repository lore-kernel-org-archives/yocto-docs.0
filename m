Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707E8C6FA92
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.591.1663955622342718051
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EqzitSvb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 73E6AFF802;
	Fri, 23 Sep 2022 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zMht8FIjAvdFqHbe6lCGXENztrX2OKW5K9L49z19B4U=;
	b=EqzitSvbMTt6sv6TmE+K7ljEiEX/bNc4dbAgxukE6up8x4EaPU5qJnPYDVZRthQ9EMA2AH
	d64wozPKUo9wl1lIMRSIPm9K0g8m0d3Mjgc40VXPHYvyLA+xZEANLM8yXHD07pcotcO34n
	gE4pKF80l8Yc7PjPiv2koZjT9sohge5pz+NX0fPfj0ONhNW6ICE8GLTJe1njzVWJ+Hmi/V
	l7cE1VzfxM3WEO2UCGBlcboZLFSAA4vH3uOFXh8hi9eSCWYbXrCqu6VJuIGCBMc+vl+cfi
	qKyN/5zYYEGO/rlkoiXezGle8YjQZPiHTzellyOH7mkYJ7PZum7M2WCEsdw+BQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 19/30] manuals: add references to the "do_cleanall" task
Date: Fri, 23 Sep 2022 19:52:08 +0200
Message-Id: <20220923175219.6652-20-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3234

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 documentation/ref-manual/tasks.rst        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index cf4d12f388..c3be8b72b4 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3458,7 +3458,7 @@ Follow these general steps:
    .. note::
 
       All the modifications you make to the temporary source code disappear
-      once you run the :ref:`ref-tasks-clean` or ``do_cleanall`` tasks using BitBake
+      once you run the :ref:`ref-tasks-clean` or :ref:`ref-tasks-cleanall` tasks using BitBake
       (i.e. ``bitbake -c clean package`` and ``bitbake -c cleanall package``).
       Modifications will also disappear if you use the ``rm_work`` feature as
       described in the
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index dcfc2679ee..7eb48dcba3 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -473,7 +473,7 @@ use the :ref:`ref-tasks-cleansstate` task instead
 Removes all output files, shared state
 (:ref:`sstate <overview-manual/concepts:shared state cache>`) cache, and
 downloaded source files for a target (i.e. the contents of
-:term:`DL_DIR`). Essentially, the ``do_cleanall`` task is
+:term:`DL_DIR`). Essentially, the :ref:`ref-tasks-cleanall` task is
 identical to the :ref:`ref-tasks-cleansstate` task
 with the added removal of downloaded source files.
 
@@ -481,7 +481,7 @@ You can run this task using BitBake as follows::
 
    $ bitbake -c cleanall recipe
 
-Typically, you would not normally use the ``cleanall`` task. Do so only
+Typically, you would not normally use the :ref:`ref-tasks-cleanall` task. Do so only
 if you want to start fresh with the :ref:`ref-tasks-fetch`
 task.
 
-- 
2.34.1


