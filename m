Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.13794.1619906418460291383
 for <docs@lists.yoctoproject.org>;
 Sat, 01 May 2021 15:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:32838 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lcxes-0005yp-Jo
	for docs@lists.yoctoproject.org; Sat, 01 May 2021 18:00:17 -0400
Date: Sat, 1 May 2021 18:00:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: can all references to "lsb" in docs be removed?
Message-ID: <321fc26-93d6-c91b-43c4-b3f02458dfd@crashcourse.ca>
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


  in this case, i refer to sdk-manual, appendix-obtain.rst, where one
reads:

   The pre-built root filesystem image files follow these naming
   conventions::

      core-image-profile-arch.tar.bz2

      Where:
          profile is the filesystem image's profile:
                    lsb, lsb-dev, lsb-sdk, minimal, minimal-dev, minimal-initramfs,
                    sato, sato-dev, sato-sdk, sato-sdk-ptest. For information on
                    these types of image profiles, see the "Images" chapter in
                    the Yocto Project Reference Manual.

          arch is a string representing the target architecture:
                    beaglebone-yocto, beaglebone-yocto-lsb, edgerouter, edgerouter-lsb,
                    genericx86, genericx86-64, genericx86-64-lsb, genericx86-lsb and qemu*.


note the numerous references to "lsb"-related downloadable objects,
none of which seem to exist anymore. can all those lsb entries be
tossed?

rday
