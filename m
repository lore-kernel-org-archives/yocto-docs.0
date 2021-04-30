Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.2340.1619811339650094585
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 12:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:54200 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lcYvK-0007Wj-TR
	for docs@lists.yoctoproject.org; Fri, 30 Apr 2021 15:35:38 -0400
Date: Fri, 30 Apr 2021 15:35:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: does oe-setup-builddir sed "OEROOT" in local.conf.sample?
Message-ID: <bba39023-37a-9ce8-d2f0-d53fbf61f6f8@crashcourse.ca>
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


  working through ref manual, and sec 5.2.2 claims that, regarding
local.conf.sample:

"Once the build process gets the sample file, it uses sed to
substitute final ${OEROOT} values for all ##OEROOT## values."

  i know that happens with bblayers.conf.sample (as explained in the
following section 5.2.3), but i see nothing to suggest that sed
command is run to generate a new local.conf.

  am i missing something?

rday
