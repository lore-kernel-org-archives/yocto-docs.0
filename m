Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.773.1630177678772587918
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Aug 2021 12:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:45282 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mK3gL-0001Zy-1I; Sat, 28 Aug 2021 15:07:57 -0400
Date: Sat, 28 Aug 2021 15:07:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] are autobuilder links in dev manual correct?
In-Reply-To: <82b20807-d987-e29e-4a9d-c8c5cf1ff524@gmail.com>
Message-ID: <143d69bc-fc7-71e6-f073-2757606859de@crashcourse.ca>
References: <169F8C1A79CD3C8C.14757@lists.yoctoproject.org> <2fd1d1b-e04c-cfc7-53cd-63352de2c21e@crashcourse.ca> <82b20807-d987-e29e-4a9d-c8c5cf1ff524@gmail.com>
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
Content-Type: text/plain; charset=US-ASCII

On Sat, 28 Aug 2021, Khem Raj wrote:

>
>
> On 8/28/21 11:36 AM, Robert P. J. Day wrote:
> > On Sat, 28 Aug 2021, Robert P. J. Day wrote:
> >
> >>    here:
> >>
> >> file:///home/rpjday/oe/dist/layers/yocto-docs/documentation/_build/html/dev-manual/start.html#accessing-nightly-builds
> >>
> >> the autobuilder links in that section don't work for me, what should
> >> they be?
> >
> >    sorry, erroneously added link for local build, here it is again:
> >
> > http://docs.yoctoproject.org/dev-manual/start.html#accessing-nightly-builds
> >
>
> I am not sure if there is any nightly links like they are documented see
> https://autobuilder.yocto.io/pub/
>
> perhaps it should talk about
> https://autobuilder.yoctoproject.org/typhoon/#/builders perhaps.

  that's what i thought after a couple minutes poking around ... can
anyone confirm one way or the other?

rday
