Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.13342.1604228736806866647
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Nov 2020 03:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:49048 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kZBB1-00ERgx-06
	for docs@lists.yoctoproject.org; Sun, 01 Nov 2020 06:05:35 -0500
Date: Sun, 1 Nov 2020 06:05:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: adding some semantic markup back into .rst files
Message-ID: <19b4d4c8-7bfe-4096-8ed-d82e61487bc2@crashcourse.ca>
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


  one of the things that i liked about docbook was the semantic markup
that could be customized for individual tags, such that a <filename>
could be rendered differently from a <command> using XSLT stylesheets
and so on. at the moment, things like that are all lumped together in
the .rst files by marking them up with ``blah`` double backquotes,
losing all that distinction. it wouldn't be hard to put back just a
*little* of those semantics by using the more obvious roles.

  there are two roles for marking up commands:

  :command:
  :program:

the distinction appears to be that a :command: is meant to represent
an OS-level command to be typed literally, such as "ls" or "rm". OTOH,
a :program: should represent an executable program whose name could
differ based on the OS, so that you would type:

  :program:`sphinx-build`

even if the actual name of the program on Windows was
"sphinx-build.exe"; that is what i would think you would use to mark
up, say, :program:`devtool upgrade`. currently, there doesn't appear
to be any difference in the rendering, but it at least leaves open the
possibility for the future, and in terms of possibly
cross-referencing commands.

  a third role i think would be useful is :dfn: which is used to mark
the "defining instance" of a term -- it appears to be equivalent to
docbook's "firstterm" tag. this does *not* automatically generate an
index entry, but i suspect it could be used for exactly that if one
wanted.

  finally, there is :file: for filenames, which currently is being
rendered the same as marking up with ``, but has the additional cool
feature that, if you use {...} in a filename, what is inside the {} is
rendered as docbook's equivalent of "replaceable", to show that it is
meant to be filled in (currently rendered as bold italic). as an
example of that, in the dev-manual (common tasks section), section
3.5.2, there is the expression:

  ``${BUILDDIR}/conf/bblayers.conf``

using :file: would most likely look like:

  :file:`{BUILDDIR}/conf/layers.conf`

that's getting fancy, but it is a neat feature.

  in any event, i think taking advantage of at least the more obvious
roles would be useful for down the road. thoughts?

rday
