Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.13379.1628102080792709401
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 11:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6201BFF804;
	Wed,  4 Aug 2021 18:34:39 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 6/6] test-manual: overrides syntax updates
Date: Wed,  4 Aug 2021 20:34:26 +0200
Message-Id: <20210804183426.22333-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
References: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated with openembedded-core/scripts/contrib/convert-overrides.py

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/understand-autobuilder.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index c158d9ce4d..b6809ce7bd 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -27,7 +27,7 @@ which looks like::
          "TEMPLATE" : "arch-qemu",
          "step1" : {
                "extravars" : [
-                     "IMAGE_FSTYPES_append = ' wic wic.bmap'"
+                     "IMAGE_FSTYPES:append = ' wic wic.bmap'"
                     ]
         }
    },
-- 
2.25.1

