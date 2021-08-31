Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.3177.1630401675609279333
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 02:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56254 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKzxC-0006IG-SZ; Tue, 31 Aug 2021 05:21:14 -0400
Date: Tue, 31 Aug 2021 05:21:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] how does one search the docs for, say "site.conf"?
In-Reply-To: <20210831091056.hvcoe47cv3xxhvgd@fedora>
Message-ID: <74269318-345d-df29-38f-de46c8ab3ef9@crashcourse.ca>
References: <b793b5cb-48cf-5dbe-dc89-f5ca7d714169@crashcourse.ca> <20210831091056.hvcoe47cv3xxhvgd@fedora>
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

On Tue, 31 Aug 2021, Quentin Schulz wrote:

> Hi Robert,
>
> On Tue, Aug 31, 2021 at 04:36:57AM -0400, Robert P. J. Day wrote:
> >
> >   on a whim, i typed "site.conf" into the search box here:
> >
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_index.html&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=1vxuZK0eEqkxMrEamqtZYAZECL495cs1IbPZJSorGVA&s=DnYrRN_mwQLyI8U40I2xvuvbFdozv2d9J6M-3S7FKtM&e=
> >
> > and i got a ton of hits matching either "site" OR "conf", and nothing
> > i did could initiate a search for the literal string "site.conf". am i
> > doing something wrong, or is this a limitation of the search process?
> >
>
> The search process is extremely bad currently. I actually don't use it
> at all. We should report it on bugzilla if not already done soo we don't forget
> about finding better implementations for sphinx searches.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14534

rday
