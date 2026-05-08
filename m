Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF58CD37B8
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:45 +0000 (UTC)
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1622.1778259580449028362
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=huT6/7JC;
 spf=pass (domain: 0leil.net, ip: 45.157.188.13, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMb1TFkzD1Z;
	Fri,  8 May 2026 18:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259579;
	bh=E6e2hptid1cLakFFohpSsiBm0tCbEGdInUli6fWyGXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=huT6/7JCI+l80kIonkSNfMCpvmgaT/+4HRtY/STfJjNv40Jc3m01BWxDcXV2mUtUo
	 4aW4xZIinc7NtnC9qdfURGUK9lj6gBaSOtIvRhRKNJn/2hsw1+SUcPxzZSqnHM0IsC
	 YsJG82cO4JqNb1/jGTw1OwmYAzhxYQtCkNK4t3mp4TTSlxRDJUq1CrM2hguu26m2bN
	 ZkSoboFf9UkEUJZbsKZjzUcmsvlZxbZEfRfzDGUZq7smj+n1fwA6XCc6J9+6DfWdRh
	 bY3gpdz2kr/TP6vkBBjt8J/CfUXLOxjZK/nG5L7CthrQd9Wiw3Iad+hRa4+8wWrKl1
	 D/dG9mro4X0MQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMZ5ttpzmbL;
	Fri,  8 May 2026 18:59:38 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:30 +0200
Subject: [PATCH 06/11] migration-guides: release-notes-6.0: fix typo in
 documentation changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-6-8fb61b5358cc@cherry.de>
References: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
In-Reply-To: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 16:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9411

From: Quentin Schulz <quentin.schulz@cherry.de>

The list contains multiple version*s* so fix the missing s suffix of the
plural form.

Fixes: 8a29e23d144e ("migration-guides: update 6.0 (Wrynose) release notes")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/migration-guides/release-notes-6.0.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index aae7ee4e7..38d489232 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -262,7 +262,7 @@ New Features / Enhancements in |yocto-ver|
 -  Documentation changes:
 
    -  The documentation build now fetches the list of active and inactive
-      version of the documentation from the remote `releases.json
+      versions of the documentation from the remote `releases.json
       <https://dashboard.yoctoproject.org/releases.json>`__ file. This also applies to
       the :term:`BitBake` documentation.
 

-- 
2.54.0


