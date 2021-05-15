Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.3451.1621062780204973325
 for <docs@lists.yoctoproject.org>;
 Sat, 15 May 2021 00:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C29F7240003;
	Sat, 15 May 2021 07:12:58 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [RFC 2/3] conf.py: prefer PNG to SVG in EPUB output
Date: Sat, 15 May 2021 09:12:18 +0200
Message-Id: <20210515071219.307241-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SVG directly included in EPUB output has multiple issues,
in particular font size and alignment ones (tested on two
EPUB readers).

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/conf.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index 5a2e25f7b2..798a365c7f 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -136,3 +136,7 @@ latex_elements = {
     'passoptionstopackages': '\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
     'preamble': '\setcounter{tocdepth}{2}',
 }
+
+# Make the EPUB builder prefer PNG to SVG because of issues rendering Inkscape SVG
+from sphinx.builders.epub3 import Epub3Builder
+Epub3Builder.supported_image_types = ['image/png', 'image/svg+xml', 'image/gif', 'image/jpeg']
-- 
2.25.1

