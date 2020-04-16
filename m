Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.11892.1587059217145687592
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 10:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:51658 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jP8bH-00DzIE-Nb
	for docs@lists.yoctoproject.org; Thu, 16 Apr 2020 13:46:56 -0400
Date: Thu, 16 Apr 2020 13:46:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: docs@lists.yoctoproject.org
Subject: Re: [docs] Possible changes to the project docs
In-Reply-To: <CAP71WjxP3VE8YQo5sS43rOxWzhqhz40Zd2gkX2AGVYxNEdD8oQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2004161345410.53638@localhost.localdomain>
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org> <20200415152105.GA11838@linux-uys3> <alpine.LFD.2.21.2004161247290.35575@localhost.localdomain> <CAP71WjxP3VE8YQo5sS43rOxWzhqhz40Zd2gkX2AGVYxNEdD8oQ@mail.gmail.com>
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

On Thu, 16 Apr 2020, Nicolas Dechesne wrote:

> As I put in one of my emails before you can use my dev branch:
>
> https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=sphinx
>
> then it's just
> pip3 install sphinx
> # to use the non default theme
> pip3 install sphinx_rtd_theme
>
> cd documentation make html
>
> and it should generate exactly that on your local folder
> https://people.linaro.org/~nicolas.dechesne/yp-docs/
>
> I am happy to take patches in this branch (or create/maintain a
> contrib branch if more folks want to play/experiment and send
> patches).

  definitely need some mechanism to handle docbook entities and basic
tags like <filename> ... i'm still poring over pandoc, can it be
configured to deal with that?

  will go read more ...

rday
