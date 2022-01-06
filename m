Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC06EC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 18:52:26 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.13083.1641495145284388173
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 10:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2BDDD100006;
	Thu,  6 Jan 2022 18:52:22 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: update bitbake.conf sample for static libs
Date: Thu,  6 Jan 2022 19:52:20 +0100
Message-Id: <20220106185220.2925774-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jan 2022 18:52:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2351

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 9d0c8f33d4..8bd82223f2 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -4668,7 +4668,7 @@ Following is part of the BitBake configuration file, where you can see
 how the static library files are defined::
 
    PACKAGE_BEFORE_PN ?= ""
-   PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
+   PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
    PACKAGES_DYNAMIC = "^${PN}-locale-.*"
    FILES = ""
 
@@ -4676,7 +4676,8 @@ how the static library files are defined::
                ${sysconfdir} ${sharedstatedir} ${localstatedir} \
                ${base_bindir}/* ${base_sbindir}/* \
                ${base_libdir}/*${SOLIBS} \
-               ${base_prefix}/lib/udev/rules.d ${prefix}/lib/udev/rules.d \
+               ${base_prefix}/lib/udev ${prefix}/lib/udev \
+               ${base_libdir}/udev ${libdir}/udev \
                ${datadir}/${BPN} ${libdir}/${BPN}/* \
                ${datadir}/pixmaps ${datadir}/applications \
                ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
@@ -4692,7 +4693,8 @@ how the static library files are defined::
    FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
                    ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
                    ${datadir}/aclocal ${base_libdir}/*.o \
-                   ${libdir}/${BPN}/*.la ${base_libdir}/*.la"
+                   ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
+                   ${libdir}/cmake ${datadir}/cmake"
    SECTION:${PN}-dev = "devel"
    ALLOW_EMPTY:${PN}-dev = "1"
    RDEPENDS:${PN}-dev = "${PN} (= ${EXTENDPKGV})"
-- 
2.25.1


