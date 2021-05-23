Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.9562.1621772575175496460
 for <docs@lists.yoctoproject.org>;
 Sun, 23 May 2021 05:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:44332 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lkn89-0005nU-9E
	for docs@lists.yoctoproject.org; Sun, 23 May 2021 08:22:54 -0400
Date: Sun, 23 May 2021 08:22:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add SRCTREECOVEREDTASKS to variable glossary
Message-ID: <7a97671f-9ba8-2c0-9a68-3483a57113f@crashcourse.ca>
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


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index df6413b68..b179abf74 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7092,6 +7092,30 @@ system and gives an overview of their function and contents.
          ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
          section, which is in the Yocto Project Development Tasks Manual.

+   :term:`SRCTREECOVEREDTASKS`
+      A list of tasks that are typically not relevant (and therefore skipped)
+      when building using the :ref:`externalsrc <ref-classes-externalsrc>`
+      class. The default value as set in that class file is the set of tasks
+      that are rarely needed when using external source::
+
+         SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
+
+      The notable exception is when processing external kernel source as
+      defined in the :ref:`kernel-yocto <ref-classes-kernel-yocto>`
+      class file (formatted for aesthetics)::
+
+         SRCTREECOVEREDTASKS += "\
+           do_validate_branches \
+           do_kernel_configcheck \
+           do_kernel_checkout \
+           do_fetch \
+           do_unpack \
+           do_patch \
+         "
+
+      See the associated :term:`EXTERNALSRC` and :term:`EXTERNALSRC_BUILD`
+      variables for more information.
+
    :term:`SSTATE_DIR`
       The directory for the shared state cache.


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
