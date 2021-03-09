Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.6528.1615283938850976502
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 01:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:44868 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lJZ8i-000619-Ek
	for docs@lists.yoctoproject.org; Tue, 09 Mar 2021 04:58:57 -0500
Date: Tue, 9 Mar 2021 04:58:54 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: rendering double dashes more emphatically
Message-ID: <b1323c30-5681-20cc-af2b-e38f56c1d22f@crashcourse.ca>
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


  reading bitbake user manual and, in section 1.5.2.2:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-tasks-against-a-set-of-recipe-files

in the first line of the second paragraph, the distinction between a
single dash and a double dash seems to be pretty vague since, by
default, i believe sphinx renders a double dash as simply an "em", so
visually, it's just not as clear as it could be.

one possible fix is to mark up stuff like that with ``...``, since it
seems it should be monospaced content anyway, and doing that renders
double dashes nicely.

  thoughts? other options?

rday
