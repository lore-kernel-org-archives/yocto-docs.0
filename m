Return-Path: <niko.mauno@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4219C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 05:59:18 +0000 (UTC)
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5682.1785218355324919258
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 22:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=neutral (domain: iki.fi, ip: 185.226.149.38, mailfrom: niko.mauno@iki.fi)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <niko.mauno@iki.fi>)
	id 1woaqJ-003V5t-KM; Tue, 28 Jul 2026 07:59:07 +0200
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <niko.mauno@iki.fi>)
	id 1woaqI-0007qO-A7; Tue, 28 Jul 2026 07:59:06 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1051538)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1woaqG-00GqyD-10;
	Tue, 28 Jul 2026 07:59:04 +0200
From: niko.mauno@iki.fi
To: docs@lists.yoctoproject.org
Cc: quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] identity-component: Replace unicode with regular ASCII
Date: Tue, 28 Jul 2026 08:53:51 +0300
Message-ID: <20260728055856.22909-1-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 05:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10151

From: Niko Mauno <niko.mauno@vaisala.com>

Replace occurrences of unicode characters in the text with regular
ASCII.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/contributor-guide/identify-component.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/contributor-guide/identify-component.rst b/documentation/contributor-guide/identify-component.rst
index 6cf8ed985..26308a0e9 100644
--- a/documentation/contributor-guide/identify-component.rst
+++ b/documentation/contributor-guide/identify-component.rst
@@ -18,5 +18,5 @@ maintainers.
 
 If the issue is in the core metadata layer (OpenEmbedded-Core) or in BitBake,
 issues can be reported in the :yocto_bugs:`Yocto Project Bugzilla <>`. The
-:yocto_lists:`yocto </g/yocto>` mailing list is a general “catch-all” location
-where questions can be sent if you can’t work out where something should go.
+:yocto_lists:`yocto </g/yocto>` mailing list is a general "catch-all" location
+where questions can be sent if you can't work out where something should go.
-- 
2.47.3


