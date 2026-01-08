Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA49D232C3
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 22:20:24 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18935.1767910819076427445
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 14:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=TqHAsmN5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202601082220156dc2c7c46900020713-ou893j@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202601082220156dc2c7c46900020713
        for <docs@lists.yoctoproject.org>;
        Thu, 08 Jan 2026 23:20:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hUmM/cJiYVbbw0HY9S523jy9IiTE0d/o5lsmBjhPBNA=;
 b=TqHAsmN5B2bI2U+fJj5QFDxHZ0dnFpVtjb+k4GHj0JWgRWlJQ6QkUx3c3L84PwM7i36U5z
 dnejoZh0qzbRsiOdYZDt9zdFsWw6jdKwSpPHkdAaPDJzgqGKGxvY1hPf6JxKJbQ4We2Eb7lX
 ekTjwk0PkEWowSx//m8KFh4NTH1NlEakRckxEXDGR3hITSgJ2w4Twv6sNtnjhKxZAN0XQEIj
 uBf8JYJxlKizwCJjkUKS3ryY62pK6UePNGNIeVZTFmrJ7Qm1vudknkO5WIgCUfmrF6knj1A8
 VYR6xVTx5Lu+oULThUWc6fwjXtqAVYA9MwpODMdYIL9IfBF8WO5aWoVg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] ref-manual/variables.rst: document new FIT image variables
Date: Thu,  8 Jan 2026 23:20:11 +0100
Message-ID: <20260108222011.2576150-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 22:20:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8433

From: Adrian Freihofer <adrian.freihofer@siemens.com>

- FIT_MKIMAGE_EXTRA_OPTS: new variable to pass extra mkimage options
- FIT_CONF_MAPPINGS for flexible DTB mappings

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ee776c110..734dfcbd4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3383,6 +3383,35 @@ system and gives an overview of their function and contents.
 
       This variable is used in the :ref:`ref-classes-kernel-fit-image` class.
 
+   :term:`FIT_CONF_MAPPINGS`
+      Allows specifying mappings to rename configuration nodes or add extra
+      configuration nodes for existing DTBs in FIT images. This provides
+      flexibility when a 1-1 mapping between DTB names and configuration
+      node names does not work.
+
+      The variable accepts a space-separated list of mapping commands:
+
+      - ``dtb-conf:DTB_NAME:NEW_NAME``
+        Renames the configuration node for a specific DTB.
+
+      - ``dtb-extra-conf:DTB_NAME:EXTRA_NAME``
+        Creates an additional configuration node for an existing DTB.
+
+      For example::
+
+         FIT_CONF_MAPPINGS = "\
+             dtb-extra-conf:am335x-bonegreen:bonegreen \
+             dtb-conf:am335x-boneblack:bbblack"
+
+      This generates three configuration nodes from two DTBs:
+
+      - ``am335x-bonegreen``: a standard configuration node for a DTB
+      - ``bonegreen``: an extra configuration node for the same DTB
+      - ``bbblack``: a renamed configuration node for the ``am335x-boneblack`` DTB
+
+      The :ref:`ref-classes-kernel-fit-image` class validates all mappings
+      and ensures they match existing DTBs.
+
    :term:`FIT_CONF_PREFIX`
       When using the :ref:`ref-classes-kernel-fit-image`, this is the prefix
       used for creating FIT configuration nodes. Its default value is "conf-".
@@ -3473,6 +3502,21 @@ system and gives an overview of their function and contents.
       The default value is set to "x509" by the
       :ref:`ref-classes-kernel-fit-image` class.
 
+   :term:`FIT_MKIMAGE_EXTRA_OPTS`
+      This variable allows passing extra options to ``mkimage`` during FIT
+      image generation, providing flexibility for platforms that require
+      additional ``mkimage`` arguments beyond the defaults.
+
+      For example::
+
+         FIT_MKIMAGE_EXTRA_OPTS = "-B 8 -E"
+
+      This results in the ``mkimage`` command being invoked as::
+
+         mkimage -B 8 -E -f fit-image.its fitImage
+
+      The :ref:`ref-classes-kernel-fit-image` class uses this variable.
+
    :term:`FIT_PAD_ALG`
       Specifies the padding algorithm used in creating the FIT Image.
       The default value is set to "pkcs-1.5" by the
-- 
2.52.0


