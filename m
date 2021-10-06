Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBFAC433FE
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 12:22:49 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.11020.1633522968210453064
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 05:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7329C200006;
	Wed,  6 Oct 2021 12:22:46 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/4] conf.py: use PNG first in EPUB output
Date: Wed,  6 Oct 2021 14:22:36 +0200
Message-Id: <20211006122238.959343-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006122238.959343-1-michael.opdenacker@bootlin.com>
References: <16834414503E8A25.21857@lists.yoctoproject.org>
 <20211006122238.959343-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 12:22:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1927

SVG directly included in EPUB output has multiple issues,
in particular font size and alignment ones (tested on two
EPUB readers). Instead, using PNG, generated from SVG when available
as the primary format for images. GIF and JPEG are fine too.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/conf.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index 8e15fdc869..25ff290ae2 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -139,3 +139,7 @@ latex_elements = {
     'passoptionstopackages': '\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
     'preamble': '\setcounter{tocdepth}{2}',
 }
+
+# Make the EPUB builder prefer PNG to SVG because of issues rendering Inkscape SVG
+from sphinx.builders.epub3 import Epub3Builder
+Epub3Builder.supported_image_types = ['image/png', 'image/gif', 'image/jpeg']
-- 
2.25.1


