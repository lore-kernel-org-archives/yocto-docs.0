Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.19882.1622288279859335713
 for <docs@lists.yoctoproject.org>;
 Sat, 29 May 2021 04:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:53984 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lmxHz-00DoXC-Sw
	for docs@lists.yoctoproject.org; Sat, 29 May 2021 07:37:58 -0400
Date: Sat, 29 May 2021 07:37:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: docs don't mention INIT_MANAGER variable other than YP 3.0 migration
Message-ID: <6529bc86-96be-2e2a-822-e7eee3782ce@crashcourse.ca>
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


  as it came up recently on the OE(?) list, i checked and noticed that
there is no mention of the immensely handy INIT_MANAGER variable for
selecting the init system, other than in the YP 3.0 migration section
(not even in the variables glossary):

http://docs.yoctoproject.org/ref-manual/migration-3.0.html#init-system-selection

someone want to propose where that should be described? this is the
sort of thing that would be an ideal candidate for the imminent
"variable glossary" bugzilla category.

rday
