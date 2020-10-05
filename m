Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.30257.1601885746042998962
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 01:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4C4YM40rV2z5tlL;
	Mon,  5 Oct 2020 10:15:43 +0200 (CEST)
Date: Mon, 5 Oct 2020 10:15:42 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 8/8] docs: ref-manual: ref-structure: replace oe-init-build-env by &OE_INIT_FILE;
Message-ID: <20201005081542.r4rvjnyg3ospwp2p@qschulz>
References: <20201004085728.8015-1-foss@0leil.net>
 <20201004085728.8015-8-foss@0leil.net>
 <CAP71WjwU71MHWO7XbRsNpCV69ifdMVKjfktbr2-xFWX0Oow_BQ@mail.gmail.com>
 <20201005081055.5zuqh4d7gmibaso5@qschulz>
 <CAP71WjxOAEd5XcbEOhVJeWD7ASSozCb-jbL60oxECkQE1mWYCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxOAEd5XcbEOhVJeWD7ASSozCb-jbL60oxECkQE1mWYCA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2020 at 10:13:57AM +0200, Nicolas Dechesne wrote:
> On Mon, Oct 5, 2020 at 10:10 AM Quentin Schulz
> <quentin.schulz@streamunlimited.com> wrote:
> >
> > Hi Nicolas,
> >
> > On Mon, Oct 05, 2020 at 10:01:15AM +0200, Nicolas Dechesne wrote:
> > > On Sun, Oct 4, 2020 at 10:58 AM Quentin Schulz <foss@0leil.net> wrote:
> > > >
> > > > Signed-off-by: Quentin Schulz <foss@0leil.net>
> > > > ---
> > > >  documentation/ref-manual/ref-structure.rst | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
> > > > index 32c2dbf23..a5b43259e 100644
> > > > --- a/documentation/ref-manual/ref-structure.rst
> > > > +++ b/documentation/ref-manual/ref-structure.rst
> > > > @@ -139,7 +139,7 @@ back to the Yocto Project, such as ``create-pull-request`` and
> > > >
> > > >  .. _structure-core-script:
> > > >
> > > > -``oe-init-build-env``
> > > > +``&OE_INIT_FILE;``
> > > >  ---------------------
> > >
> > > this change is interesting. What happens to links with :ref: here? can
> >
> > I've replaced a bunch of broken refs to this section in other files. The ref to
> > use is actually :ref:`structure-core-script`.
> >
> > > we now use &OE_INIT_FILE; in :ref: links? we have several instances
> > > like this:
> > > :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\``
> > >
> >
> > Those should be converted to use :ref:`structure-core-script` instead.
> > In the manuals I've reviewed, documentation/ref-manual/ref-terms.rst is
> > the only one with such a change to make.
> >
> > > I remember that I converted all instances of &OE_INIT_FILE; initially,
> > > then I figured out how to have variables subst with poky.yaml.. so we
> > > probably have plenty of places where we should use OE_INIT_FILE
> > > again..
> > >
> >
> > BTW, what's the logic behind replacing oe-init-build-env with
> > &OE_INIT_FILE; ? There's probably a sed to make tree wide to replace
> > those :)
> 
> Just to be consistent.. if we have a variable for it, we should use
> it.. though I am not convinced we needed a variable in the first
> place.. i am not sure we plan to change that script name often ;) so
> we should have OE_INIT_FILE and use it everywhere, or remove it, no?
> 

Indeed. Soooo? Do we remove it or nah :)?

Quentin
