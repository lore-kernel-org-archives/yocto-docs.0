Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.10544.1585919990086119660
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Apr 2020 06:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:39716 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jKMEe-00GDSY-2E
	for docs@lists.yoctoproject.org; Fri, 03 Apr 2020 09:19:49 -0400
Date: Fri, 3 Apr 2020 09:19:45 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is it worth expanding sec 3.3.6, "Unpacking Code," in dev manual?
Message-ID: <alpine.LFD.2.21.2004030852060.14582@localhost.localdomain>
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


  i am sorely tempted to expand that section in the dev manual as, in
my experience (from just this last week, in fact), a lot of people
don't understand the rationale for setting S in a recipe, what it
means, and *when* they need to set it. i would approach it this way.

  first, emphasize that, in any recipe (let's stick with tarballs), S
must have the value of where the downloaded tarball will be untarred
under WORKDIR. not where the developer *wants* it unloaded, but based
on the actual directory structure of the tarball. so if the tarball
has the internal structure of, say:

  pkg-1.0/
  pkg-1.0/... entire tarball contents ...

then S would clearly need to be set to match that. (it is curious how
many people don't seem to grasp that -- that one must examine the
downloaded content and set S to match that.)

  i would then point to the default values used in bitbake.conf:

  S = "${WORKDIR}/${BP}"
  BP = "${BPN}-${PV}"

and emphasize that, if these values are appropriate, then there is no
need to set S, while adding that many recipes might set it anyway
unnecessarily. a simple example using libxslt_1.1.34.bb (as long as i
am not misreading this):

  S = "${WORKDIR}/libxslt-${PV}"

while it seems trivial to point this out, i think it's useful since,
if beginners are trying to learn by RTFS and see the above, they may
very well think, "hang on, i thought that was the default, why is it
being set?" and conclude there must be more here than they understand
and walk away confused.

  i would next present an example that *does* require setting S;
here's libpcre2_10.34.bb:

  S = "${WORKDIR}/pcre2-${PV}"

so that drives home an instance where setting S is essential to match
the directory structure of the tarball.

  finally (and i actually used this example this week to explain S), i
would cover multiple recipe files in the same directory that are based
off the same downloaded tarball, where one has to set S individually
for each recipe file separately. the example i used was grub, where
grub2.inc establishes the single SRC_URI:

  SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz

wherein the default value of S is fine for the base recipe
grub_2.04.bb, but is *not* for grub-efi_2.04.bb, which needs to set it
explicitly to match the very same tarball structure:

  S = "${WORKDIR}/grub-${PV}"

i used this example earlier this week, and there was that moment of
"AHA" when the person finally understood the proper usage of S.

  finally (you hope), cover the case where the downloaded tarball has
no top-level directory structure where everything is dumped straight
into WORKDIR, in which case one needs to:

  S = ${WORKDIR}

lots of examples of that, i can pick something simple.

  is this too much for that section? is there a better place for it?

rday

