Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.5858.1630256910796094500
 for <docs@lists.yoctoproject.org>;
 Sun, 29 Aug 2021 10:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:42696 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKOIG-0003An-9M
	for docs@lists.yoctoproject.org; Sun, 29 Aug 2021 13:08:29 -0400
Date: Sun, 29 Aug 2021 13:08:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: update SYSROOT_DIRS_* variable entries
Message-ID: <bf17e3e4-41a2-5558-2375-0faad5eff80@crashcourse.ca>
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

Both SYSROOT_DIRS and SYSROOT_DIRS_BLACKLIST have more current
values.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d5ac1926b..dacc03659 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7503,6 +7503,7 @@ system and gives an overview of their function and contents.
              ${base_libdir} \
              ${nonarch_base_libdir} \
              ${datadir} \
+             /sysroot-only \
              "

    :term:`SYSROOT_DIRS_BLACKLIST`
@@ -7516,10 +7517,16 @@ system and gives an overview of their function and contents.
              ${mandir} \
              ${docdir} \
              ${infodir} \
-             ${datadir}/locale \
+             ${datadir}/X11/locale \
              ${datadir}/applications \
+             ${datadir}/bash-completion \
              ${datadir}/fonts \
+             ${datadir}/gtk-doc/html \
+             ${datadir}/installed-tests \
+             ${datadir}/locale \
              ${datadir}/pixmaps \
+             ${datadir}/terminfo \
+             ${libdir}/${BPN}/ptest \
              "

    :term:`SYSROOT_DIRS_NATIVE`

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
