Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.55798.1622543686414506890
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jun 2021 03:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:41572 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lo1jR-00D5zz-Nq
	for docs@lists.yoctoproject.org; Tue, 01 Jun 2021 06:34:45 -0400
Date: Tue, 1 Jun 2021 06:34:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: a really robust "how to get started with YP" document?
Message-ID: <2cf4a272-2d45-1ce9-3813-8e1bb69cd3c@crashcourse.ca>
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


  yes, there's a "getting started" page or two, but i was perusing the
docs recently, and was reminded of the "stuff i wish i'd known" page:

  https://docs.yoctoproject.org/what-i-wish-id-known.html

and remember thinking, "what a cool idea," then thought about it a bit
longer and realized i was looking at it the wrong way. if we actually
think we need a page along the lines of "hey, even though you've been
using YP for a while, here's a bunch of stuff we *could* have told you
long ago to make your life easier but we didn't and now you have to go
back and change stuff to take advantage of it," well, maybe we didn't
prepare people properly in the first place.

  i'm thinking of a really robust, complete, industrial-grade
introduction to YP that lays out *everything* a new user should know
if they're about to immerse themselves. i don't mean, "hey, i want to
build a project to play around," i mean, "hey, i'm about to spend the
next two years on a YP contract and i really need to make sure i'm
doing stuff the right way to be as productive as possible."

  one oversight that i always talk about is how to set up your entire
build directory infrastructure. yes, there are lots of ways to do it,
but newcomers just want to be told what seems to work for most
accomplished YP developers so they can set it up and get to work,
confident they won't need to go back and do it all over again.

  here's a really trivial example -- i've had people who've used YP
for at least a couple years say, "wait ... there's a 'site.conf' file
that i could have been putting all this common stuff in all this
time!?!?"

  other things the truly serious developer should know -- how to use
bitbake-layers and oe-pkgdata-util. and "bitbake -e".

  anyway, you get the idea ... the idea that we think there's value in
a "stuff you wish you had known" page sort of implicitly admits that
we somehow failed to tell them about it in the first place.

  thoughts?

rday
