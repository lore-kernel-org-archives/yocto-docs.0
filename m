Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.25775.1585483905716261423
 for <docs@lists.yoctoproject.org>;
 Sun, 29 Mar 2020 05:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:46424 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jIWn1-00BT1H-MX
	for docs@lists.yoctoproject.org; Sun, 29 Mar 2020 08:11:44 -0400
Date: Sun, 29 Mar 2020 08:11:40 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: add missing check to yocto-check-layer section
Message-ID: <alpine.LFD.2.21.2003290809490.15604@localhost.localdomain>
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

Add explanation of missing checks performed by yocto-check-layer, and
fix one typo.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 32da79a89..333be169a 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -597,11 +597,19 @@
                             is in order without errors (i.e.
                             <filename>bitbake -e</filename>).
                             </para></listitem>
+                        <listitem><para>
+                            <filename>common.test_world</filename>:
+                            Verifies that <filename>bitbake world</filename> works.
+                            </para></listitem>
                         <listitem><para>
                             <filename>common.test_signatures</filename>:
                             Tests to be sure that BSP and DISTRO layers do not
                             come with recipes that change signatures.
                             </para></listitem>
+                        <listitem><para>
+                            <filename>common.test_layerseries_compat</filename>:
+                            Verifies layer compatibility is set properly.
+                            </para></listitem>
                         <listitem><para>
                             <filename>bsp.test_bsp_defines_machines</filename>:
                             Tests if a BSP layer has machine configurations.
@@ -611,12 +619,23 @@
                             Tests to ensure a BSP layer does not set the
                             machine when the layer is added.
                             </para></listitem>
+                        <listitem><para>
+                            <filename>bsp.test_machine_world</filename>:
+                            Verifies that <filename>bitbake world</filename>
+                            works regardless of which machine is selected.
+                            </para></listitem>
+                        <listitem><para>
+                            <filename>bsp.test_machine_signatures</filename>:
+                            Verifies that building for a particular machine
+                            affects only the signature of tasks specific to that
+                            machine.
+                            </para></listitem>
                         <listitem><para>
                             <filename>distro.test_distro_defines_distros</filename>:
                             Tests if a DISTRO layer has distro configurations.
                             </para></listitem>
                         <listitem><para>
-                            <filename>distro.test_distro_no_set_distro</filename>:
+                            <filename>distro.test_distro_no_set_distros</filename>:
                             Tests to ensure a DISTRO layer does not set the
                             distribution when the layer is added.
                             </para></listitem>

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
