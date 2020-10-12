Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web10.35473.1602488827116564863
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 00:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: naokihayama@lineo.co.jp)
Received: from naokihayama-desktop (unknown [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 0C2358063D748;
	Mon, 12 Oct 2020 16:47:06 +0900 (JST)
Received: by naokihayama-desktop (Postfix, from userid 1000)
	id E928150040BA; Mon, 12 Oct 2020 16:47:05 +0900 (JST)
From: "Naoki Hayama" <naoki.hayama@lineo.co.jp>
To: docs@lists.yoctoproject.org
Cc: Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [yocto-docs][dunfell][PATCH] ref-manual: Fix typo overriden
Date: Mon, 12 Oct 2020 16:47:00 +0900
Message-Id: <20201012074700.13134-1-naoki.hayama@lineo.co.jp>
X-Mailer: git-send-email 2.17.1

s/overriden/overridden/

Signed-off-by: Naoki Hayama <naoki.hayama@lineo.co.jp>
---
 documentation/ref-manual/ref-variables.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 364cd09eb..2135eaf9f 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -8802,7 +8802,7 @@
                     <literallayout class='monospaced'>
      MACHINEOVERRIDES =. "qemuall:"
                     </literallayout>
-                    This override allows variables to be overriden for all
+                    This override allows variables to be overridden for all
                     machines emulated in QEMU, like in the following example
                     from the <filename>connman-conf</filename> recipe:
                     <literallayout class='monospaced'>
-- 
2.17.1

