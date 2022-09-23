Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63566C07E9D
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:19 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.560.1663955591033855131
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VphprWtN;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3803C200002;
	Fri, 23 Sep 2022 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipgIg6BdsVqk+sn2X5BvtkFUbRe9J2+zM3KwZGFESuo=;
	b=VphprWtNC5aVtk76xESQwBaHmpTBtDk8KnF5kr5N5a9p6KNqZ5652bDU9riSkAu3jJthw5
	qXrWS0CBxLU7XbNNdmVTG8aNe7qFPtCTCDJp+nsKLyHFrGf4Wf+fKeJxzDvUDdtwwyLPek
	fYXLQbEC39VNZ9Fic6OsSpOQ5Rgk0PokCrYCqCehsTxcgDM/fk4WBG5GPk1/eL+ggBQrZu
	AK+FwQDQCYD2UWgtB051F2SvkdYasedyV7++HMuhiJPlZWUhtZVefmFlDUCNGQXa7SQG3b
	c7NRqV8gxtgku//cYM49y77RbyDywcEJ10ZrtCJOpjZh1c6ZT1UXxpFAcCH5SA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 07/30] manuals: add references to the "do_image" task
Date: Fri, 23 Sep 2022 19:51:56 +0200
Message-Id: <20220923175219.6652-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3222

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst  | 2 +-
 documentation/overview-manual/concepts.rst | 4 ++--
 documentation/ref-manual/tasks.rst         | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 0b512601e5..22d1634f1b 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3853,7 +3853,7 @@ to be added to the recipe that builds the ``core-image-sato`` image::
    do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_rootfs"
 
 In this example, the `from_multiconfig` is "x86". The `to_multiconfig` is "arm". The
-task on which the ``do_image`` task in the recipe depends is the
+task on which the :ref:`ref-tasks-image` task in the recipe depends is the
 ``do_rootfs`` task from the ``core-image-minimal`` recipe associated
 with the "arm" multiconfig.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index f3f8cbd95c..3bb728f990 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1036,7 +1036,7 @@ the
 variable. This variable specifies a list of functions to call before the
 build system creates the final image output files.
 
-The build system dynamically creates ``do_image_*`` tasks as needed,
+The build system dynamically creates :ref:`do_image_* <ref-tasks-image>` tasks as needed,
 based on the image types specified in the
 :term:`IMAGE_FSTYPES` variable.
 The process turns everything into an image file or a set of image files
@@ -2162,7 +2162,7 @@ operations that are normally reserved for the root user (e.g.
 :ref:`ref-tasks-install`,
 :ref:`do_package_write* <ref-tasks-package_write_deb>`,
 :ref:`ref-tasks-rootfs`, and
-:ref:`do_image* <ref-tasks-image>`). For example,
+:ref:`do_image_* <ref-tasks-image>`). For example,
 the :ref:`ref-tasks-install` task benefits from being able to set the UID and GID
 of installed files to arbitrary values.
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 5efe64b35d..63af2730e7 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -128,15 +128,15 @@ module.
 ``do_image``
 ------------
 
-Starts the image generation process. The ``do_image`` task runs after
+Starts the image generation process. The :ref:`ref-tasks-image` task runs after
 the OpenEmbedded build system has run the
 :ref:`ref-tasks-rootfs` task during which packages are
 identified for installation into the image and the root filesystem is
 created, complete with post-processing.
 
-The ``do_image`` task performs pre-processing on the image through the
+The :ref:`ref-tasks-image` task performs pre-processing on the image through the
 :term:`IMAGE_PREPROCESS_COMMAND` and
-dynamically generates supporting ``do_image_*`` tasks as needed.
+dynamically generates supporting :ref:`do_image_* <ref-tasks-image>` tasks as needed.
 
 For more information on image creation, see the ":ref:`overview-manual/concepts:image generation`"
 section in the Yocto Project Overview and Concepts Manual.
@@ -149,7 +149,7 @@ section in the Yocto Project Overview and Concepts Manual.
 Completes the image generation process. The ``do_image_complete`` task
 runs after the OpenEmbedded build system has run the
 :ref:`ref-tasks-image` task during which image
-pre-processing occurs and through dynamically generated ``do_image_*``
+pre-processing occurs and through dynamically generated :ref:`do_image_* <ref-tasks-image>`
 tasks the image is constructed.
 
 The ``do_image_complete`` task performs post-processing on the image
-- 
2.34.1


