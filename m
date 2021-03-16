Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.9104.1615904691078489829
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 07:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:51230 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lMAcq-00GKAE-Fq; Tue, 16 Mar 2021 10:24:49 -0400
Date: Tue, 16 Mar 2021 10:24:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] wisdom of multiple BBFILE_PATTERN_* example in BB user manual
In-Reply-To: <6b7688d68105073a9f1dc1718a2f5890d9e089f8.camel@linuxfoundation.org>
Message-ID: <e4403069-aeb7-abc5-0d7-53f0d53ad360@crashcourse.ca>
References: <91803038-3794-aef9-af8e-4128f8a52af5@crashcourse.ca> <6b7688d68105073a9f1dc1718a2f5890d9e089f8.camel@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="8323328-67620824-1615904688=:20775"

--8323328-67620824-1615904688=:20775
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 16 Mar 2021, Richard Purdie wrote:

> On Tue, 2021-03-16 at 08:59 -0400, Robert P. J. Day wrote:
> >   not sure why i never noticed this before, but in BB user manual:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#locating-and-parsing-recipes
> >
> > there's this weird example for layer.conf:
> >
> >   BBFILES = "/stuff/openembedded/*/*.bb /stuff/openembedded.modified/*/*.bb"
> >   BBFILE_COLLECTIONS = "upstream local"
> >   BBFILE_PATTERN_upstream = "^/stuff/openembedded/"
> >   BBFILE_PATTERN_local = "^/stuff/openembedded.modified/"
> >   BBFILE_PRIORITY_upstream = "5" BBFILE_PRIORITY_local = "10"
> >
> > rendering issue in the last line aside, is using multiple
> > BBFILE_PATTERN settings in a single layer definition a good idea? i'm
> > unaware of that being used in any layer i've ever seen, and it seems
> > that, if one is writing for newbies, the last thing you want to do is
> > present something truly obscure like that.
> >
> >   thoughts?
>
> The collections code predates layers and in many ways is separate
> from the concept. In practise that is how most people use it today.
> The BitBake manual is intended to document the functionality so
> showing this is possible seems reasonable to me but maybe not as in
> that specific example. I'm not sure the manual is specifically
> targeted at newbies.

  ok, maybe saying the guide was for newbies was a stretch, but it's
still weird that the very first example of a layer.conf file presented
uses a construct that is clearly deprecated. i'll figure something out
and submit a patch.

rday

p.s. to go along with the above, it's also confusing that, in that
whole section about "preferences," there is an explanation about
"PREFERRED_VERSION" that nowhere mentions the importance of
BBFILE_PRIORITY in layer.conf. in fact, AFAICT, the only mention of
BBFILE_PRIORITY in the entire manual is in the variable glossary.

--8323328-67620824-1615904688=:20775--
