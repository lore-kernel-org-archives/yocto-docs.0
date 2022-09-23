Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6C5C04A95
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.567.1663955625492115249
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fPMaISij;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D14931BF206;
	Fri, 23 Sep 2022 17:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpMSUrnvNXo/TnX/8W7m5dTReHtoaK29YUS6jTSBf50=;
	b=fPMaISijHTtPFOJ1qpDCyZNpahaBtzuVm9ZaMLWLGEGajn8IiAc3l6OTsiaBfM/3dKDe47
	PnFSjFV7IamQi4NMGhV+SOrG8TneYHwhf16NUt15c5bs/avBNHffhd2vJHGFJ7ODSIzOb6
	THtO20tSs7mCUuZqJThxLM2AVirQBe9HO7rgvrppt6byE+Up8sq2Qow+tlE48KSBBmGPcp
	MreVIf9XOLAdTq1jqkQSSPqjZXFJ7DaG4csPTIWm4JSRuzIlBWuZVLBqMDCKWSs/62LeAW
	oe5uKBiNGxI1xnv3XYQUCti3hICjd2nnYXwE9AP0j916q+DfqLG1QleWyYiVQA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 21/30] manuals: add references to the "do_devshell" task
Date: Fri, 23 Sep 2022 19:52:10 +0200
Message-Id: <20220923175219.6652-22-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3236

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 documentation/ref-manual/classes.rst      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index c3be8b72b4..efed327cea 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9637,7 +9637,7 @@ behavior in most cases is: :ref:`ref-tasks-fetch`, :ref:`ref-tasks-unpack`, :ref
 :ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, :ref:`ref-tasks-install`, :ref:`ref-tasks-package`,
 :ref:`do_package_write_* <ref-tasks-package_write_deb>`, and :ref:`ref-tasks-build`. The default task is
 :ref:`ref-tasks-build` and any tasks on which it depends build first. Some tasks,
-such as ``do_devshell``, are not part of the default build chain. If you
+such as :ref:`ref-tasks-devshell`, are not part of the default build chain. If you
 wish to run a task that is not part of the default build chain, you can
 use the ``-c`` option in BitBake. Here is an example::
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 033284a46c..8e8a0baaf0 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -444,7 +444,7 @@ staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
 ``devshell.bbclass``
 ====================
 
-The ``devshell`` class adds the ``do_devshell`` task. Distribution
+The ``devshell`` class adds the :ref:`ref-tasks-devshell` task. Distribution
 policy dictates whether to include this class. See the ":ref:`dev-manual/common-tasks:using a development shell`"
 section in the Yocto Project Development Tasks Manual for more
 information about using ``devshell``.
-- 
2.34.1


