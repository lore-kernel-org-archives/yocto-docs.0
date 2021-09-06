Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.22261.1630936819548191852
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 07:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:49762 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mNFAX-0002f9-Vu
	for docs@lists.yoctoproject.org; Mon, 06 Sep 2021 10:00:18 -0400
Date: Mon, 6 Sep 2021 10:00:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] ref-manual: add potential of parallelism to defn of "Task"
Message-ID: <79475bcc-344e-b3bb-eb82-8ab31446b57d@crashcourse.ca>
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


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 32658051a..e5a7565df 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -367,10 +367,16 @@ universal, the list includes them just in case:
      section in the Yocto Project Overview and Concepts Manual.

    :term:`Task`
-      A unit of execution for BitBake (e.g.
+      A per-recipe unit of execution for BitBake (e.g.
       :ref:`ref-tasks-compile`,
       :ref:`ref-tasks-fetch`,
       :ref:`ref-tasks-patch`, and so forth).
+      One of the major benefits of the build system is that, since each
+      recipe will typically spawn the execution of numerous tasks,
+      it is entirely possible that many tasks can execute in parallel,
+      either tasks from separate recipes or independent tasks within
+      the same recipe, potentially up to the parallelism of your
+      build system.

    :term:`Toaster`
       A web interface to the Yocto Project's :term:`OpenEmbedded Build System`.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
