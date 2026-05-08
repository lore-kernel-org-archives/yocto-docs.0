Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90208CD37B9
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:45 +0000 (UTC)
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1619.1778259579385653747
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=dSfbRB2d;
 spf=pass (domain: 0leil.net, ip: 83.166.143.171, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMY3gD9zDJm;
	Fri,  8 May 2026 18:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259577;
	bh=hR7p0kmY4fcaldilDHfr68yilTt5/7OcpM7T4Envprk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dSfbRB2d5aK3Ib0joqbEyb4OACtAjQwLEwkyTDE+BdYILbM/rMsklpM+3611YCBch
	 ewEQwJ///CPSijQBvr1iar5AH0E9HJTqOK1MRaLgNZNHEvlWLoMr07f1jWziTnsprn
	 760H7V8Q4KoqaqkdmwrOKJ771tNRUhD3FcuK7m7Th0Sk7ZxZTUi3OZG3Kr76iT7Q+Z
	 Ywh0qK7kKgUHOTgzu+Pgy7OjFerlEATB0ktWWRfOhil2HQMRiPac6gXt+nWw+OAw4X
	 20ZwhOwMvxAXUgs7ew82CfCF4EIK9bUU68EQXIfXTFNpk5YykxRAbnjWI34nTCv9zk
	 frlKTRGI+xeXw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMY1C53znHR;
	Fri,  8 May 2026 18:59:37 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:25 +0200
Subject: [PATCH 01/11] migration-guides: fix https:// prefix missing in
 anonymous reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-1-8fb61b5358cc@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9406

From: Quentin Schulz <quentin.schulz@cherry.de>

By failing to prefix the URL with https://, it makes the anonymous
reference a link relative to the "parent link". In other words, it
renders the link as
https://docs.yoctoproject.org/wrynose/migration-guides/dashboard.yoctoproject.org/releases.json
instead of https://dashboard.yoctoproject.org/releases.json.

Add https:// prefix to the URI so it's properly handled.

Fixes: 8a29e23d144e ("migration-guides: update 6.0 (Wrynose) release notes")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/migration-guides/release-notes-6.0.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index f93075d7a..aae7ee4e7 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -263,7 +263,7 @@ New Features / Enhancements in |yocto-ver|
 
    -  The documentation build now fetches the list of active and inactive
       version of the documentation from the remote `releases.json
-      <dashboard.yoctoproject.org/releases.json>`__ file. This also applies to
+      <https://dashboard.yoctoproject.org/releases.json>`__ file. This also applies to
       the :term:`BitBake` documentation.
 
 -  Go changes:

-- 
2.54.0


