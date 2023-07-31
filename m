Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77EBC001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 17:58:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2208.1690826324262808751
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 10:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LkIcR15n;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C2FB1C0005;
	Mon, 31 Jul 2023 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690826322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yQ0xQkmwT2BjXJb4KB2OQcpNlURJzqs2A8Snwujhb+4=;
	b=LkIcR15nwLP0XiJukxUsMWhBAfwSvQEzm3YQ9/gYhXpb6PkinMg+45VkMl83OsBZujhWT3
	tluCA3qdEGD7t/bstHUOgGx+SZto6csatuaVfGZ6hD0xKhle4vDc6i8U5fEgxH6s5yfc1F
	A4SjEV4zt9t67rGmc2NFmEnXiURp3rKG2XCG2XhfDFK97oImkAfvi85PMDP/6EBMzv5p/+
	Rf3bSKbpR+tWMAzhPnFNpTmDjpx+r5Zy4LetMSASG+xdCxI/YVnr19p2jKFiu4UZsYLtZT
	DqQVZRMGMW9ziikCY5bX7Hm3cZmp66yQQj283LZA1EH1KoSpWSkNuJtP9k7Efw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] [kirkstone] ref-manual: document image-specific variant of INCOMPATIBLE_LICENSE
Date: Mon, 31 Jul 2023 19:58:36 +0200
Message-Id: <20230731175836.51755-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Jul 2023 17:58:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4091

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This has been around without being properly documented since 2019 (!!!),
and is nowadays the preferred method for enforcing license restrictions,
especially since meta-gplv2 is officially obsolete.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/images.rst    | 16 +++++++++-------
 documentation/ref-manual/variables.rst | 11 ++++++++++-
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index 31fb567687..33e5b53d9f 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -14,15 +14,17 @@ image you want.
    Building an image without GNU General Public License Version 3
    (GPLv3), GNU Lesser General Public License Version 3 (LGPLv3), and
    the GNU Affero General Public License Version 3 (AGPL-3.0) components
-   is only supported for minimal and base images. Furthermore, if you
-   are going to build an image using non-GPLv3 and similarly licensed
-   components, you must make the following changes in the ``local.conf``
-   file before using the BitBake command to build the minimal or base
-   image::
+   is only tested for core-image-minimal image. Furthermore, if you would like to
+   build an image and verify that it does not include GPLv3 and similarly licensed
+   components, you must make the following changes in the image recipe
+   file before using the BitBake command to build the image:
 
-           1. Comment out the EXTRA_IMAGE_FEATURES line
-           2. Set INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0* AGPL-3.0*"
+       INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0*"
 
+   Alternatively, you can adjust ``local.conf`` file, repeating and adjusting the line
+   for all images where the license restriction must apply:
+
+       INCOMPATIBLE_LICENSE:pn-your-image-name = "GPL-3.0* LGPL-3.0*"
 
 From within the ``poky`` Git repository, you can use the following
 command to display the list of directories within the :term:`Source Directory`
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9aab6e0709..88b27492c7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3547,9 +3547,18 @@ system and gives an overview of their function and contents.
    :term:`INCOMPATIBLE_LICENSE`
       Specifies a space-separated list of license names (as they would
       appear in :term:`LICENSE`) that should be excluded
-      from the build. Recipes that provide no alternatives to listed
+      from the build (if set globally), or from an image (if set locally
+      in an image recipe).
+
+      When the variable is set globally, recipes that provide no alternatives to listed
       incompatible licenses are not built. Packages that are individually
       licensed with the specified incompatible licenses will be deleted.
+      Most of the time this does not allow a feasible build (because it becomes impossible
+      to satisfy build time dependencies), so the recommended way to
+      implement license restrictions is to set the variable in specific
+      image recipes where the restrictions must apply. That way there
+      are no build time restrictions, but the license check is still
+      performed when the image's filesystem is assembled from packages.
 
       There is some support for wildcards in this variable's value,
       however it is restricted to specific licenses. Currently only
-- 
2.34.1


