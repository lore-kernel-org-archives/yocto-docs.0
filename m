Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.11082.1615054605269632098
 for <docs@lists.yoctoproject.org>;
 Sat, 06 Mar 2021 10:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:60610 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lIbTn-0006sg-Gf
	for docs@lists.yoctoproject.org; Sat, 06 Mar 2021 13:16:43 -0500
Date: Sat, 6 Mar 2021 13:16:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: bitbake: "task" versus "do_task"
Message-ID: <c22f6422-9e6b-5cc3-35f5-a9eb9e2d8755@crashcourse.ca>
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


  (aside: currently rewriting/updating about 50,000 pages of OE/YP
courseware, which explains my pedantic perusal of YP docs right now.)

  BB manual, starting at sec 1.5.2.2, regular task example reads:

  $ bitbake -c clean foo

as we know, "-c do_clean" would work just as well, but in the very
next section:

  $ bitbake myfirstrecipe:do_taskA mysecondrecipe:do_taskB

that example does require the "do_" prefix for the task names. is
there any value in drawing this distinction? do readers need to know
the difference?

rday
