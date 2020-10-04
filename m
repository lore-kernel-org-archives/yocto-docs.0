Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.7379.1601801887201833734
 for <docs@lists.yoctoproject.org>;
 Sun, 04 Oct 2020 01:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id 66172240008;
	Sun,  4 Oct 2020 08:58:05 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 6/8] docs: ref-manual: ref-classes: remove "prototype" note for spdx class
Date: Sun,  4 Oct 2020 10:57:26 +0200
Message-Id: <20201004085728.8015-6-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004085728.8015-1-foss@0leil.net>
References: <20201004085728.8015-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1.6 was a loooooong time ago.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/ref-classes.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 134564362..a0f48b152 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -2363,10 +2363,6 @@ The ``spdx`` class integrates real-time license scanning, generation of
 SPDX standard output, and verification of license information during the
 build.
 
-.. note::
-
-   This class is currently at the prototype stage in the 1.6 release.
-
 .. _ref-classes-sstate:
 
 ``sstate.bbclass``
-- 
2.26.2

