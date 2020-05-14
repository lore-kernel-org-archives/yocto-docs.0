Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.9240.1589450653615843284
 for <docs@lists.yoctoproject.org>;
 Thu, 14 May 2020 03:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:47862 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jZAip-00A6fX-Lf
	for docs@lists.yoctoproject.org; Thu, 14 May 2020 06:04:12 -0400
Date: Thu, 14 May 2020 06:04:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: any issues with randomly mixing python2 and python3 modules?
Message-ID: <alpine.LFD.2.21.2005140553380.7051@localhost.localdomain>
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


  trying to be brief ... current, rather aged in-house layer (circa
morty) is having user space updated significantly (to thud or zeus or
some weird mixture of the two), and part of upgrade is to bring a
number of python modules more up to date, and add a number of new
ones.

  layer already has both python2 and python3 so there is already a mix
of modules versions, and my efforts to upgrade the python content
involve a chaotic combination of:

 - check version of same module in updated version of same layer
 - if possible, replace P2 module with P3 as long as it's equivalent
 - cast around for new modules, sometimes finding them in layers like
   meta-iot-cloud or meta-virtualization or meta-openstack or what
   have you
 - if all else fails, use "pipoe" to (generally correctly) create a
   python3 recipe file for a new module

unsurprisingly, while the end result builds and installs (still to
test), what one ends up with is quite the dog's breakfast of both P2
and P3 modules from various sources.

  question: as long as everything works, are there any potential
problems with this kind of mixing?

  associated question: given the convenience of using "pipoe" to
create the recipe files, i'm sorely tempted to just bail on trying to
find existing recipes in the OE layers, and just let pipoe do all the
work. do i really care if the module comes from somewhere other than
an "official" OE layer since, once i know it works, i can lock it down
until it needs more upgrading.

rday
