Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9E5CD1284
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 15:07:39 +0000 (UTC)
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
 by mx.groups.io with SMTP id smtpd.web11.18895.1711638453172240388
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 08:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.174, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4V56N34s7jzxQL;
	Thu, 28 Mar 2024 16:07:31 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4V56N271dCzMppDj;
	Thu, 28 Mar 2024 16:07:30 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 28 Mar 2024 16:07:14 +0100
Subject: [PATCH 1/3] conf.py: properly escape backslashes for
 latex_elements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-yocto-patches-v1-1-1124fa0bc532@theobroma-systems.com>
References: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
In-Reply-To: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Mar 2024 15:07:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5023

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
---
 documentation/conf.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index a64685ec9..35c5c1453 100644
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
2.44.0


