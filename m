Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F6CD0E6E7
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 13:49:39 +0000 (UTC)
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17408.1764078574628149766
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 05:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.169, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dG3vw3KSVz6l1;
	Tue, 25 Nov 2025 14:49:32 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dG3vv52gxzRR6;
	Tue, 25 Nov 2025 14:49:31 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 25 Nov 2025 14:49:18 +0100
Subject: [PATCH] brief-yoctoprojectqs: specify what "recent Ubuntu Linux
 distribution" is
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-quick-starting-guide-v1-1-45386c7b678e@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBvIKYm6SrQInWwIrDQjiO6et
 HyL/x+IHIQj9MUDgS+JsvkMVRZglsk7RrHZQBVppUjjkcSsGM8pnOIduiSWkeq2sVp1hiuCnO6
 BZ7n/7TC+7wdJKsbYZgAAAA==
X-Change-ID: 20251125-quick-starting-guide-2374d519ce02
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 13:49:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8116

From: Quentin Schulz <quentin.schulz@cherry.de>

The docs from any release can be read at any moment. The time-specific
"recent" doesn't actually help. The user could be reading the
instructions for kirkstone and try to build on Ubuntu 25.10 as that is
the most recent version. It'll likely fail though.

Instead, point at the list of supported Linux distributions so that they
know which are supported for the version of the docs they are currently
reading.

Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/brief-yoctoprojectqs/index.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 07bb4e1ca..7d94eebcb 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -15,7 +15,9 @@ build a reference embedded OS called Poky.
 .. note::
 
    -  The examples in this paper assume you are using a native Linux
-      system running a recent Ubuntu Linux distribution. If the machine
+      system running a
+      :ref:`supported version of Ubuntu Linux distribution<ref-manual/system-requirements:supported linux distributions>`.
+      If the machine
       you want to use Yocto Project on to build an image
       (:term:`Build Host`) is not
       a native Linux system, you can still perform these steps by using

---
base-commit: bcb6a7c8a401ceadf69a4c0c14dbc89f85ffdebe
change-id: 20251125-quick-starting-guide-2374d519ce02

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


