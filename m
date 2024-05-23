Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA57C41513
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:56:51 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.17708.1716472604659070553
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 06:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P6wX+IYK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF08E20003;
	Thu, 23 May 2024 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716472602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PhuIe6E4U6X8zbqGrpeUZXD9fIFdENKzi+gc6O9L+xw=;
	b=P6wX+IYKJS7TyUSqMVc00HrYc9jBKY13oFEf833Q5zIVx+Dr4Cjmc5Jhdisg1zNGA3xH0V
	UTZzjnMTeIFkzgb2zIPXEYgVDEpAdMyv9DblINyYUU0rCLnkspL2WVnsfGWoyvz8Wm3EOj
	RHnZZODUZe+t7m5sKK8UAUDzTBbFl4Xjr6a3NjHX0hLGkhLt6M62zr4c3UncqC11c2rb7u
	mtUq7wfi5pmPjG1j9191N4rFBSnFgkyviSU9BvO3ZYt/eN7LUp562zYI6sImggnaGq5HS9
	M24oH7i+4LzrvdwMSPwPSSykvkTRzxFfv/1EmkHLVi0v7OsC6PvFOGj51/T9PA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] migration-5.1.rst: preliminary description of UNPACKDIR changes
Date: Thu, 23 May 2024 15:56:28 +0200
Message-Id: <20240523135628.3076018-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523135628.3076018-1-michael.opdenacker@bootlin.com>
References: <20240523135628.3076018-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 13:56:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5245

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../migration-guides/migration-5.1.rst        | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index b4db04bcee..84ef35e28a 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -11,6 +11,61 @@ Project 5.1 Release (codename "styhead") from the prior release.
 
 .. _migration-5.1-supported-kernel-versions:
 
+:term:`WORKDIR` changes
+~~~~~~~~~~~~~~~~~~~~~~~
+
+S = ${WORKDIR} no longer supported
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+If a recipe has :term:`S` set to be :term:`WORKDIR`, this is no longer
+supported, and an error will be issued. The recipe should be changed to::
+
+    S = "${WORKDIR}/sources"
+    UNPACKDIR = "${S}"
+
+Any :term:`WORKDIR` references where files from :term:`SRC_URI` are referenced
+should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`,
+:ref:`ref-tasks-compile`, :ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
+
+:term:`WORKDIR` references in recipes
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+:term:`WORKDIR` references in other recipes need auditing. If they reference
+files from :term:`SRC_URI`, they likely need changing to :term:`UNPACKDIR`.
+These are commonly in :ref:`ref-tasks-compile` and :ref:`ref-tasks-install`
+for things like service or configuration files. One unusual case is
+``${WORKDIR}/${BP}`` which should probably be set to ``${S}``.
+
+References to ``../`` in :term:`LIC_FILES_CHKSUM` or elsewhere may need changing
+to :term:`UNPACKDIR`. References to :term:`WORKDIR` in ``sed`` commands are
+usually left as they are.
+
+General notes
+^^^^^^^^^^^^^
+
+Files from :ref:`ref-tasks-unpack` now unpack to ``WORKDIR/sources-unpack/``
+rather than ``WORKDIR/``.
+
+If :term:`S` is set to a subdirectory under :term:`WORKDIR` and that
+subdirectory exists in ``sources-unpack`` after :ref:`ref-tasks-unpack` runs,
+it is moved to :term:`WORKDIR`. This means that ``S = "${WORKDIR}/${BP}"``,
+``S = "${WORKDIR}/git"`` and also deeper paths continue to work as expected
+without changes. We cannot use symlinks to do this as it breaks autotools
+based recipes. Keeping all sources under ``sources-unpack`` wasn't considered
+as it meant more invasive recipes changes. The key objective was separating the
+:ref:`ref-tasks-unpack` task output from :term:`WORKDIR`.
+
+Previously, :term:`S` was always created but after the recent changes it is no
+longer the case. This means the check in ``do_unpack_qa`` triggers where
+:term:`S` is not created by a recipe while it didn't happen before. This can
+require to add an :term:`S` definition to a recipe that only uses
+``file://`` :term:`SRC_URI` entries. Building C files from :term:`UNPACKDIR`
+without setting :term:`S` to point at it does not work as the debug prefix
+mapping doesn't handle that.
+
+``devtool``  and ``recipetool`` have been updated to handle this and their
+support for ``S = WORKDIR`` and ``oe-local-files`` has been removed.
+
 Supported kernel versions
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.34.1


