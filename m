Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.9364.1627381573413279061
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 03:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5CFBA24000B;
	Tue, 27 Jul 2021 10:26:11 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: remove unused example recipe source files
Date: Tue, 27 Jul 2021 12:26:05 +0200
Message-Id: <20210727102605.123582-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These files are not used to build to documentation

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../examples/hello-autotools/hello_2.10.bb      |  9 ---------
 .../examples/hello-single/files/helloworld.c    |  8 --------
 .../ref-manual/examples/hello-single/hello.bb   | 17 -----------------
 .../ref-manual/examples/libxpm/libxpm_3.5.6.bb  | 14 --------------
 .../examples/mtd-makefile/mtd-utils_1.0.0.bb    | 15 ---------------
 5 files changed, 63 deletions(-)
 delete mode 100644 documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
 delete mode 100644 documentation/ref-manual/examples/hello-single/files/helloworld.c
 delete mode 100644 documentation/ref-manual/examples/hello-single/hello.bb
 delete mode 100644 documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
 delete mode 100644 documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb

diff --git a/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb b/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
deleted file mode 100644
index aa2beb9a9b..0000000000
--- a/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "GNU Helloworld application"
-SECTION = "examples"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/hello/hello-${PV}.tar.gz"
-SRC_URI[sha256sum] = "31e066137a962676e89f69d1b65382de95a7ef7d914b8cb956f41ea72e0f516b"
-
-inherit autotools-brokensep gettext
diff --git a/documentation/ref-manual/examples/hello-single/files/helloworld.c b/documentation/ref-manual/examples/hello-single/files/helloworld.c
deleted file mode 100644
index fc7169b7b8..0000000000
--- a/documentation/ref-manual/examples/hello-single/files/helloworld.c
+++ /dev/null
@@ -1,8 +0,0 @@
-#include <stdio.h>
-
-int main(void)
-{
-	printf("Hello world!\n");
-
-	return 0;
-}
diff --git a/documentation/ref-manual/examples/hello-single/hello.bb b/documentation/ref-manual/examples/hello-single/hello.bb
deleted file mode 100644
index 90d3aefd86..0000000000
--- a/documentation/ref-manual/examples/hello-single/hello.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Simple helloworld application"
-SECTION = "examples"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-SRC_URI = "file://helloworld.c"
-
-S = "${WORKDIR}"
-
-do_compile() {
-	${CC} ${LDFLAGS} helloworld.c -o helloworld
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 helloworld ${D}${bindir}
-}
diff --git a/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb b/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
deleted file mode 100644
index c0c8986405..0000000000
--- a/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require recipes-graphics/xorg-lib/xorg-lib-common.inc
-
-DESCRIPTION = "X11 Pixmap library"
-LICENSE = "X-BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
-DEPENDS += "libxext"
-PR = "r2"
-PE = "1"
-
-XORG_PN = "libXpm"
-
-PACKAGES =+ "sxpm cxpm"
-FILES_cxpm = "${bindir}/cxpm"
-FILES_sxpm = "${bindir}/sxpm"
diff --git a/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb b/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb
deleted file mode 100644
index 5d05a437a4..0000000000
--- a/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Tools for managing memory technology devices."
-SECTION = "base"
-DEPENDS = "zlib"
-HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
-
-SRC_URI = "ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-${PV}.tar.gz"
-
-CFLAGS_prepend = "-I ${S}/include "
-
-do_install() {
-	oe_runmake install DESTDIR=${D}
-}
-- 
2.25.1

