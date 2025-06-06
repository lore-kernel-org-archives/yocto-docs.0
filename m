Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A137C5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:21:51 +0000 (UTC)
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
 by mx.groups.io with SMTP id smtpd.web11.34713.1749219708293504713
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 07:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bDNmV4DzQzy9Y;
	Fri,  6 Jun 2025 16:21:46 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bDNmV0Y45z6vn;
	Fri,  6 Jun 2025 16:21:45 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Jun 2025 16:21:33 +0200
Subject: [PATCH] docs: conf.py: silence SyntaxWarning on js_splitter_code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-conf-syntax-warning-v1-1-4ebc90ae7d69@cherry.de>
X-B4-Tracking: v=1; b=H4sIAGz5QmgC/x3MSQqAMAxA0atI1gZqpXW4irioGjWbKK04IL27x
 eVb/P9CIM8UoM1e8HRy4E0SijyDcXWyEPKUDFppo6yyOG4yY3jkcDdezgvLgrVpykabodZDBan
 cPc18/9euj/EDlvlbkWUAAAA=
X-Change-ID: 20250606-conf-syntax-warning-8593925b82b7
To: docs@lists.yoctoproject.org
Cc: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 14:21:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7021

From: Quentin Schulz <quentin.schulz@cherry.de>

The js_splitter_code string contains backslashes that Python tries to
use as escape sequence but doesn't manage to, hence the following
SyntaxWarning message:

documentation/conf.py:188: SyntaxWarning: invalid escape sequence '\p'
  .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}-]+/gu)

Considering that we want this to be sent verbatim to the JS, let's make
this a raw string instead.

Fixes: d4a98ee19e0c ("conf.py: tweak SearchEnglish to be hyphen-friendly")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index ad60d911394561f16dc28b3d41329f08e6c0999b..1eca8756abac72d311b39144f65910d28b4e3aec 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -182,7 +182,7 @@ class DashFriendlySearchEnglish(SearchEnglish):
     # Accept words that can include hyphens
     _word_re = re.compile(r'[\w\-]+')
 
-    js_splitter_code = """
+    js_splitter_code = r"""
 function splitQuery(query) {
     return query
         .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}-]+/gu)

---
base-commit: 406e8a8e30404c0538f5aa46f211540bae2b206b
change-id: 20250606-conf-syntax-warning-8593925b82b7

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


