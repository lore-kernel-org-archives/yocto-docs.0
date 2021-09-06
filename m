Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.21354.1630930210094541079
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 05:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:49754 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mNDRw-0005Az-Bo
	for docs@lists.yoctoproject.org; Mon, 06 Sep 2021 08:10:08 -0400
Date: Mon, 6 Sep 2021 08:10:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: ambiguous definition of "container layer" in ref manual
Message-ID: <1c15448a-27a0-3b37-b8a5-bec9249c8c8e@crashcourse.ca>
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
Content-Type: multipart/mixed; boundary="8323328-887144611-1630930207=:7052"

--8323328-887144611-1630930207=:7052
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT


  on this page:

https://docs.yoctoproject.org/ref-manual/terms.html

i think the definition of "container layer" is potentially confusing.
one reads:

"An example of a container layer is OpenEmbedded¢s meta-openembedded
layer"

  no, it's not -- it is simply a single git checkout containing
numerous (sub)layers, it is not *itself* a layer, containing neither
its own conf/ directory and layer.conf file and so on.

  i submit that an actual container layer would be, say,
meta-cloud-services:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/tree/

or perhaps meta-security:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-security/tree/

  thoughts?

rday

--8323328-887144611-1630930207=:7052--
