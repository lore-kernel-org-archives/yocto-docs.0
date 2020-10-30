Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.9437.1604036758673322465
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 22:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:41362 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYNEa-003ZA7-4M; Fri, 30 Oct 2020 01:45:56 -0400
Date: Fri, 30 Oct 2020 01:45:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <foss@0leil.net>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] normalize use of trailing "::" across docs
In-Reply-To: <c550db4b55fbc2b77d0a96d87ab5edf1@0leil.net>
Message-ID: <a98891b5-5f8e-d63e-8c2c-377486cf1271@crashcourse.ca>
References: <afdb4476-bdb4-3df0-be7-457ebd473db0@crashcourse.ca> <c550db4b55fbc2b77d0a96d87ab5edf1@0leil.net>
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

On Thu, 29 Oct 2020, Quentin Schulz wrote:

> Hi Robert,
>
> On 2020-10-29 23:00, Robert P. J. Day wrote:
> > Rather than terminate a line with a single ":" and follow that up with
> > a line of simply "::" to start a code block, we can simply terminate
>
> I think it's actually called a literal block? (was looking for documentation
> on this :) ).
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks
>
> > the text line with "::" which has the same effect. While we're there,
> > we can change a few terminating "." to "::" just for aesthetics.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> >   this appears to build, but some confirmation would be nice.
> >
>
> The easiest way would be to build without and with your patch and the HTML
> shouldn't change.
>
> > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst
> > b/documentation/dev-manual/dev-manual-common-tasks.rst
> > index 0630040e6..ede7b494c 100644
> > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> [...]
> > @@ -4207,10 +4149,9 @@ happens, which changes the way you build them.
> > You can also modify the
> >  filesystem itself or select a different filesystem.
> >
> > First, find out what is hogging your root filesystem by running the
> > -``dirsize.py`` script from your root directory:
> > -::
> > +``dirsize.py`` script from your root directory::
> >
> > -   $ cd root-directory-of-image
> > +   $ cd root-directory-of-image:
>
> Unwanted change here.
>
> [...]
> > @@ -11669,8 +11473,8 @@ Wayland with Kernel Mode Setting
> >  (`KMS <https://wiki.archlinux.org/index.php/Kernel_Mode_Setting>`__)
> >  support, include the "wayland" flag in the
> >  :term:`DISTRO_FEATURES`
> > -statement in your ``local.conf`` file:
> > -::
> > +s:tatement in your ``local.conf`` file:
> > +
>
> s/s:tatement/statement/
>
> + missing : at the end
>
> + no need for additional newline.
>
> >
> >     DISTRO_FEATURES_append = " wayland"
> >
> > @@ -11687,8 +11491,8 @@ Installing Wayland and Weston
> >  To install the Wayland feature into an image, you must include the
> >  following
> >  :term:`CORE_IMAGE_EXTRA_INSTALL`
> > -statement in your ``local.conf`` file:
> > -::
> > +s:tatement in your ``local.conf`` file:
> > +
>
> s/s:tatement/statement/
>
> + missing : at the end
>
> + no need for additional newline.
>
> Moreover, I think we sometime have literal blocks inside of notes (so the
> double colon does not start a line, it has some spaces before it for
> indentation purposes). We should probably tackle those as well?
>
> Thanks,
> Quentin

  ack, not sure what happened in those few cases, will take the rest
of your comments under review.

rday
