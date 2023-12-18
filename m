Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8271AC4706C
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3220.1702935908119921849
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kIKYflTz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 970AC60005;
	Mon, 18 Dec 2023 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlveiCOQ2Muc/74FjhpRn2z3nDG1qKunqzeV54yfKAY=;
	b=kIKYflTzO+o6wQ+zntwIOlLVJal/meVvXuOv9oIMbh9bu8pNk0DQM53m3MUvmyUz5YVOJg
	eq4ZoAm5+0fFmg8yQoLf/DCjwxd/0EhbufgCyPXOG6SqQyko2DQmOKChns/0SVf5tDljrs
	ecvwQdjuBBdVRpHKjXO6HtM/tbTDQvetiWl+SGxXG+nBOKKwwZXc2eBM3bTQJa/v7IbH/G
	6mw/I+bQ3gTBOh6wAGp7qjFPWZvc6RJm3a/5TqHsRyic2u47o8koa/rDTp31x+VRSRKJEr
	FvT9lDCG6QXUfVIIx/OoVU5Ok9lE4UuNkxHzlcC5Ridr0MTKhNbNBZZ5bQHCHA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Aatir Manzur <aatrapps@gmail.com>
Subject: [kirkstone][PATCH 07/18] docs: add CONVERSION_CMD definition
Date: Mon, 18 Dec 2023 22:44:31 +0100
Message-Id: <20231218214442.147385-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4714

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Aatir Manzur <aatrapps@gmail.com>

Signed-off-by: Aatir Manzur <aatrapps@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-2.2.rst |  2 +-
 documentation/migration-guides/migration-2.4.rst |  2 +-
 documentation/migration-guides/migration-3.4.rst |  2 +-
 documentation/ref-manual/variables.rst           | 13 +++++++++++++
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 10aa2d0684..3803dea832 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -442,7 +442,7 @@ The following miscellaneous changes have occurred:
 -  :ref:`ref-classes-image`: Renamed COMPRESS(ION) to CONVERSION. This change
    means that ``COMPRESSIONTYPES``, ``COMPRESS_DEPENDS`` and
    ``COMPRESS_CMD`` are deprecated in favor of ``CONVERSIONTYPES``,
-   ``CONVERSION_DEPENDS`` and ``CONVERSION_CMD``. The ``COMPRESS*``
+   ``CONVERSION_DEPENDS`` and :term:`CONVERSION_CMD`. The ``COMPRESS*``
    variable names will still work in the 2.2 release but metadata that
    does not need to be backwards-compatible should be changed to use the
    new names as the ``COMPRESS*`` ones will be removed in a future
diff --git a/documentation/migration-guides/migration-2.4.rst b/documentation/migration-guides/migration-2.4.rst
index ef5f32e6ef..964ed92937 100644
--- a/documentation/migration-guides/migration-2.4.rst
+++ b/documentation/migration-guides/migration-2.4.rst
@@ -301,7 +301,7 @@ The following are additional changes:
    likely be removed in the next Yocto Project release.
 
 -  The ``vmdk``, ``vdi``, and ``qcow2`` image file types are now used in
-   conjunction with the "wic" image type through ``CONVERSION_CMD``.
+   conjunction with the "wic" image type through :term:`CONVERSION_CMD`.
    Consequently, the equivalent image types are now ``wic.vmdk``,
    ``wic.vdi``, and ``wic.qcow2``, respectively.
 
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index d57c955eb4..5fc2ef78fe 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -252,7 +252,7 @@ Miscellaneous
 
 - The previously deprecated ``COMPRESS_CMD`` and
   ``CVE_CHECK_CVE_WHITELIST`` variables have been removed. Use
-  ``CONVERSION_CMD`` and ``CVE_CHECK_WHITELIST`` (replaced by
+  :term:`CONVERSION_CMD` and ``CVE_CHECK_WHITELIST`` (replaced by
   :term:`CVE_CHECK_IGNORE` in version 3.5) respectively
   instead.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0a0b0ad37a..fe0b993bd8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1342,6 +1342,19 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`CONVERSION_CMD`
+      This variable is used for storing image conversion commands.
+      Image conversion can convert an image into different objects like:
+
+      -   Compressed version of the image
+
+      -   Checksums for the image
+
+      An example of :term:`CONVERSION_CMD` from :ref:`image-types
+      <ref-classes-image_types>` class is::
+
+         CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+
    :term:`COPY_LIC_DIRS`
       If set to "1" along with the
       :term:`COPY_LIC_MANIFEST` variable, the
-- 
2.34.1


