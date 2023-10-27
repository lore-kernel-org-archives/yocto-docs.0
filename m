Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7E3C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 18:38:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.14550.1698431920966972919
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 11:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dpe7haJW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 203C1FF809;
	Fri, 27 Oct 2023 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698431919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=74PXff0HpxLDWc2+fLWXduMcsTz/+6gDMRzmbtgHrWc=;
	b=dpe7haJW1ueqEMCysnxCUnkRHYiTYWWy6BsZ9u2npfQWViVz1+d0PUY0Hb46hYp3ZJBysb
	x81k/KahHfvrjGP7nBNtVjPbocFrEqjHP7D4jfNyE4J9bxwYjXw/UA8IfawdXbzQZzkYCu
	43bfXA4KUkStGlgjRKgI4ZPnpNBg4dWt8xbAgBSn+6LXkTAm5DKacLmettrxj1eUY2Smqc
	586r8mEFT8/bFp47EaVl+wJFHtgH+mSNdqYPYj3nC0mnkkqpGhoYUN4U4iDxR0c4SjioUm
	q+QYvURF4jknP1E/AhMvgC0gdAlXeOEEPm+2/NnEk0w95M+5qRj2TzLEGieUkg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: further updates for 4.3
Date: Fri, 27 Oct 2023 20:38:31 +0200
Message-Id: <20231027183831.1646399-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 18:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4522

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/migration-4.3.rst        | 39 ++++++++++++++++++-
 .../migration-guides/release-notes-4.3.rst    |  4 +-
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documentation/migration-guides/migration-4.3.rst
index 3fa131ef0c..891f2d08ce 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -26,6 +26,8 @@ no longer the default supported configuration. This setting does not affect whic
 kernel versions SDKs will run against and does not affect which versions of the kernel
 can be used to run builds.
 
+.. _migration-4.3-layername-override:
+
 Layername override implications
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -36,6 +38,15 @@ side effect that the QA checks will apply to things being bbappended to recipes
 from other layers. Those other layers would need to have patch upstream status
 entries for patches being bbappended for example.
 
+.. _migration-4.3-compiling-changes:
+
+Compiling changes
+~~~~~~~~~~~~~~~~~
+
+-  Code on 32 bit platforms is now compiled with largefile support and 64
+   bit ``time_t``, to avoid the Y2038 time overflow issue. This could break
+   existing programs in untested layers.
+
 .. _migration-4.3-supported-distributions:
 
 Supported distributions
@@ -43,8 +54,18 @@ Supported distributions
 
 This release supports running BitBake on new GNU/Linux distributions:
 
+-  Ubuntu 22.10
+-  Fedora 38
+-  CentOS Stream 8
+-  AlmaLinux 8.8
+-  AlmaLinux 9.2
+
 On the other hand, some earlier distributions are no longer supported:
 
+-  Fedora 36
+-  AlmaLinux 8.7
+-  AlmaLinux 9.1
+
 See :ref:`all supported distributions <system-requirements-supported-distros>`.
 
 .. _migration-4.3-go-changes:
@@ -55,6 +76,8 @@ Go language changes
 -  Support for the Glide package manager has been removed, as ``go mod``
    has become the standard.
 
+.. _migration-4.3-systemd-changes:
+
 Systemd changes
 ~~~~~~~~~~~~~~~
 
@@ -79,6 +102,15 @@ Class changes
    as there were no users in any core layer. The functions for this functionality
    are still available.
 
+.. _migration-4.3-deprecated-variables:
+
+Deprecated variables
+~~~~~~~~~~~~~~~~~~~~
+
+The following variables have been deprecated:
+
+-  :term:`CVE_CHECK_IGNORE`: use :term:`CVE_STATUS` instead.
+
 .. _migration-4.3-removed-variables:
 
 Removed variables
@@ -105,8 +137,7 @@ Removed classes
 
 The following classes have been removed in this release:
 
-
-.. _migration-4.3-misc-changes:
+.. _migration-4.3-qemu-changes:
 
 QEMU changes
 ~~~~~~~~~~~~
@@ -124,12 +155,16 @@ QEMU changes
    This change was made to avoid exceeding two serial ports, which interferes
    with automated testing.
 
+.. _migration-4.3-qa-changes:
+
 QA check changes
 ~~~~~~~~~~~~~~~~
 
 -  The fetcher in ``lib/bb/tests/fetch.py`` now uses the ``https`` protocol
    instead of ``git``, whenever possible.
 
+.. _migration-4.3-misc-changes:
+
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index d2c8aa0857..424e75541d 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -28,6 +28,8 @@ New Features / Enhancements in 4.3
 
    -  :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`: to restrict package managers used in reproducibility testing.
 
+   -  :term:`KERNEL_STRIP`: to specify the command to strip the kernel binary.
+
 - Layername functionality available through overrides
 
   Code can now know which layer a recipe is coming from through the newly added :term:`FILE_LAYERNAME`
@@ -68,8 +70,6 @@ New Features / Enhancements in 4.3
    -  The ``poky-altcfg`` distribution enables the ``usrmerge``
       :ref:`distro feature <ref-manual/features:Distro Features>`.
 
-
-
 -  wic Image Creator enhancements:
 
 -  FIT image related improvements:
-- 
2.34.1


