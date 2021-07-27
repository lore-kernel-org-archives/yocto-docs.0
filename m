Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.1722.1627395139262539499
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 07:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 80A7D240017;
	Tue, 27 Jul 2021 14:12:17 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] documentation/README: improve BitBake manual referencing guidelines
Date: Tue, 27 Jul 2021 16:11:59 +0200
Message-Id: <20210727141200.128209-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/documentation/README b/documentation/README
index f9e803a28b..1d4d213076 100644
--- a/documentation/README
+++ b/documentation/README
@@ -328,11 +328,15 @@ The sphinx.ext.intersphinx extension is enabled by default
 so that we can cross reference content from other Sphinx based
 documentation projects, such as the BitBake manual.
 
-References to the bitbake manual can be done like this:
-
-  See the ":ref:`-D <bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax>`" option
-or
+References to the BitBake manual can be done:
+ - With a specific description instead of the section name:
+  :ref:`Azure Storage fetcher (az://) <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
+ - With the section name:
+  ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax` option
+ - With a BitBake variable name:
   :term:`bitbake:BB_NUMBER_PARSE_THREADS`
+ - Linking to the entire BitBake manual:
+  :doc:`BitBake User Manual <bitbake:index>`
 
 Submitting documentation changes
 ================================
-- 
2.25.1

