Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.8261.1604138280017600910
 for <docs@lists.yoctoproject.org>;
 Sat, 31 Oct 2020 02:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:56778 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYne2-009Wfr-KV
	for docs@lists.yoctoproject.org; Sat, 31 Oct 2020 05:57:59 -0400
Date: Sat, 31 Oct 2020 05:57:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: general opinion on FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:" ??
Message-ID: <edfa2c82-d684-446e-8428-af619e979eca@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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


  as in, the use of "BPN" in the above, which is found in all of one
place in the docs:

  dev-manual/dev-manual-common-tasks.rst

i vaguely recall seeing a warning that BPN should be avoided, but
maybe i'm misremembering. some other layers use that form widely, but
not so much in OE/YP layers.

  just change it to PN and move on? is there a standard for that?

rday
