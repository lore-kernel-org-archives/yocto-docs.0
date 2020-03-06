Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.1315.1583524557252764192
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Mar 2020 11:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:55718 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jAJ4d-003LHg-It
	for docs@lists.yoctoproject.org; Fri, 06 Mar 2020 14:55:56 -0500
Date: Fri, 6 Mar 2020 14:55:52 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: minor rewording in chapter 1
Message-ID: <alpine.LFD.2.21.2003061454550.7587@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=0.3
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


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 9c2198a76..db74ac848 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -8,12 +8,12 @@
     <para>
         Welcome to the Yocto Project Reference Manual!
         This manual provides reference information for the current release
-        of the Yocto Project.
-        The manual is best used after you have an understanding
+        of the Yocto Project, and
+        is most effectively used after you have an understanding
         of the basics of the Yocto Project.
         The manual is neither meant to be read as a starting point to the
-        Yocto Project nor read from start to finish.
-        Use this manual to find variable definitions, class
+        Yocto Project, nor read from start to finish.
+        Rather, use this manual to find variable definitions, class
         descriptions, and so forth as needed during the course of using
         the Yocto Project.
     </para>
@@ -117,7 +117,7 @@
         <para>
             The list of packages you need on the host development system can
             be large when covering all build scenarios using the Yocto Project.
-            This section provides required packages according to
+            This section describes required packages according to
             Linux distribution and function.
         </para>


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
