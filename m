Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.13796.1615315095405906126
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 10:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:47408 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lJhFF-0006lZ-9Q
	for docs@lists.yoctoproject.org; Tue, 09 Mar 2021 13:38:13 -0500
Date: Tue, 9 Mar 2021 13:38:11 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: a more precise definition of "ASSUME_PROVIDED" variable?
Message-ID: <bbaef691-7c53-12c1-4dcc-e7d9eb14c0c2@crashcourse.ca>
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


  more pedantic nitpickery, but i recall a long time back being
confused by the current definition in the BB manual about what
ASSUME_PROVIDED meant. here's part of the glossary entry for that
variable:

"In OpenEmbedded-Core, ASSUME_PROVIDED mostly specifies native tools
that should not be built. An example is git-native, which when
specified allows for the Git binary from the host to be used rather
than building git-native."

  fair enough, but a reader might interpret that as meaning that the
"git" executable command will be picked up from the host, without
appreciating that other commands might also be involved.

  as i recall (and i could be wrong), if bzip2-native is
ASSUME_PROVIDED, that means that recipe won't be built, but it would
also mean(?) that all of the *other* commands normally provided by
that package (bzdiff, bzgrep, bzmore) better also exist on the host if
they're used.

  do i understand that correctly?

rday
