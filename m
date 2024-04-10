Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757BFCD1297
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 09:11:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.161300.1712740300377654566
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 02:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KZmKJFjA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9A281C0005;
	Wed, 10 Apr 2024 09:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712740299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t75iTv5mSBirX5olFp4UdZ1ZHt3Uz3UnwFKhLJrumHs=;
	b=KZmKJFjAtummx7umg9Fzj0XCy2Zl6pb2dnqDi0BHdiLorGlbMxHuM6qAZfXbZYI+PezpD9
	iLbKSO5OjgKrTRSD0AOJFd0iz+qnVL36h+dNM+NzPhQIuLEpCHBu40udP1uqSsxd6mYIwP
	PzRjP91wJQkweei4yiackdWGVQzX1qN5pRJei8kxfs/8ENa8QH3phzWwPQLop4VKOjTvou
	LrtGHRj1yIowlUqKiRwCVp1BVUBCMCzd0pVMtqSI9Ip17cbsW8/MFvAoyQuP4FIxbIJftH
	xxQPnc0J39Y3deOilUushiIC79OtfBL67zScwhftTV/G/igNbRJBjn1Iyns5cQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 2/2] ref-manual/variables: add new variables for v5.0
Date: Wed, 10 Apr 2024 11:11:24 +0200
Message-ID: <20240410091124.2976089-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091124.2976089-1-joaomarcos.costa@bootlin.com>
References: <20240410091124.2976089-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 09:11:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5099

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Add variables newly referenced in release-notes-5.0.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/ref-manual/variables.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 97abb398c..d4cb0e6e3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -561,6 +561,10 @@ system and gives an overview of their function and contents.
    :term:`BB_INVALIDCONF`
       See :term:`bitbake:BB_INVALIDCONF` in the BitBake manual.
 
+   :term:`BB_LOADFACTOR_MAX`
+      The system load threshold above which BitBake will stop runnig extra
+      tasks.
+
    :term:`BB_LOGCONFIG`
       See :term:`bitbake:BB_LOGCONFIG` in the BitBake manual.
 
@@ -2335,6 +2339,12 @@ system and gives an overview of their function and contents.
       See the :ref:`ref-classes-systemd-boot` and :ref:`ref-classes-image-live`
       classes for more information.
 
+   :term:`EFI_UKI_DIR`
+      The primary place for the UKI image inside the EFI System Partition.
+
+   :term:`EFI_UKI_PATH`
+      The path for the UKI image inside the rootfs.
+
    :term:`ENABLE_BINARY_LOCALE_GENERATION`
       Variable that controls which locales for ``glibc`` are generated
       during the build (useful if the target device has 64Mbytes of RAM or
@@ -5671,6 +5681,9 @@ system and gives an overview of their function and contents.
       default by setting the variable in a custom distribution
       configuration file.
 
+   :term:`OPKG_MAKE_INDEX_EXTRA_PARAMS`
+      Specifies extra parameters for opkg-make-index command.
+
    :term:`OVERLAYFS_ETC_DEVICE`
       When the :ref:`ref-classes-overlayfs-etc` class is
       inherited, specifies the device to be mounted for the read/write
@@ -7152,6 +7165,9 @@ system and gives an overview of their function and contents.
       :term:`IMAGE_ROOTFS` variable for more
       information.
 
+   :term:`RPMBUILD_EXTRA_PARAMS`
+      Specifies extra user-defined parameters for rpmbuild command.
+
    :term:`RPROVIDES`
       A list of package name aliases that a package also provides. These
       aliases are useful for satisfying runtime dependencies of other
-- 
2.43.0


