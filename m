Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.1334.1616178647249988345
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 11:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:53070 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lNJtV-00FmRf-Kp
	for docs@lists.yoctoproject.org; Fri, 19 Mar 2021 14:30:46 -0400
Date: Fri, 19 Mar 2021 14:30:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: worth emphasizing that conditional overrides are order independent?
Message-ID: <f4ead1-a14c-49d-aeb8-2a6f81d5a61@crashcourse.ca>
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


  in BB user manual, there is this example of overrides:

KBRANCH = "standard/base"
KBRANCH_qemuarm = "standard/arm-versatile-926ejs"
KBRANCH_qemumips = "standard/mti-malta32"
KBRANCH_qemuppc = "standard/qemuppc"
KBRANCH_qemux86 = "standard/common-pc/base"
KBRANCH_qemux86-64 = "standard/common-pc-64/base"
KBRANCH_qemumips64 = "standard/mti-malta64"

  fair enough, but i wonder if readers will appreciate that the final
value of KBRANCH does not depend on the order of those statements. is
it worth adding an explanation of that? since i'm betting some readers
might get the wrong impression.

rday
