Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50352EC8756
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 16:55:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.219.1694192095098063078
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 09:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jhpslsKD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A625420007;
	Fri,  8 Sep 2023 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694192093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lzBlZ2lO4z/1ALuY5LS6pdmiXNTwL5jWebkjm7M8mWA=;
	b=jhpslsKDr7y3v07xB9Hs7j+0DvlZKJKarXXgw3HZGdt5KmLkq0/tZ6ucJofQbR/Z5lghy0
	wSabioayoTA0SJ4rSG9xViawpQMx2eyO5cJWUXGFhK42T6OBcRD0ESWhluUrC77+WeE78J
	Cx4UBx3X29uO31UktUGZRQa+w4R3EnRJMNkaIjmXiXNQBqWXVah/zw3fFuNNZmSNlDO/ut
	f7vtBScm5d2BOTbASrEtWNHhSUR85DuUVBk76SH5Fn5ODmAsVpYulf2w1gpmGYauiUkBcq
	NXZtRy1HXihVl0PSomBvaY2Q8nKXKFHMPnGqhTFk1Q9v6aEIp8kjLze5YcVoOQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Ross Burton <ross.burton@arm.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] manuals: document LICENSE_FLAGS_DETAILS
Date: Fri,  8 Sep 2023 18:54:40 +0200
Message-Id: <20230908165440.319268-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Sep 2023 16:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4207

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Quentin Schulz <foss+yocto@0leil.net>
---
 documentation/dev-manual/licenses.rst           |  7 +++++++
 .../migration-guides/release-notes-4.3.rst      |  5 ++++-
 documentation/ref-manual/variables.rst          | 17 +++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 9629dc5329..e62a3c501f 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -123,6 +123,13 @@ name and version (after variable expansion)::
 
    LICENSE_FLAGS = "license_${PN}_${PV}"
 
+It is possible to give more details about a specific license
+using flags on the :term:`LICENSE_FLAGS_DETAILS` variable::
+
+   LICENSE_FLAGS_DETAILS[my-eula-license] = "\nFor further details, see https://example.com/eula."
+
+If set, this will be displayed to the user if the license hasn't been accepted.
+
 In order for a component restricted by a
 :term:`LICENSE_FLAGS` definition to be enabled and included in an image, it
 needs to have a matching entry in the global
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index c19cf6e4f9..87cd622743 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -10,6 +10,8 @@ New Features / Enhancements in 4.3
 
 -  New variables:
 
+   -  :term:`FILE_LAYERNAME`: bitbake now sets this to the name of the layer containing the recipe
+
    -  :term:`FIT_ADDRESS_CELLS` and :term:`UBOOT_FIT_ADDRESS_CELLS`.
       See details below.
 
@@ -17,7 +19,8 @@ New Features / Enhancements in 4.3
 
    -  :term:`KERNEL_DTBVENDORED`: whether to keep vendor subdirectories.
 
-   -  :term:`FILE_LAYERNAME`: bitbake now sets this to the name of the layer containing the recipe
+   -  :term:`LICENSE_FLAGS_DETAILS`: add extra details about a recipe license
+      in case it is not allowed by :term:`LICENSE_FLAGS_ACCEPTED`.
 
 - Layername functionality available through overrides
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7a71abc0ae..71c02a8510 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4968,6 +4968,23 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/licenses:enabling commercially licensed recipes`"
       section in the Yocto Project Development Tasks Manual.
 
+   :term:`LICENSE_FLAGS_DETAILS`
+      Adds details about a flag in :term:`LICENSE_FLAGS`. This way,
+      if such a flag is not accepted through :term:`LICENSE_FLAGS_ACCEPTED`,
+      the error message will be more informative, containing the specified
+      extra details.
+
+      For example, a recipe with an EULA may set::
+
+         LICENSE_FLAGS = "FooBar-EULA"
+         LICENSE_FLAGS_DETAILS[FooBar-EULA] = "\nFor further details, see https://example.com/eula."
+
+      If ``Foobar-EULA`` isn't in :term:`LICENSE_FLAGS_ACCEPTED`, the
+      error message is more useful::
+
+        Has a restricted license 'FooBar-EULA' which is not listed in your LICENSE_FLAGS_ACCEPTED.
+        For further details, see https://example.com/eula.
+
    :term:`LICENSE_PATH`
       Path to additional licenses used during the build. By default, the
       OpenEmbedded build system uses :term:`COMMON_LICENSE_DIR` to define the
-- 
2.34.1


