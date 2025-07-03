Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FEEC83030
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 10:23:25 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.19201.1751538196428083235
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Jul 2025 03:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1uXH61-0006g1-V0; Thu, 03 Jul 2025 12:23:13 +0200
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1uXH61-006aPJ-2T;
	Thu, 03 Jul 2025 12:23:13 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1uXH61-00EyA5-2F;
	Thu, 03 Jul 2025 12:23:13 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de
Subject: [PATCH] conf.py: improve SearchEnglish to handle terms with dots
Date: Thu,  3 Jul 2025 12:23:01 +0200
Message-Id: <20250703102301.3566750-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Jul 2025 10:23:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7260

While search queries already handled words with hyphens correctly, they
did not do so for words with dots.

To fix this, we

- enhance the word tokenizer to treat both dots ('.') and hyphens ('-')
  as valid characters within words.
  (For robustness, explicitly exclude dots/hyphens at the start or end
  of a word from indexing.)
- adjust query processing to avoid splitting on dots in search input

This allows search queries to correctly match terms such as
'local.conf', 'site.conf', and similar ones now.

Fixes: [YOCTO #14534]

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 documentation/conf.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 1eca8756a..c07b6c419 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -179,13 +179,13 @@ from sphinx.search import SearchEnglish
 from sphinx.search import languages
 class DashFriendlySearchEnglish(SearchEnglish):
 
-    # Accept words that can include hyphens
-    _word_re = re.compile(r'[\w\-]+')
+    # Accept words that can include 'inner' hyphens or dots
+    _word_re = re.compile(r'[\w]+(?:[\.\-][\w]+)*')
 
     js_splitter_code = r"""
 function splitQuery(query) {
     return query
-        .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}-]+/gu)
+        .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}\-\.]+/gu)
         .filter(term => term.length > 0);
 }
 """
-- 
2.39.5


