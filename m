Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.7191.1619876240039375035
 for <docs@lists.yoctoproject.org>;
 Sat, 01 May 2021 06:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:58818 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lcpo7-0007eW-T0; Sat, 01 May 2021 09:37:18 -0400
Date: Sat, 1 May 2021 09:37:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] purpose of /tmp/work-shared?
In-Reply-To: <9ac2c7e224812c9709b6cfeb8ffe54a614619466.camel@linuxfoundation.org>
Message-ID: <93467da3-2b55-6e49-aa31-e44b739898e3@crashcourse.ca>
References: <1bef6f43-8b4b-468d-1f90-116f5cf4221@crashcourse.ca> <9ac2c7e224812c9709b6cfeb8ffe54a614619466.camel@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="8323328-983556839-1619876238=:22381"

--8323328-983556839-1619876238=:22381
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 1 May 2021, Richard Purdie wrote:

> On Sat, 2021-05-01 at 08:59 -0400, Robert P. J. Day wrote:
> > from:
> >
> > https://docs.yoctoproject.org/ref-manual/structure.html#build-tmp-work-shared
> >
> > "For efficiency, the OpenEmbedded build system creates and uses this
> > directory to hold recipes that share a work directory with other
> > recipes. In practice, this is only used for gcc and its variants (e.g.
> > gcc-cross, libgcc, gcc-runtime, and so forth)."
> >
> >   but some shared kernel content is also still stashed under there,
> > no? should that not be mentioned here? or have things changed?
>
> We changed the kernel to use the shared directory too, the docs
> obviously weren't updated.

  ok, i'll submit something unless someone else gets there first.

rday

--8323328-983556839-1619876238=:22381--
