Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.3624.1630405240508974189
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 03:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56260 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mL0si-0004J5-1Z
	for docs@lists.yoctoproject.org; Tue, 31 Aug 2021 06:20:39 -0400
Date: Tue, 31 Aug 2021 06:20:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should "Excluding Packages from an Image" mention IMAGE_INSTALL:remove?
Message-ID: <896a5ad8-858d-be77-96e3-adbc803b9be3@crashcourse.ca>
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


this section in dev manual:

https://docs.yoctoproject.org/dev-manual/common-tasks.html#excluding-packages-from-an-image

mentions PACKAGE_EXCLUDE, but says nothing about the possibility of
defining IMAGE_INSTALL:remove. should it?

  as i read it, PACKAGE_EXCLUDE *guarantees* that that package will
not be installed, but might very well break runtime dependencies
whereupon the build will fail.

  OTOH, even is you ask for a package to be removed with
IMAGE_INSTALL:remove, if it's a runtime dependency of some other
package to be installed, it will still be installed, yes?

  is this worth mentioning?

rday
