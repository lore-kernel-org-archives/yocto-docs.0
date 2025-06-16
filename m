Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32860C7115B
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 20:41:56 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.2378.1750106508774280934
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jun 2025 13:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=f9JWOYCf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-202506162041456f52c46b42c90501e4-bu5xsq@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202506162041456f52c46b42c90501e4
        for <docs@lists.yoctoproject.org>;
        Mon, 16 Jun 2025 22:41:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Ma0FamvjraByyUOQEGGpD4SPSRlErr86GlCRIcIHSkM=;
 b=f9JWOYCfVuRGscJPXwsyK/3GekzKWD/mMKB0W9VmCYWxkIZ2zxxvaC0uApYc7ouXPrzQ3C
 ZGOsYWcmPw5+o5JFA2oDtca9Ra2o3Jv+qsJTkoASLuGzCod48CqZq8jY+qePSAMdwFmjgv01
 cEHVAN3RttieEqV2y22/Ftw7FzIQBXic/t5A4ZULzKxNErhuQkeEYTnvUIpiQJwodFAzSHYl
 ww7IqIHCoJnZ6uMUoWpel27nQcAeO+65AXJY/S55NawTeovuWk/R1UKZ70GDH0n1aCDpBTfz
 UubTIj3TnW6sILdlh4JjM+sNi4BJNQ/MmbaJrwX4/X9TBuZgU6GngCCw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/3] release-notes: drop references to kernel-fitimage
Date: Mon, 16 Jun 2025 22:36:48 +0200
Message-ID: <20250616204135.1388643-3-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7073

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


