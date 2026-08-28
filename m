Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFD1C61DD6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 09:50:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2843.1787910596947932927
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 02:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xWRVFu2X;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 111BC4E413FD
	for <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:49:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA1E160537
	for <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:49:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 455BF11C78144;
	Fri, 28 Aug 2026 11:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787910590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o0SKBxCpZdJUjta7N5B6AbKLe/K/osXxqigGXhKHrSs=;
	b=xWRVFu2XoZAspqrmciUP1yhxDJNpvyLgN8jR8BMVRz9gsQdvke5CwoBvfGa093XpFatwsT
	+GkSw4NRPr2pN+WLbLRR07hM9rTfTAsDVWG/aw7JA99E80D5Vuy3sh8EyCqThlun1mzzUz
	23xXk/pFgNXCoU8p2SnIAfmKT8hbfFD443h1c3dstXpeMASqtKpypQKdGWK6hgA2YVrssW
	lFynOsqLRCiBQqyYvauKbl755MMCw9wWXBRsnwo18Hi+XcuPZ8UjzxqdjGwUtirPHI6QCE
	gQ56dhFMmHM33UsvOtoua9fuJAGw+cfxQK2PF0Dva265oemkgAqXin9N9K4SSQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Aug 2026 11:49:34 +0200
Subject: [PATCH 1/3] conf.py: move and sort imports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-cleanup-conf-py-v1-1-c8925e5fe1ac@bootlin.com>
References: <20260828-cleanup-conf-py-v1-0-c8925e5fe1ac@bootlin.com>
In-Reply-To: <20260828-cleanup-conf-py-v1-0-c8925e5fe1ac@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HwOE/XWZqQlC5TCmjE353DqUFXAnyR2VoZ6Fz3wjBYw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqkVm45L2/ZKPp5h4EsFhtncm+UsWNVovM20DBy
 SrP5Oh77EiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCapFZuAAKCRDRgEFAKaOo
 NrzwD/wOhBEkw3X3cs3SUb2fbpgmOiPf1zAjIHZwH2/CwqQE0zjO7p7qu8TgC/lRkdMBOQAJiD5
 QI34IU6brk/vPVQ3ZZLtGjPVg3lHk4JPydp/gZS7Sl4f5xy1ox+pJpT2+JSPxhaeNUo96yuJB09
 lRUpvk4iQZeMfEKS8nNIvM79hXA/riYNxbrpxxqjDtoYXK3k9Hp3TSfKUBca0rqAhfNGtyW8gk4
 sLwsvKfJLftB61QO1OYgeMtKhk5MCpAZ6UewN0i6do+Ilq0lki+oWPWxBA16JNHRRt69TCtxQPj
 mTWghmJpjl9/nw4Jo+oM6dOJ4esC9hTLRzac4MRzOKsx4uV7/GKY6f08DbjVuERLOgJ482VC/f5
 3iZkVSzxiIF6hlrHDptVxkxpORekYvkknhYmdJTTLb+i4GhgzrliEd3RJL1idXrzwjgXtxRBNpp
 Q0dXaDW4B61Gsj7iUa8/NhxKNHWxHnoEJHhl8XPfk5y6YCRl5Ga/jN/BfICKko/BVn4W36AKMua
 fyuw0nKEFiuVSuqkrTS2B8ruKSm1bKplVLtEYasXtRoY49Hbp3nTBoycWNhlHIU303DP8w1H7bn
 1hiyApY/Yex885uuaam/JZ7+mP33hS8z/H3QmAVyhJXPaZBL2KbLKcQu4CRHSp2FL5BCifVaJ4n
 8gKIPZ71eADr7jw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:50:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10392

Move all imports at the top of the file and sort them.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 8b50656bf..671bf537c 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -11,11 +11,16 @@
 # If extensions (or modules to document with autodoc) are in another directory,
 # add these directories to sys.path here. If the directory is relative to the
 # documentation root, use os.path.abspath to make it absolute, like shown here.
-#
+
+import datetime
 import os
 import re
 import sys
-import datetime
+
+from sphinx.builders.epub3 import Epub3Builder
+from sphinx.search import SearchEnglish
+from sphinx.search import languages
+
 try:
     import yaml
 except ImportError:
@@ -211,9 +216,6 @@ latex_elements = {
     'preamble': '\\usepackage[UTF8]{ctex}\n\\setcounter{tocdepth}{2}',
 }
 
-
-from sphinx.search import SearchEnglish
-from sphinx.search import languages
 class DashFriendlySearchEnglish(SearchEnglish):
 
     # Accept words that can include 'inner' hyphens or dots
@@ -230,5 +232,4 @@ function splitQuery(query) {
 languages['en'] = DashFriendlySearchEnglish
 
 # Make the EPUB builder prefer PNG to SVG because of issues rendering Inkscape SVG
-from sphinx.builders.epub3 import Epub3Builder
 Epub3Builder.supported_image_types = ['image/png', 'image/gif', 'image/jpeg']

-- 
2.55.0


