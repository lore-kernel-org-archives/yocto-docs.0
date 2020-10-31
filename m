Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.2886.1604164948457072162
 for <docs@lists.yoctoproject.org>;
 Sat, 31 Oct 2020 10:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:48038 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYuaA-00B0yV-Mw
	for docs@lists.yoctoproject.org; Sat, 31 Oct 2020 13:22:27 -0400
Date: Sat, 31 Oct 2020 13:22:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: any reason for relative "../" in :doc:`../<manual-name>/...`?
Message-ID: <28aabb6-01-4ca8-2c64-f76b7ecf5a8f@crashcourse.ca>
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


  just noticed numerous :doc: items in, for example, ref-manual/
directory that use "../" as a relative location, as in:

resources.rst:-  :doc:`../sdk-manual/sdk-manual` *manual :* This
resources.rst:-  :doc:`../bsp-guide/bsp` *:* This guide defines the structure
resources.rst:-  :doc:`../kernel-dev/kernel-dev` *:* This manual describes
resources.rst:-  :doc:`../ref-manual/ref-manual` *:* This

i'm fairly sure you can write those with absolute pathnames, as in:

resources.rst:-  :doc:`/sdk-manual/sdk-manual` *manual :*

this would seem to be more stable just in case some .rst files are
moved around. thoughts? it appears that the underlying HTML generated
in either case is identical, unless i screwed something up.

rday
