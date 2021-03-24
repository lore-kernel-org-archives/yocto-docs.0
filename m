Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.5599.1616590959168113025
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 06:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:58410 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lP39h-003Xj9-K7
	for docs@lists.yoctoproject.org; Wed, 24 Mar 2021 09:02:38 -0400
Date: Wed, 24 Mar 2021 09:02:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: trying to clarify meaning of ASSUME_PROVIDED
Message-ID: <23422e6f-1232-0e1-a2aa-5e85af3d493@crashcourse.ca>
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


  i've asked about this before, but i'd like to really nail this down
and perhaps update the documentation.

  current definition of ASSUME_PROVIDED in ref manual:

"Lists recipe names (PN values) BitBake does not attempt to build.
Instead, BitBake assumes these recipes have already been built.

"In OpenEmbedded-Core, ASSUME_PROVIDED mostly specifies native tools
that should not be built. An example is git-native, which when
specified, allows for the Git binary from the host to be used rather
than building git-native."

  re: that first paragraph, what does it mean to say that BB assumes
these recipes have already been built? does that mean that, without
building that recipe, the build should expect to find on the host
*all* of the executables that should have been produced by the native
build of the recipe?

  for example, consider recipe "zip," which produces four executables:
zip, zipnote, zipcloak and zipsplit. if i add "zip-native" to
ASSUME_PROVIDED, am i implicitly stating that the host is expected to
provide all four of the executables that would have come from
zip-native? and note that, on the host, even if those four executables
exist, it's possible they came from a package or packages other than
"zip."

  in short, if i ASSUME_PROVIDED "fubar-native", am i saying nothing
more than, "all of the executables that would have been provided by
building and installing fubar-native exist on the host, regardless of
how they got there"?

rday
