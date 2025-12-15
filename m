Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F72D41D74
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 11:27:04 +0000 (UTC)
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46425.1765798015191851296
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 03:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dVHp51Kb7z2Cp;
	Mon, 15 Dec 2025 12:26:53 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dVHp446JSzvpL;
	Mon, 15 Dec 2025 12:26:52 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 15 Dec 2025 12:26:45 +0100
Subject: [PATCH] brief-yoctoprojectqs/index.rst: fix improper code-block
 indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-bitbake-setup-v1-1-abbbeb81ffbf@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0NT3aTMkqTE7FTd4tSS0gJdQ4ukFGOzxKTUNANzJaCegqLUtMwKsHn
 RsbW1AFYmc6pfAAAA
X-Change-ID: 20251215-bitbake-setup-18bd36abef07
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Dec 2025 11:27:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8275

From: Quentin Schulz <quentin.schulz@cherry.de>

This mistake resulted in an empty code-block followed by a quote section
with poky-master-poky-distro_poky-machine_qemux86-64 as text.

Let's fix this oversight by making the text part of the code-block.

Fixes: 0c1fbe2657d3 ("brief-yoctoprojectqs/index.rst: switch shell block to to console/text blocks")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index ea73a5431..84eb63c93 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -196,7 +196,7 @@ configuration above.
 
 For the selected options in the above example, this would be:
 
-   .. code-block:: text
+.. code-block:: text
 
    poky-master-poky-distro_poky-machine_qemux86-64
 

---
base-commit: c9b19880d281be41660306f1f7456b9735c21487
change-id: 20251215-bitbake-setup-18bd36abef07

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


