Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.2594.1603999860050965194
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 12:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:39918 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYDdR-001Xjy-Tf
	for docs@lists.yoctoproject.org; Thu, 29 Oct 2020 15:30:58 -0400
Date: Thu, 29 Oct 2020 15:30:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] "PACKAGE_FEEDS_ARCHS" -> "PACKAGE_FEED_ARCHS"
Message-ID: <b914f3c-e22c-b3c8-f3a9-ebf417f1f218@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=0.3
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


Fix single misspelling.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  let's see if i can even remember how to submit a patch.

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 0603ba93c..0a70363a6 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -5104,7 +5104,7 @@ system and gives an overview of their function and contents.

       .. note::

-         You can use the ``PACKAGE_FEEDS_ARCHS``
+         You can use the ``PACKAGE_FEED_ARCHS``
          variable to whitelist specific package architectures. If you do
          not need to whitelist specific architectures, which is a common
          case, you can omit this variable. Omitting the variable results in

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
