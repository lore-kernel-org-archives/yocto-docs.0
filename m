Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.1078.1582317831304084293
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 12:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:34902 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j5F9J-00G9u4-TF
	for docs@lists.yoctoproject.org; Fri, 21 Feb 2020 15:43:50 -0500
Date: Fri, 21 Feb 2020 15:43:47 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] kernel-dev: fix explanation of KBUILD_DEFCONFIG
Message-ID: <alpine.LFD.2.21.2002211542330.8909@localhost.localdomain>
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

KBUILD_DEFCONFIG is meant to refer to an *in-tree* defconfig file, not
an external one.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/kernel-dev/kernel-dev-common.xml b/documentation/kernel-dev/kernel-dev-common.xml
index 2ea5d3f38..7491d3dbd 100644
--- a/documentation/kernel-dev/kernel-dev-common.xml
+++ b/documentation/kernel-dev/kernel-dev-common.xml
@@ -948,12 +948,14 @@
                 <literallayout class='monospaced'>
      KBUILD_DEFCONFIG_<replaceable>KMACHINE</replaceable> ?= <replaceable>defconfig_file</replaceable>
                 </literallayout>
-                Here is an example that appends the
-                <filename>KBUILD_DEFCONFIG</filename> variable with
-                "common-pc" and provides the path to the "in-tree"
-                <filename>defconfig</filename> file:
+                Here is an example that assigns the
+                <filename>KBUILD_DEFCONFIG</filename> variable based on
+                "raspberrypi2" and provides the path to the "in-tree"
+                <filename>defconfig</filename> file
+                to be used for a Raspberry Pi 2,
+                which is based on the Broadcom 2708/2709 chipset:
                 <literallayout class='monospaced'>
-     KBUILD_DEFCONFIG_common-pc ?= "/home/scottrif/configfiles/my_defconfig_file"
+     KBUILD_DEFCONFIG_raspberrypi2 ?= "bcm2709_defconfig"
                 </literallayout>
             </para>


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
