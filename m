Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.10703.1619894050651103599
 for <docs@lists.yoctoproject.org>;
 Sat, 01 May 2021 11:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:59992 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lcuRO-00066w-M3
	for docs@lists.yoctoproject.org; Sat, 01 May 2021 14:34:09 -0400
Date: Sat, 1 May 2021 14:34:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] sdk-manual: couple minor fixes in using.rst
Message-ID: <81155fce-9ac4-312-ca57-aedf82b38774@crashcourse.ca>
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


One grammar fix, and adding two proper links to other sections.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/sdk-manual/using.rst b/documentation/sdk-manual/using.rst
index fa0e8d409..301627812 100644
--- a/documentation/sdk-manual/using.rst
+++ b/documentation/sdk-manual/using.rst
@@ -11,9 +11,8 @@ standard SDK.
 .. note::

    For a side-by-side comparison of main features supported for a
-   standard SDK as compared to an extensible SDK, see the "
-   Introduction
-   " section.
+   standard SDK as compared to an extensible SDK, see the
+   ":ref:`sdk-manual/intro:introduction`" section.

 You can use a standard SDK to work on Makefile and Autotools-based
 projects. See the
@@ -49,7 +48,7 @@ the Index of Releases. Toolchains are available for several 32-bit and
 64-bit architectures with the ``x86_64`` directories, respectively. The
 toolchains the Yocto Project provides are based off the
 ``core-image-sato`` and ``core-image-minimal`` images and contain
-libraries appropriate for developing against that image.
+libraries appropriate for developing against the corresponding image.

 The names of the tarball installer scripts are such that a string
 representing the host system appears first in the filename and then is
@@ -84,9 +83,9 @@ the SDK for ``core-image-sato`` and using the current DISTRO snapshot::
 .. note::

    As an alternative to downloading an SDK, you can build the SDK
-   installer. For information on building the installer, see the "
-   Building an SDK Installer
-   " section.
+   installer. For information on building the installer, see the
+   ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
+   section.

 The SDK and toolchains are self-contained and by default are installed
 into the ``poky_sdk`` folder in your home directory. You can choose to

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
