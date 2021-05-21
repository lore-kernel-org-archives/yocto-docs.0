Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.6676.1621587868137430600
 for <docs@lists.yoctoproject.org>;
 Fri, 21 May 2021 02:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56000 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lk153-00087J-CR
	for docs@lists.yoctoproject.org; Fri, 21 May 2021 05:04:27 -0400
Date: Fri, 21 May 2021 05:04:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add glossary entry, INHIBIT_PACKAGE_STRIP_FILES
Message-ID: <e93fc77b-ea2f-862c-1476-6716da65e47f@crashcourse.ca>
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
index 0b61f77cb..b1774d22a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3446,6 +3446,16 @@ system and gives an overview of their function and contents.
       Consequently, you should not set ``INHIBIT_PACKAGE_STRIP`` when you
       plan to debug in general.

+   :term:`INHIBIT_PACKAGE_STRIP_FILES`
+      List of files to avoid stripping, to retain the ability to run
+      certain tests on them. A small example from current ``elfutils``
+      recipe file::
+
+         INHIBIT_PACKAGE_STRIP_FILES = "\
+             ${PKGD}${PTEST_PATH}/tests/test-nlist \
+             ${PKGD}${PTEST_PATH}/tests/elfstrmerge \
+             ... snip ...
+
    :term:`INHIBIT_SYSROOT_STRIP`
       If set to "1", causes the build to not strip binaries in the
       resulting sysroot.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
