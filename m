Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.14160.1629051375441302818
 for <docs@lists.yoctoproject.org>;
 Sun, 15 Aug 2021 11:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:35798 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mFKg9-0007j7-Mn
	for docs@lists.yoctoproject.org; Sun, 15 Aug 2021 14:16:14 -0400
Date: Sun, 15 Aug 2021 14:16:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: first of many questions on wic and associated documentation
Message-ID: <b94dc1e7-9ba-58c6-9236-9c89cf23f83@crashcourse.ca>
MIME-Version: 1.0
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


  as i am just beginning my adventure with the current wic
documentation, i suspect i will have many questions, so let's start
here:

http://docs.yoctoproject.org/dev-manual/common-tasks.html#requirements

  first, the docs imply that you have to manually build some packages:

  "You must build several native tools, which are built to run on the
build system:

  $ bitbake parted-native dosfstools-native mtools-native"

except that there is a "wic-tools.bb" recipe that appears to handle
that, and i'm going to assume it's called as part of the wic
processing, so that the doc seems a bit over-ambitious in what it
needs the developer to do.

  and right below that:

  "Include the name of the wic kickstart file as part of the WKS_FILE
variable"

  except that makes no mention of the WKS_FILES variable.

  thoughts?

rday
