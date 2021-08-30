Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.16035.1630325136259162198
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 05:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37230 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKg2f-00047y-6r
	for docs@lists.yoctoproject.org; Mon, 30 Aug 2021 08:05:34 -0400
Date: Mon, 30 Aug 2021 08:05:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: pass False to d.getVar() for devpyshell example
Message-ID: <fe6cf3af-6c9f-a4c0-9f5b-48beccdb11ae@crashcourse.ca>
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


In the example in section 3.9, the call to d.getVar() needs to have
the additional arugment of "False" so that the output is not expanded.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  pretty sure it works this way.

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 4a5011ea7..f3b508443 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3486,7 +3486,7 @@ functions::

    pydevshell> d.getVar("STAGING_DIR")
    '/media/build1/poky/build/tmp/sysroots'
-   pydevshell> d.getVar("STAGING_DIR")
+   pydevshell> d.getVar("STAGING_DIR", False)
    '${TMPDIR}/sysroots'
    pydevshell> d.setVar("FOO", "bar")
    pydevshell> d.getVar("FOO")

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
