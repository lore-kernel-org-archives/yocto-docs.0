Return-Path: <niko.mauno@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C676C54F4D
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:05 +0000 (UTC)
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35418.1785170156948183111
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 09:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=neutral (domain: iki.fi, ip: 185.226.149.38, mailfrom: niko.mauno@iki.fi)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <niko.mauno@iki.fi>)
	id 1woOJ0-001pHa-7n; Mon, 27 Jul 2026 18:35:54 +0200
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <niko.mauno@iki.fi>)
	id 1woOIz-0008DZ-Vk; Mon, 27 Jul 2026 18:35:54 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1051538)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1woOIf-00H0lC-E7;
	Mon, 27 Jul 2026 18:35:33 +0200
From: niko.mauno@iki.fi
To: docs@lists.yoctoproject.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/4] ref-manual: Prune superfluous space with :append
Date: Mon, 27 Jul 2026 19:35:27 +0300
Message-ID: <20260727163529.30595-2-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727163529.30595-1-niko.mauno@iki.fi>
References: <20260727163529.30595-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 16:36:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10145

From: Niko Mauno <niko.mauno@vaisala.com>

Remove occurrences of superfluous space characters in value field of
:append assignments.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/ref-manual/qa-checks.rst | 2 +-
 documentation/ref-manual/variables.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 9654cf08e..09b0f628a 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -889,7 +889,7 @@ or "-fpic" to the compiler command-line options. For example, given
 software that reads :term:`CFLAGS` when you build it,
 you could add the following to your recipe::
 
-   CFLAGS:append = " -fPIC "
+   CFLAGS:append = " -fPIC"
 
 For more information on text relocations at runtime, see
 https://www.akkadia.org/drepper/textrelocs.html.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0066ede0f..b124e9c30 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5559,7 +5559,7 @@ system and gives an overview of their function and contents.
          KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
          KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
          KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc"
-         KERNEL_FEATURES:append:qemux86 = "  cfg/sound.scc cfg/paravirt_kvm.scc"
+         KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
          KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc"
 
    :term:`KERNEL_FIT_LINK_NAME`
-- 
2.47.3


