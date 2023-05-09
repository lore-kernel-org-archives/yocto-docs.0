Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F28C7EE24
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 12:40:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.31182.1683636048248864451
 for <docs@lists.yoctoproject.org>;
 Tue, 09 May 2023 05:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GLYPFgQa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 42D4D1BF20D;
	Tue,  9 May 2023 12:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683636046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g+y0XxtA7rZKdfIyzsUMM0Ltd0cqSNzWHOM2kqumN+E=;
	b=GLYPFgQawLIoVQE2wdnkLgPfAWy5nsUwzoVqU2cZTuqW6DCfuSFHQOXO7CcYjHhcX37U4L
	IrLjDVcf5Bdj/J4rnlYKZkUwBFWZfDA9ijSYBsTgi/OQlAeYj3Zzf7BtIZjp3MT2HxTjm5
	iqyP+QcYokdE8tHpfEdGx7v4w+x3G7tquuXyPKb+KzKpc0W64i+l/tiZfCY+PJ9mzn0GSQ
	NwB/34ry+4hoE7VVJSRc/YmmmIlcXWHN3peXOQO3r/AiHWdUvVsrng5QsPoCszgtP/IsAo
	Z56Cx5dp7wjNqMbDeFK/YYqOmBsW3m+D9fkHw1ZF59gp4B1fP3OR/KIIKGP6ag==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/4] [mickledore] migration-guides: release-notes-4.2: add doc improvement highlights
Date: Tue,  9 May 2023 14:40:35 +0200
Message-Id: <20230509124038.2265185-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 May 2023 12:40:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3924

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst        |  2 ++
 .../migration-guides/release-notes-4.2.rst     | 18 ++++++++++++++++++
 .../ref-manual/system-requirements.rst         |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 4e74246a4e..ab3e193aaf 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1289,6 +1289,8 @@ as described in the ":ref:`dev-manual/licenses:tracking license changes`"
 section in the Yocto Project Overview and Concepts Manual. You can quickly
 create Autotool-based recipes in a manner similar to the previous example.
 
+.. _ref-building-meson-package:
+
 Building a Meson Package
 ------------------------
 
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index 473ea984c3..e13bbde1b3 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -271,6 +271,24 @@ New Features / Enhancements in 4.2
    -  ``xinetd``: move ``xconv.pl`` script to separate package
    -  ``perf``: enable debug/source packaging
 
+-  Prominent documentation updates:
+
+   -  Substantially expanded the ":doc:`/dev-manual/vulnerabilities`" section.
+   -  Added a new ":doc:`/dev-manual/sbom`" section about SPDX SBoM generation.
+   -  Expanded ":ref:`init-manager`" documentation.
+   -  New section about :ref:`ref-long-term-support-releases`.
+   -  System Requirements: details about :ref:`system-requirements-minimum-ram`.
+   -  Details about :ref:`ref-building-meson-package` and the
+      :ref:`ref-classes-meson` class.
+   -  Documentation about how to write recipes for Rust programs. See the
+      :ref:`ref-classes-cargo` class.
+   -  Documentation about how to write recipes for Go programs. See the
+      :ref:`ref-classes-go` class.
+   -  Variable index: added references to variables only documented in the
+      BitBake manual. All variables should be easy to access through the Yocto
+      Manual variable index.
+   -  Expanded the description of the :term:`BB_NUMBER_THREADS` variable.
+      
 -  Miscellaneous changes:
 
    -  Supporting 64 bit dates on 32 bit platforms: several packages have been
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 91ed6d8d6d..d6e8b4583c 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -40,6 +40,8 @@ to run multiple builds and to cache build artifacts, improving build efficiency.
 If you have a shortage of disk space, see the ":doc:`/dev-manual/disk-space`"
 section of the Development Tasks Manual.
 
+.. _system-requirements-minimum-ram:
+
 Minimum System RAM
 ==================
 
-- 
2.34.1


