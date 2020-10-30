Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.10875.1604049717525228572
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 02:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:57664 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYQbc-004HHE-3l
	for docs@lists.yoctoproject.org; Fri, 30 Oct 2020 05:21:56 -0400
Date: Fri, 30 Oct 2020 05:21:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] README: "yocto-project-qs" -> "brief-yoctoprojectqs"
Message-ID: <f3de44-4ef9-806c-7c59-e8223c86d5c2@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
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

Directory has been renamed, so fix README and add a bit more white
space to keep everything lined up.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/README b/documentation/README
index fe86876ee..534ae66f8 100644
--- a/documentation/README
+++ b/documentation/README
@@ -34,15 +34,15 @@ Manual Organization

 Folders exist for individual manuals as follows:

-* sdk-manual       - The Yocto Project Software Development Kit (SDK) Developer's Guide.
-* bsp-guide        - The Yocto Project Board Support Package (BSP) Developer's Guide
-* dev-manual       - The Yocto Project Development Tasks Manual
-* kernel-dev       - The Yocto Project Linux Kernel Development Tasks Manual
-* ref-manual       - The Yocto Project Reference Manual
-* yocto-project-qs - The Yocto Project Quick Start
-* profile-manual   - The Yocto Project Profile and Tracing Manual
-* toaster-manual   - The Toaster Manual
-* test-manual      - The Test Environment Manual
+* sdk-manual           - The Yocto Project Software Development Kit (SDK) Developer's Guide.
+* bsp-guide            - The Yocto Project Board Support Package (BSP) Developer's Guide
+* dev-manual           - The Yocto Project Development Tasks Manual
+* kernel-dev           - The Yocto Project Linux Kernel Development Tasks Manual
+* ref-manual           - The Yocto Project Reference Manual
+* brief-yoctoprojectqs - The Yocto Project Quick Start
+* profile-manual       - The Yocto Project Profile and Tracing Manual
+* toaster-manual       - The Toaster Manual
+* test-manual          - The Test Environment Manual

 Each folder is self-contained regarding content and figures.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
