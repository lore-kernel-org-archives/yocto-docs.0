Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.26308.1588523793480470043
 for <docs@lists.yoctoproject.org>;
 Sun, 03 May 2020 09:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:49690 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jVHbT-00AoGI-Kq
	for docs@lists.yoctoproject.org; Sun, 03 May 2020 12:36:32 -0400
Date: Sun, 3 May 2020 12:36:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: correspondence between HOSTTOOLS and ASSUME_PROVIDED?
Message-ID: <alpine.LFD.2.21.2005030952320.25550@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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


  (wanting to clarify the precise behaviour involving both HOSTTOOLS
and ASSUME_PROVIDED.)

  just want to make sure this stuff is explained properly in the docs,
as it has the potential to be confusing.

  first, in the current reference manual in the variables glossary,
one reads:

"HOSTTOOLS: A space-separated list (filter) of tools on the build host
that should be allowed to be called from within build tasks..."

  that seems a bit vague ... as i read it, it's not so much that those
native commands "*should* be allowed to be called" so much as it is
that those are the native tools that *must* exist on the host and,
furthermore, they are the ones that *will* be invoked even if the
corresponding providing native recipe is built that provides the same
command, is that right?

  and, second, it seems that if one wants to play with those variables
(admittedly unusual), then one has to make sure they stay in sync in
the following way.

  HOSTTOOLS represents simply individual *commands* that have to be
natively available, while ASSUME_PROVIDED identifies entire native
*recipes* that are being told not to build, which means that if a
certain native recipe is not built, quite a number of native commands
might suddenly be unavailable.

  as a simple example, ASSUME_PROVIDED identifies "findutils-native"
as a recipe that should not be built. as it is, that recipe provides
two native commands of interest: "find" and "xargs". so given that the
build process really needs both of those commands, it is not
surprising that both of those are listed in HOSTTOOLS, which requires
them to exist natively.

  now, if someone had neglected to mention "xargs" in HOSTTOOLS, as i
read it, a build would fail if xargs was invoked natively even if such
a command existed on the build host. that is, once one identifies
findutils-native to ASSUME_PROVIDED, then one is *required* to have
the necessary commands on the build host, *and* list them in HOSTTOOLS
so that they are found.

  do i have this about right?

rday
