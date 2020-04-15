Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.10875.1586941500698439028
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 02:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:53898 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jOdyc-009MAu-VT
	for docs@lists.yoctoproject.org; Wed, 15 Apr 2020 05:04:59 -0400
Date: Wed, 15 Apr 2020 05:04:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: update blktrace example to match master branch
Message-ID: <alpine.LFD.2.21.2004150503550.6761@localhost.localdomain>
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


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 2b8868b62..06e3068cd 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -1989,13 +1989,15 @@
                 Here is an example from the recipe
                 <filename>meta/recipes-kernel/blktrace/blktrace_git.bb</filename>:
                 <literallayout class='monospaced'>
-     SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
+     SRCREV = "cca113f2fe0759b91fd6a0e10fdcda2c28f18a7e"

-     PR = "r6"
-     PV = "1.0.5+git${SRCPV}"
+     PV = "1.2.0+git${SRCPV}"

      SRC_URI = "git://git.kernel.dk/blktrace.git \
-                file://ldflags.patch"
+                file://ldflags.patch \
+                file://CVE-2018-10689.patch \
+                file://make-btt-scripts-python3-ready.patch \
+     "
                 </literallayout>
             </para>


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
