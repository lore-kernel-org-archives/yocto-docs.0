Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web11.35467.1602488632993331560
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 00:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: naokihayama@lineo.co.jp)
Received: from naokihayama-desktop (unknown [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 315558063D748;
	Mon, 12 Oct 2020 16:43:51 +0900 (JST)
Received: by naokihayama-desktop (Postfix, from userid 1000)
	id DA5F450040BA; Mon, 12 Oct 2020 16:43:50 +0900 (JST)
From: "Naoki Hayama" <naoki.hayama@lineo.co.jp>
To: docs@lists.yoctoproject.org
Cc: Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [yocto-docs][dunfell][PATCH] dev-manual: Fix typo overriden
Date: Mon, 12 Oct 2020 16:43:19 +0900
Message-Id: <20201012074319.10544-1-naoki.hayama@lineo.co.jp>
X-Mailer: git-send-email 2.17.1

s/overriden/overridden/

Signed-off-by: Naoki Hayama <naoki.hayama@lineo.co.jp>
---
 documentation/dev-manual/dev-manual-common-tasks.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index e9ce182a5..dbe49ee3c 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -12968,7 +12968,7 @@
                 In the output of <filename>bitbake -e</filename>, each
                 variable is preceded by a description of how the variable
                 got its value, including temporary values that were later
-                overriden.
+                overridden.
                 This description also includes variable flags (varflags) set on
                 the variable.
                 The output can be very helpful during debugging.
-- 
2.17.1

