Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.31308.1601890823152921044
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 02:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4C4bDh75bdz5tlP;
	Mon,  5 Oct 2020 11:40:20 +0200 (CEST)
Date: Mon, 5 Oct 2020 11:40:19 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 8/8] docs: ref-manual: ref-structure: replace oe-init-build-env by &OE_INIT_FILE;
Message-ID: <20201005094019.muft3mo4fgpbfptt@qschulz>
References: <20201004085728.8015-1-foss@0leil.net>
 <20201004085728.8015-8-foss@0leil.net>
 <CAP71WjwU71MHWO7XbRsNpCV69ifdMVKjfktbr2-xFWX0Oow_BQ@mail.gmail.com>
 <20201005081055.5zuqh4d7gmibaso5@qschulz>
 <CAP71WjxOAEd5XcbEOhVJeWD7ASSozCb-jbL60oxECkQE1mWYCA@mail.gmail.com>
 <20201005081542.r4rvjnyg3ospwp2p@qschulz>
 <CAP71WjyWGpLmXhO+Cvg554FxD=c_8=XWaJqd+jXxDM_fJtwB0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjyWGpLmXhO+Cvg554FxD=c_8=XWaJqd+jXxDM_fJtwB0A@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2020 at 11:20:36AM +0200, Nicolas Dechesne wrote:
> > > Just to be consistent.. if we have a variable for it, we should use
> > > it.. though I am not convinced we needed a variable in the first
> > > place.. i am not sure we plan to change that script name often ;) so
> > > we should have OE_INIT_FILE and use it everywhere, or remove it, no?
> > >
> >
> > Indeed. Soooo? Do we remove it or nah :)?
> 
> heh.. I haven't been able to decide so far, but now that you insist
> ;-) I think we should remove OE_INIT_FILE everywhere.. and just keep
> things simple..
> 

Didn't know I had this power in my hands :D

OK, so what about this patch, do you still take it and I do a sed
s/&OE_INIT_FILE;/oe-init-build-env/ tree wide and send a patch for that?

Or do you want the sed patch before this one so we don't touch
any of the OE_INIT_FILE stuff in this patch?

Another suggestion?

Quentin
