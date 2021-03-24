Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.9.1616606184918979042
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 10:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:59566 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lP77H-004Khk-9W; Wed, 24 Mar 2021 13:16:23 -0400
Date: Wed, 24 Mar 2021 13:16:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: extend/add HOSTTOOLS, HOSTTOOLS_DIR defns
In-Reply-To: <20210324170904.tmlw5by6w35t7byw@qschulz>
Message-ID: <f84eb78-251e-108c-a3e9-6c18abd8abf@crashcourse.ca>
References: <1191825-a9e8-ea67-69e8-468edc9e6095@crashcourse.ca> <20210324170904.tmlw5by6w35t7byw@qschulz>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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

On Wed, 24 Mar 2021, Quentin Schulz wrote:

> Hi Robert,
>
> Nitpicking, I'll leave the review of the essence of the patch to people
> who know more about it.
>
> On Wed, Mar 24, 2021 at 12:43:52PM -0400, Robert P. J. Day wrote:
> > Tighten up the definition for HOSTTOOLS, and add an entry for
> > HOSTTOOLS_DIR.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index 0310429bd..80b73f70c 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -2793,16 +2793,22 @@ system and gives an overview of their function and contents.
> >           Linux, the value might be "mipsel-linux".
> >
> >     :term:`HOSTTOOLS`
> > -      A space-separated list (filter) of tools on the build host that
> > -      should be allowed to be called from within build tasks. Using this
> > -      filter helps reduce the possibility of host contamination. If a tool
> > -      specified in the value of ``HOSTTOOLS`` is not found on the build
> > -      host, the OpenEmbedded build system produces an error and the build
> > -      is not started.
> > +      A space-separated list (filter) of tools that must exist on the
> > +      build host and which will be called from within build tasks.
> > +      If a tool specified in the value of ``HOSTTOOLS`` is not found
> > +      on the build host, the OpenEmbedded build system produces an error
> > +      and the build is not started.
> >
> > -      For additional information, see
> > +      For additional information, see the related
> >        :term:`HOSTTOOLS_NONFATAL`.
> >
> > +   :term:`HOSTTOOLS_DIR`
> > +      The directory which contains symlinks to all of the host tools
> > +      specified by ``HOSTTOOLS``, as well as any of the available
>
> :term:`HOSTTOOLS`
>
> > +      host tools specified by ``HOSTTOOLS_NONFATAL``.
>
> :term:`HOSTTOOLS_NONFATAL`
>
> > +      The default value for this directory is typically
> > +      ``${TMPDIR}/hosttools``.
>
> I don't remember if :term: can be surrounded in ``, but if it can :term:
> would make sense too here (it probably can't but better know it for sure
> :) )

  i was actually grappling with that, i think it was only because they
were all next to each other that i got lazy.

rday
