Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.8089.1590654571167996037
 for <docs@lists.yoctoproject.org>;
 Thu, 28 May 2020 01:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:40334 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jeDur-000OUA-Pw; Thu, 28 May 2020 04:29:30 -0400
Date: Thu, 28 May 2020 04:29:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: Mark Van De Vyver <mark@taqtiqa.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] Possible changes to the project docs
In-Reply-To: <CAP71WjxpZAVr8VeGv3AiRiGFscTJsRGDT6KJBaP0TEDfzUHzNQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2005280427160.515316@localhost.localdomain>
References: <CAP71WjzD-AMauxpgbydY2fryU6+JU599UPRPXi_c582WvvfV6w@mail.gmail.com> <18306.1590644951892762393@lists.yoctoproject.org> <CAP71WjxpZAVr8VeGv3AiRiGFscTJsRGDT6KJBaP0TEDfzUHzNQ@mail.gmail.com>
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

On Thu, 28 May 2020, Nicolas Dechesne wrote:

> hi Mark,
>
> thanks a lot for joining the discussion! This is very helpful and much appreciated.

  ... snip ...

>       Considering AsciiDoc, MkDoc-Materialize, Docusarus, Sphinx and Antora
>
>       * A switch from DocBook is a net benefit regardless of what you switch too.

  the one aspect of docbook i will miss is actual semantic markup
which can then be customized with stylesheets, but that benefit is
outweighed by all the downsides of the complexity. and given that i'm
poring over the sphinx docs right now and playing with it, yeah,
sphinx is my choice. :-)

rday
