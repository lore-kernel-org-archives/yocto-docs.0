Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.9671.1585917201494264404
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Apr 2020 05:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:39598 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jKLVf-00G4qN-QK
	for docs@lists.yoctoproject.org; Fri, 03 Apr 2020 08:33:20 -0400
Date: Fri, 3 Apr 2020 08:33:17 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: use "git", not "apmd", to explain checksum names
Message-ID: <alpine.LFD.2.21.2004030829490.13758@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

The apmd recipe is no longer appropriate to demonstrate the use of
SRC_URI checksum names as it has only a single SRC_URI URL, so pick a
more illuminating recipe.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 52eb54012..60de78254 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -1978,16 +1978,17 @@
                 For these cases, you provide a name for each URL as part of
                 the <filename>SRC_URI</filename> and then reference that name
                 in the subsequent checksum statements.
-                Here is an example:
+                Here is an example combining lines from the files
+                <filename>git.inc</filename> and
+                <filename>git_2.24.1.bb</filename>:
                 <literallayout class='monospaced'>
-     SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
-                ${DEBIAN_MIRROR}/main/a/apmd/apmd_${PV}.diff.gz;name=patch"
-
-     SRC_URI[tarball.md5sum] = "b1e6309e8331e0f4e6efd311c2d97fa8"
-     SRC_URI[tarball.sha256sum] = "7f7d9f60b7766b852881d40b8ff91d8e39fccb0d1d913102a5c75a2dbb52332d"
+     SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
+                ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"

-     SRC_URI[patch.md5sum] = "57e1b689264ea80f78353519eece0c92"
-     SRC_URI[patch.sha256sum] = "7905ff96be93d725544d0040e425c42f9c05580db3c272f11cff75b9aa89d430"
+     SRC_URI[tarball.md5sum] = "166bde96adbbc11c8843d4f8f4f9811b"
+     SRC_URI[tarball.sha256sum] = "ad5334956301c86841eb1e5b1bb20884a6bad89a10a6762c958220c7cf64da02"
+     SRC_URI[manpages.md5sum] = "31c2272a8979022497ba3d4202df145d"
+     SRC_URI[manpages.sha256sum] = "9a7ae3a093bea39770eb96ca3e5b40bff7af0b9f6123f089d7821d0e5b8e1230"
                 </literallayout>
             </para>


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
