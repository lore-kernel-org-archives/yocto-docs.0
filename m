Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ECFC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 14:02:28 +0000 (UTC)
Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
 by mx.groups.io with SMTP id smtpd.web11.12496.1738764141054176127
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 06:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yp23v3M2Mz2M9;
	Wed,  5 Feb 2025 15:02:19 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yp23t51XPz4rN;
	Wed,  5 Feb 2025 15:02:18 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 05 Feb 2025 15:02:09 +0100
Subject: [PATCH v2] add basic b4 config file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
X-B4-Tracking: v=1; b=H4sIAGBvo2cC/23NTQrCMBCG4atI1kaSaUKqK+8hLvIztdm0JanBU
 np3pwWhostv4HlnZhlTxMwuh5klLDHHvqMBxwPzre0eyGOgzUCAEhoUd4rn5zD0aeRBo1Fn0NI
 5ywgMCZv42mK3O+025rFP09Yucr3+zRTJJRdeUM3XwWB99S2mNJ0CrlUiWkiofknllJU1hiY0O
 7J+LvD5RlSaLwpEwYCw4B14MHu6LMsbLuovZhIBAAA=
X-Change-ID: 20240524-b4-support-d5e749251bba
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Feb 2025 14:02:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6250

From: Quentin Schulz <quentin.schulz@cherry.de>

b4[1] is a very nice tool for mail-based contribution. A config[2] file
exists to set up a few defaults. We can use it to set the To recipients
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
Changes in v2:
- add mailing list to To recipients instead of Cc recipients to match
  our contribution instructions,
- Link to v1: https://lore.kernel.org/r/20250123-b4-support-v1-1-03b4a18edfdf@cherry.de
---
 .b4-config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000000000000000000000000000000000000..77b28554b1952158bd8ee94a9c9439a60f3e80d2
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,3 @@
+[b4]
+  send-series-to = docs@lists.yoctoproject.org
+  prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking

---
base-commit: 6b44257874858db3aa426d3e84a79c41cb4937a3
change-id: 20240524-b4-support-d5e749251bba

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


