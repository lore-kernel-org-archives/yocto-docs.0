Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.2019.1632387622955605443
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Sep 2021 02:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:45266 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mTKaa-0000yd-VG
	for docs@lists.yoctoproject.org; Thu, 23 Sep 2021 05:00:20 -0400
Date: Thu, 23 Sep 2021 05:00:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: mention INHIBIT_PACKAGE_DEBUG_SPLIT variable
Message-ID: <898ffd75-d74f-7fe7-3ca7-b818d2c7cab@crashcourse.ca>
MIME-Version: 1.0
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


Following a detailed discussion of PACKAGE_DEBUG_SPLIT_STYLE, it seems
only appropriate to refer the reader to INHIBIT_PACKAGE_DEBUG_SPLIT.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  this patch is against master-next, as the earlier patch has not been
merged into master yet.

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 28eb5f233..6cb9ad9c9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5098,6 +5098,11 @@ system and gives an overview of their function and contents.
       -  "``debug-without-src``": The same behavior as with the ``.debug``
          setting, but no source is packaged at all.

+      .. note::
+
+         Much of the above package splitting can be overridden via
+         use of the :term:`INHIBIT_PACKAGE_DEBUG_SPLIT` variable.
+
       You can find out more about debugging using GDB by reading the
       ":ref:`dev-manual/common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
       in the Yocto Project Development Tasks Manual.
-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
