Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.15094.1630319090535157766
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 03:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37226 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKeTA-0003Xc-Um
	for docs@lists.yoctoproject.org; Mon, 30 Aug 2021 06:24:49 -0400
Date: Mon, 30 Aug 2021 06:24:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "Both of these options are not seen in the majority of recipes."?
Message-ID: <fd8e2f61-5a11-9c59-d40-c37c4e84693f@crashcourse.ca>
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


  in section:

https://docs.yoctoproject.org/dev-manual/common-tasks.html#recipe-syntax

in Functions section:

"It is also possible to implement new functions that are called
between existing tasks as long as the new functions are not replacing
or complementing the default functions. You can implement functions in
Python instead of shell. Both of these options are not seen in the
majority of recipes."

  that last sentence seems ... backwards? how should one read it?

rday
