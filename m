Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.1072.1630220688970758703
 for <docs@lists.yoctoproject.org>;
 Sun, 29 Aug 2021 00:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:42688 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKEs2-0006Oq-Vr
	for docs@lists.yoctoproject.org; Sun, 29 Aug 2021 03:04:47 -0400
Date: Sun, 29 Aug 2021 03:04:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] README: update manual list and names, online docs URL
Message-ID: <5ae42459-99a9-c7fc-45a2-3f3cf6345ce@crashcourse.ca>
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

Minor tweaks to top-level README:
  - add missing line for overview manual
  - correct manual names to match their *actual* names
  - point reader at docs.yoctoproject.org for online docs

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

commit 56ebf7806434d786959d62f18d0daf399b30b78b
Author: Robert P. J. Day <rpjday@crashcourse.ca>
Date:   Sun Aug 29 03:01:30 2021 -0400

    README: update manuals list, pointer to online docs

diff --git a/documentation/README b/documentation/README
index fad19683c..1e7b4f0e6 100644
--- a/documentation/README
+++ b/documentation/README
@@ -34,26 +34,21 @@ Manual Organization

 Here the folders corresponding to individual manuals:

-* sdk-manual           - The Yocto Project Software Development Kit (SDK) Developer's Guide.
-* bsp-guide            - The Yocto Project Board Support Package (BSP) Developer's Guide
-* dev-manual           - The Yocto Project Development Tasks Manual
-* kernel-dev           - The Yocto Project Linux Kernel Development Tasks Manual
-* ref-manual           - The Yocto Project Reference Manual
-* brief-yoctoprojectqs - The Yocto Project Quick Start
-* profile-manual       - The Yocto Project Profile and Tracing Manual
-* toaster-manual       - The Toaster Manual
-* test-manual          - The Test Environment Manual
+* overview-manual      - Yocto Project Overview and Concepts Manual
+* sdk-manual           - Yocto Project Software Development Kit (SDK) Developer's Guide.
+* bsp-guide            - Yocto Project Board Support Package (BSP) Developer's Guide
+* dev-manual           - Yocto Project Development Tasks Manual
+* kernel-dev           - Yocto Project Linux Kernel Development Manual
+* ref-manual           - Yocto Project Reference Manual
+* brief-yoctoprojectqs - Yocto Project Quick Start
+* profile-manual       - Yocto Project Profiling and Tracing Manual
+* toaster-manual       - Toaster User Manual
+* test-manual          - Yocto Project Test Environment Manual

 Each folder is self-contained regarding content and figures.

 If you want to find HTML versions of the Yocto Project manuals on the web,
-go to https://www.yoctoproject.org and click on the "Docs" tab.  From
-there you have access to archived documentation from previous releases, current
-documentation for the latest release, and "Docs in Progress" for the release
-currently being developed.
-
-In general, the Yocto Project site (https://www.yoctoproject.org) is a great
-reference for both information and downloads.
+the current versions reside at https://docs.yoctoproject.org.

 poky.yaml
 =========

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
