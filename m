Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.15093.1581875579632722321
 for <docs@lists.yoctoproject.org>;
 Sun, 16 Feb 2020 09:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:35330 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j3O6D-002MIK-LS
	for docs@lists.yoctoproject.org; Sun, 16 Feb 2020 12:52:58 -0500
Date: Sun, 16 Feb 2020 12:52:55 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: dev manual section 3.6: should it not end with showing *how* to test?
Message-ID: <alpine.LFD.2.21.2002161247030.2291542@localhost.localdomain>
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


  section 3.6, dev manual, "Finding Temporary Source Code", opens by
talking about how to temporarily tweak source code for testing,
explains the likely location of the source code, then ... just ends
without explaining how to do the actual testing.

  i was reading that section, nodding in agreement, expecting it
would culminate in a description of how to test local changes, but it
just ended. as i recall, once one makes local changes, one can then
just:

  $ bitbake -c compile -f <image>
  $ bitbake <image>

the "-f" being necessary to force recompilation, after which you do
just a regular image build.

  is there a reason that extra little bit is not at the end of that
section? and if it's added, perhaps the section should be titled
"Testing Temporary Local Changes" or something similar?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
