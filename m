Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1572.1601923084088226013
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPA id 201C8C000E;
	Mon,  5 Oct 2020 18:38:01 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2 7/8] docs: ref-manual: ref-classes: remove "prototype" note for spdx class
Date: Mon,  5 Oct 2020 20:37:27 +0200
Message-Id: <20201005183728.9832-7-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005183728.9832-1-foss@0leil.net>
References: <20201005183728.9832-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1.6 was a loooooong time ago.

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
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

