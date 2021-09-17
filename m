Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.2068.1631901587583735311
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Sep 2021 10:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:59130 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mRI9L-00075Q-Sr
	for docs@lists.yoctoproject.org; Fri, 17 Sep 2021 13:59:46 -0400
Date: Fri, 17 Sep 2021 13:59:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: explanation of PACKAGE_DEBUG_SPLIT_STYLE seems confusing
Message-ID: <ad2dbd34-b35-d0bd-fc56-84d979a25e4c@crashcourse.ca>
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
Content-Type: multipart/mixed; boundary="8323328-1126516496-1631901585=:313087"

--8323328-1126516496-1631901585=:313087
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  regarding this:

http://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_DEBUG_SPLIT_STYLE

i waqs digging into it in detail for the first time, and that
explanation seems misleading.

  first, "Determines how to split up the binary and debug information
when creating *-dbg packages ..." but further down, it explains how,
depending on what you select, some stuff might be placed in a separate
"-src" package. so saying that this variable relates to only creating
a "-dbg" package is already slightly misleading, no? perhaps a better
opening line might be, "this variable determines how content is
apportioned between the -dbg and -src packages."

  also, "“debug-without-src”: The same behavior as “.debug” previously
described with the exception that no source files are installed." but
this is just a packaging step, isn't it? it has no effect on what
is "installed" -- that decision is controlled elsewhere.

  i'm about to jump into the code, but is it fair to say that this
variable controls exclusively the *packaging* of both source and
debug information? regardless of what one chooses to install later?

rday

--8323328-1126516496-1631901585=:313087--
