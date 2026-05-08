Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27201CD37B1
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:45 +0000 (UTC)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1698.1778259581136457191
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=X4Ee2G6E;
 spf=pass (domain: 0leil.net, ip: 185.125.25.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMb3n27z9fv;
	Fri,  8 May 2026 18:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259579;
	bh=GUyrJENCAyq3F7bgmUoFtyvpkPiA1szJ4DJNYJRbHnk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X4Ee2G6EAD8aJ6LmW/6/G4EBksBda/11z9mPHJIMwyyZnET9rRcGuyd4wIUuYCULU
	 jKsPXd5Itq20B07sFUzRoadSkFQEYI8zHneGtg/Fj9rwnNzj/hc8gXXQe8X+r1Jo3J
	 uwMu1SjcH7lH1tkc8G8wlkg7FBKtbMY9SFvZ8Hei5909+wWkwagfKDV6KwivSWPSEy
	 x3IqCAo1J2mbiSzUff6Z07LhlXjmtebsugYen8vEV3YoIRoITHdgv9ml18u3YfXv07
	 J0x7wIFI6kTKatZtxbCORoRfI0FEhEUoCyvXXnUtdWuVBprRJPyKQe7zT300YXrCJG
	 LMbLtx1f/uuZw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMb1DTnznDj;
	Fri,  8 May 2026 18:59:39 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:31 +0200
Subject: [PATCH 07/11] ref-manual: classes: add missing "task" after
 create_recipe_sbom
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-7-8fb61b5358cc@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9413

From: Quentin Schulz <quentin.schulz@cherry.de>

create_recipe_sbom is a task and since we don't document it yet, it can
be quite confusing without explicitly saying it's a task (also the
wording is odd by prefixing the word with "the").

Specify create_recipe_sbom is a task.

Fixes: 51162cd20d7a ("ref-manual: document the sbom-cve-check class, fragment, and variables")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/classes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index e40032164..5c7605b86 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2725,7 +2725,7 @@ SPDX files are the input of this tool.
 
 This class can be inherited in any recipe. Compared to the
 :class:`ref-classes-sbom-cve-check` class, this class only uses the SBOM of the
-recipe (after the ``create_recipe_sbom`` is run) to determine which is the
+recipe (after the ``create_recipe_sbom`` task is run) to determine which is the
 underlying software and do the analysis, meaning that building the recipe itself
 isn't necessary.
 

-- 
2.54.0


