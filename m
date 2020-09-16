Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.3958.1600300773066679348
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 4EBA560002;
	Wed, 16 Sep 2020 23:59:31 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 06/16] sphinx: brief-yoctoprojectqs: add note on branch consistency between layers
Date: Thu, 17 Sep 2020 01:58:56 +0200
Message-Id: <20200916235906.243174-6-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index 40f9587f3..08d49d1e2 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -308,6 +308,12 @@ Follow these steps to add a hardware layer:
    host as ``meta-altera`` and contains all the metadata needed to
    support hardware from Altera, which is owned by Intel.
 
+   .. note::
+
+      It is recommended for layers to have a branch per Yocto Project release.
+      Please make sure to checkout the layer branch supporting the Yocto Project
+      release you're using.
+
 #. **Change the Configuration to Build for a Specific Machine:** The
    :term:`MACHINE` variable in the
    ``local.conf`` file specifies the machine for the build. For this
-- 
2.26.2

