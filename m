Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3071EC71159
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 20:41:56 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.2381.1750106509113811239
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jun 2025 13:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=K3bhaY87;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20250616204145677ef5fea3e4256cc4-t2jwwl@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250616204145677ef5fea3e4256cc4
        for <docs@lists.yoctoproject.org>;
        Mon, 16 Jun 2025 22:41:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/bnVDUG93OhR1DO5kCCz79kAUjxY3yyiDAUYhW4bM5A=;
 b=K3bhaY87Wsfc+Ll9mwPvVnzq3s9+1OB0fIibzbMZgi0DulsdPkXD5WdQ+/T3eifP/UXeEt
 iwCtekCs3zLy3QZO4hmNY2W0sXsBeTMmGQjuNm/B4Suuo1dmLAB5g7Mwxmcm2EDUv4pxMRq2
 y8IlTHfG0viuI68bOAQ+iKfmgrkskeYWD4j5Y5Xs2JCA2BfjWGi0fhExHtSzksFAqW0kd3bG
 m89Awhe/kDIvcDDSgqJ+BJg0NwZ4NAEi7A01bC6bnAJK9d51zEyDxHiNPX47CNjr7CRPCpbO
 aopVaQPrgjpKGHnSeS9eL/kcquhKWt9vX7CJc3xGJ2Y++WizX61LvJ8g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/3] migration-5.3: replace kernel-fitimage by kernel-fit-image
Date: Mon, 16 Jun 2025 22:36:49 +0200
Message-ID: <20250616204135.1388643-4-adrian.freihofer@siemens.com>
In-Reply-To: <20250616204135.1388643-1-adrian.freihofer@siemens.com>
References: <20250616204135.1388643-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Jun 2025 20:41:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7075

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add migration documentation for users moving from the removed
kernel-fitimage.bbclass to the new kernel-fit-image.bbclass.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../migration-guides/migration-5.3.rst        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 22653fc911e..09095c7bb25 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -59,6 +59,48 @@ Removed classes
 
 The following classes have been removed in this release:
 
+-  ``kernel-fitimage.bbclass``: the class has been replaced by the
+   :ref:`ref-classes-kernel-fit-image` class. The new implementation resolves
+   the long-standing :yocto_bugs:`bug 12912</show_bug.cgi?id=12912>`.
+
+   If you are using the kernel FIT image support, you will need to:
+
+   #. Make sure to include ``kernel-fit-extra-artifacts`` in your :term:`KERNEL_CLASSES`
+      variable to ensure the required files are exposed to the :term:`DEPLOY_DIR_IMAGE`
+      directory::
+
+         KERNEL_CLASSES += "kernel-fit-extra-artifacts"
+
+   #. Use the specific FIT image recipe rather than the base kernel recipe.
+      For example, instead of::
+
+         bitbake linux-yocto
+
+      the FIT image is now build by::
+
+         bitbake linux-yocto-fitimage
+
+      For custom kernel recipes, creating a corresponding custom FIT image recipe
+      is usually a good approach.
+
+   #. If a FIT image is used as a replacement for the kernel image in the root
+      filesystem, add the following configuration to your machine configuration
+      file::
+
+         # Create and deploy the vmlinux artifact which gets included into the FIT image
+         KERNEL_CLASSES += "kernel-fit-extra-artifacts"
+
+         # Do not install the kernel image package
+         RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base = ""
+         # Install the FIT image package
+         MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-yocto-fitimage"
+
+         # Configure the image.bbclass to depend on the FIT image instead of only
+         # the kernel to ensure the FIT image is built and deployed with the image
+         KERNEL_DEPLOY_DEPEND = "linux-yocto-fitimage:do_deploy"
+
+   See the :ref:`ref-classes-kernel-fit-image` section for more information.
+
 Removed features
 ~~~~~~~~~~~~~~~~
 
-- 
2.49.0


