Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.6175.1603964148076594648
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 02:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:60332 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kY4LS-00H54n-Cy; Thu, 29 Oct 2020 05:35:46 -0400
Date: Thu, 29 Oct 2020 05:35:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: Quentin Schulz <foss@0leil.net>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] adding more glossary links in the glossary
In-Reply-To: <CAP71WjxjpKNusUURNydfrTg4G0G0BQUaEq9J4vTmDE2c4xA1bA@mail.gmail.com>
Message-ID: <336c445d-a1d-081-7d1a-c6f62bcceb72@crashcourse.ca>
References: <df8f2d4e-30c5-d267-dbae-a67aaf4bcc6@crashcourse.ca> <C5C2A97D-AC35-4DB6-B87B-BDD016352296@0leil.net> <8f84fc1d-714e-aea1-5afd-7e667c1979b@crashcourse.ca> <CAP71WjxjpKNusUURNydfrTg4G0G0BQUaEq9J4vTmDE2c4xA1bA@mail.gmail.com>
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

On Thu, 29 Oct 2020, Nicolas Dechesne wrote:

... snip ...

> This specific syntax bothers me a lot.. one reason we moved to
> Sphinx was to have 'simple' documentation source and this specific
> syntax is horrifying.. if it's a pattern we use a lot, perhaps we
> should create a custom role for that, like :term2: for example, so
> that :term2:`PACKAGES` would add the ${} and the fixed-font
> rendering.

... snip ...

  ah, irony ... while sphinx is so much easier to write, the one thing
i truly miss about docbook/XML is the semantic markup, which is
exactly what you're proposing. :-) again, i missed a lot of the recent
discussion on this list, being coincidentally buried in yocto project
work, but it seems that a simple solution would be to restore just a
wee bit of that semantic markup as above by defining, say "glossterm":

  :glossterm:`PACKAGES`

and let sphinx take it from there.

  that could be a massively stupid suggestion as i'm still perusing
the sphinx docs to truly understand how it works.

rday
