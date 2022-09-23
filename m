Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E29C6FA86
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:59 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.546.1663955630968949249
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=erlJ7XD8;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2E5F9200003;
	Fri, 23 Sep 2022 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bn3GmiKr9qdTXOSD67WPPr2MHSHqglnLGWPfV3pUR/Y=;
	b=erlJ7XD84O5Py08kCkEL9PVQRvUHjy1S9en42bK2NdvLb6G26edMs4nBavGDFTXP1q7eCn
	5iwH3KoTiyjt5OU/Gw/s3UizeFA5xA/mFU3LrZu9kgVu24f+bdnsYVfZoMbCRcPCzbRpD0
	Ry42JUOVrWVn1hQh0ZtQZm3I/AgaNO0UtkIy4c6q4CSYL8VZ+e6fwQY92i8ABEm5IuEL+T
	0sidlDFqLTQbut+fm+giEE+QhJdvf989j9eS6m027dnsUg5qjiu3DlhWkaxgkTJmtDm85n
	/HWNOwAXCQ2SP76gwGf+ycikAaM+ISvdBPjYXpCDAwkQI4WSXSTWu0r5a40lKA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 24/30] manuals: add references to the "do_rootfs" task
Date: Fri, 23 Sep 2022 19:52:13 +0200
Message-Id: <20220923175219.6652-25-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3239

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst        | 6 +++---
 documentation/migration-guides/migration-2.1.rst | 8 ++++----
 documentation/migration-guides/migration-2.5.rst | 2 +-
 documentation/overview-manual/concepts.rst       | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b20b9f374b..d00aeab72a 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3854,7 +3854,7 @@ to be added to the recipe that builds the ``core-image-sato`` image::
 
 In this example, the `from_multiconfig` is "x86". The `to_multiconfig` is "arm". The
 task on which the :ref:`ref-tasks-image` task in the recipe depends is the
-``do_rootfs`` task from the ``core-image-minimal`` recipe associated
+:ref:`ref-tasks-rootfs` task from the ``core-image-minimal`` recipe associated
 with the "arm" multiconfig.
 
 Once you set up this dependency, you can build the "x86" multiconfig
@@ -3864,7 +3864,7 @@ using a BitBake command as follows::
 
 This command executes all the tasks needed to create the
 ``core-image-sato`` image for the "x86" multiconfig. Because of the
-dependency, BitBake also executes through the ``do_rootfs`` task for the
+dependency, BitBake also executes through the :ref:`ref-tasks-rootfs` task for the
 "arm" multiconfig build.
 
 Having a recipe depend on the root filesystem of another build might not
@@ -9081,7 +9081,7 @@ Class methods are as follows:
 
 -  *hasPackage(pkg):* Returns "True" if ``pkg`` is in the installed
    package list of the image, which is based on the manifest file that
-   is generated during the ``do_rootfs`` task.
+   is generated during the :ref:`ref-tasks-rootfs` task.
 
 -  *hasFeature(feature):* Returns "True" if the feature is in
    :term:`IMAGE_FEATURES` or
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index bfc600ccca..c19ba5501c 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -128,12 +128,12 @@ separate :ref:`ref-tasks-image` tasks for clarity both in
 operation and in the code.
 
 For most cases, this change does not present any problems. However, if
-you have made customizations that directly modify the ``do_rootfs`` task
-or that mention ``do_rootfs``, you might need to update those changes.
-In particular, if you had added any tasks after ``do_rootfs``, you
+you have made customizations that directly modify the :ref:`ref-tasks-rootfs` task
+or that mention :ref:`ref-tasks-rootfs`, you might need to update those changes.
+In particular, if you had added any tasks after :ref:`ref-tasks-rootfs`, you
 should make edits so that those tasks are after the
 :ref:`ref-tasks-image-complete` task rather than
-after ``do_rootfs`` so that your added tasks run at the correct
+after :ref:`ref-tasks-rootfs` so that your added tasks run at the correct
 time.
 
 A minor part of this restructuring is that the post-processing
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index abd26809df..04f4cd7e73 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -261,7 +261,7 @@ The following are additional changes:
    ``pkg_postinst_ontarget()`` or call
    ``postinst_intercept delay_to_first_boot`` from ``pkg_postinst()``.
    Any failure of a ``pkg_postinst()`` script (including ``exit 1``)
-   will trigger a warning during ``do_rootfs``.
+   will trigger a warning during :ref:`ref-tasks-rootfs`.
 
    For more information, see the
    ":ref:`dev-manual/common-tasks:post-installation scripts`"
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 2aa7676324..8b8625a080 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1012,7 +1012,7 @@ all the post installation scripts must succeed on the build host during
 the package installation phase since the root filesystem on the target
 is read-only.
 
-The final stages of the ``do_rootfs`` task handle post processing. Post
+The final stages of the :ref:`ref-tasks-rootfs` task handle post processing. Post
 processing includes creation of a manifest file and optimizations.
 
 The manifest file (``.manifest``) resides in the same directory as the
-- 
2.34.1


