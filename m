Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.8194.1615813556667698091
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Mar 2021 06:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:48818 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lLmux-00ASS1-3u
	for docs@lists.yoctoproject.org; Mon, 15 Mar 2021 09:05:55 -0400
Date: Mon, 15 Mar 2021 09:05:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Description of BBPATH in BB user manual seems ... wrong
Message-ID: <ff1a51a0-8f8d-13c-5bf3-e833a1b79e5e@crashcourse.ca>
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
Content-Type: multipart/mixed; boundary="8323328-1993496012-1615813555=:37514"

--8323328-1993496012-1615813555=:37514
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  Section 3.4.1 of BB manual:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#locating-include-and-class-files

"BitBake uses the BBPATH variable to locate needed include and class
files. Additionally, BitBake searches the current directory for
include and require directives.

... snip ..

"In order for include and class files to be found by BitBake, they
need to be located in a “classes” subdirectory that can be found in
BBPATH."

  first, is BBPATH not used for finding conf files as well? and the
wording of that second paragraph suggests that include files need to
be in a classes subdirectory to be found, which i'm pretty sure isn't
true.

  thoughts?

rday

--8323328-1993496012-1615813555=:37514--
