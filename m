Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.16534.1604244967993319195
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Nov 2020 07:36:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:50118 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kZFOn-00FLOM-SE
	for docs@lists.yoctoproject.org; Sun, 01 Nov 2020 10:36:06 -0500
Date: Sun, 1 Nov 2020 10:36:03 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [RFC] what about adding a ToC to top-level individual pages?
Message-ID: <e7265c66-faa4-e0c0-b661-7ac89a1e3581@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  above and beyond the hyperlinks in the left margin when viewing the
docs, it's easy to add a single-level ToC to each page, which is
available to the reader even if the left margin hyperlinks are
collapsed and non-visible. here's a patch that applies that to the dev
manual as an example, so you can see what i mean (the patch also adds
some whitespace at the top for aesthetics):

  thoughts?

rday
---

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 27aacde60..1e0fe225a 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -4,6 +4,13 @@
 Common Tasks
 ************

+|
+
+.. contents::
+   :depth: 1
+   :local:
+   :backlinks: none
+
 This chapter describes fundamental procedures such as creating layers,
 adding new software packages, extending or customizing images, porting
 work to new hardware (adding a new machine), and so forth. You will find
diff --git a/documentation/dev-manual/dev-manual-intro.rst b/documentation/dev-manual/dev-manual-intro.rst
index 05136f735..7078991ec 100644
--- a/documentation/dev-manual/dev-manual-intro.rst
+++ b/documentation/dev-manual/dev-manual-intro.rst
@@ -4,6 +4,13 @@
 The Yocto Project Development Tasks Manual
 ******************************************

+|
+
+.. contents::
+   :depth: 1
+   :local:
+   :backlinks: none
+
 .. _dev-welcome:

 Welcome
diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentation/dev-manual/dev-manual-qemu.rst
index c91e8b538..e5da176bd 100644
--- a/documentation/dev-manual/dev-manual-qemu.rst
+++ b/documentation/dev-manual/dev-manual-qemu.rst
@@ -4,6 +4,13 @@
 Using the Quick EMUlator (QEMU)
 *******************************

+|
+
+.. contents::
+   :depth: 1
+   :local:
+   :backlinks: none
+
 The Yocto Project uses an implementation of the Quick EMUlator (QEMU)
 Open Source project as part of the Yocto Project development "tool set".
 This chapter provides both procedures that show you how to use the Quick
diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
index a85b86fbf..958e95745 100644
--- a/documentation/dev-manual/dev-manual-start.rst
+++ b/documentation/dev-manual/dev-manual-start.rst
@@ -4,6 +4,13 @@
 Setting Up to Use the Yocto Project
 ***********************************

+|
+
+.. contents::
+   :depth: 1
+   :local:
+   :backlinks: none
+
 This chapter provides guidance on how to prepare to use the Yocto
 Project. You can learn about creating a team environment to develop
 using the Yocto Project, how to set up a :ref:`build

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
