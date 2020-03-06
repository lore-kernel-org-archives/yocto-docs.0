Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.1546.1583525062754105639
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Mar 2020 12:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:55744 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jAJCn-003MVM-3h
	for docs@lists.yoctoproject.org; Fri, 06 Mar 2020 15:04:21 -0500
Date: Fri, 6 Mar 2020 15:04:19 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: minor rewording/clarification in chapter 2
Message-ID: <alpine.LFD.2.21.2003061503290.7885@localhost.localdomain>
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

diff --git a/documentation/ref-manual/ref-terms.xml b/documentation/ref-manual/ref-terms.xml
index f98546826..722fa7ee2 100644
--- a/documentation/ref-manual/ref-terms.xml
+++ b/documentation/ref-manual/ref-terms.xml
@@ -41,11 +41,13 @@
                 That append file would match any
                 <filename>busybox_1.21.</filename><replaceable>x</replaceable><filename>.bb</filename>
                 version of the recipe.
-                So, the append file would match the following recipe names:
+                So, the append file would match any of the following recipe names:
                 <literallayout class='monospaced'>
      busybox_1.21.1.bb
      busybox_1.21.2.bb
      busybox_1.21.3.bb
+     busybox_1.21.10.bb
+     busybox_1.21.25.bb
                 </literallayout>
                 <note><title>Important</title>
                     The use of the "<filename>%</filename>" character
@@ -115,7 +117,7 @@
                         in your home directory within the existing
                         directory <filename>mybuilds</filename>:
                         <literallayout class='monospaced'>
-     $cd $HOME
+     $ cd $HOME
      $ source $HOME/poky/&OE_INIT_FILE; $HOME/mybuilds/YP-&POKYVERSION;
                         </literallayout>
                         </para></listitem>
@@ -141,7 +143,7 @@
                 The system used to build images in a Yocto Project
                 Development environment.
                 The build system is sometimes referred to as the
-                development host.
+                <firstterm>development host</firstterm>.
                 </para></listitem>
             <listitem><para>
                 <emphasis>Classes:</emphasis>
@@ -393,7 +395,7 @@
                 Poky is not a product level distro.
                 Rather, it is a good starting point for customization.
                 <note>
-                    Poky began an open-source
+                    Poky began as an open-source
                     project initially developed by OpenedHand.
                     OpenedHand developed Poky from the existing
                     OpenEmbedded build system to create a commercially

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
