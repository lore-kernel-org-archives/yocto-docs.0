Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.4302.1627405925320900653
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 10:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 888CD240008;
	Tue, 27 Jul 2021 17:12:03 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 1/3] documentation/README: improve BitBake manual referencing guidelines
Date: Tue, 27 Jul 2021 19:11:45 +0200
Message-Id: <20210727171147.132288-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727171147.132288-1-michael.opdenacker@bootlin.com>
References: <1695B21F5A0B37B5.3345@lists.yoctoproject.org>
 <20210727171147.132288-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing the ":ref:`-D <bitbake:..." syntax as it's not necessary
Adding more and simpler ways of making references to the BitBake
manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/documentation/README b/documentation/README
index f9e803a28b..fad19683c1 100644
--- a/documentation/README
+++ b/documentation/README
@@ -328,10 +328,19 @@ The sphinx.ext.intersphinx extension is enabled by default
 so that we can cross reference content from other Sphinx based
 documentation projects, such as the BitBake manual.
 
-References to the bitbake manual can be done like this:
+References to the BitBake manual can be done:
+ - With a specific description instead of the section name:
+  :ref:`Azure Storage fetcher (az://) <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
+ - With the section name:
+  ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax` option
+ - Linking to the entire BitBake manual:
+  :doc:`BitBake User Manual <bitbake:index>`
+
+Note that a reference to a variable (:term:`VARIABLE`) automatically points to
+the BitBake manual if the variable is not described in the Reference Manual's Variable Glossary.
+However, if you need to bypass this, you can explicitely refer to a description in the
+BitBake manual as follows:
 
-  See the ":ref:`-D <bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax>`" option
-or
   :term:`bitbake:BB_NUMBER_PARSE_THREADS`
 
 Submitting documentation changes
-- 
2.25.1

