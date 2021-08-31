Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.2809.1630399021467804073
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 01:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56248 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKzGO-0004RB-Oz
	for docs@lists.yoctoproject.org; Tue, 31 Aug 2021 04:37:00 -0400
Date: Tue, 31 Aug 2021 04:36:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: how does one search the docs for, say "site.conf"?
Message-ID: <b793b5cb-48cf-5dbe-dc89-f5ca7d714169@crashcourse.ca>
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
Content-Type: text/plain; charset=US-ASCII


  on a whim, i typed "site.conf" into the search box here:

https://docs.yoctoproject.org/index.html

and i got a ton of hits matching either "site" OR "conf", and nothing
i did could initiate a search for the literal string "site.conf". am i
doing something wrong, or is this a limitation of the search process?

rday

p.s. the whim was inspired by the thought that we definitely need to
promote the value of site.conf as opposed to just local.conf.
