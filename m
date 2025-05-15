Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E697AC3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:30:18 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
 by mx.groups.io with SMTP id smtpd.web11.10984.1747312208854534419
 for <docs@lists.yoctoproject.org>;
 Thu, 15 May 2025 05:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZyqKq0lXCzb5l;
	Thu, 15 May 2025 14:30:07 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZyqKp3MdCz6rB;
	Thu, 15 May 2025 14:30:06 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 15 May 2025 14:29:52 +0200
Subject: [PATCH] set_versions.py: mark Styhead as EoL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-styhead-eol-v1-1-3b8b9fc69f88@cherry.de>
X-B4-Tracking: v=1; b=H4sIAD/eJWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0NT3eKSyozUxBTd1PwcXQOTJMPEVAtjI0vDRCWgjoKi1LTMCrBp0bG
 1tQAB7YfMXQAAAA==
X-Change-ID: 20250515-styhead-eol-04b1ae83291a
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 May 2025 12:30:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6825

From: Quentin Schulz <quentin.schulz@cherry.de>

Styhead is now EoL, let's remove it from the active releases.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/set_versions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 7f5810a314dffa1e2e90cbc001f5b1af1b46ddaf..b8dd4b1b90725439969a5646b81274fd59b28222 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,7 +26,7 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["walnascar", "styhead", "scarthgap", "kirkstone"]
+activereleases = ["walnascar", "scarthgap", "kirkstone"]
 devbranch = "whinlatter"
 ltsseries = ["scarthgap", "kirkstone"]
 

---
base-commit: 0ada58bc51ed313584d743f40efee9e1445a5d8e
change-id: 20250515-styhead-eol-04b1ae83291a

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


