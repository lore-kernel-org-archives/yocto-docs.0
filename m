Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B06C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 14:16:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.608.1646835356667554028
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 06:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fBfGgk9V;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2863B40007;
	Wed,  9 Mar 2022 14:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646835354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eOKYFWGhWgQZOCfhd2tIOnKIhsk+WG+PDQtQnyjxsjk=;
	b=fBfGgk9Vg0Mpds6/GZrte+770V8wmGBa3QOYPaOjLtlRCTQIBUlIFF3+3qPTDP4oJrMoMb
	JjSlhYu2yQHF+GHHjap3CwzeXrRgmZNvT1Rc4Yj6S9elKIHceJNJ/rzsrbFFiaRA5tRgYG
	qJNq5UrIuEEwWfrvvltROq3hXgVh+CXYlNcxy2LWgypWptZzqPA427Op+83DKV5GMChZfo
	o0VDRMi4fwjFa4olBOccmRIsfdWrCNNm4V9HHu5hk9B5NVmKhx99RdcY84FCK9bjgwQZWG
	yxq6uj8NNNk13eGX9FxFgKpXpW9UCx8YquyacfiXHgIpD/V17Bvb7GUQKhEWyA==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] docs: update examples to add branch info to git URIs
Date: Wed,  9 Mar 2022 15:15:51 +0100
Message-Id: <20220309141551.612610-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 14:16:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2555

Branch information is now mandatory for git:// and gitsm:// URIs

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 56 +++++++++++------------
 documentation/ref-manual/classes.rst      |  5 +-
 documentation/ref-manual/variables.rst    |  2 +-
 3 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 1caf953901..34f086bf1f 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -1402,13 +1402,11 @@ the revision with :term:`SRCPV`. Here
 is an example from the recipe
 ``meta/recipes-kernel/blktrace/blktrace_git.bb``::
 
-   SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
+   SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
-   PR = "r6"
-   PV = "1.0.5+git${SRCPV}"
+   PV = "1.3.0+git${SRCPV}"
 
-   SRC_URI = "git://git.kernel.dk/blktrace.git \
-              file://ldflags.patch"
+   SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master"
 
 If your :term:`SRC_URI` statement includes URLs pointing to individual files
 fetched from a remote server other than a version control system,
@@ -2372,41 +2370,39 @@ following example shows this::
 
    CFLAGS:prepend = "-I ${S}/include "
 
-In the following example, ``mtd-utils`` is a makefile-based package::
+In the following example, ``lz4`` is a makefile-based package::
 
-   SUMMARY = "Tools for managing memory technology devices"
-   SECTION = "base"
-   DEPENDS = "zlib lzo e2fsprogs util-linux"
-   HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-   LICENSE = "GPL-2.0-or-later"
-   LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-       file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
+   SUMMARY = "Extremely Fast Compression algorithm"
+   DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
+   HOMEPAGE = "https://github.com/lz4/lz4"
 
-   # Use the latest version at 26 Oct, 2013
-   SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
-   SRC_URI = "git://git.infradead.org/mtd-utils.git \
-       file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-       "
+   LICENSE = "BSD-2-Clause | GPL-2.0-only"
+   LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
+                       file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                       file://LICENSE;md5=d57c0d21cb917fb4e0af2454aa48b956 \
+                       "
 
-   PV = "1.5.1+git${SRCPV}"
+   PE = "1"
 
-   S = "${WORKDIR}/git"
+   SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
 
-   EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+   SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
+              file://CVE-2021-3520.patch \
+              "
+   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-   do_install () {
-       oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
-   }
+   S = "${WORKDIR}/git"
 
-   PACKAGES =+ "mtd-utils-jffs2 mtd-utils-ubifs mtd-utils-misc"
+   # Fixed in r118, which is larger than the current version.
+   CVE_CHECK_IGNORE += "CVE-2014-4715"
 
-   FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
-   FILES:mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
-   FILES:mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
+   EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
 
-   PARALLEL_MAKE = ""
+   do_install() {
+           oe_runmake install
+   }
 
-   BBCLASSEXTEND = "native"
+   BBCLASSEXTEND = "native nativesdk"
 
 Splitting an Application into Multiple Packages
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index cba9793332..ffb2176e43 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -170,8 +170,7 @@ example use for this class.
    are extracted into the subdirectory expected by the default value of
    :term:`S`::
 
-           SRC_URI = "git://example.com/downloads/somepackage.rpm;subpath=${BP}"
-
+      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=master;subpath=${BP}"
 
    See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`" section in the BitBake User Manual for
    more information on supported BitBake Fetchers.
@@ -477,7 +476,7 @@ recipe that fetches from an alternative URI (e.g. Git) instead of a
 tarball. Following is an example::
 
    BBCLASSEXTEND = "devupstream:target"
-   SRC_URI:class-devupstream = "git://git.example.com/example"
+   SRC_URI:class-devupstream = "git://git.example.com/example;branch=master"
    SRCREV:class-devupstream = "abcd1234"
 
 Adding the above statements to your recipe creates a variant that has
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 005456f0c4..efc3fcf8d4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6455,7 +6455,7 @@ system and gives an overview of their function and contents.
       from the default value of :term:`S`, you must set it specifically so the
       source can be located::
 
-         SRC_URI = "git://path/to/repo.git"
+         SRC_URI = "git://path/to/repo.git;branch=master"
          S = "${WORKDIR}/git"
 
    :term:`SANITY_REQUIRED_UTILITIES`
-- 
2.25.1


