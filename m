Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.9431.1619777012550500138
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 03:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:48356 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lcPzg-00052F-6H
	for docs@lists.yoctoproject.org; Fri, 30 Apr 2021 06:03:31 -0400
Date: Fri, 30 Apr 2021 06:03:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] sdk-manual: fix broken formatting of sample command
Message-ID: <53696327-b187-808d-29cb-0d007ef27@crashcourse.ca>
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

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 0ce828aa2..0d1422ed4 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -138,9 +138,11 @@ build the SDK installer. Follow these steps:

 6. *Build the SDK Installer:* To build the SDK installer for a standard
    SDK and populate the SDK image, use the following command form. Be
-   sure to replace image with an image (e.g. "core-image-sato"): $
-   bitbake image -c populate_sdk You can do the same for the extensible
-   SDK using this command form::
+   sure to replace image with an image (e.g. "core-image-sato")::
+
+      $ bitbake image -c populate_sdk
+
+   You can do the same for the extensible SDK using this command form::

       $ bitbake image -c populate_sdk_ext


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
