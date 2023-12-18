Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2435C4706D
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.2936.1702935257373669634
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OeuldfDA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 880EA60003;
	Mon, 18 Dec 2023 21:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zeVH8zD45s0XhjB8pNu78cfzj45xv5t2TBlXRLBxwAA=;
	b=OeuldfDAhOLYIpi8bFH4vPc/9awwFrlwbBu5Tzv/iGHTrvAqqtHiIpJvA37KwW0hO/P19E
	gOla4nIMUeE7+bv5ETlcbJItb1SVynyEBym4PZtOgrAwDJMUlcFIg5ZWAWOj6W4JvyNIrb
	YZaGdM1BQiLW4yPiSVYnJbWwcr30qka/e97bJx2VxMZ8dWZtSEgw0RMXA6g0jZ2FzyA900
	dfvXslBX7ZqHzENMoM7vzECh3PbozcBEieZINVXI+balBUYiV/YwyU1Fraikezc1FSrhPq
	tC1Dz2eGXPqJdVOiW3xi5aewSMSTz8EEe69Zy6Yl6kzSAgVKMbPFri/a4PwUWw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 12/20] test-manual: resource updates
Date: Mon, 18 Dec 2023 22:33:26 +0100
Message-Id: <20231218213334.146370-13-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4698

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/intro.rst | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index f27210642c..d14aa20f76 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -19,10 +19,8 @@ environment used by the Yocto Project to create their own automated,
 production test environment, building upon the foundations from the
 project core.
 
-Currently, the Yocto Project Test Environment Manual has no projected
-release date. This manual is a work-in-progress and is being initially
-loaded with information from the README files and notes from key
-engineers:
+This manual is a work-in-progress and is being initially loaded with
+information from the README files and notes from key engineers:
 
 -  *yocto-autobuilder2:* This
    :yocto_git:`README.md </yocto-autobuilder2/tree/README.md>`
@@ -39,7 +37,7 @@ engineers:
    As a result, it can be used by any Continuous Improvement (CI) system
    to run builds, support getting the correct code revisions, configure
    builds and layers, run builds, and collect results. The code is
-   independent of any CI system, which means the code can work `Buildbot <https://docs.buildbot.net/0.9.15.post1/>`__,
+   independent of any CI system, which means the code can work `Buildbot <https://docs.buildbot.net/current/>`__,
    Jenkins, or others. This repository has a branch per release of the
    project defining the tests to run on a per release basis.
 
@@ -54,8 +52,8 @@ the Autobuilder tests if things work. The Autobuilder builds all test
 targets and runs all the tests.
 
 The Yocto Project uses now uses standard upstream
-`Buildbot <https://docs.buildbot.net/0.9.15.post1/>`__ (version 9) to
-drive its integration and testing. Buildbot Nine has a plug-in interface
+Buildbot (`version 3.8 <https://docs.buildbot.net/3.8.0/>`__) to
+drive its integration and testing. Buildbot has a plug-in interface
 that the Yocto Project customizes using code from the
 ``yocto-autobuilder2`` repository, adding its own console UI plugin. The
 resulting UI plug-in allows you to visualize builds in a way suited to
@@ -304,11 +302,11 @@ Tests map into the codebase as follows:
       Git repository.
 
       Use the ``oe-build-perf-report`` command to generate text reports
-      and HTML reports with graphs of the performance data. For
-      examples, see
-      :yocto_dl:`/releases/yocto/yocto-2.7/testresults/buildperf-centos7/perf-centos7.yoctoproject.org_warrior_20190414204758_0e39202.html`
+      and HTML reports with graphs of the performance data. See
+      :yocto_dl:`html </releases/yocto/yocto-4.3/testresults/buildperf-debian11/perf-debian11_nanbield_20231019191258_15b576c410.html>`
       and
-      :yocto_dl:`/releases/yocto/yocto-2.7/testresults/buildperf-centos7/perf-centos7.yoctoproject.org_warrior_20190414204758_0e39202.txt`.
+      :yocto_dl:`txt </releases/yocto/yocto-4.3/testresults/buildperf-debian11/perf-debian11_nanbield_20231019191258_15b576c410.txt>`
+      examples.
 
    -  The tests are contained in ``lib/oeqa/buildperf/test_basic.py``.
 
-- 
2.34.1


