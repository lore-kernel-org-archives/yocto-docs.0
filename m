Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.14329.1630313049303051425
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 01:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37212 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKctj-0005QX-Oi
	for docs@lists.yoctoproject.org; Mon, 30 Aug 2021 04:44:08 -0400
Date: Mon, 30 Aug 2021 04:44:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: virtual providers don't apply to runtime dependencies?
Message-ID: <09ae7be-46c4-ab72-542-a450f6132b5b@crashcourse.ca>
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


  in this section:

https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-virtual-providers

one reads the note:

"Virtual providers only apply to build time dependencies specified
with PROVIDES and DEPENDS. They do not apply to runtime dependencies
specified with RPROVIDES and RDEPENDS."

  except in current oe-core, there seem to be a couple examples of
that:

meta/recipes-core/systemd/systemd-bootconf_1.00.bb:RPROVIDES:${PN} +=
"virtual/systemd-bootconf"

meta/recipes-bsp/grub/grub-bootconf_1.00.bb:RPROVIDES:${PN} +=
"virtual/grub-bootconf"

  am i misreadimg something?

rday
