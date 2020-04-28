Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.1525.1588085838259318158
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Apr 2020 07:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:57090 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jTRfg-001xkT-JQ
	for docs@lists.yoctoproject.org; Tue, 28 Apr 2020 10:57:17 -0400
Date: Tue, 28 Apr 2020 10:57:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: Remove long-dead PACKAGE_GROUP variable
Message-ID: <alpine.LFD.2.21.2004281055300.926737@localhost.localdomain>
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

This was, years ago, deprecated in favour of FEATURE_PACKAGES, so
remove all references, other than the entry in the migration section.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-manual/migration.xml
index 9422b5a27..affc8b90a 100644
--- a/documentation/ref-manual/migration.xml
+++ b/documentation/ref-manual/migration.xml
@@ -875,8 +875,7 @@
                     not work.
                     This change is intended to catch those kinds of situations.
                     Valid <filename>IMAGE_FEATURES</filename> are drawn from
-                    <link linkend='var-PACKAGE_GROUP'><filename>PACKAGE_GROUP</filename></link>
-                    definitions,
+                    <filename>PACKAGE_GROUP</filename> definitions,
                     <link linkend='var-COMPLEMENTARY_GLOB'><filename>COMPLEMENTARY_GLOB</filename></link>
                     and a new "validitems" varflag on
                     <filename>IMAGE_FEATURES</filename>.
@@ -1404,8 +1403,7 @@

             <para>
                 The
-                <link linkend='var-PACKAGE_GROUP'><filename>PACKAGE_GROUP</filename></link>
-                variable has been renamed to
+                <filename>PACKAGE_GROUP</filename> variable has been renamed to
                 <link linkend='var-FEATURE_PACKAGES'><filename>FEATURE_PACKAGES</filename></link>
                 to more accurately reflect its purpose.
                 You can still use <filename>PACKAGE_GROUP</filename> but
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index b44fdcb73..b733e5e75 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -10292,28 +10292,6 @@
             </glossdef>
         </glossentry>

-        <glossentry id='var-PACKAGE_GROUP'><glossterm>PACKAGE_GROUP</glossterm>
-            <info>
-                PACKAGE_GROUP[doc] = "Defines one or more packages to include in an image when a specific item is included in IMAGE_FEATURES."
-            </info>
-            <glossdef>
-                <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
-                    The <filename>PACKAGE_GROUP</filename> variable has been
-                    renamed to
-                    <link linkend='var-FEATURE_PACKAGES'><filename>FEATURE_PACKAGES</filename></link>.
-                    See the variable description for
-                    <filename>FEATURE_PACKAGES</filename> for information.
-                </para>
-
-                <para>
-                    If if you use the <filename>PACKAGE_GROUP</filename>
-                    variable, the OpenEmbedded build system issues a warning
-                    message.
-                </para>
-            </glossdef>
-        </glossentry>
-
         <glossentry id='var-PACKAGE_INSTALL'><glossterm>PACKAGE_INSTALL</glossterm>
             <info>
                 PACKAGE_INSTALL[doc] = "List of the packages to be installed into the image. The variable is generally not user-defined and uses IMAGE_INSTALL as part of the list."

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
