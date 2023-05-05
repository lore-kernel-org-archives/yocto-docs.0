Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE942C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 16:27:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.118.1683304063045112107
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 09:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lsnFcD2o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7077E240005;
	Fri,  5 May 2023 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683304060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g+y0XxtA7rZKdfIyzsUMM0Ltd0cqSNzWHOM2kqumN+E=;
	b=lsnFcD2oRVgh7YOiQlU9XmaOmkXc57r4BznfrIak/IixR73kmZzVbfvGRnPj+Y0jX0EjO/
	skBYeeEA/7CIt9t9aqDnFYLwVpmHhOdM+FCBnMydZQbjvHrBsLMvpeugFgv3NMuCrnhIES
	zQtZt1lA6lPiZpWfC7t9XtWC43vmvPq2edONLozR/zRwaJqnpZd4zYHA79eXQjCs2mPcfB
	2bhptiKtiUDKMlJSjSGIj3BqYAun0ca1CBhkIoMT4meeUBr79y70cngobsO2Ls+5X35zpP
	ezRDITYBejPc+rLA70vuLkk+KHJWLTajBl67pSqtQmjQSWnaTbEX1XystH02HA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: release-notes-4.2: add doc improvement highlights
Date: Fri,  5 May 2023 18:27:38 +0200
Message-Id: <20230505162738.2126117-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 16:27:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3916

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


