Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.2551.1586542440982074308
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2020 11:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:51422 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jMyAB-00DB6f-Gp
	for docs@lists.yoctoproject.org; Fri, 10 Apr 2020 14:14:00 -0400
Date: Fri, 10 Apr 2020 14:13:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add entry for rm_work_and_downloads.bbclass
Message-ID: <alpine.LFD.2.21.2004101410580.9046@localhost.localdomain>
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

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index f9bbddd72..2506da5f5 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -2961,6 +2961,21 @@ This check was removed for YP 2.3 release
     </para>
 </section>

+<section id='ref-classes-rm-work-and-downloads'>
+    <title><filename>rm_work_and_downloads.bbclass</filename></title>
+
+    <para>
+        In addition to removing the local build directories of a recipe,
+        this class also removes the downloaded source; it would be invoked
+        thusly:
+        <literallayout class='monospaced'>
+    INHERIT += "rm_work_and_downloads"
+        </literallayout>
+        While this sounds wasteful, where this works well is in well-connected
+        build environments with limited disk space (such as Travis CI).
+    </para>
+</section>
+
 <section id='ref-classes-rootfs*'>
     <title><filename>rootfs*.bbclass</filename></title>


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
