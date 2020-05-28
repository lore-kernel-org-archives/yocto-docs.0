Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.7888.1590654235825565590
 for <docs@lists.yoctoproject.org>;
 Thu, 28 May 2020 01:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:40202 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jeDpQ-000Nos-Vo; Thu, 28 May 2020 04:23:54 -0400
Date: Thu, 28 May 2020 04:23:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: Mark Van De Vyver <mark@taqtiqa.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] Possible changes to the project docs
In-Reply-To: <CAP71WjxpZAVr8VeGv3AiRiGFscTJsRGDT6KJBaP0TEDfzUHzNQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2005280422160.515316@localhost.localdomain>
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
Content-Type: multipart/mixed; boundary="8323328-525010992-1590654232=:515316"

--8323328-525010992-1590654232=:515316
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 28 May 2020, Nicolas Dechesne wrote:

... snip ...

> The main reasons why we've started to explore/experiment with reST/Sphinx (as opposed to
> Asciidoc) are:
> 1. this is what Python uses, and our project is intimately linked to Python. Sphinx can
> be extended with plugins in Python, and we have very capable Python developers around
> here.
> 2. we've closely studied what happened in the Linux kernel community, and their thought
> process when they moved away from Docbook a couple of years ago, which is nicely
> summarized in the following articles:
> https://lwn.net/Articles/671496/ 
> https://lwn.net/Articles/692704/
> https://lwn.net/Articles/692705/
> Even though the initial plan was to move from Docbook to Asciidoc, they ended up using
> reST/Sphinx in the end. Given the proximity of the YP and kernel communities, we should
> pay close attention to what they've done.

... snip ...

  FWIW, the red hat folks working on podman/libpod docs are moving to
sphinx as well.

rday

--8323328-525010992-1590654232=:515316--
