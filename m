Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62422F4487D
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157880.1775832229464135756
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qkI6Z9mW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0B966C5C1AF
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2371603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 420FC10450025;
	Fri, 10 Apr 2026 16:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uouaJxUfqsaEFwDvjftO91aKvkT1sMnidGMxbiWUBPA=;
	b=qkI6Z9mWubV5pSh3qckOHbuF1owSXdoEbZVNEUCxkStDmcN13MyNUwPqIgHU3EzRuGnHkT
	AJGg0EPUllj1R7yphf4k7HAz1f+refdcSPuJTJtbS1Pd2zadCqr4YZMxy/1CHlBQRFG+tW
	a8yqiMiTRyAYj95uglA2tY3T9c+yHm8BUJ2gh1ngPtihAKdZ13YtrFwqQoViNoHks/zGes
	TOflm6mNuoLk7839jldz7/s9i1mL2bpwwZfjRhVD6JymBbz7VEcM9LtamPXvF6H3i8FvSU
	WofQpnqcaOwsAx6/1KTePQE6284SL/69bZWLCwBX2TZ6oyJ4HVaEe5vhT0DOcQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:35 +0200
Subject: [PATCH 11/18] migration-guides/migration-6.0.rst: add note on
 WIC_SECTOR_SIZE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-11-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2770;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dVGr8E7/8KR3G9aCg5KKWeAXGZf66GFz1LAGIE49Sos=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyYd0XPiiU9Vls1bktuz1YLvLDNL196M3kY8
 PsLIIT5tjGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMmAAKCRDRgEFAKaOo
 NpxeD/wL0ODtTASOxNEVvgNWd3X+mKHOs5vp1BjHm6tQY+Hps4i7bSpzttqci0BS/7Mdda7SOcF
 ACQ3y9zK+uBKAUvjcp6tv7Lmnf00Gc61Ke5kFwwM7ix7qzL/c3inWbN9hrZUVhsPbwZaPLTQE7G
 AYghkBqg/3RVT1ppJdb6QcCwmNj1J6V+TfK1yrB5xD1JxEemOwQFx9+G4dySGPHO2/j2PGT7aqd
 XylRBWUClUd8BvzW6NCiehsHwzGq8BbaErS/leXkX3qy4A3kGvXuxlC7+TXG9yVMKEZ1xQ0C3ih
 HsTXBR08RDMB7soVIyPEPSGGeSdOYQZYpZXkwZbe/+8uNYfLr9JBGtzn4fkKRH/Nz8eLXzcEnq2
 jkpWCMuyEydCI6dDbFlKUaefTYfgCEzC4wLHnCjnPkO64Zdqs/vF1lO3LGC1bOAUoNzD8M0h52X
 Wnmw6zG8wi+myqj0Ee77UDCnA1W4tVo8GKCFdWM3zCmPYwBh7of3fZyfoT05G9eFE5vSqdvZFJJ
 klh8ajEN6vIL/mqkabfpDjoN67dymON2fjX4Gxj2rmjdyTwrRALI3vz7IXjBcEYIgjprxJEyq4J
 yfiz16nnov6FLsE8005h7m3dUTJ0SgAJ77KLIFmNmwCh/b7yzPqUEgxTq/C/DBiuZTrQJ/V/Zxl
 amjtxBurrCJBgEQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9238

After b50d6debf7ba ("wic: re-implement sector-size support") in OE-Core,
add a note on the WIC_SECTOR_SIZE variable.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst | 30 ++++++++++++++++++++++++
 documentation/ref-manual/variables.rst           |  7 ++++++
 2 files changed, 37 insertions(+)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index 15dbd08a0..16046dad8 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -189,6 +189,36 @@ class, meaning recipes using these variables that not yet inheriting the
 
 See commit :oecore_rev:`68d2d38483efada7bc2409e10508b03a7431caff` for more information.
 
+
+.. _ref-migration-6-0-wic-sector-size-change:
+
+:term:`WIC_SECTOR_SIZE` should be replaced by ``--sector-size``
+---------------------------------------------------------------
+
+The :term:`WIC_SECTOR_SIZE` variable was previously used to define the sector
+size of the partitions generated by the :doc:`WIC </dev-manual/wic>` tool. The
+``wic`` command-line tool now supports a ``--sector-size`` argument that
+replaces this variable.
+
+While this variable can still be used in recipes, a warning is now printed on
+the console when used::
+
+   DEPRECATED: WIC_SECTOR_SIZE is deprecated, use the --sector-size command-line argument instead.
+
+Using the ``--sector-size`` command-line argument can be done through the
+:term:`WIC_CREATE_EXTRA_ARGS` variable.
+
+For example, a previous assignment to :term:`WIC_SECTOR_SIZE`::
+
+   WIC_SECTOR_SIZE = "4096"
+
+Should be replaced by::
+
+   WIC_CREATE_EXTRA_ARGS += "--sector-size 4096"
+
+See commit :oecore_rev:`b50d6debf7baa555fbfb3521c4f952675bba2d37` for more
+information.
+
 Rust language changes
 ---------------------
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 89a5e632b..b698e865f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -12261,6 +12261,13 @@ system and gives an overview of their function and contents.
       Wic creation process.
 
    :term:`WIC_SECTOR_SIZE`
+
+      .. warning::
+
+         This variable is deprecated in favor of the ``--sector-size`` wic
+         command-line argument. See :ref:`ref-migration-6-0-wic-sector-size-change`
+         for more information.
+
       The variable :term:`WIC_SECTOR_SIZE` controls the sector size of Wic
       images. In the background, this controls the value of the
       ``PARTED_SECTOR_SIZE`` environment variable passed to the ``parted``

-- 
2.53.0


