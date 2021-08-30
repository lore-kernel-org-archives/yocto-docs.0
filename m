Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.14550.1630314048484287392
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 02:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37216 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKd9n-0000yB-7O
	for docs@lists.yoctoproject.org; Mon, 30 Aug 2021 05:00:47 -0400
Date: Mon, 30 Aug 2021 05:00:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: add line continuations for aesthetics
Message-ID: <9490f67c-af80-2517-737f-f05591c9a0bb@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


Not a fan of lengthy lines that require horizontal scrolling,
so add line continuations.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 4a5011ea7..6f0ee27c7 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2331,17 +2331,39 @@ In the following example, ``mtd-utils`` is a makefile-based package::

    S = "${WORKDIR}/git"

-   EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+   EXTRA_OEMAKE = " \
+       'CC=${CC}' \
+       'RANLIB=${RANLIB}' \
+       'AR=${AR}' \
+       'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' \
+       'BUILDDIR=${S}' \
+       "

    do_install () {
-       oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
+       oe_runmake install \
+           DESTDIR=${D} \
+           SBINDIR=${sbindir} \
+           MANDIR=${mandir} \
+           INCLUDEDIR=${includedir}
    }

    PACKAGES =+ "mtd-utils-jffs2 mtd-utils-ubifs mtd-utils-misc"

-   FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
+   FILES:mtd-utils-jffs2 = " \
+       ${sbindir}/mkfs.jffs2 \
+       ${sbindir}/jffs2dump \
+       ${sbindir}/jffs2reader \
+       ${sbindir}/sumtool \
+       "
    FILES:mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
-   FILES:mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
+   FILES:mtd-utils-misc = " \
+       ${sbindir}/nftl* \
+       ${sbindir}/ftl* \
+       ${sbindir}/rfd* \
+       ${sbindir}/doc* \
+       ${sbindir}/serve_image \
+       ${sbindir}/recv_image \
+       "

    PARALLEL_MAKE = ""


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
