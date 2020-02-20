Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.3043.1582188819814670208
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 00:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:52812 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j4haU-00BazO-7z
	for docs@lists.yoctoproject.org; Thu, 20 Feb 2020 03:53:38 -0500
Date: Thu, 20 Feb 2020 03:53:35 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "KBUILD_DEFCONFIG" description in kernel-dev manual seems wrong
Message-ID: <alpine.LFD.2.21.2002200346570.15458@localhost.localdomain>
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


  in current kernel-dev manual, section on "in-tree" defconfig file:

https://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#using-an-in-tree-defconfig-file

the example given is:

 KBUILD_DEFCONFIG_common-pc ?= "/home/scottrif/configfiles/my_defconfig_file"

but that's not an "in-tree" file, is it? i thought that variable
referred to just the file name within an existing kernel source tree,
no? the processing in kernel-yocto.bbclass certainly suggests that:

 if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then

should i submit a patch for that? perhaps steal the example from the
reference manual:

  KBUILD_DEFCONFIG_raspberrypi2 = "bcm2709_defconfig"

rday
