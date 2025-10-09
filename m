Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B310DCCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 10:24:16 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
 by mx.groups.io with SMTP id smtpd.web10.8914.1760005454265619216
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 03:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cj5Zh39bWzfv9;
	Thu,  9 Oct 2025 12:24:12 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cj5Zh0hFRzqyB;
	Thu,  9 Oct 2025 12:24:12 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 09 Oct 2025 12:24:00 +0200
Subject: [PATCH v2 2/3] Makefile: allow to specify build directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-iid-file-v2-2-715d527457f0@cherry.de>
References: <20251009-iid-file-v2-0-715d527457f0@cherry.de>
In-Reply-To: <20251009-iid-file-v2-0-715d527457f0@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 10:24:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7679

From: Quentin Schulz <quentin.schulz@cherry.de>

This can be useful to compare the output of two runs or separate the
build directory of 2+ distro builds from tools/build-docs-container.

Note that make clean cannot remove BUILDDIR from previous runs if they
differ as it wouldn't be able to know what it was named in the past.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index bade78fe8..94d19e350 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -11,7 +11,7 @@ SOURCEDIR      = .
 VALEDOCS       ?= $(SOURCEDIR)
 SPHINXLINTDOCS ?= $(SOURCEDIR)
 IMAGEDIRS      = */svg
-BUILDDIR       = _build
+BUILDDIR       ?= _build
 DESTDIR        = final
 SVG2PNG        = rsvg-convert
 SVG2PDF        = rsvg-convert

-- 
2.51.0


