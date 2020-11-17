Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.10777.1605631435372957265
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 08:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:33252 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kf45B-0003JE-KP
	for docs@lists.yoctoproject.org; Tue, 17 Nov 2020 11:43:54 -0500
Date: Tue, 17 Nov 2020 11:43:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: clarifying the variations of BBMASK
Message-ID: <8eb9ab43-974b-3fa2-4335-e13e2044bb61@crashcourse.ca>
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


  as i've rarely needed to BBMASK stuff, i learned a couple things
today when a colleague brought me some masking that could use some
highlighting in the docs, methinks.

  first, all of his BBMASKing was of the form:

  BBMASK += "|layer stuff ..."

that is, every value prefixed with "|". since the bitbake user manual
does state that BBMASK supports Python REs, i guess it takes only a
few seconds to realize that you *can* do that, or just leave spaces
between patterns with:

  BBMASK += "layer stuff ..."

a more obvious observation would be for the BB manual to actually show
some examples that use "|" in a practical way, as none of the examples
there do that.

  what i did find surprising was that (apparently, and feel free to
correct me) wildcarding was automatically applied to the end of a
string. i noticed this as my colleague was trying to BBMASK a
directory named "protobuf", and specified:

  BBMASK += "|.../protobuf"

not realizing that it would also mask the sibling directory
"protobuf-rpc". the BB manual does indirectly hint at that issue,
writing, "When specifying a directory name, use the trailing slash
character to ensure you match just that directory name," but a good
example of that would be, i think, straight out of oe-core, showing
that:

  BBMASK += ".../recipes-support/libcap"

would unfortunately also BBMASK libcap-ng (hence the caution to use a
trailing slash to lock it to the directory name).

  so as long as i've understood all this, that explanation in the BB
manual seems like it could use a couple more examples. or have i
misread?

rday
