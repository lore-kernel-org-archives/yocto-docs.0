Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.21683.1630932274743639591
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 05:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:49758 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mNDzF-0006Pd-Ex
	for docs@lists.yoctoproject.org; Mon, 06 Sep 2021 08:44:33 -0400
Date: Mon, 6 Sep 2021 08:44:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add potential of parallelism to defn of "Task"
Message-ID: <2cf272e-4b96-e1ae-c692-4a1ee6b8736e@crashcourse.ca>
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


Emphasize that tasks can be done in parallel.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 32658051a..1a1f8dbee 100644
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
+      recipe will typically spawn the execution of numerous tasks, it is
+      entirely possible that many tasks can execute in parallel, with
+      the fetch task of one recipe being done simultaneously with the
+      build task of another, and so forth, potentially up to the
+      parallelism limit of your build system.

    :term:`Toaster`
       A web interface to the Yocto Project's :term:`OpenEmbedded Build System`.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
