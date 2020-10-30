Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.15141.1604070454107663130
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 08:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:58646 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYW04-005WNc-5v
	for docs@lists.yoctoproject.org; Fri, 30 Oct 2020 11:07:32 -0400
Date: Fri, 30 Oct 2020 11:07:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: possible marker cleanup: ": ::$" -> "::"
Message-ID: <d39d9b0-512a-d035-cd5-f6313bf41d@crashcourse.ca>
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


  in the midst of messing with "::" markers, i just noticed that there
is a *ton* of literal code block markers of the form:

  ... blah blah: ::

     code stuff

this seems clearly overkill as the trailing "::" obviously starts a
literal block, while the definition of the marker includes the
explanation:

  If it is preceded by whitespace, the marker is removed.

in short, this appears to be *exactly* equivalent as if you had simply
written:

  ... blah blah::

     code stuff

the apparent effect in the original being to start a literal block
while leaving the preceding colon there -- just what ending with "::"
provides. does that seem about right? one suspects there is a pile of
marker simplification could be done.

rday


