Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D81D0E6F9
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 14:53:20 +0000 (UTC)
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18721.1764082396430815428
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 06:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dG5KP2nS4ztyj;
	Tue, 25 Nov 2025 15:53:13 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dG5KN6JjPzrqx;
	Tue, 25 Nov 2025 15:53:12 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 25 Nov 2025 15:53:00 +0100
Subject: [PATCH 1/2] tools: ubuntu_docs: remove duplicate python3-saneyaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-quick-start-requirements-common-v1-1-2c872b2fd45f@cherry.de>
References: <20251125-quick-start-requirements-common-v1-0-2c872b2fd45f@cherry.de>
In-Reply-To: <20251125-quick-start-requirements-common-v1-0-2c872b2fd45f@cherry.de>
To: docs@lists.yoctoproject.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 14:53:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8119

From: Quentin Schulz <quentin.schulz@cherry.de>

The same package is listed twice, let's fix this oversight.

Fixes: 8d993022c2ae ("docs: use literalinclude for system requirements")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/tools/host_packages_scripts/ubuntu_docs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/tools/host_packages_scripts/ubuntu_docs.sh b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
index d2a1832e2..67bb81094 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_docs.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
@@ -1 +1 @@
-sudo apt install git librsvg2-bin locales make python3-saneyaml python3-saneyaml python3-sphinx-rtd-theme sphinx
+sudo apt install git librsvg2-bin locales make python3-saneyaml python3-sphinx-rtd-theme sphinx

-- 
2.52.0


