Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.5230.1630486603195487068
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 01:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:47336 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mLM2x-0004Yo-Hk
	for docs@lists.yoctoproject.org; Wed, 01 Sep 2021 04:56:42 -0400
Date: Wed, 1 Sep 2021 04:56:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: did we ever resolve whether sphinx supported "replaceable" markup?
Message-ID: <8b9f384e-81ad-9fdf-a096-e66183284720@crashcourse.ca>
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


  longer ago than i care to remember, i mentioned that one thing i
missed about docbook was the notion of the <replaceable> markup, which
emphasized that something was merely a placeholder for an actual
value -- this was normally rendered in italics.

  i ask since it would be nice to have the same thing, since in the
dev manual i am currently proofing, there's this code snippet:

  $ source oe-init-build-env [build_dir]

where "[]" is clearly meant to imply replaceable, and yet, only a few
lines further down:

  $ bitbake target

where "target" is also clearly meant to be replaceable, but there is
no markup to imply that, so it's kind of inconsistent.

  i'm guessing there's no easy way to do this, other than perhaps to
define another sphinx directive if it seems worth it.

rday
