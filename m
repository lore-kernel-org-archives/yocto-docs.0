Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.3963.1600300779203972915
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 7D89E60003;
	Wed, 16 Sep 2020 23:59:37 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 15/16] ref-manual: examples: hello-autotools: upgrade to 2.10
Date: Thu, 17 Sep 2020 01:59:05 +0200
Message-Id: <20200916235906.243174-15-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2.3 example was not working anymore so fixed it and upgraded all
at once.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../ref-manual/examples/hello-autotools/hello_2.10.bb    | 9 +++++++++
 .../ref-manual/examples/hello-autotools/hello_2.3.bb     | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)
 create mode 100644 documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
 delete mode 100644 documentation/ref-manual/examples/hello-autotools/hello_2.3.bb

diff --git a/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb b/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
new file mode 100644
index 000000000..aa2beb9a9
--- /dev/null
+++ b/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "GNU Helloworld application"
+SECTION = "examples"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/hello/hello-${PV}.tar.gz"
+SRC_URI[sha256sum] = "31e066137a962676e89f69d1b65382de95a7ef7d914b8cb956f41ea72e0f516b"
+
+inherit autotools-brokensep gettext
diff --git a/documentation/ref-manual/examples/hello-autotools/hello_2.3.bb b/documentation/ref-manual/examples/hello-autotools/hello_2.3.bb
deleted file mode 100644
index 5dfb0b30c..000000000
--- a/documentation/ref-manual/examples/hello-autotools/hello_2.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "GNU Helloworld application"
-SECTION = "examples"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
-
-SRC_URI = "${GNU_MIRROR}/hello/hello-${PV}.tar.bz2"
-
-inherit autotools
-- 
2.26.2

