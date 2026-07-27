Return-Path: <niko.mauno@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9F6C54F4C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:05 +0000 (UTC)
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35580.1785170156573439575
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 09:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=neutral (domain: iki.fi, ip: 185.226.149.37, mailfrom: niko.mauno@iki.fi)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <niko.mauno@iki.fi>)
	id 1woOJ0-000Egn-5b; Mon, 27 Jul 2026 18:35:54 +0200
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <niko.mauno@iki.fi>)
	id 1woOIz-0000Cm-Pp; Mon, 27 Jul 2026 18:35:53 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1051538)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1woOIf-00H0lC-6l;
	Mon, 27 Jul 2026 18:35:33 +0200
From: niko.mauno@iki.fi
To: docs@lists.yoctoproject.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/4] ref-manual: Fix occurrences of omitted space with :prepend
Date: Mon, 27 Jul 2026 19:35:26 +0300
Message-ID: <20260727163529.30595-1-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 16:36:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10143

From: Niko Mauno <niko.mauno@vaisala.com>

Add trailing space to value field in :prepend assignments, in
order to avoid providing examples which could lead the users to risk
inadvertent string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/ref-manual/faq.rst       | 6 ++++--
 documentation/ref-manual/variables.rst | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 65d5db5d2..2ffacaf94 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -126,7 +126,8 @@ attempt before any others by adding something like the following to the
        git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
        ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
        http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
-       https://.*/.* &YOCTO_DL_URL;/mirror/sources/"
+       https://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+   "
 
 These changes cause the build system to intercept Git, FTP, HTTP, and
 HTTPS requests and direct them to the ``http://`` sources mirror. You
@@ -165,7 +166,8 @@ file as long as the :term:`PREMIRRORS` server is current::
        git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
        ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
        http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
-       https://.*/.* &YOCTO_DL_URL;/mirror/sources/"
+       https://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+   "
    BB_FETCH_PREMIRRORONLY = "1"
 
 These changes would cause the build system to successfully fetch source
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 394797ca3..0066ede0f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7843,7 +7843,8 @@ system and gives an overview of their function and contents.
              git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
              ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
              http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
-             https://.*/.* &YOCTO_DL_URL;/mirror/sources/"
+             https://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+         "
 
       These changes cause the
       build system to intercept Git, FTP, HTTP, and HTTPS requests and
-- 
2.47.3


