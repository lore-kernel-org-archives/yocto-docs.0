Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web09.10699.1620231205221386249
 for <docs@lists.yoctoproject.org>;
 Wed, 05 May 2021 09:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4Fb1wK5Y6rz5tlB;
	Wed,  5 May 2021 18:13:21 +0200 (CEST)
Date: Wed, 5 May 2021 18:13:20 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] link to gnome developer example for autotools?
Message-ID: <20210505161320.i5vleonzzehcpeuf@qschulz>
References: <976b49cc-2ca1-7754-14c-a02451cff517@crashcourse.ca>
 <476747ba-82f5-f820-ca37-bde73d3d5dc5@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <476747ba-82f5-f820-ca37-bde73d3d5dc5@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Wed, May 05, 2021 at 06:03:43PM +0200, Michael Opdenacker wrote:
> Hi Robert,
> 
> On 5/1/21 10:02 PM, Robert P. J. Day wrote:
> >   this section:
> >
> > file:///home/rpjday/oe/dist/layers/yocto-docs/documentation/_build/html/sdk-manual/working-projects.html
> 
> 
> You meant https://docs.yoctoproject.org/sdk-manual/working-projects.html
> (you referred to a local link).
> 
> >
> > notes:
> >
> > "For more information on the GNU Autotools workflow, see the same
> > example on the GNOME Developer site."
> >
> >   not sure what "same example" this is referring to, but can someone
> > clarify what link can be added here corresponding to the alleged
> > example?
> 
> 
> I guess the reference is
> https://developer.gnome.org/anjuta-build-tutorial/stable/create-autotools.html.en
> 

Yes. It was lost during the migration.

See:
https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#autotools-based-projects

When there are things which seem a bit odd, I usually check with the
documentation at that link (which I told Robert to not look at anymore :p)
which is the latest doc before the sphinx migration.

> Indeed, we should provide readers with a direct link instead of
> expecting them to find such a page through a search engine.
> 
> Actually, this example just adds a little more than what we already
> explain. Instead shouldn't we provide links to the original
> documentation for the autotools, such as
> https://www.gnu.org/software/automake/#documentation for automake and
> https://www.gnu.org/software/autoconf/ for autoconf? If we do that, it's
> what we already get from the link to
> https://en.wikipedia.org/wiki/GNU_Build_System already provided at the
> beginning of the section.
> 
> If you agree, I vote to remove the note entirely.
> 

I'd check first in the git history what the original intent was before
removing it.

Cheers,
Quentin
