Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.804.1622140369027125142
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 11:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.193, mailfrom: foss@0leil.net)
Received: from fiqs.lan (84-115-233-129.cable.dynamic.surfer.at [84.115.233.129])
	(Authenticated sender: foss@0leil.net)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPA id 16BF7240004;
	Thu, 27 May 2021 18:32:46 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] documentation: Makefile: turn warnings into errors by default
Date: Thu, 27 May 2021 20:31:50 +0200
Message-Id: <20210527183150.79497-1-foss@0leil.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-W is for turning warnings into errors, --keep-going to make sure the
whole documentation is built and all warnings will be printed before
failing.

Since there's currently no warning, it's time to introduce it!

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index d40f390e2..996f01b7d 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -3,7 +3,7 @@
 
 # You can set these variables from the command line, and also
 # from the environment for the first two.
-SPHINXOPTS    ?= -j auto
+SPHINXOPTS    ?= -W --keep-going -j auto
 SPHINXBUILD   ?= sphinx-build
 SOURCEDIR     = .
 BUILDDIR      = _build
-- 
2.31.1

