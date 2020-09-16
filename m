Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3899.1600300770274155798
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id F3DDB60002;
	Wed, 16 Sep 2020 23:59:27 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 01/16] sphinx: brief-yoctoprojectqs: remove redundant welcome
Date: Thu, 17 Sep 2020 01:58:51 +0200
Message-Id: <20200916235906.243174-1-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index 456fab870..9fe4b0c51 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -7,7 +7,7 @@ Yocto Project Quick Build
 Welcome!
 ========
 
-Welcome! This short document steps you through the process for a typical
+This short document steps you through the process for a typical
 image build using the Yocto Project. The document also introduces how to
 configure a build for specific hardware. You will use Yocto Project to
 build a reference embedded OS called Poky.
-- 
2.26.2

