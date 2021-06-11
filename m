Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.632.1623432278606421983
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 10:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4G1nlM4n1Gz5tlB;
	Fri, 11 Jun 2021 19:24:31 +0200 (CEST)
Date: Fri, 11 Jun 2021 19:24:30 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	"Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
Message-ID: <20210611172430.3ozoucxrbzkdtikd@qschulz>
References: <1675A932C413C877.8243@lists.yoctoproject.org>
 <16872EDF3FBC0621.15202@lists.yoctoproject.org>
 <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
 <CAP71Wjyy=KM+EFt69rMg5vGJwS6xiG8tsFHfZ_eTZLhjg5vhWA@mail.gmail.com>
 <168736F45421387B.20336@lists.yoctoproject.org>
 <63f24dc7-4fbf-6543-6e1d-8eadfe3cd338@bootlin.com>
 <59c947fa6fc26b984a54b9b781367e41360a713b.camel@linuxfoundation.org>
 <3cd15f0a-5a79-13e0-d44a-e7d8872cc285@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <3cd15f0a-5a79-13e0-d44a-e7d8872cc285@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Fri, Jun 11, 2021 at 12:13:05PM +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> On 6/11/21 11:15 AM, Richard Purdie wrote:
> >
> >> Another question is whether "Release notes" is the right title for these
> >> migration guides, at least in the left menu. Shouldn't we just call them
> >> "Release migration guides" as they truly are, knowing that the true
> >> release notes are on
> >> https://www.yoctoproject.org/software-overview/downloads/?
> > Yes, they're migration guides, the release notes are something different.
> 
> 
> Right, thanks for confirming.
> I updated my branch and you can see the result on
> http://docs.yoctoproject.org/next/
> 

I can't. I only have a fileserver webpage on which I can click on ../
which redirects me to http://docs.yoctoproject.org/

Cheers,
Quentin
