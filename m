Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.1060.1582581892887613106
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 14:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:42548 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j6LqM-006uZH-OQ
	for docs@lists.yoctoproject.org; Mon, 24 Feb 2020 17:04:51 -0500
Date: Mon, 24 Feb 2020 17:04:48 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] correct mention of "postinst_intercept delay_to_first_boot"
Message-ID: <alpine.LFD.2.21.2002241702230.5651@localhost.localdomain>
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


Migration to YP 2.5 contains incorrect description of routine for
delaying to first boot.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  even going back to YP 2.5, the migration information should still be
accurate.

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 1e6addde4..2e83611da 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -3262,7 +3262,7 @@
                 mark post installs to defer to the target.
                 You can use <filename>pkg_postinst_ontarget()</filename> or
                 call
-                <filename>postinst-intercepts defer_to_first_boot</filename>
+                <filename>postinst_intercept delay_to_first_boot</filename>
                 from <filename>pkg_postinst()</filename>.
                 Any failure of a <filename>pkg_postinst()</filename> script
                 (including exit 1) triggers an error during the
diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-manual/migration.xml
index 8d50ab913..6f8d19075 100644
--- a/documentation/ref-manual/migration.xml
+++ b/documentation/ref-manual/migration.xml
@@ -5601,7 +5601,7 @@ id=f4d4f99cfbc2396e49c1613a7d237b9e57f06f81'>commit message</ulink>.
                     creation time, use
                     <filename>pkg_postinst_ontarget()</filename>
                     or call
-                    <filename>postinst-intercepts defer_to_first_boot</filename>
+                    <filename>postinst_intercept delay_to_first_boot</filename>
                     from <filename>pkg_postinst()</filename>.
                     Any failure of a <filename>pkg_postinst()</filename>
                     script (including <filename>exit 1</filename>)
@@ -6192,7 +6192,7 @@ id=f4d4f99cfbc2396e49c1613a7d237b9e57f06f81'>commit message</ulink>.
             If you want to explicitly defer a postinstall to first boot on
             the target rather than at rootfs creation time, use
             <filename>pkg_postinst_ontarget()</filename> or call
-            <filename>postinst-intercepts defer_to_first_boot</filename> from
+            <filename>postinst_intercept delay_to_first_boot</filename> from
             <filename>pkg_postinst()</filename>.
             Any failure of a <filename>pkg_postinst()</filename> script
             (including exit 1) triggers an error during the

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
