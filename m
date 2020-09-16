Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.3953.1600300770296753514
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 9C4C660004;
	Wed, 16 Sep 2020 23:59:28 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 02/16] sphinx: brief-yoctoprojectqs: fix ambiguous note for cyclone5 example
Date: Thu, 17 Sep 2020 01:58:52 +0200
Message-Id: <20200916235906.243174-2-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index 9fe4b0c51..bcba1336c 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -350,7 +350,7 @@ Project development environment and configured it to build for the
 .. note::
 
    The previous steps are for demonstration purposes only. If you were
-   to attempt to build an image for the "cyclone5" build, you should
+   to attempt to build an image for the "cyclone5" machine, you should
    read the Altera README.
 
 Creating Your Own General Layer
-- 
2.26.2

