Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF324C10DC1
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:54:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.35293.1701878077570561350
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 07:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JqMisB6E;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4E8BC0003;
	Wed,  6 Dec 2023 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701878075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zeVH8zD45s0XhjB8pNu78cfzj45xv5t2TBlXRLBxwAA=;
	b=JqMisB6EE6rZkX5+vnsKHTyyUegYe789GAXfNn190wwOn/hpdU4JmjZ3eOp1dbr/WdNiro
	cg43Hic8v6Vxt0BS7ziY9yJAHqGpcrP7jonkhJ+zE76idocZ1tjej7s+GF0cPZ4i2sgpAn
	lgotw3bOVBRzaE1GeRJWM6m9urtVnaYDvvxH0tNIt+nPIpC5FI+FYne+JM+VmmMCnTn8Vg
	8V+H5a945H4PaX2oVupSu+2PwvzC1k0Qe69ToNwgNzdTEHgtAX1cxCFfvY9Hvu6VzazdF8
	t2BmWv+pKlEk3N4T/S+wlPDPQCM4EFGpwrIZ257lIo80FULi1pv/iZeUmR/gDQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/6] test-manual: resource updates
Date: Wed,  6 Dec 2023 16:54:23 +0100
Message-Id: <20231206155427.279612-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206155427.279612-1-michael.opdenacker@bootlin.com>
References: <20231206155427.279612-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Dec 2023 15:54:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4658

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


