Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.34692.1620052244864477172
 for <docs@lists.yoctoproject.org>;
 Mon, 03 May 2021 07:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:46386 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ldZas-0002T3-Rz; Mon, 03 May 2021 10:30:43 -0400
Date: Mon, 3 May 2021 10:30:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] sdk-manual: various cleanups to intro.rst
In-Reply-To: <600b21c7-859d-ae19-4d2d-19e3807a79d9@bootlin.com>
Message-ID: <73edbf27-7a4a-b1ab-a674-c89483566336@crashcourse.ca>
References: <f8833f4-34ab-98d2-ede1-881bf279ee60@crashcourse.ca> <BB89D528-4B9B-4E2A-808E-F679154865B2@0leil.net> <600b21c7-859d-ae19-4d2d-19e3807a79d9@bootlin.com>
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

On Mon, 3 May 2021, Michael Opdenacker wrote:

> Hi Robert,
>
> Thanks for these improvements!
>
> On 5/1/21 9:11 PM, Quentin Schulz wrote:
> >
> >> Welcome to the Yocto Project Application Development and the Extensible
> >> -Software Development Kit (eSDK) manual. This manual provides information
> >> -that explains how to use both the Yocto Project extensible and standard
> >> +Software Development Kit (eSDK) manual. This manual
> >> +explains how to use both the Yocto Project extensible and standard
> >> SDKs to develop applications and images.
>
> Actually, I caught multiple ones like this while reading the manuals
> (still ongoing work). I'll submit more such improvements. Sometimes
> the style is too verbose indeed.

  i've noticed the prevalence of unnecessary prose in lots of places.
example:

  "To frobnicate the fubar, run the following command:"

when it should say simply:

  "To frobnicate the fubar, run:"

and so on.

  i can't remember who said it, but some literary giant once said
something like, "half my time is spent writing, the other half
throwing away what shouldn't be there."

rday
