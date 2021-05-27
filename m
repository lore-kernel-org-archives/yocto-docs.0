Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.8982.1622131092912455343
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 08:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:33228 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lmIOg-002rAc-Fi; Thu, 27 May 2021 11:58:11 -0400
Date: Thu, 27 May 2021 11:58:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add DEBUGFS-related variables to glossary
In-Reply-To: <20210527103344.pqxrbddld5rtpbge@qschulz>
Message-ID: <456a26f-3bb5-5b29-88a6-3db82a99ed82@crashcourse.ca>
References: <b3b0312-688f-1b68-ac2b-29db8163cc9a@crashcourse.ca> <20210527103344.pqxrbddld5rtpbge@qschulz>
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

On Thu, 27 May 2021, Quentin Schulz wrote:

> Hi Richard,
>
> On Fri, May 21, 2021 at 05:35:21AM -0400, Robert P. J. Day wrote:
> >
> > Add variable glossary entries for all of:
> >
> >   * IMAGE_GEN_DEBUGFS
> >   * IMAGE_FSTYPES_DEBUGFS
> >   * IMAGE_INSTALL_DEBUGFS
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index 0b61f77cb..1ce43a954 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -3006,6 +3006,24 @@ system and gives an overview of their function and contents.
> >              or ``_prepend``. You must use the ``+=`` operator to add one or
> >              more options to the ``IMAGE_FSTYPES`` variable.
> >
> > +   :term:`IMAGE_FSTYPES_DEBUGFS`
> > +      Similar to :term:`IMAGE_FSTYPES`, specifies the formats the
> > +      OpenEmbedded build system uses during the build when creating the
> > +      debug filesystem, as long as :term:`IMAGE_GEN_DEBUGFS` has been
> > +      set to '1'.
> > +
> > +      The default value from ``bitbake.conf``::
> > +
> > +         IMAGE_FSTYPES_DEBUGFS ?= "tar.gz"
> > +
> > +   :term:`IMAGE_GEN_DEBUGFS`
> > +      Set to '1' in order to generate a separate debug fileystem::
> > +
> > +         IMAGE_GEN_DEBUGFS = '1'
> > +
> > +      If set, the debugfs will be generated with all of the filesystem
>
> Having worked with the kernel before Yocto, for me debugfs is a
> pseudo filesystem created and mounted by the kernel. I guess this
> has nothing to do with it.

  i went through that initial confusion once upon a time as well --
yup, totally different. it would be the stuff placed typically under
various .debug directories.

> Could we elaborate a bit more on what this debug filesystem is and
> what's its use? And also put a word that this shouldn't be confused
> with debugfs filesystem from the kernel, c.f.
> https://www.kernel.org/doc/html/latest/filesystems/debugfs.html.

  for the sake of brevity in the glossary, it would be better to keep
glossary entries short, and link to longer explanations or tutorials.
i can add such a link if such a section exists. is there somewhere a
decent explanation?

rday
