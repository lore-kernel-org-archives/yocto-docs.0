Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.14308.1622237144419833785
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 14:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:47970 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lmjzC-00A66H-MO; Fri, 28 May 2021 17:25:42 -0400
Date: Fri, 28 May 2021 17:25:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: Khem Raj <raj.khem@gmail.com>, 
    Quentin Schulz <quentin.schulz@streamunlimited.com>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add DEBUGFS-related variables to glossary
In-Reply-To: <ced2b76e-5284-7489-4c38-d32e2191048a@bootlin.com>
Message-ID: <ab5517ca-5bfe-4c19-849d-1a711ac76d2@crashcourse.ca>
References: <b3b0312-688f-1b68-ac2b-29db8163cc9a@crashcourse.ca> <20210527103344.pqxrbddld5rtpbge@qschulz> <b261368c-3e1b-b229-e081-ab157e0fdbd0@gmail.com> <ced2b76e-5284-7489-4c38-d32e2191048a@bootlin.com>
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
Content-Type: multipart/mixed; boundary="8323328-1843117067-1622237141=:10180"

--8323328-1843117067-1622237141=:10180
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 28 May 2021, Michael Opdenacker wrote:

> Greetings,
>
> On 5/28/21 1:34 AM, Khem Raj wrote:
> >
> >
> > On 5/27/21 3:33 AM, Quentin Schulz wrote:
> >> Hi Richard,
> >>
> >> On Fri, May 21, 2021 at 05:35:21AM -0400, Robert P. J. Day wrote:
> >>>
> >>> Add variable glossary entries for all of:
> >>>
> >>>    * IMAGE_GEN_DEBUGFS
> >>>    * IMAGE_FSTYPES_DEBUGFS
> >>>    * IMAGE_INSTALL_DEBUGFS
> >>>
> >>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >>>
> >>> ---
> >>>
> >>> diff --git a/documentation/ref-manual/variables.rst
> >>> b/documentation/ref-manual/variables.rst
> >>> index 0b61f77cb..1ce43a954 100644
> >>> --- a/documentation/ref-manual/variables.rst
> >>> +++ b/documentation/ref-manual/variables.rst
> >>> @@ -3006,6 +3006,24 @@ system and gives an overview of their
> >>> function and contents.
> >>>               or ``_prepend``. You must use the ``+=`` operator to
> >>> add one or
> >>>               more options to the ``IMAGE_FSTYPES`` variable.
> >>>
> >>> +   :term:`IMAGE_FSTYPES_DEBUGFS`
> >>> +      Similar to :term:`IMAGE_FSTYPES`, specifies the formats the
> >>> +      OpenEmbedded build system uses during the build when creating
> >>> the
> >>> +      debug filesystem, as long as :term:`IMAGE_GEN_DEBUGFS` has been
> >>> +      set to '1'.
> >>> +
> >>> +      The default value from ``bitbake.conf``::
> >>> +
> >>> +         IMAGE_FSTYPES_DEBUGFS ?= "tar.gz"
> >>> +
> >>> +   :term:`IMAGE_GEN_DEBUGFS`
> >>> +      Set to '1' in order to generate a separate debug fileystem::
> >>> +
> >>> +         IMAGE_GEN_DEBUGFS = '1'
> >>> +
> >>> +      If set, the debugfs will be generated with all of the filesystem
> >>
> >> Having worked with the kernel before Yocto, for me debugfs is a pseudo
> >> filesystem created and mounted by the kernel. I guess this has nothing
> >> to do with it. Could we elaborate a bit more on what this debug
> >> filesystem is and what's its use? And also put a word that this
> >> shouldn't be confused with debugfs filesystem from the kernel, c.f.
> >> https://www.kernel.org/doc/html/latest/filesystems/debugfs.html.
> >>
> >> Eager to learn what this is for :)
> >
> > yeah its a name collision, perhaps we could have called it DBGFS or
> > somesuch name
>
>
> I got *really confused too* when I checked Robert's patch for the first
> time. The DEBUGFS naming very strongly reminds me of the filesystem in
> the kernel.
>
> Yes, DBGFS would be less confusing. May I file a bug (or a patch) to
> address this in a future release?
>
> Actually, even the use of "FS" is confusing in this project, like when
> you set:
>
> 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"'
>
> I'd use "IMAGE_TYPES_" instead of "IMAGE_FSTYPES_..." because tar.bz2 is
> not a filesystem, but rather a type of image.

  i agree with the concept, but would it be too disruptive a rename?

rday

--8323328-1843117067-1622237141=:10180--
