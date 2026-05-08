Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B62CD37B6
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:45 +0000 (UTC)
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1700.1778259582091291749
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=WnTGoVs1;
 spf=pass (domain: 0leil.net, ip: 185.125.25.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMc3RGFzF5M;
	Fri,  8 May 2026 18:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259580;
	bh=3Jd8SwTqpaDXAwep6+bN7340O8w2veQCUTDhpsAkzkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WnTGoVs14pOeRz0oMiwn9ATplo/ZbQT1fiofqONigZ6zQ0Yfxs7dep/nB1sthVC7K
	 XeKbB/R2v4YhHJkNvy9SntQKcZvehP7ZcDfCqoARYgpTnf1kSQIgH31y+KO8IQj5Ft
	 CcttAW38dKCh6ZgYbfPpcgvfmoq++v5XOyvv9/m+irpcCvtRVK+jZIF3eNHzFUFzY6
	 VPoylQ07y2L2bOY++sj3mt0oSukyrCoQJZ0NwPdTa9OPztMynPWs6x0c/5354+t8yz
	 t324PtUvXmTaIvcUlBilbDPGF8xDjCQovotNNu0i4HDubV9O4sf0bglFpgKXxuR98i
	 3icqh++f2SkFw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMc0tw7zl5q;
	Fri,  8 May 2026 18:59:40 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:34 +0200
Subject: [PATCH 10/11] ref-manual: variables: add hyphen to "space
 separated"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-10-8fb61b5358cc@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9415

From: Quentin Schulz <quentin.schulz@cherry.de>

So we're consistent with the rest of the docs.

Fixes: c7925d14afd2 ("ref-manual/variables.rst: document the SPDX_GIT_PURL_MAPPINGS variable")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 45123488d..ac515939d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9379,7 +9379,7 @@ system and gives an overview of their function and contents.
       See also :term:`SPDX_INCLUDE_SOURCES`.
 
    :term:`SPDX_GIT_PURL_MAPPINGS`
-      A space separated list of ``domain:purl_type`` mappings to configure PURL
+      A space-separated list of ``domain:purl_type`` mappings to configure PURL
       (Package URLs) generation for Git source downloads.
 
       For example, adding ``gitlab.example.com:pkg:gitlab`` to this variable

-- 
2.54.0


