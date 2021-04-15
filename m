Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.7600.1618495625260357237
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 07:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FLh3n6D2Pz5tlC;
	Thu, 15 Apr 2021 16:07:01 +0200 (CEST)
Date: Thu, 15 Apr 2021 16:07:00 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Paul Eggleton <bluelightning@bluelightning.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 12/13] ref-manual: add migration section for 3.3 release
Message-ID: <20210415140700.qwj4lotqr72es3jm@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <d8b43077bf92ad403028cbf37b61c4a6349f9370.1618358456.git.paul.eggleton@linux.microsoft.com>
 <20210414082603.gmkxjpyxwnhwzzor@qschulz>
 <1712714.3VsfAaAtOV@linc>
 <20210415095914.eqpunspm2rnpnc4v@qschulz>
 <CAP71WjxKavO93Cm8ZooE4HnJtbb79WLOQASEkh9UL5nFKw8ZNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxKavO93Cm8ZooE4HnJtbb79WLOQASEkh9UL5nFKw8ZNA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2021 at 12:25:55PM +0200, Nicolas Dechesne wrote:
> On Thu, Apr 15, 2021 at 11:59 AM Quentin Schulz <
> quentin.schulz@streamunlimited.com> wrote:
> > On Thu, Apr 15, 2021 at 09:52:31PM +1200, Paul Eggleton wrote:
> > > On Wednesday, 14 April 2021 20:26:03 NZST Quentin Schulz wrote:
> > > > On Tue, Apr 13, 2021 at 05:19:53PM -0700, Paul Eggleton wrote:
> > > > > +BitBake changes
> > > > > +---------------
> > > > > +
> > > > > +- BitBake is now configured to use a default ``umask`` of ``022``
> > for all
> > > > > tasks +  (specified via a new ``BB_DEFAULT_UMASK`` variable). If
> > needed,
> > > > > ``umask`` can
> > > > s/``BB_DEFAULT_UMASK``/:term:`BB_DEFAULT_UMASK`/
> > > >
> > > > IIRC, this works fine even for bitbake terms (might need some tweaking
> > > > if it does not work but I know we use :term: for some bitbake variables
> > > > from bitbake's docs).
> > >
> > > Wow, that does work but I didn't imagine that it would. Any idea how it
> > > resolves those references given that doc is not in this tree?
> > >
> >
> > How internally it works? No idea :)
> >
> 
> It is interesting... I would not have expected that to work ;)
> 
> 
> >
> > But the few lines here are what makes it work:
> >
> > https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/conf.py#n90
> 
> 
> So, this is correct we use the intersphinx extension to link YP and bitbake
> docs which are indeed 2 different sphinx projects. When we build the YP
> docs, it will first download the bitbake sphinx 'index, e.g. you can see
> that in the log when building YP docs:
> 
> loading intersphinx inventory from
> https://docs.yoctoproject.org/bitbake/objects.inv...
> 
> So now sphinx knows about all the :ref:, :doc:, :term:, ... defined in
> bitbake, so we can use them to create cross references. More on that here:
> https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html
> 
> A nice debug tip is to run:
> python -msphinx.ext.intersphinx
> https://docs.yoctoproject.org/bitbake/objects.inv
> 
> which shows all the bitbake references that can be used from YP docs.
> 
> 
> >
> >
> > Nicolas and/or other peoples involved in the migration might be able to
> > tell you more, I'm not :/
> >
> > "it works for me" is enough to me right now :p
> >
> 
> Yes, it does! I never realized that it would, and I have always
> explicitely used the intersphinx prefix, e.g. :term:`bibtake:BB_XXX`. But
> reading the doc more carefully, it states that you can use the 'prefix' to
> force the lookup to be done in the specific intersphinx. But if the
> reference is 'unique' then the prefix is not required. And it works for
> :ref: as well.. I tried with:
> :ref:`Fetchers <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
> 
> and it worked fine.. that's cool, because that means we should be able to
> remove some extraneous bitbake: prefix in few places.
> 
> As for :term:`BB_DEFAULT_UMASK` it works because this 'term' is not define
> in the YP reference manual terms. If you add it in YP doc then the link
> will use the local term instead of bitbake, which makes sense I suppose.
> 

I think so? I could imagine some bitbake variables to be better explained in
the context of their use in the Yocto Project.

We have to be careful with :ref: though, I wouldn't want links to point
to the incorrect doc if the reference appears in both documentations?
Especially since Sphinx wouldn't detect this as an error, since the
:ref: would be valid in both cases. I'm pretty sure it's very unlikely
to happen, but do we want to risk it :) ?

Cheers,
Quentin
-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
Fax: +43 1 667 20 02 4401
quentin.schulz@streamunlimited.com, www.streamunlimited.com
