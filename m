Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.4859.1615463249369079582
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 03:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:49184 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lKJmp-0006vQ-VD
	for docs@lists.yoctoproject.org; Thu, 11 Mar 2021 06:47:28 -0500
Date: Thu, 11 Mar 2021 06:47:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: why i'm not crazy about "PROVIDES += ..." syntax, then i'll shut up
Message-ID: <eda1c715-ba9d-89dc-d96a-fb5e62d8ee2e@crashcourse.ca>
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


  yes, i appreciate the recent settling on the preferred syntax of
"PROVIDES +=" rather than "PROVIDES =", so i'll whine about why i
don't like it one more time, then i'll shut up about it (and there's a
larger point to be made here as well).

  we all know that it is necessary to use only "PROVIDES =" to *add*
extra provided entities, but the current bitbake manual makes no
mention of that explicitly; it simply shows an example of:

  PROVIDES += "fullkeyboard"

sure, that will work, and it might even make readers feel better, but
here's the problem.

  many readers like me, in order to better understand things they read
for the first time, will instantly go look in the source code for
examples as to how those things are used. i used to do that all the
time, which is why i kept stumbling over things that seemed to
disagree with what i just read, and i'd ask about it and, in many
cases, the reaction was, "huh ... you're right, that's kind of
confusing, we should clean that up."

  the same thing is going to happen here, as some readers will read
that section in the BB manual, run a quick "grep", and run into, for
example:

  systemd/systemd_247.3.bb:PROVIDES = "udev"
  udev/eudev_3.2.10.bb:PROVIDES = "udev"

and some of them will fer shure get confused about why it's "="
instead of "+=".

  IMHO, it's fine to settle on a preferred style, but not if you
deliberately omit the other possibilities. protecting the reader from
subtleties or complexities is not helping them if it simply sets them
up to be confused later. after all, if one regularly advises people to
both RTFM and RTFS, then those two things should not appear to
contradict each other.

  i will shut up now.

rday
