Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web09.9637.1623140976151337220
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 01:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4Fzk1S24MWz5tlK;
	Tue,  8 Jun 2021 10:29:32 +0200 (CEST)
Date: Tue, 8 Jun 2021 10:29:31 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs <docs@lists.yoctoproject.org>
Subject: Re: [docs] [poky] [PATCH] README.poky: Update to switch to markdown format and update
Message-ID: <20210608082931.a4csftm445kfhzzr@qschulz>
References: <16865661A55682C8.7118@lists.yoctoproject.org>
 <3c7b1f74d4b989316e24be08db75f34720198e2d.camel@linuxfoundation.org>
 <20210607155906.3hgtcl6fsyedstrh@qschulz>
 <d986d79263894ada0e1bf2e5777419ecc6b6f18f.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <d986d79263894ada0e1bf2e5777419ecc6b6f18f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Mon, Jun 07, 2021 at 05:16:43PM +0100, Richard Purdie wrote:
> On Mon, 2021-06-07 at 17:59 +0200, Quentin Schulz wrote:
> > Hi Richard,
> > 
> > On Mon, Jun 07, 2021 at 04:36:22PM +0100, Richard Purdie wrote:
> > > Mentioning on the docs list.
> > > 
> > > I a plan is forming to migrate the various READMEs in the repos to markdown
> > > format and display these in the git web interface in the about page. If this
> > 
> > Does it need to be in MarkDown format to be displayed in the About
> > section?
> 
> No, but it does help a little and see below.
> 
> > > merges I'll work with MichaelH to make sure it displays properly on the
> > > about page.
> > > 
> > > I've had a go at improving the poky one which needed a bit of modernisation
> > > anyway. Help with others welcome.
> > > 
> > 
> > Anyway to have those two changes separate so we can properly review each
> > separately?
> 
> I can reverse engineer them back apart I guess, I just couldn't bring myself
> to leave it as it was as it needed reformatting and so on anyway.
> 

The constant struggle of trying not to fix everything at once in the
docs :)

> > > I am a little torn on this as it does make the README harder to read
> > > outside of rendered interfaces.
> > > 
> > 
> > But it'd be displayed correctly in the Github mirror and Gitlab for
> > those using it I guess.
> > 
> > Most projects hosted on Github/Gitlab use MarkDown so I don't think it's
> > such a bad idea, I'm just not sure it has as much benefit on cgit since
> > it's not the landing page of the repo (the summary page is).
> > 
> > If we can display the non-MD version in the about page, I don't think
> > there's a huge benefit of migrating to MD?
> > 
> > If we absolutely need MD for the about page, go for it as it'll cover
> > Github, Gitlab and probably others.
> > 
> > We might want to modify bitbake-layers create-layer to provide a
> > README.md too instead of the current template?
> 
> There is the issue of needing to display a best practices badge somewhere
> for the project which only really makes sense in markdown format which
> kind of pushed me into this.
> 

It's all settled then :)

MarkDown is not that much less readable than plain text anyway, it can easily
be picked up by anyone, so no objection on my part. LGTM.

Cheers,
Quentin
