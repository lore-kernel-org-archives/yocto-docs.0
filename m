Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D91C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 14:32:21 +0000 (UTC)
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
 by mx.groups.io with SMTP id smtpd.web10.11538.1737642734711911635
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 06:32:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yf3LN5jVczP7m;
	Thu, 23 Jan 2025 15:32:12 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yf3LN2gtPzXhm;
	Thu, 23 Jan 2025 15:32:12 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 23 Jan 2025 15:31:59 +0100
Subject: [PATCH] add basic b4 config file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-b4-support-v1-1-03b4a18edfdf@cherry.de>
X-B4-Tracking: v=1; b=H4sIAN5SkmcC/23MQQrCMBCF4auUWRtJhoRUV95DXDTJaLNpy6QGS
 8ndTQuCgsv34P9WSMSREpybFZhyTHEc6lCHBnzfDQ8SMdQNKFFLg1o4LdJzmkaeRTBk9QmNcq6
 DGkxM9/jaseut7j6meeRlt7Pa3r9MVkIJ6WXVfBsstRffE/NyDAQbk/GTGqmU/UmxpmhRdugde
 rTfaSnlDdRVsijfAAAA
X-Change-ID: 20240524-b4-support-d5e749251bba
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jan 2025 14:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6159

From: Quentin Schulz <quentin.schulz@cherry.de>

b4[1] is a very nice tool for mail-based contribution. A config[2] file
exists to set up a few defaults. We can use it to set the Cc recipients
to always add, in our case the mailing list.

Because we do not have anything to check for now, disable needs-checking
so patches can be sent without running b4 prep --check.

Because we do not have any auto-to-cc support (and the implicit one
using scripts/get_maintainer.pl cannot work for us), also disable
needs-auto-to-cc so patches can be sent without running b4 prep
--auto-to-cc.

[1] https://pypi.org/project/b4/
[2] https://b4.docs.kernel.org/en/latest/config.html

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
I'm wondering if we couldn't add some per-patch check as well, checking
that the documentation builds for each for example. Could be added in a
later patch though. Any idea?
---
 .b4-config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000000000000000000000000000000000000..4f87f61b58519862da44fd9af6e6d0018edc7dc2
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,3 @@
+[b4]
+  send-series-cc = docs@lists.yoctoproject.org
+  prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking

---
base-commit: 6b44257874858db3aa426d3e84a79c41cb4937a3
change-id: 20240524-b4-support-d5e749251bba

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


