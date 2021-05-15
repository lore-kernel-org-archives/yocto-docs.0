Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.4164.1621071786677010997
 for <docs@lists.yoctoproject.org>;
 Sat, 15 May 2021 02:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:34400 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lhqp7-00080M-9c
	for docs@lists.yoctoproject.org; Sat, 15 May 2021 05:43:05 -0400
Date: Sat, 15 May 2021 05:43:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: wanting to clarify "FILES_*" and wildcarding
Message-ID: <358d7961-9a28-8fce-adb4-54e54021270@crashcourse.ca>
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


  i just got burned by the way someone defined the constitution of
packages for an internal recipe a while back because of the way they
claim to have read the documentation, so i want to clarify a couple
things about what can be assigned to the variations of "FILES_*", and
i might submit a patch to be emphatic about how things work.

  so here:

http://docs.yoctoproject.org/ref-manual/variables.html#term-FILES

the glossary entry does mention Python's glob syntax for wildcarding,
but muh colleague wasn't sure how that applied to directory names, and
arbitrarily switched back and forth between:

  FILES_${PN} += "/bin"
  FILES_${PN} += "/bin/*"

thinking those were equivalent, and in a lot of cases, they would be,
but the second variant would not pick up any hidden objects like
".debug", correct? which is why the build just exploded when it was
extended to start adding static libraries -- the first variant was
being used and all of the static libs were suddenly being added to the
base package and bad things happened. so is the fundamental difference
between those two variants the processing of hidden files and nothing
else?

  second minor observation is that the current assignments use
hard-coded names -- /bin instead of, say, ${bindir} -- so i'm going to
note people shouldn't do that.

  last thing that truly caused trouble was someone thinking you needed
to define the files list one directory level at a time, as in, to
include the shared libs:

  FILES_${PN} = "/usr"
  FILES_${PN} += "/usr/lib64"
  FILES_${PN} += "/usr/lib64/lib*.so*"

i'm not sure where someone got the idea that you needed to do this one
directory at a time as, since inclusion works recursively, that first
assignment picks up all of /usr, and that also caused grief as soon as
static libs were added to the build.

  i see nothing in the current definition of FILES that would inspire
anyone to do this, but maybe it's worth adding to the "Note" a caution
against doing that.

  thoughts? then i'll submit a patch.

rday
