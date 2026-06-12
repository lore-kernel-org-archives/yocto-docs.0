Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA7ACD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 11:57:20 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68754.1781265434847778067
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 04:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Ff1bV/SR;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vZi2Ogar2/3UOTuAz4daErO3nKyblHkoCS16JCCuA0U=; b=Ff1bV/SR/v5PwNsA4Rmt+88f3s
	J4J5Hq3hLIqtazVgGNbCLzakIP0nn+gNpTZHH4QEjNWFkgnmY14v0yc2zMq2kpPVxFgWICdr1YVkj
	gJPqkA8fA7LqrjBYAbiZbHB7Yih7wmSgYzPj4MKhbup+BwkgHzMHJykKwrNiapDVe77MrhU6+Aznt
	usY8H2V72gXzg/Hb9nvQ2dtzgXwekhiuWpSLijEpZCiGwTIxCppGpvQvg8nTF+8FBw6d4QQeV9uET
	e0tJKwJ1VNbMzmJ9oZjgt/o7Ye9icElHUI8L0enCTeHGoaqcpp+Yn8HHHyDV/+pQAAm6Y8rfEkQhk
	Bnxo9LKg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:58594 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wY0Vc-0000000EBV7-0386;
	Fri, 12 Jun 2026 07:57:13 -0400
Date: Fri, 12 Jun 2026 07:57:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: correct which package variables
 support which backends
In-Reply-To: <2a441c4a-81c4-4c51-a80f-7dec845cba45@cherry.de>
Message-ID: <8cd4b7b0-6d05-1291-155f-4223dddc8176@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:57:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9707

On Fri, 12 Jun 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/12/26 1:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
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

  that phrasing was in the original explanation -- one can set, say,
PACKAGE_EXCLUDE either globally in local.conf:

  PACKAGE_EXCLUDE = "minicom"

or attach the exclusion to a specific image by using what the variable
glossary describes as a "recipe name override":

https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE

  PACKAGE_EXCLUDE:pn-<target image> = "minicom"

so the phrase "recipe name override" comes from the glossary ...
should it be called something else?

rday

