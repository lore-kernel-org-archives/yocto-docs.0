Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609F5C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 09:45:41 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.16838.1747734331063669121
 for <docs@lists.yoctoproject.org>;
 Tue, 20 May 2025 02:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1uHJXN-00062V-8i; Tue, 20 May 2025 11:45:29 +0200
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1uHJXN-000ODb-0I;
	Tue, 20 May 2025 11:45:29 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1uHJXN-00BJ5s-05;
	Tue, 20 May 2025 11:45:29 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de
Subject: [PATCH v2] conf.py: tweak SearchEnglish to be hyphen-friendly
Date: Tue, 20 May 2025 11:45:14 +0200
Message-Id: <20250520094514.2672646-1-ejo@pengutronix.de>
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
 <docs@lists.yoctoproject.org>; Tue, 20 May 2025 09:45:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6847

This modifies the default indexer split() and js splitQuery()
methods to support searching for words with hyphens.

While this might not be an ideal, rock solid, and fully future-proof
solution, it allows at least to search for strings inlcuding hyphens,
such as 'bitbake-layers', 'send-error-report', or 'oe-core'.

Below is a bit more detailed explanation of the two modifications done:

1) The default split regex in the sphinx-doc SearchLanguage base class
   is:

   | _word_re = re.compile(r'\w+')

   which we simply extend to include hyphens '-'.

   This will result in a searchindex.js that contains words with hyphens,
   too.

2) The 'searchtool.js' code notes for its splitQuery() implementation:

   | /**
   |  * Default splitQuery function. Can be overridden in ``sphinx.search`` with a
   |  * custom function per language.
   |  *
   |  * The regular expression works by splitting the string on consecutive characters
   |  * that are not Unicode letters, numbers, underscores, or emoji characters.
   |  * This is the same as ``\W+`` in Python, preserving the surrogate pair area.
   |  */
   | if (typeof splitQuery === "undefined") {
   |   var splitQuery = (query) => query
   |       .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}]+/gu)
   |       .filter(term => term)  // remove remaining empty strings
   | }

   The hook for this is documented in the sphinx-docs 'SearchLanguage'
   base class.

   |    .. attribute:: js_splitter_code
   |
   |       Return splitter function of JavaScript version.  The function should be
   |       named as ``splitQuery``.  And it should take a string and return list of
   |       strings.
   |
   |       .. versionadded:: 3.0

   We use this to define a simplified splitQuery() function with a split
   argument that splits on empty spaces only.

We extend SearchEnglish (which extends SearchLanguage) here to retain
the stemmer code and stopwords for English.

[YOCTO #14534]

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---

Changes v1 -> v2

* extend SearchEnglish instead of SearchLanguage to retain stemmer code
  and stopword handing (rename class accordingly)
* drop "lang = 'en'"
* Escape '-' in _word_re to prevent future misinterpretation as range
  symbol
* drop useless split() method override
* Use extended original regex for splitQuery() instead of using a custom
  one

 documentation/conf.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index 2aceeb8e7..ad60d9113 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -13,6 +13,7 @@
 # documentation root, use os.path.abspath to make it absolute, like shown here.
 #
 import os
+import re
 import sys
 import datetime
 try:
@@ -173,6 +174,24 @@ latex_elements = {
     'preamble': '\\usepackage[UTF8]{ctex}\n\\setcounter{tocdepth}{2}',
 }
 
+
+from sphinx.search import SearchEnglish
+from sphinx.search import languages
+class DashFriendlySearchEnglish(SearchEnglish):
+
+    # Accept words that can include hyphens
+    _word_re = re.compile(r'[\w\-]+')
+
+    js_splitter_code = """
+function splitQuery(query) {
+    return query
+        .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}-]+/gu)
+        .filter(term => term.length > 0);
+}
+"""
+
+languages['en'] = DashFriendlySearchEnglish
+
 # Make the EPUB builder prefer PNG to SVG because of issues rendering Inkscape SVG
 from sphinx.builders.epub3 import Epub3Builder
 Epub3Builder.supported_image_types = ['image/png', 'image/gif', 'image/jpeg']
-- 
2.39.5


