Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.5823.1630169950432958984
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Aug 2021 09:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:45266 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mK1fg-0001Pk-Fw
	for docs@lists.yoctoproject.org; Sat, 28 Aug 2021 12:59:09 -0400
Date: Sat, 28 Aug 2021 12:59:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: docs "README" file seems a bit out of date
Message-ID: <1a55fe74-5128-7a1f-5a3d-dd137ecf7bde@crashcourse.ca>
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


  README file at top of "documentation" directory:

https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/README?h=master-next

at lines 49-53:

"If you want to find HTML versions of the Yocto Project manuals on the
web, go to https://www.yoctoproject.org and click on the "Docs" tab.
From there you have access to archived documentation from previous
releases, current documentation for the latest release, and "Docs in
Progress" for the release currently being developed."

  that's not quite what you find under the "Docs" tab and, anyway, one
should direct readers to docs.yoctoproject.org, yes?

rday
