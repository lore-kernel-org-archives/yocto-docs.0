Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8A0C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 14:33:41 +0000 (UTC)
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
 by mx.groups.io with SMTP id smtpd.web10.11561.1737642814765797813
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 06:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yf3Mw71V2zRDT;
	Thu, 23 Jan 2025 15:33:32 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yf3Mw4mWyzlrm;
	Thu, 23 Jan 2025 15:33:32 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 23 Jan 2025 15:33:24 +0100
Subject: [PATCH] ref-manual: variables: fix spurious parenthesis
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-spurious-parenthesis-v1-1-8bfe09dbe895@cherry.de>
X-B4-Tracking: v=1; b=H4sIADNTkmcC/x3MOwqAMBBF0a3I1AaS+EHciliIeeo0McyoCOLeD
 ZanuPchhTCU+uIhwcXKe8xwZUHzNsUVhkM2eesb63xlNJ3C+6kmTYJ4bFBWE9oFtqpt6OAop0m
 w8P1vh/F9P5gky9lmAAAA
X-Change-ID: 20250123-spurious-parenthesis-d6fe0340d8e1
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jan 2025 14:33:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6160

From: Quentin Schulz <quentin.schulz@cherry.de>

There's no opening parenthesis, so let's remove the spurious closing
parenthesis.

Fixes: ea638e85316d ("ref-manual/variables: document the KERNEL_CONSOLE variable")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 702a6caf8723b04a12092f88f70d93c255bbbc10..e4256344f404e12cb748c280f16ecdf48570d1bb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4602,7 +4602,7 @@ system and gives an overview of their function and contents.
 
      The default value of this variable is extracted from the first console
      device and setting in :term:`SERIAL_CONSOLES`. If nothing is found in
-     :term:`SERIAL_CONSOLES`, the default value is set to ``ttyS0,115200``).
+     :term:`SERIAL_CONSOLES`, the default value is set to ``ttyS0,115200``.
 
      For more information, see the `Kernel command-line documentation
      <https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html>`__.

---
base-commit: 8bd2bc3c00ca80f4c000a2a8d618a9f8ea3aa54b
change-id: 20250123-spurious-parenthesis-d6fe0340d8e1

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


