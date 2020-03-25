Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.18798.1585159170121568248
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Mar 2020 10:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:40676 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jHAJM-00E5XD-L2
	for docs@lists.yoctoproject.org; Wed, 25 Mar 2020 13:59:29 -0400
Date: Wed, 25 Mar 2020 13:59:27 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: mismatch between anchors in YP ref manual and bitbake user manual?
Message-ID: <alpine.LFD.2.21.2003251355200.26890@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  perhaps i'm just misreading this, but it seems that the URLs used to
cross-reference bitbake stuff in the YP ref manual no longer match the
href names used in the bitbake manual.

  eg. in ref manual, var glossary, under BBSERVER, there is a link to
the BB_HASHBASE_WHITELIST variable, which does *NOT* take you to the
bitbake user manual location for that variable as the ref manual uses
the URL:

http://www.yoctoproject.org/docs/3.1/bitbake-user-manual/bitbake-user-manual.html#var-BB_HASHBASE_WHITELIST

while the bitbake manual uses the form "var-bb-BB_HASHBASE_WHITELIST".

  am i just misunderstanding something?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
