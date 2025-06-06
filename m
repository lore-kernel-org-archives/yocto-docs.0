Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D075FC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:07:10 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.34379.1749218821615244503
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 07:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=j9lFOPuS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202506061406574324bbdc81330fe6e2-xtv2li@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202506061406574324bbdc81330fe6e2
        for <docs@lists.yoctoproject.org>;
        Fri, 06 Jun 2025 16:06:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Ma0FamvjraByyUOQEGGpD4SPSRlErr86GlCRIcIHSkM=;
 b=j9lFOPuS1CXpNuDwLDtRI18OGLaJJGzCsc4eODR5zy7mmNyq2Z3F0yxCgF/7IwlaZVJKRd
 UW48XkE5d39Hzck1eUPi3pR2+AArohZc0JDOOaUZMeUzEqEwfPjz1wGf8IW2GHTUaP7+zkQC
 TG+g8BCrRxFNDGMrzsEMlC4tha4e9feh2yWg8/LZ19sLRnM4UrjL/s5W0fLPwgLfbd4/3kqm
 pORFJ1tV/XjWMnJ+6fm6NqBBRLfkQB4ZGGJN3pQIn0AVylUdaCDpPE+M763feP2exWnWCaZ9
 XsEvZmpF2UicZnr/IsGIAeJOPxCF7x/BofywbsgqWxT+3P+lXP1zfi5g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/3] release-notes: drop references to kernel-fitimage
Date: Fri,  6 Jun 2025 16:06:09 +0200
Message-ID: <20250606140647.80782-3-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7018

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This commit drops references to the kernel-fitimage.bbclass to prevent
from build errors when the label is no longer available.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/migration-guides/release-notes-5.1.rst | 2 +-
 documentation/migration-guides/release-notes-5.2.rst | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 267934a71ed..bab0c145814 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -377,7 +377,7 @@ New Features / Enhancements in 5.1
       :term:`SIGGEN_EXCLUDERECIPES_ABISAFE` and does not trigger a rebuild on a
       change for dependent tasks.
 
-   -  In :ref:`ref-classes-kernel-fitimage`, the existence of
+   -  In ``kernel-fitimage``, the existence of
       :term:`EXTERNAL_KERNEL_DEVICETREE` is checked more thoroughly to avoid
       false positives.
 
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index aad5a2eda03..5fc426c050c 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -29,7 +29,7 @@ New Features / Enhancements in |yocto-ver|
       ``RuntimeWatchdogSec`` option in ``/etc/systemd/system.conf``.
 
    -  :term:`FIT_UBOOT_ENV` to allow including a u-boot script as a text in a
-      fit image. See the :ref:`ref-classes-kernel-fitimage` for more information.
+      fit image. See the ``kernel-fitimage`` for more information.
 
    -  :ref:`ref-classes-meson`: :term:`MESON_INSTALL_TAGS` to allow passing
       install tags (``--tags``) to the ``meson install`` command during the
@@ -684,7 +684,7 @@ New Features / Enhancements in |yocto-ver|
       command-line tool was added to the different Yocto Project and OpenEmbedded
       repositories.
 
-   -  :ref:`ref-classes-kernel-fitimage`: handle :doc:`multiconfig
+   -  ``kernel-fitimage``: handle :doc:`multiconfig
       </dev-manual/multiconfig>` dependency when
       :term:`INITRAMFS_MULTICONFIG` is set.
 
-- 
2.49.0


