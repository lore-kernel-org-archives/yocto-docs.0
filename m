Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.18136.1585158336739646908
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Mar 2020 10:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:40516 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jHA5v-00E3Ug-1q
	for docs@lists.yoctoproject.org; Wed, 25 Mar 2020 13:45:35 -0400
Date: Wed, 25 Mar 2020 13:45:33 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: bitbake variable glossary versus YP (ref manual) variable glossary?
Message-ID: <alpine.LFD.2.21.2003251331320.25486@localhost.localdomain>
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


  was puzzled over a lack of some important BB_* variables in the ref
manual variable glossary, until i remembered the bitbake user manual,
where i can find them, but there is an inconsistency between the two
manuals in that *some* of the BB_* variables are listed in the ref
manual variable glossary (eg., BB_NUMBER_THREADS) but not others (eg.,
BB_NO_NETWORK), which could lead to some confusion.

  even weirder, some are in the ref manual while *not* in the bitbake
user manual variable glossary (eg., BB_SERVER_TIMEOUT). is there some
sort of pattern as to which variables go in which variable glossary?
as it is, it's definitely inconsistent, requiring one to bounce back
and forth for a complete coverage.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
