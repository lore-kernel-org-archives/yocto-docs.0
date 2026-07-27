Return-Path: <niko.mauno@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E01C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:05 +0000 (UTC)
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35417.1785170156948026599
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 09:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=neutral (domain: iki.fi, ip: 185.226.149.38, mailfrom: niko.mauno@iki.fi)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <niko.mauno@iki.fi>)
	id 1woOJ0-001pHY-4Q; Mon, 27 Jul 2026 18:35:54 +0200
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <niko.mauno@iki.fi>)
	id 1woOIy-0000Cf-Da; Mon, 27 Jul 2026 18:35:53 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1051538)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1woOIf-00H0lC-KR;
	Mon, 27 Jul 2026 18:35:33 +0200
From: niko.mauno@iki.fi
To: docs@lists.yoctoproject.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 3/4] dev-manual: Fix missing whitespace around '=' operator
Date: Mon, 27 Jul 2026 19:35:28 +0300
Message-ID: <20260727163529.30595-3-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727163529.30595-1-niko.mauno@iki.fi>
References: <20260727163529.30595-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 16:36:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10146

From: Niko Mauno <niko.mauno@vaisala.com>

According to the Whinlatter (5.3) migration guide;

  A new warning is now printed when there are no whitespaces around an '=' assignment in recipes

Fix occurrence of example verbatim applying of which would generate
such warning.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/dev-manual/layers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index dc63478a3..d33eb136d 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -252,7 +252,7 @@ following list:
          KERNEL_CC:append:arc = " ${TOOLCHAIN_OPTIONS}"
          KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"
 
-         KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
+         KERNEL_FEATURES:append:qemuall = " features/debug/printk.scc"
 
    -  *Place Machine-Specific Files in Machine-Specific Locations:* When
       you have a base recipe, such as ``base-files.bb``, that contains a
-- 
2.47.3


