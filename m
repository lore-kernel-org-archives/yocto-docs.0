Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.27241.1623658229927213516
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4G3PJZ4T9dz5tlM;
	Mon, 14 Jun 2021 10:10:22 +0200 (CEST)
Date: Mon, 14 Jun 2021 10:10:21 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	"Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
Message-ID: <20210614081021.zoh3ph7mgtjuui5u@qschulz>
References: <16872EDF3FBC0621.15202@lists.yoctoproject.org>
 <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
 <CAP71Wjyy=KM+EFt69rMg5vGJwS6xiG8tsFHfZ_eTZLhjg5vhWA@mail.gmail.com>
 <168736F45421387B.20336@lists.yoctoproject.org>
 <63f24dc7-4fbf-6543-6e1d-8eadfe3cd338@bootlin.com>
 <59c947fa6fc26b984a54b9b781367e41360a713b.camel@linuxfoundation.org>
 <3cd15f0a-5a79-13e0-d44a-e7d8872cc285@bootlin.com>
 <20210611172430.3ozoucxrbzkdtikd@qschulz>
 <16879940C9237AEB.32248@lists.yoctoproject.org>
 <4f3eab88-a3c2-f386-1cdb-f775785afe5f@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <4f3eab88-a3c2-f386-1cdb-f775785afe5f@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Mon, Jun 14, 2021 at 10:05:31AM +0200, Michael Opdenacker wrote:
> Hi Quentin,
> 
> On 6/11/21 8:04 PM, Michael Opdenacker wrote:
> > HI Quentin,
> >
> > On 6/11/21 7:24 PM, Quentin Schulz wrote:
> >> I can't. I only have a fileserver webpage on which I can click on ../
> >> which redirects me to http://docs.yoctoproject.org/
> > Oops, maybe because my "master-next" branch was broken until 15 minutes
> > ago. This is fixed now but the autobuilder may need time to update the
> > contents.
> >
> > Thanks for the notification.
> 
> 
> That's fixed now if you're interested in having a look:
> https://docs.yoctoproject.org/next/

I was about to say that it finally works now, it didn't over the
week-end.

Thanks for the update!

I was wondering if it made more sense to pick more expressive words for
"current" and "previous" release manuals. Something like
maintained/unmaintained for example? Or... EOL/outdated for the second
kind?

Also, I would move the release number after the release name, because
it's the place where you usually have section number in e.g. Reference
Manual in the navigation panel.

In any case, looks already great to me!
Thanks Michael!
Cheers,
Quentin
