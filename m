Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.628.1616602012978323153
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 09:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:59084 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lP61z-0047f9-61
	for docs@lists.yoctoproject.org; Wed, 24 Mar 2021 12:06:52 -0400
Date: Wed, 24 Mar 2021 12:06:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: HOSTTOOLS and HOSTTOOLS_NONFATAL and ASSUME_PROVIDED
Message-ID: <f76e5093-205a-5e1f-6da2-4658dcf23bd@crashcourse.ca>
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


  following up (briefly?) on richard's last post, a question or two
about HOSTTOOLS, whose ref manual entry reads:

"A space-separated list (filter) of tools on the build host that
should be allowed to be called from within build tasks. Using this
filter helps reduce the possibility of host contamination. If a tool
specified in the value of HOSTTOOLS is not found on the build host,
the OpenEmbedded build system produces an error and the build is not
started."

  i would first suggest that that opening sentence is a bit wussy ...
it's not so much that the listed tools "should be allowed to be
called", it's more, "here are the individual tools that absolutely
must exist on the host or you're not going anywhere." yes, i realize
the end of that entry gets around to that, but that should be
emphasized from the beginning. i might even throw in a link for the
reader to here:

https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#required-packages-for-the-build-host

  also, the required presence of those tools on the host is totally
independent of whatever ASSUME_PROVIDED is set to; the
setup_hosttools_dir() routine in base.bbclass has no interest in the
value of ASSUME_PROVIDED. so even if some of those tools had been
built natively by the OE build, they would be ignored entirely. and
these required host tools are supported by symlinking from
${HOSTTOOLS_DIR}. so far, so good.

  as i read it, the difference with HOSTTOOLS_NONFATAL is that, if the
tool *does* exist on the host, that's the one that will be called
(again, via linking from ${HOSTTOOLS_DIR}). if it doesn't, then that
tool had better have been built natively as part of the build,
correct? seems obvious, but just checking.

  last part -- it only makes sense that if ASSUME_PROVIDED identifies
a recipe that should not be built, then HOSTTOOLS had better identify
whatever executables from that recipe that should be available on the
host. in short, ASSUME_PROVIDED and HOSTTOOLS do need to make some
effort to stay at least moderately in sync (as is being done now).

  i'm only yammering on about this, as the layer i'm perusing right
now has some *very* odd settings for these variables, suggesting the
people who set it up didn't quite understand how those variables
worked. at least not fully.

rday
