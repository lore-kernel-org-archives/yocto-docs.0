Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.22239.1630935918158560364
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 06:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:49760 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mNEw0-0007LL-7m; Mon, 06 Sep 2021 09:45:16 -0400
Date: Mon, 6 Sep 2021 09:45:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add potential of parallelism to defn of "Task"
In-Reply-To: <20210906132959.h5d45apq2es6dojw@fedora>
Message-ID: <6e82a29-4497-df3-3034-3f5c5ea32f7f@crashcourse.ca>
References: <2cf272e-4b96-e1ae-c692-4a1ee6b8736e@crashcourse.ca> <20210906132959.h5d45apq2es6dojw@fedora>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Sep 2021, Quentin Schulz wrote:

> Hi Robert,
>
> On Mon, Sep 06, 2021 at 08:44:30AM -0400, Robert P. J. Day wrote:
> >
> > Emphasize that tasks can be done in parallel.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> > index 32658051a..1a1f8dbee 100644
> > --- a/documentation/ref-manual/terms.rst
> > +++ b/documentation/ref-manual/terms.rst
> > @@ -367,10 +367,16 @@ universal, the list includes them just in case:
> >       section in the Yocto Project Overview and Concepts Manual.
> >
> >     :term:`Task`
> > -      A unit of execution for BitBake (e.g.
> > +      A per-recipe unit of execution for BitBake (e.g.
> >        :ref:`ref-tasks-compile`,
> >        :ref:`ref-tasks-fetch`,
> >        :ref:`ref-tasks-patch`, and so forth).
> > +      One of the major benefits of the build system is that, since each
> > +      recipe will typically spawn the execution of numerous tasks, it is
> > +      entirely possible that many tasks can execute in parallel, with
> > +      the fetch task of one recipe being done simultaneously with the
>
> :ref:`ref-tasks-fetch`
>
> > +      build task of another, and so forth, potentially up to the
> > +      parallelism limit of your build system.
> >
>
> I'm not entirely sure now, but I'm wondering if this does not apply to
> tasks within a recipe too?

  ... snip ...

i'd thought of that but decided to keep it brief, but thinking about
it, it would take only a few additional words to mention parallelism
within a single recipe.

rday
