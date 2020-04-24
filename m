Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.1643.1587767322462523993
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2020 15:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:41162 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jS6oK-007SQR-Dm
	for docs@lists.yoctoproject.org; Fri, 24 Apr 2020 18:28:40 -0400
Date: Fri, 24 Apr 2020 18:28:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: looking for some rewording regarding /tmp/work-shared dir
Message-ID: <alpine.LFD.2.21.2004241825050.985420@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  ref manual, sec. 5.2.24, description of tmp/work-shared:

"For efficiency, the OpenEmbedded build system creates and uses this
directory to hold recipes that share a work directory with other
recipes. In practice, this is only used for gcc and its variants (e.g.
gcc-cross, libgcc, gcc-runtime, and so forth)."

  obviously, that should also mention kernel source and kernel build
artifacts directories as well -- i'm open to an accurate rewording, or
someone else is welcome to handle that.

rday
