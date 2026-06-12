Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3F0CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:26:21 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69304.1781267172291866057
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 05:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=0kKdkdz7;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7Oy6I5LzQp28pf4yAqlMDVz140LWsf5szDSm3fanVYg=; b=0kKdkdz7rZzIR57UDMJV3a0gr0
	GNOjRPOmU+zLb3hQmGORwXE9zvblqJ0lVnE0HLLoQtysS1LtUds/8RserkLbFAk6KFFV//I6VB8o9
	PGs37lwJcPlEEDseEqjJzswYmkNaquQIV5ag4/URAxnQza6FFG+21sxW3zSOjzbj8IsRe0Blajqxp
	I2/JvbyRuu0yStMZiCHLsdF1DUupo23VtEos7Z/ouFxCJoNEaTCC8ymaTAABYix3y8GGbyDwAunJ0
	PM2h5cKf7yCEBX/7P56ogH4fwYJHkQSXqAQ8ERMdzm/wzJN9e2J8WW85ffR0w6Bxx8euWstkQFrV0
	wTeGMP8Q==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:36708 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wY0xc-0000000EFKw-3wC4;
	Fri, 12 Jun 2026 08:26:10 -0400
Date: Fri, 12 Jun 2026 08:26:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: correct which package variables
 support which backends
In-Reply-To: <1fb59ff1-599c-49d8-937f-f35fa4b74110@cherry.de>
Message-ID: <1a986b29-fcfd-50db-94cb-aec67804b7e8@crashcourse.ca>
References: <063e2bf1-5f48-3ea6-f18a-3d422af03a2f@crashcourse.ca> <2a441c4a-81c4-4c51-a80f-7dec845cba45@cherry.de> <8cd4b7b0-6d05-1291-155f-4223dddc8176@crashcourse.ca> <1fb59ff1-599c-49d8-937f-f35fa4b74110@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 12 Jun 2026 12:26:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9709

On Fri, 12 Jun 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/12/26 1:57 PM, Robert P. J. Day wrote:
> > On Fri, 12 Jun 2026, Quentin Schulz wrote:
> >
> > > Hi Robert,
> > >
> > > On 6/12/26 1:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > > >
> > > > -The following list introduces variables you can use to prevent packages
> > > > -from being installed into your image. Each of these variables only
> > > > works
> > > > -with IPK and RPM package types, not for Debian packages.
> > > > -Also, you can use these variables from your ``local.conf`` file
> > > > -or attach them to a specific image recipe by using a recipe name
> > > > -override. For more detail on the variables, see the descriptions in the
> > > > -Yocto Project Reference Manual's glossary chapter.
> > > > +There are three variables you can use to avoid installing particular
> > > > +packages into the final image -- you can either set these variables
> > > > +appropriately in your ``local.conf`` file, or attach them to a specific
> > > > +image recipe by using a recipe name override.
> > > >
> > >
> > > What do you mean by "recipe name override"?
> >
> >    that phrasing was in the original explanation -- one can set, say,
>
> Not verbatim, and it matters here.
>
> > PACKAGE_EXCLUDE either globally in local.conf:
> >
> >    PACKAGE_EXCLUDE = "minicom"
> >
> > or attach the exclusion to a specific image by using what the variable
>
> ^^^^ here it says "to a specific image" and this patch here says "to a
> specific image recipe".
>
> If you have a recipe name override in an image recipe, it either doesn't work
> or is useless:
>
> my-image.bb:
>
> BAD_RECOMMENDATIONS:pn-my-image = "test"
>
> is unnecessary complexity for what is simply achieved the same with
> BAD_RECOMMENDATIONS = "test".
>
> The phrasing could hint at:
>
> my-image.bb:
>
> BAD_RECOMMENDATIONS:pn-some-package-recipe = "test"
>
> But this doesn't work, because a recipe (including an image recipe) variable
> scope is specific to the recipe and cannot impact another recipe, thus this is
> a no-op.
>
> > glossary describes as a "recipe name override":
> >
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE
> >
> >    PACKAGE_EXCLUDE:pn-<target image> = "minicom"
> >
> > so the phrase "recipe name override" comes from the glossary ...
> > should it be called something else?
> >
>
> That's ok, it's just combined with the earlier part of the sentence which is
> confusing or misleading (so the other part of the sentence needs to be fixed).

  i think that entire section needs to be reworked to explain all of
that *properly*, such as you might find those exclusion variables used
in your local.conf, or an image file, or a class file, and so on.

  i will ponder ... for now, i'll just send in a patch that corrects
the claims in the variable glossary, just so *that* stuff is correct.

rday

