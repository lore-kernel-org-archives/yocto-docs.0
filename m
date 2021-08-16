Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.21365.1629101376015707555
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Aug 2021 01:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:35862 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mFXgb-0000Pk-6D; Mon, 16 Aug 2021 04:09:34 -0400
Date: Mon, 16 Aug 2021 04:09:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] first of many questions on wic and associated documentation
In-Reply-To: <CAMKF1srSBN4kOK8=huWg4Vnxz3GG2PMnx6Afc34LEtbUw5g4Yw@mail.gmail.com>
Message-ID: <7d9fc068-46b2-f42b-6e47-8a4b69f1bdcd@crashcourse.ca>
References: <b94dc1e7-9ba-58c6-9236-9c89cf23f83@crashcourse.ca> <CAMKF1srSBN4kOK8=huWg4Vnxz3GG2PMnx6Afc34LEtbUw5g4Yw@mail.gmail.com>
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

On Sun, 15 Aug 2021, Khem Raj wrote:

> On Sun, Aug 15, 2021 at 11:16 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   as i am just beginning my adventure with the current wic
> > documentation, i suspect i will have many questions, so let's start
> > here:
> >
> > http://docs.yoctoproject.org/dev-manual/common-tasks.html#requirements
> >
> >   first, the docs imply that you have to manually build some packages:
> >
> >   "You must build several native tools, which are built to run on the
> > build system:
> >
> >   $ bitbake parted-native dosfstools-native mtools-native"
> >
>
> I think this perhaps can be omitted.

  once i figure all this out, i volunteer to update the wic docs --
best way to actually understand it. but first, all the questions. :-)

> > except that there is a "wic-tools.bb" recipe that appears to handle
> > that, and i'm going to assume it's called as part of the wic
> > processing, so that the doc seems a bit over-ambitious in what it
> > needs the developer to do.
> >
> >   and right below that:
> >
> >   "Include the name of the wic kickstart file as part of the WKS_FILE
> > variable"
> >
> >   except that makes no mention of the WKS_FILES variable.
> >
> >   thoughts?
>
> maybe WKS_FILES should be better documented as well.

  i mentioned recently there are a number of wic-related variables
that are missing from the glossary; i'm making a list.

rday
