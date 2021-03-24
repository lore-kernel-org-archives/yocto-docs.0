Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.3578.1616580084467045145
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 03:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:57456 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lP0KJ-002zoX-1j
	for docs@lists.yoctoproject.org; Wed, 24 Mar 2021 06:01:23 -0400
Date: Wed, 24 Mar 2021 06:01:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should variable glossary include all "QB_" qemuboot variables?
Message-ID: <a82b2686-145d-5fc9-482-70e94a55339f@crashcourse.ca>
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


  i noticed a pile of "QB_"-prefixed variables related to QEMU
booting, as in:

qemuarm.conf:QB_SYSTEM_NAME = "qemu-system-arm"
qemuarm.conf:QB_MACHINE = "-machine virt,highmem=off"
qemuarm.conf:QB_CPU = "-cpu cortex-a15"
qemuarm.conf:QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
qemuarm.conf:QB_GRAPHICS = "-device VGA,edid=on"
... snip ...

  none of these are included in the current variable glossary ...
should they be?

rday
