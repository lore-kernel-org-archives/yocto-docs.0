Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.7706.1604133741779987595
 for <docs@lists.yoctoproject.org>;
 Sat, 31 Oct 2020 01:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:56570 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYmSp-009HiM-Mv
	for docs@lists.yoctoproject.org; Sat, 31 Oct 2020 04:42:20 -0400
Date: Sat, 31 Oct 2020 04:42:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: what is with the use of anonymous hyperlinks used for regular hyperlinks?
Message-ID: <d4ec497b-6647-b2ec-c1d2-d6b387223f19@crashcourse.ca>
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


  another oddity in the .rst files ... i note the use of what look
like anonymous hyperlinks where regular hyperlinks are used, like in
overview-manual/overview-manual-yp-intro.rst (note the trailing
double underscores which typically denote "anonymous" hyperlinks):


For further introductory information on the Yocto Project, you might
be
interested in this
`article
<https://www.embedded.com/electronics-blogs/say-what-/4458600/Why-the-Yocto-Project-for-my-IoT-Project->`__
by Drew Moseley and in this short introductory
`video <https://www.youtube.com/watch?v=utZpKM7i5Z4>`__.


  as i read it, the double underscore defines an anonymous hyperlink
as explained here:

https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#anonymous-hyperlinks

those hyperlinks above look like regular hyperlinks, and removing one
of those underscores doesn't seem to affect the output. so is there
some magic with those double underscores that isn't immediately
obvious?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
