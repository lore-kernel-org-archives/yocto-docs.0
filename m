Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8285FC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:44:49 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.13503.1639413888282448259
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7C2C5240004;
	Mon, 13 Dec 2021 16:44:46 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] documentation: add comment to releases.rst switchers.js
Date: Mon, 13 Dec 2021 17:44:42 +0100
Message-Id: <20211213164442.55720-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:44:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2250

To let release developers know that they don't need
to update these files in release branches other than "master".

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/releases.rst               | 7 +++++++
 documentation/sphinx-static/switchers.js | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index e1d8eae8ef..83b9e76a62 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -1,5 +1,12 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
+..
+   NOTE FOR RELEASE MAINTAINERS:
+   This file only needs updating in the development release ("master" branch)
+   When documentation for stable releases is built,
+   the latest version from "master" is used
+   by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-build
+
 ===========================
  Supported Release Manuals
 ===========================
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 056a8926ba..29bf02fe02 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -1,3 +1,11 @@
+/*
+NOTE FOR RELEASE MAINTAINERS:
+This file only needs updating in the development release ("master" branch)
+When documentation for stable releases is built,
+the latest version from "master" is used
+by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-build
+*/
+
 (function() {
   'use strict';
 
-- 
2.25.1


