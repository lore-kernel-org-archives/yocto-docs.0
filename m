Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.41345.1584917124895440444
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Mar 2020 15:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:41408 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jG9LP-004pX9-Bt
	for docs@lists.yoctoproject.org; Sun, 22 Mar 2020 18:45:23 -0400
Date: Sun, 22 Mar 2020 18:45:20 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: incomplete description of tmp/work-shared in ref manual
Message-ID: <alpine.LFD.2.21.2003221841520.2606881@localhost.localdomain>
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


  working my way throught the ref manual, and this section looks
incomplete:

"5.2.24. build/tmp/work-shared/

"For efficiency, the OpenEmbedded build system creates and uses this
directory to hold recipes that share a work directory with other
recipes. In practice, this is only used for gcc and its variants (e.g.
gcc-cross, libgcc, gcc-runtime, and so forth)."

  pretty sure this is incomplete as work-shared also contains:

  <target>/
    kernel-build-artifacts/
    kernel-source/

should that be added to that paragraph (assuming yes), and is there
anything else that ever ends up under work-shared? (i am not aware of
that, but i'm willing to be corrected.)

  will submit patch to fix this once i finalize the fix.

rday

