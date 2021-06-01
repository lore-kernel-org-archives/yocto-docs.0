Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.55945.1622544687899930494
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jun 2021 03:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-52-70-26-112-209.dsl.bell.ca ([70.26.112.209]:41574 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lo1zb-00D9nP-EC; Tue, 01 Jun 2021 06:51:26 -0400
Date: Tue, 1 Jun 2021 06:51:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] a really robust "how to get started with YP" document?
In-Reply-To: <CAP71WjxjRhHc=pUP7B=DcjAMJ-17HbAbR-aMA7D3AgERO2SYiA@mail.gmail.com>
Message-ID: <af98db1d-aad3-86e2-55a5-b11d47ae286f@crashcourse.ca>
References: <2cf4a272-2d45-1ce9-3813-8e1bb69cd3c@crashcourse.ca> <CAP71WjxjRhHc=pUP7B=DcjAMJ-17HbAbR-aMA7D3AgERO2SYiA@mail.gmail.com>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="8323328-358048406-1622544685=:7813"

--8323328-358048406-1622544685=:7813
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 1 Jun 2021, Nicolas Dechesne wrote:

... snip ...

> Have you checked:
> https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html
>
> Should we not try to improve this existing document instead?  

  oh, i'm aware of that page, i still don't think it matches what i'm
talking about. i'd make one distinction, and that's between what
someone *must* do to use YP, as opposed to really good workflow
practice to use after that.

  for example, that page talks about how to make sure you have a
compatible linux distro. well, sure, but you *have* to do that, you
don't have a choice. so i'd try to distinguish between:

  1) initial setup *required* to use YP, as opposed to
  2) subsequent good practice that might take years to learn

i see those as two different topics. i will think more on this.

rday

--8323328-358048406-1622544685=:7813--
