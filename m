Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.28483.1585492503624582924
 for <docs@lists.yoctoproject.org>;
 Sun, 29 Mar 2020 07:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:47496 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jIZ1i-00Bp3X-4o
	for docs@lists.yoctoproject.org; Sun, 29 Mar 2020 10:35:02 -0400
Date: Sun, 29 Mar 2020 10:34:59 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: clarify PN usage in packagegroup files
Message-ID: <alpine.LFD.2.21.2003291033140.21190@localhost.localdomain>
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

Make it clear to the reader that they can use the much shorter form of
${PN} for the base packagegroup name, rather than typing it out in
full.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index dfbc6eeb3..1fdab0eae 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -1417,28 +1417,32 @@

             <para>
                 Here is a short, fabricated example showing the same basic
-                pieces:
+                pieces for a hypothetical packagegroup defined in
+                <filename>packagegroup-custom.bb</filename>, where the
+                variable <filename>PN</filename> is the standard way to
+                abbreviate the reference to the full packagegroup name
+                <filename>packagegroup-custom</filename>:
                 <literallayout class='monospaced'>
      DESCRIPTION = "My Custom Package Groups"

      inherit packagegroup

      PACKAGES = "\
-         packagegroup-custom-apps \
-         packagegroup-custom-tools \
+         ${PN}-apps \
+         ${PN}-tools \
          "

-     RDEPENDS_packagegroup-custom-apps = "\
+     RDEPENDS_${PN}-apps = "\
          dropbear \
          portmap \
          psplash"

-     RDEPENDS_packagegroup-custom-tools = "\
+     RDEPENDS_${PN}-tools = "\
          oprofile \
          oprofileui-server \
          lttng-tools"

-     RRECOMMENDS_packagegroup-custom-tools = "\
+     RRECOMMENDS_${PN}-tools = "\
          kernel-module-oprofile"
                 </literallayout>
             </para>

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
