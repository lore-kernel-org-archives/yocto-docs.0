Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.8918.1630844385403992234
 for <docs@lists.yoctoproject.org>;
 Sun, 05 Sep 2021 05:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:48448 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mMr7e-0002fQ-NH
	for docs@lists.yoctoproject.org; Sun, 05 Sep 2021 08:19:43 -0400
Date: Sun, 5 Sep 2021 08:19:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: how to simply build a common toolchain for multiple developers?
Message-ID: <257d4643-e530-45dd-819d-1d92865f983@crashcourse.ca>
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


  (sort of a "how to do this?" question, but also wondering if this is
covered in the docs so i could have found it there.)

  over the last week, two separate colleagues asked how to build a
generic aarch64 toolchain they could subsequently use for builds so
that they don't have to reproduce all that work in brand new builds,
and since it's been a while since i dug into that, i'll ask here and
make sure it's properly written up afterwards. (i think alexander k.
explained some of this before, so i'm about to dig out his earlier
post.)

  the idea is to create (i'm assuming with "bitbake -c populate_sdk
...) the appropriate SDK, then install it and use it from then on when
building other aarch64 images. the goal is a totally generic toolchain
-- no customization; that is, create the simplest toolchain that has
the widest application for developers who just want to build a new
aarch64 image.

  while i'm getting ready to build and test this very thing, i'm
going to assume that i could start with a fresh aarch64 build, and
just:

  $ bitbake -c populate_sdk core-image-minimal

that is, no customization for either host or target -- just build the
SDK .sh script, after which i can run it and install the SDK in a
common location accessible to others, after which ... what?

  if someone wanted to do a fresh (from scratch) aarch64-based build,
would they simply need to run the SDK's env setup script, then proceed
normally to take advantage of all that earlier work? or is there more
to it? it seems like a simple enough request, but i don't see it
explained in the SDK manual.

  thoughts?

rday
