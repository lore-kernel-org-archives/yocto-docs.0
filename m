Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3259DC54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 15:07:39 +0000 (UTC)
Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
 by mx.groups.io with SMTP id smtpd.web10.18865.1711638453972846138
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 08:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4V56N44FxrzfpM;
	Thu, 28 Mar 2024 16:07:32 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4V56N41SdfzMppDv;
	Thu, 28 Mar 2024 16:07:32 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 28 Mar 2024 16:07:16 +0100
Subject: [PATCH 3/3] contributor-guide: submit-changes: fix typo in URL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-yocto-patches-v1-3-1124fa0bc532@theobroma-systems.com>
References: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
In-Reply-To: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Mar 2024 15:07:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5025

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

lore.kernelorg should be lore.kernel.org as the former doesn't exist.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index b5a6e4240..baba1b659 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -438,7 +438,7 @@ their e-mail clients will default to including your email address in the
 conversation anyway.
 
 Anyway, you'll also be able to access the new messages on mailing list archives,
-either through a web browser, or for the lists archived on https://lore.kernelorg,
+either through a web browser, or for the lists archived on https://lore.kernel.org,
 through an individual newsgroup feed or a git repository.
 
 Sending Patches via Email

-- 
2.44.0


