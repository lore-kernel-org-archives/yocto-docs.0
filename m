Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4DCD206A6
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 07:27:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.17541.1729063666240765976
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 00:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fbuvwe5H;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F14E0E0004;
	Wed, 16 Oct 2024 07:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729063664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z4WOYlAAm9SRWFnLagx1DjOpKHKPHi+t0wRxoWJrDkk=;
	b=fbuvwe5Hj9JFxkGozcPxw3gDlLgl+70dmHpNr0ZkrCUI8Z8kCXsnQLLcaBxRq6u21EycS5
	bCkSGBU/hn4z60gP8KgL+RfMq+ZiwUMigOSfoAlmv45wp7k50TMaHOVUMSusFN0k4onSqA
	uNOgwD1HWCnXlrI6Rd6TYalqoWdBKxD3zNZx9noCQIEwSJZlBLydN632E062imFieurBmD
	CYwC3A8SqjO3MCryx4mZq7xJ9+H0sw/yqnh2fjp8lSPPeIXAmJtVPTauXoL+wcbyUagegL
	a3CX9qODgwjS4eQNuB+dCgWvE9ja/3XuAykwUyXQwQ7QpXCmVBcVibOPXZKcQQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 16 Oct 2024 09:27:20 +0200
Subject: [PATCH v2] ref-manual: structure.rst: document missing tmp/ dirs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-bug-14543-v2-1-df3038344377@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANdqD2cC/23MQQ7CIBCF4as0sxbDIFRw5T1MF4LQTqLFQCWah
 ruLXbv8X16+FbJP5DOcuhWSL5Qpzi3ErgM3XefRM7q1BsGFRI6S2dfIUCp5YKoPVnJtuO4DtP8
 z+UDvzboMrSfKS0yfjS74W/8pBRmyo9MKjfXGGXe2MS53mvcuPmCotX4BPaNNVqQAAAA=
X-Change-ID: 20241014-bug-14543-56fb4089086f
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3158;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=i8HLW/rA2NVeLhVY+XeCL9yMLI5g2fawHNeJlLDAnAQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnD2rvcQKyqg+BQbDFWsqj30iXd7dRWQHA6gVNE
 FRx1VeSHDOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZw9q7wAKCRDRgEFAKaOo
 NpZ0D/9IasQe9vpsWGRk1flMqs34rMSj70mAKQs6DNdciGqCrZxnjusYQL7FqKULCuI65IBrt1U
 Sof2oYHHFAu3yoAtl1DOoO/FihRDwQAQU/C0TTPDuDrVGmLHjpdaisSd/F1Vky81CGU1/zr51s3
 kupnefMGTjiaeRv8UwR0YTESd2YHnbbMxmhmJ1GEdqzC6itF+kJp8tvEm7Dwvngmm8KdM7VK7Ab
 Smr1vZqd6EjvNedGknZCXGVNP3z0k+t5KMpOhbBiyhN+euPimAD9UsqnDfuZvW3QqfTv8fwOW28
 DoEd/R3+VcLGSJSogr2+s+Re6/vg663TkTTmE1dcuABhP4bR97yH31Lbc+7OpE9agYf6Tor7y89
 G8e/+lsWJhU/zKeSFGM+npPZbrE7P058OUk0hysq65x8yAZnzJ3w8v1dywK9erzjKuWI9avxw9k
 jKNg8FvFpE01e8yAtry6SAvVlFGzb8edGChiJ/RFBpiicqSLM8G2obemlvMHhaBTqDCt1hrgXIn
 YcaO9miOwHZj6uSva9ibIHzXKEy229+AL6b6vceIBcSe93Ba8pAZZZRpocsm96lnh3vcDmylqVu
 J5NP/t0PqXMjSXPbnTyOG48LFlddsA0sgBdFD3A7BXkyQORv7SPWlBFndFoAsdUsqn8vuMHHN00
 IRYWCBOfQlfplSw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 07:27:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5493

Document `hosttools/`, `pkgdata/` and add some more information on
`work-shared/`.

Adresses [YOCTO #14543].

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
Changes in v2:
- hosttools: add missing "the"
- hosttools: Remove "pre-installed" packages and point to host
  requirements section instead.
- work-shared: s/as a way to make it common to/to make it available to/
- Link to v1: https://lore.kernel.org/r/20241014-bug-14543-v1-1-7c8519be9c9c@bootlin.com
---
 documentation/ref-manual/structure.rst | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index e4d8b54bb9e39ffe344d2db1798e4fe76c742f4e..738d4a6a8e1bc968abd4c0dcce8e0b6cde9db4e4 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -484,6 +484,30 @@ the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual.
 
+.. _structure-build-tmp-hosttools:
+
+``build/tmp/hosttools/``
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+The OpenEmbedded build system uses this directory to create symbolic links to
+some of the host components that are allowed to be called within tasks. These
+are basic components listed in the :ref:`ref-manual/system-requirements:required
+packages for the build host` section. These components are also listed in the
+:term:`HOSTTOOLS` variable and are limited to this list to prevent host
+contamination.
+
+.. _structure-build-tmp-pkgdata:
+
+``build/tmp/pkgdata/``
+~~~~~~~~~~~~~~~~~~~~~~
+
+The OpenEmbedded build system uses this directory to store package metadata
+generated during the :ref:`ref-tasks-packagedata` task. The files stored in this
+directory contain information about each output package produced by the
+OpenEmbedded build system, and are used in different ways by the build system
+such as ":ref:`dev-manual/debugging:viewing package information with
+\`\`oe-pkgdata-util\`\``".
+
 .. _structure-build-tmp-sstate-control:
 
 ``build/tmp/sstate-control/``
@@ -657,8 +681,11 @@ Here are key subdirectories within each recipe work directory:
 
 For efficiency, the OpenEmbedded build system creates and uses this
 directory to hold recipes that share a work directory with other
-recipes. In practice, this is only used for ``gcc`` and its variants
-(e.g. ``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth).
+recipes. This is for example used for ``gcc`` and its variants (e.g.
+``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth), or by the
+:ref:`ref-classes-kernel` class to store the kernel source code and kernel build
+artifacts to make it available to out-of-tree kernel modules or other
+kernel-dependent recipes.
 
 .. _structure-meta:
 

---
base-commit: 1304b899cd4480f80eaeb6e58d57e87d3d2f6911
change-id: 20241014-bug-14543-56fb4089086f

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


