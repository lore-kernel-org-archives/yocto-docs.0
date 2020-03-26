Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.38827.1585234592929504908
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Mar 2020 07:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:53140 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jHTvq-00HEa4-Hy
	for docs@lists.yoctoproject.org; Thu, 26 Mar 2020 10:56:32 -0400
Date: Thu, 26 Mar 2020 10:56:28 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] use defined entity "YOCTO_DOCS_URL", not "YOCTO_HOME_URL"
Message-ID: <alpine.LFD.2.21.2003261051490.142823@localhost.localdomain>
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


Given the defined DocBook entity:

  <!ENTITY YOCTO_DOCS_URL "&YOCTO_HOME_URL;/docs">

replace numerous instances of the more verbose
"&YOCTO_HOME_URL;/documentation", which is a redirect, anyway.

rday

---

  i *think* i got them all, there are probably other instances
involving other entities.

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index ea4899b70..a7d10a09b 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -152,7 +152,7 @@
                        Yocto Project.
                        To be sure you have the latest version of the manual
                        for this release, go to the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual from that site.
                        Manuals from the site are more up-to-date than manuals
                        derived from the Yocto Project released TAR files.
@@ -169,7 +169,7 @@
                        page.
                        If you need a version of this manual for a different
                        Yocto Project release, visit the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual set by using the
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index 2ef7087cd..72a045181 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -144,7 +144,7 @@
                        Yocto Project.
                        To be sure you have the latest version of the manual
                        for this release, go to the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual from that site.
                        Manuals from the site are more up-to-date than manuals
                        derived from the Yocto Project released TAR files.
@@ -161,7 +161,7 @@
                        page.
                        If you need a version of this manual for a different
                        Yocto Project release, visit the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual set by using the
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index e0aed297d..f388838e9 100755
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -127,7 +127,7 @@
                        Yocto Project.
                        To be sure you have the latest version of the manual
                        for this release, go to the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual from that site.
                        Manuals from the site are more up-to-date than manuals
                        derived from the Yocto Project released TAR files.
@@ -144,7 +144,7 @@
                        page.
                        If you need a version of this manual for a different
                        Yocto Project release, visit the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual set by using the
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index 13ada7c03..8eca04c31 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -118,7 +118,7 @@
                        Yocto Project.
                        To be sure you have the latest version of the manual
                        for this release, go to the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual from that site.
                        Manuals from the site are more up-to-date than manuals
                        derived from the Yocto Project released TAR files.
@@ -135,7 +135,7 @@
                        page.
                        If you need a version of this manual for a different
                        Yocto Project release, visit the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual set by using the
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
diff --git a/documentation/overview-manual/overview-manual-yp-intro.xml b/documentation/overview-manual/overview-manual-yp-intro.xml
index dbf62cc16..1d90aad02 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.xml
+++ b/documentation/overview-manual/overview-manual-yp-intro.xml
@@ -225,9 +225,9 @@
                         For information that helps you transition from
                         trying out the Yocto Project to using it for your
                         project, see the
-                        "<ulink url='&YOCTO_HOME_URL;/docs/what-i-wish-id-known/'>What I wish I'd Known</ulink>"
+                        "<ulink url='&YOCTO_DOCS_URL;/what-i-wish-id-known/'>What I wish I'd Known</ulink>"
                         and
-                        "<ulink url='&YOCTO_HOME_URL;/docs/transitioning-to-a-custom-environment/'>Transitioning to a Custom Environment for Systems Development</ulink>"
+                        "<ulink url='&YOCTO_DOCS_URL;/transitioning-to-a-custom-environment/'>Transitioning to a Custom Environment for Systems Development</ulink>"
                         documents on the Yocto Project website.
                         </para></listitem>
                     <listitem><para>
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index dfdc165a6..516ab2421 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -79,7 +79,7 @@
                        Yocto Project.
                        To be sure you have the latest version of the manual
                        for this release, go to the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual from that site.
                        Manuals from the site are more up-to-date than manuals
                        derived from the Yocto Project released TAR files.
@@ -96,7 +96,7 @@
                        page.
                        If you need a version of this manual for a different
                        Yocto Project release, visit the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual set by using the
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index 14c508ea1..f51bfae6c 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -129,7 +129,7 @@
                        Yocto Project.
                        To be sure you have the latest version of the manual
                        for this release, go to the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual from that site.
                        Manuals from the site are more up-to-date than manuals
                        derived from the Yocto Project released TAR files.
@@ -146,7 +146,7 @@
                        page.
                        If you need a version of this manual for a different
                        Yocto Project release, visit the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual set by using the
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index 48358aae5..72f1b1e01 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -153,7 +153,7 @@
                        Yocto Project.
                        To be sure you have the latest version of the manual
                        for this release, go to the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual from that site.
                        Manuals from the site are more up-to-date than manuals
                        derived from the Yocto Project released TAR files.
@@ -170,7 +170,7 @@
                        page.
                        If you need a version of this manual for a different
                        Yocto Project release, visit the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual set by using the
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index b00547c1a..1d5b7409a 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -97,7 +97,7 @@
                        Yocto Project.
                        To be sure you have the latest version of the manual
                        for this release, go to the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual from that site.
                        Manuals from the site are more up-to-date than manuals
                        derived from the Yocto Project released TAR files.
@@ -114,7 +114,7 @@
                        page.
                        If you need a version of this manual for a different
                        Yocto Project release, visit the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual set by using the
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index d38137c8a..59f8d7f9e 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -107,7 +107,7 @@
                        Yocto Project.
                        To be sure you have the latest version of the manual
                        for this release, go to the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual from that site.
                        Manuals from the site are more up-to-date than manuals
                        derived from the Yocto Project released TAR files.
@@ -124,7 +124,7 @@
                        page.
                        If you need a version of this manual for a different
                        Yocto Project release, visit the
-                       <ulink url='&YOCTO_HOME_URL;/documentation'>Yocto Project documentation page</ulink>
+                       <ulink url='&YOCTO_DOCS_URL;'>Yocto Project documentation page</ulink>
                        and select the manual set by using the
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
