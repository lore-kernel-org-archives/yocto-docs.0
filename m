Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.143.1623938741834216285
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 07:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1742260013;
	Thu, 17 Jun 2021 14:05:39 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] sdk-manual: add missing quoting around "devtool upgrade"
Date: Thu, 17 Jun 2021 16:05:37 +0200
Message-Id: <20210617140537.252995-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/sdk-manual/extensible.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 33032b42a7..5520a07184 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -603,7 +603,7 @@ counterparts.
 .. note::
 
    Several methods exist by which you can upgrade recipes -
-   devtool upgrade
+   ``devtool upgrade``
    happens to be one. You can read about all the methods by which you
    can upgrade recipes in the
    :ref:`dev-manual/common-tasks:upgrading recipes` section
-- 
2.25.1

