Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0956DC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 12:44:03 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.7463.1666183436134063771
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 05:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bXYxT+bl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9EE491BF211;
	Wed, 19 Oct 2022 12:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666183433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cl0rbNO/v34GdZpFaYEDd+AonMG337t2JMRAgg5KQq8=;
	b=bXYxT+bl/cxSXeObbLsZ7S+egab2b08GW6EwGFiyewWypM1BhaDDSplr6Rqnbx6Eh7JagM
	dTlgzUw4cfJCuf998khTymREg7VCXVwMLEKc66BHc3elVeEt7t40WWaXi0erpp4uNjPOia
	YJafSzl1pny+8YxqYDxS8IUFPZSQmtaCMV+QaX49pfmyw1Ql8mXQ/m9lb484RnozD4H+z2
	T3I3iLd3PAga4DKhi0bg3hGq193OCnTmc17FKfyZt8qQbwJ4BHZeciSyvVpCGeAs0LLERB
	HnNySBb/vgHIMLyCt1ZVgYx5XYEcJMe+x7beM00bOFQ2oRUm9VYDdtrKNl2olg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: fix misc typos
Date: Wed, 19 Oct 2022 14:43:51 +0200
Message-Id: <20221019124351.44462-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Oct 2022 12:44:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3373

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst              | 2 +-
 documentation/dev-manual/start.rst                     | 4 ++--
 documentation/migration-guides/release-notes-4.0.4.rst | 2 +-
 documentation/overview-manual/concepts.rst             | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 0d4e814f66..53e7686633 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2124,7 +2124,7 @@ removed later when a recipe is either modified or removed. Thus, the
 sysroot is able to remain free from stale files.
 
 A subset of the files installed by the :ref:`ref-tasks-install` task are
-used by the :ref:`ref-tasks-populate_sysroot` task as defined by the the
+used by the :ref:`ref-tasks-populate_sysroot` task as defined by the
 :term:`SYSROOT_DIRS` variable to automatically populate the sysroot. It
 is possible to modify the list of directories that populate the sysroot.
 The following example shows how you could add the ``/opt`` directory to
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 499c3f8394..6816ce5846 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -497,8 +497,8 @@ your Yocto Project build host:
    launch your WSL distribution just like any other application.
 
 6. *Optimize your WSLv2 storage often:* Due to the way storage is
-   handled on WSLv2, the storage space used by the undelying Linux
-   distribution is not reflected immedately, and since BitBake heavily
+   handled on WSLv2, the storage space used by the underlying Linux
+   distribution is not reflected immediately, and since BitBake heavily
    uses storage, after several builds, you may be unaware you are
    running out of space. WSLv2 uses a VHDX file for storage, this issue
    can be easily avoided by manually optimizing this file often, this
diff --git a/documentation/migration-guides/release-notes-4.0.4.rst b/documentation/migration-guides/release-notes-4.0.4.rst
index c615b83186..43f92cae84 100644
--- a/documentation/migration-guides/release-notes-4.0.4.rst
+++ b/documentation/migration-guides/release-notes-4.0.4.rst
@@ -95,7 +95,7 @@ Fixes in Yocto-4.0.4
 -  linux-yocto/5.15: update genericx86* machines to v5.15.59
 -  linux-yocto/5.15: update to v5.15.62
 -  linux-yocto: Fix COMPATIBLE_MACHINE regex match
--  linux-yocto: prepend the the value with a space when append to KERNEL_EXTRA_ARGS
+-  linux-yocto: prepend the value with a space when append to KERNEL_EXTRA_ARGS
 -  lttng-modules: fix 5.19+ build
 -  lttng-modules: fix build against mips and v5.19 kernel
 -  lttng-modules: fix build for kernel 5.10.137
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index a978e2cd7d..75eb872b32 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1431,7 +1431,7 @@ toolchain construction and use.
    :width: 100%
 
 Most of the work occurs on the Build Host. This is the machine used to
-build images and generally work within the the Yocto Project
+build images and generally work within the Yocto Project
 environment. When you run
 :term:`BitBake` to create an image, the
 OpenEmbedded build system uses the host ``gcc`` compiler to bootstrap a
-- 
2.34.1


