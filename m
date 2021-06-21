Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.46716.1624280387517375029
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 05:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:48472 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lvJWk-008uJ4-9x
	for docs@lists.yoctoproject.org; Mon, 21 Jun 2021 08:59:46 -0400
Date: Mon, 21 Jun 2021 08:59:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should "ASNEEDED" be in the variables glossary?
Message-ID: <7b2fdc5-b939-eb82-ea82-c8d4f6e8e26@crashcourse.ca>
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


  it's not like there's a lot of it in OE-Core:

meta/recipes-support/icu/icu_69.1.bb:ASNEEDED = ""
meta/conf/bitbake.conf:ASNEEDED ?= "-Wl,--as-needed"
meta/conf/bitbake.conf:TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:ASNEEDED = ""
meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb:ASNEEDED = ""
meta/recipes-devtools/distcc/distcc_3.4.bb:ASNEEDED = ""
meta/recipes-devtools/unfs3/unfs3_git.bb:ASNEEDED = ""
meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:ASNEEDED = ""
meta/recipes-extended/quota/quota_4.06.bb:ASNEEDED = ""
meta/recipes-bsp/pciutils/pciutils_3.7.0.bb:ASNEEDED = ""

rday
