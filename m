Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.14886.1585427704801203245
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Mar 2020 13:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:52124 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jIIAZ-009EYY-8U
	for docs@lists.yoctoproject.org; Sat, 28 Mar 2020 16:35:03 -0400
Date: Sat, 28 Mar 2020 16:35:00 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: use actual machine override demonstration
Message-ID: <alpine.LFD.2.21.2003281633070.6139@localhost.localdomain>
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

Given that the section in question is describing how to configure
dependencies based on the machine type, it seems inappropriate to use
an example that depends on the choice of C library, so grab a snippet
from linux-yocto.inc to really drive the point home.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index ac761df2a..32da79a89 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -319,12 +319,26 @@
      DEPENDS_append_one = " foo"
      DEPENDS_prepend_one = "foo "
                                 </literallayout>
-                                As an actual example, here's a line from the recipe
-                                for gnutls, which adds dependencies on
-                                "argp-standalone" when building with the musl C
-                                library:
+                                As an actual example, here's a snippet from the
+                                generic kernel include file
+                                <filename>linux-yocto.inc</filename>,
+                                wherein the kernel compile and link options are
+                                adjusted in the case of a subset of the supported
+                                architectures:
                                 <literallayout class='monospaced'>
-     DEPENDS_append_libc-musl = " argp-standalone"
+     DEPENDS_append_aarch64 = " libgcc"
+     KERNEL_CC_append_aarch64 = " ${TOOLCHAIN_OPTIONS}"
+     KERNEL_LD_append_aarch64 = " ${TOOLCHAIN_OPTIONS}"
+
+     DEPENDS_append_nios2 = " libgcc"
+     KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
+     KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
+
+     DEPENDS_append_arc = " libgcc"
+     KERNEL_CC_append_arc = " ${TOOLCHAIN_OPTIONS}"
+     KERNEL_LD_append_arc = " ${TOOLCHAIN_OPTIONS}"
+
+     KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
                                 </literallayout>
                                 <note>
                                     Avoiding "+=" and "=+" and using

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
