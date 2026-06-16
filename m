Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C0ECD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:51:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1014.1781625089042733793
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 08:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=C1RUYKF6;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NnRJQo5udAGTIotOok4ItjRw/mtB0Ci3nBR3ZmHnF3E=; b=C1RUYKF6BvmbyfLS8Hhh5GPbw5
	u9y/gdcbIt9/h1oaori5PNcvQ0oZAMsRtc6eZpha/kYcPwRdFMja+qosAmj1oGCX1xeOJmCp6KVvn
	YrHCR5Qof7Uzll1vJ0St+0r/qCqVhQ+5CznnNudINHlYIrVc2rXeno5/opCVUUk1uNE1249OTluCQ
	ErroRTOicMAGQZGrvLfN1G9V8ANOfXC507empFJAkEeJdYZ59oBMrTftmPibGgDlj6mYrdb4eic0B
	FzTAuqz2UGYESHKRELMCeCgKBUqI8xLytMfa69Y2Fdf57un5B+s/qeVyjN+kMLxPtnDhHCXb861qs
	2ISf6SeQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:58266 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZW4U-00000007JiN-14hz;
	Tue, 16 Jun 2026 11:51:27 -0400
Date: Tue, 16 Jun 2026 11:51:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] test-manual: add more detail to the ptest
 section
In-Reply-To: <DJAKAL8C465B.CTTNV2GIAZN0@bootlin.com>
Message-ID: <e97c27a8-5a12-2384-7a85-c974bceb428b@crashcourse.ca>
References: <46ed8884-f3d1-ee7d-1da6-a73a6e07c74c@crashcourse.ca> <DJAKAL8C465B.CTTNV2GIAZN0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:51:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9755

On Tue, 16 Jun 2026, Antonin Godard wrote:

> Hi,
>
> On Tue Jun 16, 2026 at 11:34 AM CEST, Robert P. J. Day wrote:
> >
> > Expand the ptest section to show how to distinguish between adding all
> > ptest packages to an image versus adding only a selected set of
> > packages to the image.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> >   The ptest section really should be considerably longer, perhaps
> > using actual examples from the OE-Core code base. But I'll add just
> > this bit for now.
> >
> > diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
> > index 1c946f81d..dc493b72c 100644
> > --- a/documentation/test-manual/ptest.rst
> > +++ b/documentation/test-manual/ptest.rst
> > @@ -31,12 +31,29 @@ see the :yocto_wiki:`Ptest </Ptest>` wiki page.
> >  Adding ptest to Your Build
> >  ==========================
> >
> > -To add package testing to your build, add the :term:`DISTRO_FEATURES` and
> > -:term:`EXTRA_IMAGE_FEATURES` variables to your ``local.conf`` file, which
> > -is found in the :term:`Build Directory`::
> > +Adding package testing to your image is done in two steps:
> > +
> > +#. Select that all ptest packages should be built and packaged, and
> > +
> > +#. Identify which of those ptest packages to add to your image.
> > +
> > +First, in order to build all ptest packages, add the following line
> > +to your ``local.conf`` file::
>
> While we're at it: s/to your ``local.conf`` file/to a :term:`configuration file`/
>
> >
> >     DISTRO_FEATURES:append = " ptest"
> > -   EXTRA_IMAGE_FEATURES += "ptest-pkgs"
> > +
> > +Note that this will cause all ptest packages to be built and packaged,
> > +but will not add any of those packages to your image; that comes in
> > +the next step. You can then add ptest packages to your image in one of two ways.
> > +
> > +#. If you want to add *all* of the generated ptest packages, add the line::
> > +
> > +      EXTRA_IMAGE_FEATURES += "ptest-pkgs"
> > +
> > +#. On the other hand, if you want to add only a select few of the ptest
> > +   packages, you can use some variation of::
> > +
> > +      IMAGE_INSTALL:append = " e2fsprogs-ptest zlib-ptest"
>
> You can also say:
>
> """
> You can list available ptest packages with:
>
> .. code-block:: console
>
>    oe-pkgdata-util list-pkgs "*-ptest"

  And that will list *all* generated ptest packages, not just the ones
you select for inclusion, right? Just want to be clear since I'll word
it something like that.

rday

