Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FCDC41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:52:21 +0000 (UTC)
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
 by mx.groups.io with SMTP id smtpd.web11.15617.1721310740893928380
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 06:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WPvPb2RQ3zJpf;
	Thu, 18 Jul 2024 15:52:19 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4WPvPZ74lJzxZm;
	Thu, 18 Jul 2024 15:52:18 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 18 Jul 2024 15:52:00 +0200
Subject: [PATCH 2/3] doc: releases: add nanbield to the outdated manuals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-yocto-releases-v1-2-204f3e3dade4@cherry.de>
References: <20240718-yocto-releases-v1-0-204f3e3dade4@cherry.de>
In-Reply-To: <20240718-yocto-releases-v1-0-204f3e3dade4@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, 
 bitbake-devel@lists.openembedded.org, foss+yocto@0leil.net, 
 docs@lists.yoctoproject.org
X-Mailer: b4 0.14.0
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:52:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5323

From: Quentin Schulz <quentin.schulz@cherry.de>

We missed on adding nanbield to the release manuals. It's now EOL so
let's add it directly to the oudated release manuals section.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 doc/releases.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/doc/releases.rst b/doc/releases.rst
index 1e2563de0..a595a83b6 100644
--- a/doc/releases.rst
+++ b/doc/releases.rst
@@ -20,6 +20,12 @@ Release Series 3.1 (dunfell)
 BitBake Outdated Release Manuals
 ================================
 
+*******************************
+Release Series 4.3 (nanbield)
+*******************************
+
+- :yocto_docs:`BitBake 2.6 User Manual </bitbake/2.6/>`
+
 *******************************
 Release Series 4.2 (mickledore)
 *******************************

-- 
2.45.2


