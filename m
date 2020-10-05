Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.30087.1601885049561056917
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 01:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4C4Y5f5s0Yz5tlB;
	Mon,  5 Oct 2020 10:04:06 +0200 (CEST)
Date: Mon, 5 Oct 2020 10:04:05 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/8] docs: ref-manual: indentation, links and highlights fixes
Message-ID: <20201005080405.6xhlbk3j5gxe3yqi@qschulz>
References: <20201004085728.8015-1-foss@0leil.net>
 <20201004085728.8015-3-foss@0leil.net>
 <CAP71WjwcYvRUE5WzWK6MADr7XxnLS9v4=h9TCCK58WcZf0MRiw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjwcYvRUE5WzWK6MADr7XxnLS9v4=h9TCCK58WcZf0MRiw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Mon, Oct 05, 2020 at 09:54:13AM +0200, Nicolas Dechesne wrote:
> > diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/ref-manual/migration-2.6.rst
> > index f16aaaa97..2f0da48ab 100644
> > --- a/documentation/ref-manual/migration-2.6.rst
> > +++ b/documentation/ref-manual/migration-2.6.rst
> > @@ -110,7 +110,7 @@ upon the older ``*proto`` recipes need to be changed to depend on the
> >  newer ``xorgproto`` recipe instead.
> >
> >  For names of recipes removed because of this repository change, see the
> > -`Removed Recipes <#migration-2.6-removed-recipes>`__ section.
> > +`Removed Recipes <#removed-recipes>`__ section.
> 
> are you sure about this one? perhaps better to use a :ref:?

90% sure, I can test again tonight at home. I think this kind of URL
works fine when using the exact name of the section iif the section is
in the same html page. Not against having :ref: instead if that's what
you want, can probably change all <#.*> to their proper :ref: so that
Sphinx gives us a warning when the ref does not exit.

Quentin
