Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.416.1630337845590341647
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 08:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id E8EAA100003;
	Mon, 30 Aug 2021 15:37:22 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [PATCH] dev-manual: correct note about virtual providers
Date: Mon, 30 Aug 2021 17:37:20 +0200
Message-Id: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #14530]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
 documentation/dev-manual/common-tasks.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index f3b5084436..dd015a761e 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2114,9 +2114,10 @@ The following lists specific examples of virtual providers:
 
 .. note::
 
-   Virtual providers only apply to build time dependencies specified with
-   :term:`PROVIDES` and :term:`DEPENDS`. They do not apply to runtime
-   dependencies specified with :term:`RPROVIDES` and :term:`RDEPENDS`.
+   Virtual providers can be applied not only to build time dependencies
+   specified with :term:`PROVIDES` and :term:`DEPENDS`, as show in the
+   example above, but also to runtime dependencies specified with
+   :term:`RPROVIDES` and :term:`RDEPENDS`.
 
 Properly Versioning Pre-Release Recipes
 ---------------------------------------
-- 
2.25.1

