Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697CBE8B37E
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 22:58:12 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6949.1770159483995087149
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 14:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=YUiECn04;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260203225800d97978d203000207f1-8pucmu@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260203225800d97978d203000207f1
        for <docs@lists.yoctoproject.org>;
        Tue, 03 Feb 2026 23:58:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ge9OHt1X6K39o1VbzhO9ye7X+sTxpnof52yHhm9yD8w=;
 b=YUiECn040hWKc8BUDQ3WQREC9u4rRnL0ubG/PEetEFoT0YpGRYTpc7UwjFYWRJ15cPdIED
 b3sg3vVlQAPdCiiGFiZpvj+YFw+x8SG/6buVySRCkWmSncz/Y8EhlHDBvwLMVKaCojNi9iEH
 KmH2SQaSodDqUdvOZAHO8qLfSLhUWir1oBcXNKHNOlsW7kodWhu6KQJvoKWPOktI1RfATudL
 k5NsGLyj4+IydBqMNZdj3nE3WLMHYQ5kHtL+8e9xlh5a/AgyQ7Tjk0OfETSVv5IX12e90qxz
 6qhn3gofKZuLkqAUpqn+t0BX72bPYlITLOWJh2CeZtTqxfMcqG36S2Dg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2] ref-manual/variables.rst: document new FIT image variables
Date: Tue,  3 Feb 2026 23:57:40 +0100
Message-ID: <20260203225740.1605305-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Feb 2026 22:58:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8860

From: Adrian Freihofer <adrian.freihofer@siemens.com>

- FIT_MKIMAGE_EXTRA_OPTS: new variable to pass extra mkimage options
- FIT_CONF_MAPPINGS for flexible DTB mappings

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 57 ++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4d8a35473..08103f7e1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3389,6 +3389,47 @@ system and gives an overview of their function and contents.
 
       This variable is used in the :ref:`ref-classes-kernel-fit-image` class.
 
+   :term:`FIT_CONF_MAPPINGS`
+      When inheriting the :ref:`ref-classes-kernel-fit-image`, the
+      :term:`FIT_CONF_MAPPINGS` variable allows specifying mappings to rename
+      configuration nodes or add extra configuration nodes for existing device
+      tree blobs (DTBs) in FIT images. This provides flexibility when a 1 to 1
+      mapping between DTB names and configuration node names does not work,
+      such as when the kernel defines a kernel specific name but the bootloader
+      uses a different name. This might be the case when maintaining
+      compatibility with existing boot scripts or bootloader configurations.
+      But there are other use cases as well.
+
+      The variable accepts a space-separated list of mapping commands:
+
+      -  ``dtb-conf:DTB_NAME:NEW_NAME``
+         Renames the configuration node for a specific DTB. The ``DTB_NAME`` is
+         the name of the DTB without its ``.dtb`` suffix.
+
+      -  ``dtb-extra-conf:DTB_NAME:EXTRA_NAME``
+         Creates an additional configuration node for an existing DTB. This is
+         useful when you need to provide alternative names for the same hardware
+         configuration to maintain compatibility with existing boot scripts or
+         bootloader configurations or just need an alias configuration name for
+         some other reason.
+
+      For example::
+
+         FIT_CONF_MAPPINGS = "\
+             dtb-extra-conf:am335x-bonegreen:bonegreen \
+             dtb-conf:am335x-boneblack:bbblack"
+
+      This generates three configuration nodes from two DTBs:
+
+      -  ``am335x-bonegreen``: the original configuration node for the
+         ``am335x-bonegreen`` device tree
+      -  ``bonegreen``: an extra configuration node for the same
+         ``am335x-bonegreen`` DTB
+      -  ``bbblack``: a renamed configuration node for the ``am335x-boneblack`` DTB
+
+      The :ref:`ref-classes-kernel-fit-image` class validates all mappings
+      and ensures they match existing DTBs.
+
    :term:`FIT_CONF_PREFIX`
       When using the :ref:`ref-classes-kernel-fit-image`, this is the prefix
       used for creating FIT configuration nodes. Its default value is "conf-".
@@ -3479,6 +3520,22 @@ system and gives an overview of their function and contents.
       The default value is set to "x509" by the
       :ref:`ref-classes-kernel-fit-image` class.
 
+   :term:`FIT_MKIMAGE_EXTRA_OPTS`
+      When inheriting the :ref:`ref-classes-kernel-fit-image`, the
+      :term:`FIT_MKIMAGE_EXTRA_OPTS` variable allows passing extra options to
+      ``mkimage`` during FIT image generation, providing flexibility for platforms
+      that require additional ``mkimage`` arguments beyond the defaults.
+
+      For example::
+
+         FIT_MKIMAGE_EXTRA_OPTS = "-B 8 -E"
+
+      This results in the ``mkimage`` command being invoked as:
+
+      .. parsed-literal::
+
+         mkimage *-B 8 -E* -f fit-image.its fitImage
+
    :term:`FIT_PAD_ALG`
       Specifies the padding algorithm used in creating the FIT Image.
       The default value is set to "pkcs-1.5" by the
-- 
2.52.0


