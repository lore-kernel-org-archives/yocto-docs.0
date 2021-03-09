Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web12.6782.1615285859842663622
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 02:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4Dvs1X6tnsz5tlK;
	Tue,  9 Mar 2021 11:30:56 +0100 (CET)
Date: Tue, 9 Mar 2021 11:30:55 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] rendering double dashes more emphatically
Message-ID: <20210309103055.cfqkohjoxq635r2g@qschulz>
References: <b1323c30-5681-20cc-af2b-e38f56c1d22f@crashcourse.ca>
 <20210309101702.g6y4lvp2b3wnfakn@qschulz>
 <544513ce-f46d-14e2-dff9-bf394f315d@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <544513ce-f46d-14e2-dff9-bf394f315d@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 09, 2021 at 05:27:31AM -0500, Robert P. J. Day wrote:
> On Tue, 9 Mar 2021, Quentin Schulz wrote:
> 
> > Hi Robert,
> >
> > On Tue, Mar 09, 2021 at 04:58:54AM -0500, Robert P. J. Day wrote:
> > >
> > >   reading bitbake user manual and, in section 1.5.2.2:
> > >
> > > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-tasks-against-a-set-of-recipe-files
> > >
> > > in the first line of the second paragraph, the distinction between a
> > > single dash and a double dash seems to be pretty vague since, by
> > > default, i believe sphinx renders a double dash as simply an "em", so
> > > visually, it's just not as clear as it could be.
> > >
> > > one possible fix is to mark up stuff like that with ``...``, since it
> > > seems it should be monospaced content anyway, and doing that renders
> > > double dashes nicely.
> > >
> > >   thoughts? other options?
> > >
> >
> > Considering in Yocto docs we usually use ``--options`` when not in
> > code-blocks, I'd say it's pretty safe to do the same for bitbake
> > documentation.
> >
> > FWIW, I (or anyone else?) haven't gone through bitbake documentation
> > since the move to sphinx to fix the leftover of the migration. Heck, I
> > haven't even finished Yocto's one :/
> >
> > Please send a patch :)
> 
>   last question -- should patches to BB manual be sent to the YP docs
> list, or to the bitbake-devel list, since BB docs are part of the BB
> checkout?
> 

I don't remember seeing patches for bitbake docs in my mailbox. I'm not
subscribed to bitbake-devel ML, so I'd guess you should send to
bitbake-devel :)

Send a patch and people will tell you anyway :)

Cheers,
Quentin
