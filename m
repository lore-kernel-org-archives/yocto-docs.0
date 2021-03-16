Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.7815.1615899600781188095
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 06:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:50358 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lM9Il-00G1WZ-7q
	for docs@lists.yoctoproject.org; Tue, 16 Mar 2021 08:59:59 -0400
Date: Tue, 16 Mar 2021 08:59:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: wisdom of multiple BBFILE_PATTERN_* example in BB user manual
Message-ID: <91803038-3794-aef9-af8e-4128f8a52af5@crashcourse.ca>
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


  not sure why i never noticed this before, but in BB user manual:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#locating-and-parsing-recipes

there's this weird example for layer.conf:

  BBFILES = "/stuff/openembedded/*/*.bb /stuff/openembedded.modified/*/*.bb"
  BBFILE_COLLECTIONS = "upstream local"
  BBFILE_PATTERN_upstream = "^/stuff/openembedded/"
  BBFILE_PATTERN_local = "^/stuff/openembedded.modified/"
  BBFILE_PRIORITY_upstream = "5" BBFILE_PRIORITY_local = "10"

rendering issue in the last line aside, is using multiple
BBFILE_PATTERN settings in a single layer definition a good idea? i'm
unaware of that being used in any layer i've ever seen, and it seems
that, if one is writing for newbies, the last thing you want to do is
present something truly obscure like that.

  thoughts?

rday
