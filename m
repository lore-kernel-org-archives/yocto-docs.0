Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.6913.1621589725344143715
 for <docs@lists.yoctoproject.org>;
 Fri, 21 May 2021 02:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56058 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lk1Z0-0005xw-Ab
	for docs@lists.yoctoproject.org; Fri, 21 May 2021 05:35:24 -0400
Date: Fri, 21 May 2021 05:35:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add DEBUGFS-related variables to glossary
Message-ID: <b3b0312-688f-1b68-ac2b-29db8163cc9a@crashcourse.ca>
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


Add variable glossary entries for all of:

  * IMAGE_GEN_DEBUGFS
  * IMAGE_FSTYPES_DEBUGFS
  * IMAGE_INSTALL_DEBUGFS

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0b61f77cb..1ce43a954 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3006,6 +3006,24 @@ system and gives an overview of their function and contents.
             or ``_prepend``. You must use the ``+=`` operator to add one or
             more options to the ``IMAGE_FSTYPES`` variable.

+   :term:`IMAGE_FSTYPES_DEBUGFS`
+      Similar to :term:`IMAGE_FSTYPES`, specifies the formats the
+      OpenEmbedded build system uses during the build when creating the
+      debug filesystem, as long as :term:`IMAGE_GEN_DEBUGFS` has been
+      set to '1'.
+
+      The default value from ``bitbake.conf``::
+
+         IMAGE_FSTYPES_DEBUGFS ?= "tar.gz"
+
+   :term:`IMAGE_GEN_DEBUGFS`
+      Set to '1' in order to generate a separate debug fileystem::
+
+         IMAGE_GEN_DEBUGFS = '1'
+
+      If set, the debugfs will be generated with all of the filesystem
+      formats listed in :term:`IMAGE_FSTYPES_DEBUGFS`.
+
    :term:`IMAGE_INSTALL`
       Used by recipes to specify the packages to install into an image
       through the :ref:`image <ref-classes-image>` class. Use the
@@ -3055,6 +3073,11 @@ system and gives an overview of their function and contents.
             specific situation. In both these cases, the behavior is
             contrary to how most users expect the ``+=`` operator to work.

+   :term:`IMAGE_INSTALL_DEBUGFS`
+      Analogous to :term:`IMAGE_INSTALL`, specify a list of additional
+      packages to add to the debug filesystem which would not normally
+      be installed as complementary packages of standard ones.
+
    :term:`IMAGE_LINGUAS`
       Specifies the list of locales to install into the image during the
       root filesystem construction process. The OpenEmbedded build system

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
