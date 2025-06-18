Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320B8C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 15:14:04 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.web11.1375.1750259640870354698
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 08:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMnMC4PlPz3Yp;
	Wed, 18 Jun 2025 17:13:59 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMnMC1rMRzw13;
	Wed, 18 Jun 2025 17:13:59 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 18 Jun 2025 17:13:36 +0200
Subject: [PATCH 2/2] document how to use :doc: directive
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-doc-abs-path-v1-2-9f62e0ac92d2@cherry.de>
References: <20250618-doc-abs-path-v1-0-9f62e0ac92d2@cherry.de>
In-Reply-To: <20250618-doc-abs-path-v1-0-9f62e0ac92d2@cherry.de>
To: docs@lists.yoctoproject.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 15:14:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7102

From: Quentin Schulz <quentin.schulz@cherry.de>

Let's specify that we are only expecting "absolute" paths in the docs
directive for local document referencing.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/README       | 10 ++++++++++
 documentation/standards.md | 11 ++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/documentation/README b/documentation/README
index 02037e0f7ecf5c7ea18688e8ffbcfbd60c859f1c..56eac7ca1953a3b001daaba18ac7f63305c94b68 100644
--- a/documentation/README
+++ b/documentation/README
@@ -314,6 +314,16 @@ See https://stackoverflow.com/questions/27420317/restructured-text-rst-http-link
 Anchor (<#link>) links are forbidden as they are not checked by Sphinx during
 the build and may be broken without knowing about it.
 
+It is also possible to refer to another document within yocto-docs with the
+:doc: directive (c.f.
+https://www.sphinx-doc.org/en/master/usage/referencing.html#role-doc), e.g.:
+
+  For more information, read :doc:`/bsp-guide/index`.
+
+Note that only "absolute" paths (starting with a '/') are allowed. The root
+directory of that path is documentation/, that is, :doc:`/bsp-guide/index`
+points at documentation/bsp-guide/index.rst.
+
 References
 ==========
 
diff --git a/documentation/standards.md b/documentation/standards.md
index 8300d813dccba87a4d235a43b2ea7a414042e9bc..801efe3457aa9c8e7175ab15c25abbf0789df8e0 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -126,7 +126,16 @@ that most themes only style these two admonitions.
 
 ## ReStructured Text Syntax standards
 
-This section has not been filled yet
+### doc directive
+
+The [doc directive](https://www.sphinx-doc.org/en/master/usage/referencing.html#role-doc)
+allows to refer to another document within yocto-docs, like:
+
+    For more information, read :doc:`/bsp-guide/index`.
+
+Note that only "absolute" paths (starting with a '/') are allowed. The root
+directory of that path is documentation/, that is, :doc:`/bsp-guide/index`
+points at documentation/bsp-guide/index.rst.
 
 ## Adding screenshots
 

-- 
2.49.0


