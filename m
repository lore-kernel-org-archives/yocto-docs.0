Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.5876.1622116920402563977
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 05:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:60100 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lmEi6-001uyJ-Bh; Thu, 27 May 2021 08:01:59 -0400
Date: Thu, 27 May 2021 08:01:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add glossary entry for NON_MULTILIB_RECIPES
In-Reply-To: <20210527104920.7gdkqgjqdinckr3s@qschulz>
Message-ID: <3a2a7d34-8e9d-18b-8de4-1bc1e3d828c@crashcourse.ca>
References: <4483651b-7799-71b4-69e1-8ba43b933821@crashcourse.ca> <20210527104920.7gdkqgjqdinckr3s@qschulz>
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

> On Sun, May 23, 2021 at 07:00:57AM -0400, Robert P. J. Day wrote:
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index df6413b68..7f9182a5a 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -4803,6 +4803,13 @@ system and gives an overview of their function and contents.
> >           FILES_${PN}-dbg = "/usr/src/debug/"
> >           FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/${QT_DIR_NAME}/qch/qt.qch"
> >
> > +   :term:`NON_MULTILIB_RECIPES`
> > +      A list of recipes that should not be built for multilib. OE-Core's
> > +      ``multilib.conf`` file defines a reasonable starting point for this
> > +      list with::
> > +
> > +         NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
> > +
>
> I'm surprised the kernel isn't part of this list? I would have assumed
> it would be there.

  possibly ... i'm just reproducing the current state of affairs.

rday
