Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.25668.1630951440053346690
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 11:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:58788 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mNIyL-0007Pd-Nt
	for docs@lists.yoctoproject.org; Mon, 06 Sep 2021 14:03:58 -0400
Date: Mon, 6 Sep 2021 14:03:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: correct typo in "classes" section, "${BPN}/{PV}"
Message-ID: <dc2aae2b-af5-a764-5d4b-9b8ac87094d7@crashcourse.ca>
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

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3af023895..1b685370c 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -543,7 +543,7 @@ which the OpenEmbedded build system places the generated objects built
 from the recipes. By default, the :term:`B` directory is set to the
 following, which is separate from the source directory (:term:`S`)::

-   ${WORKDIR}/${BPN}/{PV}/
+   ${WORKDIR}/${BPN}-{PV}/

 See these variables for more information:
 :term:`WORKDIR`, :term:`BPN`, and

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
