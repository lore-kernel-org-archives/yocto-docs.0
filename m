Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCFBC05023
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:20:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.3517.1713118828285892629
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 11:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N/OVg+fo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1515940003;
	Sun, 14 Apr 2024 18:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713118826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3qCbVJLGseXGg0Tt+zum8zDmEVjwBkUi+6+mM9x6lU=;
	b=N/OVg+foEqwyzrbr4mDAfqXExS5UjGhWbI66EzANHg+mfXQ19cOqYyo+ntx5q8gqmKCUoU
	PbjMI5ny37yS84X9Q2x2RIqqfBGDMdA1OHMLVeG2UmOPflxLwScGvRStbXipl5fpsJiPWA
	mtgBMUpJWZdnhlWpwvO9sFKfAx0+H7VlyyeM/R0Fhh1z1UXd//Ps929hXgRaYex5YnUxBq
	zIAg+bNGt5Cf2F8yLS1567NrXn1twQwM4j7JOJnYXoDMWSay1liWYqUBwb60GtlzOTDxgI
	qW0/OliXryMk9PfUQV7mKyEmSKXwDi8uWn93bw3G15bxJri1o/vyuuZQBnu5ig==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [kirkstone][PATCH 2/9] docs: conf.py: properly escape backslashes for latex_elements
Date: Sun, 14 Apr 2024 20:20:04 +0200
Message-Id: <20240414182011.994356-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
References: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 18:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5126

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

There are some syntax warnings returned by Python:
"""
yocto-docs/documentation/conf.py:162: SyntaxWarning: invalid escape sequence '\P'
  'passoptionstopackages': '\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
yocto-docs/documentation/conf.py:163: SyntaxWarning: invalid escape sequence '\s'
  'preamble': '\setcounter{tocdepth}{2}',
"""

Backslashes must be doubled in Python string literals to avoid
interpretation as escape sequence, c.f.
https://www.sphinx-doc.org/en/master/latex.html#module-latex.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/conf.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 5ff5ec8655..83cf829e6a 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -159,8 +159,8 @@ html_last_updated_fmt = '%b %d, %Y'
 html_secnumber_suffix = " "
 
 latex_elements = {
-    'passoptionstopackages': '\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
-    'preamble': '\setcounter{tocdepth}{2}',
+    'passoptionstopackages': '\\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
+    'preamble': '\\setcounter{tocdepth}{2}',
 }
 
 # Make the EPUB builder prefer PNG to SVG because of issues rendering Inkscape SVG
-- 
2.34.1


