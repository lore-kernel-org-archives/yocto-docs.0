Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7908AC7115C
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 09:39:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.23451.1750585131054628144
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 02:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Q3YqjUCn;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GYsJOkDMzTAU+bHhEo85LuL9g/UqTuGxgMXvuvFlbLA=; b=Q3YqjUCnWLAnez5OquubOyu01h
	9LTX/V2jBpR0OwDaVTmhHUCvqthh6MWDQuIfpGV+PGq8gZ/C7YKVL2xZtanHdLmuXfB+oc5Yn5PoA
	FO9PnjvmbXYp+u7238gwQDUARQl7TcqzOCpJCTPKaIwKTRuvtpdWejEdsHs6CpeIV+06ETCfwtJP3
	IF5eO8Ovl+qRKg0nEovmhCzreSxVF2yoZosWZGvGoMYpatCm9tmqHgr2fzA8l5OBd9DB4VJ4XN7TF
	1iHYrzRYB0ukFnW2ukWBFVzWjQ17eg0PgF63rTzBvf6wFe/hSFOL+r8vC6CN7Oi8DJdMsWURo7OxQ
	h10+kUmQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:52230 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTHA0-00000006yKY-2Piy
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 05:38:49 -0400
Date: Sun, 22 Jun 2025 05:38:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: shorten bitbake.conf snippet related to static
 libs
Message-ID: <477dfe1c-8042-4038-f154-6b7459435283@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 09:39:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7136


Much of the reproduced bitbake.conf has nothing to do with showing how
the ${PN}-staticdev is defined, so delete most of it.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index 521dbb9a7..a8c38128e 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -37,40 +37,10 @@ library files.
    Some previously released versions of the Yocto Project defined the
    static library files through ``${PN}-dev``.

-Here is the part of the BitBake configuration file, where you can see
+Here is a small part of the BitBake configuration file, where you can see
 how the static library files are defined::

-   PACKAGE_BEFORE_PN ?= ""
    PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
-   PACKAGES_DYNAMIC = "^${PN}-locale-.*"
-   FILES = ""
-
-   FILES:${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
-               ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-               ${base_bindir}/* ${base_sbindir}/* \
-               ${base_libdir}/*${SOLIBS} \
-               ${base_prefix}/lib/udev ${prefix}/lib/udev \
-               ${base_libdir}/udev ${libdir}/udev \
-               ${datadir}/${BPN} ${libdir}/${BPN}/* \
-               ${datadir}/pixmaps ${datadir}/applications \
-               ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
-               ${libdir}/bonobo/servers"
-
-   FILES:${PN}-bin = "${bindir}/* ${sbindir}/*"
-
-   FILES:${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
-               ${datadir}/gnome/help"
-   SECTION:${PN}-doc = "doc"
-
-   FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
-   FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
-                   ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
-                   ${datadir}/aclocal ${base_libdir}/*.o \
-                   ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
-                   ${libdir}/cmake ${datadir}/cmake"
-   SECTION:${PN}-dev = "devel"
-   ALLOW_EMPTY:${PN}-dev = "1"
-   RDEPENDS:${PN}-dev = "${PN} (= ${EXTENDPKGV})"

    FILES:${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a ${libdir}/${BPN}/*.a"
    SECTION:${PN}-staticdev = "devel"

