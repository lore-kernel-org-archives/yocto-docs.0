Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CF1C4453F
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 13:32:12 +0000 (UTC)
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11832.1769002322932049489
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 05:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dx4qP3z0mz34k;
	Wed, 21 Jan 2026 14:32:01 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dx4qP0mQszx77;
	Wed, 21 Jan 2026 14:32:01 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 21 Jan 2026 14:31:53 +0100
Subject: [PATCH v2 12/12] sdk-manual: appendix-obtain: fix default path for
 eSDK installer script
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-code-block-misc-20260114-v2-12-fdd4bb5c2e68@cherry.de>
References: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
In-Reply-To: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 13:32:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8624

From: Quentin Schulz <quentin.schulz@cherry.de>

The eSDK installer script installs in poky_sdk directory but under the
user's home directory so let's make that explicit.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/sdk-manual/appendix-obtain.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 34a3f5bbb..83eefecd6 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -376,5 +376,5 @@ script run by the installer and BitBake.
 
 In the layout above, italicized text is used to indicate replaceable
 portions of the file or directory name. For example, *install_dir* is the
-directory where the SDK is installed, which is ``poky_sdk`` by default,
-and *target* represents the target architecture (e.g. ``i586``).
+directory where the SDK is installed, which is by default ``poky_sdk`` in your
+home directory and *target* represents the target architecture (e.g. ``i586``).

-- 
2.52.0


