Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.1205.1582582720068947088
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 14:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:42618 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j6M3i-006wpq-Gu
	for docs@lists.yoctoproject.org; Mon, 24 Feb 2020 17:18:39 -0500
Date: Mon, 24 Feb 2020 17:18:36 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: not sure why my patches to master-next don't include my real name
Message-ID: <alpine.LFD.2.21.2002241715440.6444@localhost.localdomain>
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


  my apologies for bugging the list with this, but i just noticed that
a couple of my patches that were applied to master-next list only my
email address (twice), and not my real name.

  earlier patches applied contain this in the log:

  Author: Robert P. J. Day <rpjday@crashcourse.ca>

but a couple recently-applied patches contain instead:

  Author: rpjday@crashcourse.ca <rpjday@crashcourse.ca>

pretty sure i haven't changed anything on my end ... i'm open to
suggestions as to how to fix this. willing to believe i screwed
something up, i just don't know what.

rday
