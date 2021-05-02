Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.18887.1619952011872665143
 for <docs@lists.yoctoproject.org>;
 Sun, 02 May 2021 03:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:35410 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ld9WD-0004Ga-TI
	for docs@lists.yoctoproject.org; Sun, 02 May 2021 06:40:10 -0400
Date: Sun, 2 May 2021 06:40:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: can the docs de-emphasize running oe-init-build-env in source directory?
Message-ID: <ed5858a2-981b-ead4-71ab-7b4c31fbcb53@crashcourse.ca>
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


  currently working on:

http://docs.yoctoproject.org/sdk-manual/appendix-obtain.html#building-an-sdk-installer

and i read:

"3. Initialize the Build Environment: While in the root directory of
the Source Directory (i.e. poky), run the oe-init-build-env
environment setup script to define the OpenEmbedded build environment
on your build host..."

  is it worth rewording certain passages to encourage developers to
create their build directories somewhere other than the source
directory? i can't remember the last time i initialized my build
directory in the source directory.

  thoughts?

rday
