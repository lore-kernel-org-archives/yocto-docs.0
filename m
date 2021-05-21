Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.288.1621630372087716517
 for <docs@lists.yoctoproject.org>;
 Fri, 21 May 2021 13:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:49474 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lkC8a-0004YH-Ky
	for docs@lists.yoctoproject.org; Fri, 21 May 2021 16:52:50 -0400
Date: Fri, 21 May 2021 16:52:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add WIC_CREATE_EXTRA_ARGS to var glossary
Message-ID: <bd62f84-9dbf-19e0-38af-2a36925cd71e@crashcourse.ca>
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
index 0b61f77cb..1863fb21d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8600,6 +8600,21 @@ system and gives an overview of their function and contents.
       can control with this variable, see the
       ":ref:`insane.bbclass <ref-classes-insane>`" section.

+   :term:`WIC_CREATE_EXTRA_ARGS`
+      Extra arguments to be added when running ``wic create``. Possibilities
+      can be seen by running ``wic help create``::
+
+         SYNOPSIS
+          wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
+           [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
+           [-r, --rootfs-dir] [-b, --bootimg-dir]
+           [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
+           [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
+
+      As an example, some Freescale configurations include the line::
+
+         WIC_CREATE_EXTRA_ARGS ?= "--no-fstab-update"
+
    :term:`WKS_FILE`
       Specifies the location of the Wic kickstart file that is used by the
       OpenEmbedded build system to create a partitioned image

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
