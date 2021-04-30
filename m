Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.11509.1619789342167225693
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 06:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FWtVz1hWSz5tl9;
	Fri, 30 Apr 2021 15:28:58 +0200 (CEST)
Date: Fri, 30 Apr 2021 15:28:57 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] trying to keep the variable glossary up to date
Message-ID: <20210430132857.u3ho2pcqfkaajscq@qschulz>
References: <e1a39395-2a7c-895f-a977-d6baf87fba94@crashcourse.ca>
 <20210430122936.sytnerrfegtofdbz@qschulz>
 <1b73959f-136e-884c-c05c-d8abfea6ee3@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <1b73959f-136e-884c-c05c-d8abfea6ee3@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 30, 2021 at 09:17:31AM -0400, Robert P. J. Day wrote:
> On Fri, 30 Apr 2021, Quentin Schulz wrote:
> 
> > Hi,
> >
> > On Fri, Apr 30, 2021 at 08:11:14AM -0400, Robert P. J. Day wrote:
> > >
> > >   unsurprisingly, the list of variables in the variable glossary lags
> > > noticeably behind all of the recent (and even not so recent) variables
> > > in use. as one example i'm perusing right now, there are a number of
> > > BUILDHISTORY-related variables that aren't in the glossary, such as:
> > >
> > >   BUILDHISTORY_RESET
> > >   BUILDHISTORY_SDK_FILES
> > >   BUILDHISTORY_DIR_IMAGE
> > >   BUILDHISTORY_DIR_PACKAGE
> > >
> > > there's more but that's enough to make the point, which inspires the
> > > obvious question -- is it even worth trying to keep up?
> > >
> > >   is there a reasonably methodical way to try to stay on top of this?
> > > or is that just doomed to failure? certainly, there are variables that
> > > are totally local to some focused bit of processing and merit no
> > > explanation, but for any variables that might be of interest to the
> > > developer, is it the goal for *all* of those variables to be in the
> > > glossary?
> > >
> >
> > All variables that are publicly exposed should be documented. IMO,
> > anything that is expected to be changed (or at least give the user
> > the ability to change it) in recipes declared in classes or
> > configuration files are part of this group. Obviously, anything
> > defined in classes and configuration files can be changed from a
> > recipe but that does not mean they were intended to be changeable by
> > the original committer.
> >
> > There's no way we can keep this in sync except by making sure
> > changes in classes/configuration files mean a patch to the
> > documentation needs to be sent.
> 
>   yes, that's pretty much the way i see it. it's interesting to note
> some of the variables that aren't in the reference manual variable
> glossary (BB_ENV_EXTRAWHITE, a notable omission), but it is in the
> bitbake user manual variable glossary:
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-BB_ENV_EXTRAWHITE
> 
> so then we have the decision as to whether a variable should go in one
> location, the other, or both. grapple, grapple ...
> 

BB* variables at least in the bitbake docs.

Variables not used directly by bitbake (if openembedded-core/poky was
not there), should be in YP docs.

BB* variables can be described in YP docs too if the docs could benefit
from a more YP-specific description compared to bitbake's.

I don't think we need to be strict on what makes it to YP docs from the
bitbake docs.

In any case, if doc is sent, we can always decide where to put it. The
thing is to get people to contribute patches to the doc whenever they
contribute code. If we can get them to send doc patches, the rest is
just organization/redirecting, not sure it is super important right
now?

Cheers,
Quentin
