Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.9169.1585915267574527991
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Apr 2020 05:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:39230 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jKL0T-00FxoP-Nb
	for docs@lists.yoctoproject.org; Fri, 03 Apr 2020 08:01:06 -0400
Date: Fri, 3 Apr 2020 08:01:03 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: use "strace" for PV example, not cdrtools
Message-ID: <alpine.LFD.2.21.2004030757450.11595@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
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

Section 3.3.5, "Fetching Code", uses the cdrtools recipe as an example
for showing the use of PV, but that's a bad example since the current
cdrtools recipe file contains:

  SRC_URI = " \
  ${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${REALPV}.tar.bz2 \
  ...

  PV = "3.01a31+really3.01"
  REALPV = "3.01"

which is not exactly the point the dev manual is trying to make, so
replace with simpler strace recipe.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index dfbc6eeb3..52eb54012 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -1900,9 +1900,9 @@
             <para>
                 The <filename>SRC_URI</filename> variable in your recipe must
                 define each unique location for your source files.
-                It is good practice to not hard-code pathnames in an URL used
+                It is good practice to not hard-code version numbers in a URL used
                 in <filename>SRC_URI</filename>.
-                Rather than hard-code these paths, use
+                Rather than hard-code these values, use
                 <filename>${</filename><ulink url='&YOCTO_DOCS_REF_URL;#var-PV'><filename>PV</filename></ulink><filename>}</filename>,
                 which causes the fetch process to use the version specified in
                 the recipe filename.
@@ -1913,13 +1913,13 @@

             <para>
                 Here is a simple example from the
-                <filename>meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb</filename>
+                <filename>meta/recipes-devtools/strace/strace_5.5.bb</filename>
                 recipe where the source comes from a single tarball.
                 Notice the use of the
                 <ulink url='&YOCTO_DOCS_REF_URL;#var-PV'><filename>PV</filename></ulink>
                 variable:
                 <literallayout class='monospaced'>
-     SRC_URI = "ftp://ftp.berlios.de/pub/cdrecord/alpha/cdrtools-${PV}.tar.bz2"
+     SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
                 </literallayout>
             </para>


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
