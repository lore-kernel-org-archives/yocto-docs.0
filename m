Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.16956.1604077140376334764
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 09:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:59130 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYXjt-005weU-UP; Fri, 30 Oct 2020 12:58:58 -0400
Date: Fri, 30 Oct 2020 12:58:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <foss@0leil.net>
cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
    Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [docs] possible marker cleanup: ": ::$" -> "::"
In-Reply-To: <02192FE0-FFAB-43AC-A4F1-4B779EA28991@0leil.net>
Message-ID: <7c176c2e-6196-3628-9b1a-e2ab4ede72ba@crashcourse.ca>
References: <d39d9b0-512a-d035-cd5-f6313bf41d@crashcourse.ca> <CAP71Wjy0uvFbN4+yQHOteCVef0Jb9d98U_1jM05D2pc9Bx-iDQ@mail.gmail.com> <02192FE0-FFAB-43AC-A4F1-4B779EA28991@0leil.net>
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

On Fri, 30 Oct 2020, Quentin Schulz wrote:

... snip ...

> To be honest, I don't know much about reST. I learned the very
> basics of it while doing the clean ups.

... snip ...

  i didn't appreciate that syntax either, until i tripped over it
searching on the earlier stuff, saw ": ::" at the end of a line, and
thought, "what in the name of mutt is *that*?" and then read and
figured it out.

  i'll submit another patch and, for the sake of consistency and
predictability, i'll combine the two types of cleanup based on running
simple perl commands, to do:

1) change

   ...:
   ::

   stuff

to

   ...::

   stuff	[like in my first patch]

2) change the above ": ::" to its simpler form.

the end result being the single consistent usage of "::" at the end of
the line before the literal block.

  the commit msg will be clear what commands were run to get that
effect. i'm sure this will miss the occasional corner case that
doesn't *precisely* match the two patterns above, but i can live with
that.

  stay tuned ...

rday
