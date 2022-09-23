Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630D2C04A95
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.541.1663955616010336793
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QpUY4QiO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3891B40005;
	Fri, 23 Sep 2022 17:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5mAUFF64S8r+RIpCSTnvTFaWl8UFrabBeGIbhvQCo8=;
	b=QpUY4QiOWhCLFCz3HDeUh9DRPGZtyQZQy1Bl9Nc6+fgFEJebX75pd7VBq5eLdPYmKD+JyI
	d1l074nD56CvFtWxmWmjgalgXUICtMefEifhJRA64JJB2Cl8fmE/bj3OC5zK//oj/kp6vs
	kglWtRf1fkUeFQsoFq/z5CmH45BGTXvcWTSe4c+f4MJwLILH2BZbIJmBBOP8dIg4SzpNeO
	oWQh1eiEH6qEGVfj70YGOPTtS+ikLeDkMbCUb5UiyX6bxXM5gbn6BKpOYnALaIVLRtFiUX
	8ycS31qJzYgTvbw3EuiM3P7zjotsQvTNBXKJF7Z9xLWHnrHGfGnUaasdmdaN7A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 16/30] manuals: add references to "do_populate_sysroot" task
Date: Fri, 23 Sep 2022 19:52:05 +0200
Message-Id: <20220923175219.6652-17-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3231

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 documentation/ref-manual/classes.rst      | 2 +-
 documentation/ref-manual/tasks.rst        | 2 +-
 documentation/ref-manual/variables.rst    | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index dbf7dad558..5332b21c4a 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -8481,7 +8481,7 @@ The following list shows the files produced for SDKs:
    information.
 
 -  ``sstate-task-sizes.txt:`` A text file containing name-value pairs
-   with information about task group sizes (e.g. ``do_populate_sysroot``
+   with information about task group sizes (e.g. :ref:`ref-tasks-populate_sysroot`
    tasks have a total size). The ``sstate-task-sizes.txt`` file exists
    only when an extensible SDK is created.
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 977dc34523..033284a46c 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2527,7 +2527,7 @@ stages:
    want to share with other recipes that have dependencies on the
    originating recipe. Normally these dependencies are installed through
    the :ref:`ref-tasks-install` task into
-   ``${``\ :term:`D`\ ``}``. The ``do_populate_sysroot`` task
+   ``${``\ :term:`D`\ ``}``. The :ref:`ref-tasks-populate_sysroot` task
    copies a subset of these files into ``${SYSROOT_DESTDIR}``. This
    subset of files is controlled by the
    :term:`SYSROOT_DIRS`,
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index b099ce7a5c..bf3a038b1a 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -392,7 +392,7 @@ For information on what directories are copied by default, see the
 these variables inside your recipe if you need to make additional (or
 fewer) directories available to other recipes at build time.
 
-The ``do_populate_sysroot`` task is a shared state (sstate) task, which
+The :ref:`ref-tasks-populate_sysroot` task is a shared state (sstate) task, which
 means that the task can be accelerated through sstate use. Realize also
 that if the task is re-executed, any previous output is removed (i.e.
 "cleaned").
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e71c3b6b57..79c64dc97a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6711,7 +6711,7 @@ system and gives an overview of their function and contents.
 
       - :ref:`ref-tasks-populate_lic`
       - :ref:`ref-tasks-package_qa`
-      - do_populate_sysroot
+      - :ref:`ref-tasks-populate_sysroot`
       - :ref:`ref-tasks-deploy`
 
       Despite the default value of "" for the
@@ -7382,7 +7382,7 @@ system and gives an overview of their function and contents.
       For most recipes, this sysroot is the one in which that recipe's
       :ref:`ref-tasks-populate_sysroot` task copies
       files. Exceptions include ``-native`` recipes, where the
-      ``do_populate_sysroot`` task instead uses
+      :ref:`ref-tasks-populate_sysroot` task instead uses
       :term:`STAGING_DIR_NATIVE`. Depending on
       the type of recipe and the build target, :term:`STAGING_DIR_HOST` can
       have the following values:
-- 
2.34.1


