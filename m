Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.3284.1630241567128711064
 for <docs@lists.yoctoproject.org>;
 Sun, 29 Aug 2021 05:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:42692 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKKIn-0008UK-0k
	for docs@lists.yoctoproject.org; Sun, 29 Aug 2021 08:52:45 -0400
Date: Sun, 29 Aug 2021 08:52:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: confusing note in dev manual about search order for layers
Message-ID: <ae36061-5fc8-6dde-cf3c-f939fcf983c0@crashcourse.ca>
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


  in section 3.1.9 of dev manual:

https://docs.yoctoproject.org/dev-manual/common-tasks.html#adding-a-layer-using-the-bitbake-layers-script

one reads the note:

"During a build, the OpenEmbedded build system looks in the layers
from the top of the list down to the bottom in that order."

ok, except it's not at all clear what the consequence of that is.
looks for what? what is the significance of that search order to the
developer?

rday
