Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27A8C5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:07:10 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.34416.1749218821620607754
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 07:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=ULH5n42Y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202506061406574968187f1f88879fd2-a05tdo@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202506061406574968187f1f88879fd2
        for <docs@lists.yoctoproject.org>;
        Fri, 06 Jun 2025 16:06:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=B1O9pyuf/308kCX3llLPWsvgifASMFTBnNba3CaO1AY=;
 b=ULH5n42YpBv32Dklkd6dwTEPFrzy/5Xh5I5v69XbzO8ySIEuWblAVJYC4zOyN3LCp61V6+
 k3Mi9v3obH43mAHnrN7pyrovf6ShA7qy/N4Bq0DEPsVJuqr2bOBIrAETMoMQixu+Sa94wLr9
 k/ahj4cEP7l6uZlZ0twjSCsuuuff3Qey9FOyakzwMLd1uahRTEckfXudAeFhmzeF3cXlbcAh
 DJK0iJ14iGM1A+3McSG5L6Hd2w+ATz7uoHkupvknU6Q0qGIHixVdSMZRNe0bxwaw1iqRGZra
 qLvVPr2myFVTrGCWs5BbpPHezTJ0f2CzLq1tEpxLhMAaOZTdWkZE8efg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/3] migration-5.3: replace kernel-fitimage by kernel-fit-image
Date: Fri,  6 Jun 2025 16:06:10 +0200
Message-ID: <20250606140647.80782-4-adrian.freihofer@siemens.com>
In-Reply-To: <20250606140647.80782-1-adrian.freihofer@siemens.com>
References: <20250606140647.80782-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 14:07:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7016

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add migration documentation for users moving from the removed
kernel-fitimage.bbclass to the new kernel-fit-image.bbclass.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../migration-guides/migration-5.3.rst        | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 22653fc911e..4e03d075b5e 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -59,6 +59,41 @@ Removed classes
 
 The following classes have been removed in this release:
 
+-  ``kernel-fitimage.bbclass``: the class has been replaced by the
+   :ref:`ref-classes-kernel-fit-image` class. The new implementation resolves
+   a long-standing issue with the previous implementation (see
+   `bug #12912 <https://bugzilla.yoctoproject.org/show_bug.cgi?id=12912>`__).
+
+   If you are using the kernel FIT image support, you will need to:
+
+   1. Make sure to include ``kernel-fit-extra-artifacts`` in your :term:`KERNEL_CLASSES`
+      variable to ensure the required files are exposed to the :term:`DEPLOY_DIR_IMAGE`
+      directory::
+
+         KERNEL_CLASSES += "kernel-fit-extra-artifacts"
+
+   2. Use the specific FIT image recipe rather than the base kernel recipe.
+      For example, instead of::
+
+         bitbake linux-yocto
+
+      You now need to use::
+
+         bitbake linux-yocto-fitimage
+
+   3. If you want to use the FIT image as a replacement for the kernel image in the
+      root filesystem, add the following configuration to your machine configuration file::
+
+         # Do not install the kernel image package
+         RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base = ""
+
+         # Install the FIT image package
+         MACHINE_EXTRA_RDEPENDS += "${PREFERRED_PROVIDER_virtual/kernel}-fitimage"
+
+         # Configure the image.bbclass to depend on the fitImage instead of only
+         # the kernel to ensure the fitImage is built with the image
+         KERNEL_DEPLOY_DEPEND = "${PREFERRED_PROVIDER_virtual/kernel}-fitimage:do_deploy"
+
 Removed features
 ~~~~~~~~~~~~~~~~
 
-- 
2.49.0


