Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9C4CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 11:44:20 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68565.1781264651239862097
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 04:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=fMSuCIHb;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O0NcBKY3vrQ1CBj6sDc2QhaF6AAGTVpIwzL27dUx9Q4=; b=fMSuCIHbmYtGXRZiY3E2AsalL3
	aopKL10X/OUNcaUfervjMxxgrgQxUzrNsEaXII85Exq2tvRFcmg97iY5lZtQhRdWtops0+U1Bl8kY
	eUlvhzM8vxBLLspJtVN7pLrkTN+W44rOz+OrpuubGRGImdhB9MOK8jlk5KZCqViIsE0rhu0tnjElK
	zgMfy4XZNuxmp8/4575ZRASPY8MeEV/Dzqg49/cZ1aaCdBpdL4lEcuyAxpUlIHOiRGffe4ygQFGJS
	lO1eozmCm2NLRtezPsGa4EpIpb1gpIGsKVYJI+Mc/2uEBnQHWC2CM4SyJ26I85KYrlbpNQO+Ho+3c
	11J5AFuw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:57302 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wY0Iy-0000000E9xm-0cHB;
	Fri, 12 Jun 2026 07:44:09 -0400
Date: Fri, 12 Jun 2026 07:44:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: quentin.schulz@cherry.de
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: correct which package variables
 support which backends
In-Reply-To: <2a441c4a-81c4-4c51-a80f-7dec845cba45@cherry.de>
Message-ID: <ab0271bc-ac0c-57f1-4213-1dc73db0645b@crashcourse.ca>
References: <063e2bf1-5f48-3ea6-f18a-3d422af03a2f@crashcourse.ca> <2a441c4a-81c4-4c51-a80f-7dec845cba45@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:44:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9706

On Fri, 12 Jun 2026, Quentin Schulz via lists.yoctoproject.org wrote:

> Hi Robert,
>
> On 6/12/26 1:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Update the section "Excluding packages from an image" to explain that
> > all packaging backends support all three package exclusion variables,
> > with the single exception that Debian packaging does not support
> > BAD_RECOMMENDATIONS.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> >    i tested with adding "minicom" to an image, then trying to exclude
> > its recommendation of "lrzsz".
> >
> > diff --git a/documentation/dev-manual/packages.rst
> > b/documentation/dev-manual/packages.rst
> > index 500639565..80bcac0ba 100644
> > --- a/documentation/dev-manual/packages.rst
> > +++ b/documentation/dev-manual/packages.rst
> > @@ -30,13 +30,10 @@ installed into an image. If so, you can use several
> > variables to direct
> >   the build system to essentially ignore installing recommended packages
> >   or to not install a package at all.
> >
> > -The following list introduces variables you can use to prevent packages
> > -from being installed into your image. Each of these variables only works
> > -with IPK and RPM package types, not for Debian packages.
> > -Also, you can use these variables from your ``local.conf`` file
> > -or attach them to a specific image recipe by using a recipe name
> > -override. For more detail on the variables, see the descriptions in the
> > -Yocto Project Reference Manual's glossary chapter.
> > +There are three variables you can use to avoid installing particular
> > +packages into the final image -- you can either set these variables
> > +appropriately in your ``local.conf`` file, or attach them to a specific
> > +image recipe by using a recipe name override.
> >
>
> What do you mean by "recipe name override"?
>
> Please do not say how many variables will be listed, we'll forget to update it
> if we add or remove some in the list below.
>
> >   -  :term:`BAD_RECOMMENDATIONS`:
> >      Use this variable to specify "recommended-only" packages that you do
> > @@ -53,6 +50,19 @@ Yocto Project Reference Manual's glossary chapter.
> >      prevent the installation of a package whose presence is required by
> >      an installed package.
> >
> > +.. warning::
> > +
> > +   All three of these package exclusion variables work with all three
>
> Ditto.
>
> > +   packaging backends (DEB, RPM and IPK) with one exception:
>
> Don't think we need to list the package backends if it applies to them all.
>
> > +   Debian packaging does not support the ``BAD_RECOMMENDATIONS`` setting.
>
> Please always use :term`<var>` for variables that are present in the glossary.
> Here, :term:`BAD_RECOMMENDATIONS`.
>
> > +   If you try that combination, you will get a warning similar to::
> > +
> > +      WARNING: core-image-minimal-1.0-r0 do_rootfs:
> > +        Debian package install does not support BAD_RECOMMENDATIONS
> > +
> > +   All of the other combinations of packaging backend and exclusion
> > +   variable are supported.
> > +
>
> You already said that above in other words: "All [...] work [...] with one
> exception", so necessarily the rest works and we don't need to repeat
> ourselves.

  some of what you're referring to above was stolen verbatim from the
*existing* explanation, but i will process your suggestions. patch v2
coming shortly.

rday

