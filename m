Return-Path: <niko.mauno@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C35FC53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:05 +0000 (UTC)
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35581.1785170156888314031
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 09:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=neutral (domain: iki.fi, ip: 185.226.149.37, mailfrom: niko.mauno@iki.fi)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <niko.mauno@iki.fi>)
	id 1woOJ0-000Egq-FD; Mon, 27 Jul 2026 18:35:54 +0200
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <niko.mauno@iki.fi>)
	id 1woOJ0-0008De-5M; Mon, 27 Jul 2026 18:35:54 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1051538)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1woOIf-00H0lC-Qv;
	Mon, 27 Jul 2026 18:35:33 +0200
From: niko.mauno@iki.fi
To: docs@lists.yoctoproject.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 4/4] recipe-style-guide: Prune unicode from code example
Date: Mon, 27 Jul 2026 19:35:29 +0300
Message-ID: <20260727163529.30595-4-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727163529.30595-1-niko.mauno@iki.fi>
References: <20260727163529.30595-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 16:36:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10144

From: Niko Mauno <niko.mauno@vaisala.com>

Copy-pasting example segment containing unicode characters causes
breakage like:

  ERROR: ParseError at .../foobar.bb:158: unparsed line: 'RDEPENDS:${PN} = “foo”'

therefore replace the unicode characters in the example with regular
ASCII characters.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/contributor-guide/recipe-style-guide.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index f81ffb2ab..84c6bb14e 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -192,11 +192,11 @@ Custom tasks should be sorted similarly.
 
 Package specific variables are typically grouped together, e.g.::
 
-    RDEPENDS:${PN} = “foo”
-    RDEPENDS:${PN}-libs = “bar”
+    RDEPENDS:${PN} = "foo"
+    RDEPENDS:${PN}-libs = "bar"
 
-    RRECOMMENDS:${PN} = “one”
-    RRECOMMENDS:${PN}-libs = “two”
+    RRECOMMENDS:${PN} = "one"
+    RRECOMMENDS:${PN}-libs = "two"
 
 Recipe License Fields
 ---------------------
-- 
2.47.3


