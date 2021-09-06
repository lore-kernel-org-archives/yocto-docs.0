Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.21280.1630929552144618102
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 04:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:49752 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mNDHK-0001sW-B5
	for docs@lists.yoctoproject.org; Mon, 06 Sep 2021 07:59:10 -0400
Date: Mon, 6 Sep 2021 07:59:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: couple minor tweaks to Chapter 1
Message-ID: <3a8255f0-a6cb-6c59-3533-a71ddac2f355@crashcourse.ca>
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


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  mostly make line-continued command consistent.

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index e9d995c61..5e5c105d6 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -4,7 +4,7 @@
 System Requirements
 *******************

-Welcome to the Yocto Project Reference Manual! This manual provides
+Welcome to the Yocto Project Reference Manual. This manual provides
 reference information for the current release of the Yocto Project, and
 is most effectively used after you have an understanding of the basics
 of the Yocto Project. The manual is neither meant to be read as a
@@ -277,7 +277,8 @@ installer and automatically installs the tools for you:
 1. Execute the ``install-buildtools`` script. Here is an example::

       $ cd poky
-      $ scripts/install-buildtools --without-extended-buildtools \
+      $ scripts/install-buildtools \
+        --without-extended-buildtools \
         --base-url &YOCTO_DL_URL;/releases/yocto \
         --release yocto-&DISTRO; \
         --installer-version &DISTRO;

-- 

rday
