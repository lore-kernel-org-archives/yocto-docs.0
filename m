Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E655CD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 11:24:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13129.1781695463804763406
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 04:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xbEqH4DN;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZIgOFwjo98nr6lXgyCvz31RQR117Nn+KHHmpOdif/Rg=; b=xbEqH4DNDeR8QsL4W1v3WB2C4c
	yQlzT68+Xvf1A1gZSLzu6lqv/dGmBg3ndLWA96QyulZuwqrhmo9fnZWqiA8J0l2K0ZXwcCcio26ZD
	TDpWg7Pw25QJpC5D+fa2FWgw1XF1WPHoidYyR1f4L4kFd1OCq8elNIU0A3J26zwGmTjqEjLAWl3L2
	LHudTa7l048MxaH1rCuZal8LnIo2/CfTF+FRgy+ds/1NY7ODjvHw1j9Yq4p05PwQjZAO73rn9VJKc
	+cZwwVav+bKtihlCziHn11rOh9Jm/BYa0av/9WTMukzLJuSRczAKUQvvz5Ush+AB7yRWw9s9rpg/8
	hqU1YH/Q==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:51194 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZoNY-00000009LcD-2g1V;
	Wed, 17 Jun 2026 07:24:22 -0400
Date: Wed, 17 Jun 2026 07:24:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: antonin.godard@bootlin.com, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "Required Variables" aren't really "required"
In-Reply-To: <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org>
Message-ID: <9da23f3f-716b-99b2-87cf-cb131c84e64e@crashcourse.ca>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>  <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>  <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca> <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-578642578-1781695458=:1289890"
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
 <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 11:24:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9771

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-578642578-1781695458=:1289890
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 5 Jun 2026, Richard Purdie wrote:

> On Fri, 2026-06-05 at 07:22 -0700, Robert P. J. Day via lists.yoctoproject.org wrote:
> > On Fri, 5 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:
> >
> > > On Fri Jun 5, 2026 at 1:40 PM CEST, Robert P. J. Day wrote:
> > > >
> > > > here:
> > > >
> > > > https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#required-variables
> > > >
> > > > the section "Required Variables" goes on to say that four variables
> > > > "should" be included in all recipes ("should" does not equal "must"),
> > > > but a quick test build showed that none of those four variables seemed
> > > > to be required for successful parsing -- only a missing "LICENSE"
> > > > triggered a parse error during my testing.
> > >
> > > What do you suggest as an alternative word for "Required"?
> >
> >   Well, it makes no sense to first say that short list of variables is
> > "Required", then say they "should" be included in all recipes. It's
> > common usage that "should" means only that something is *recommended*
> > or *encouraged*, not mandatory.
> >
> >   Then based on my testing, none of those variables are actually
> > required since leaving them out didn't cause a parse error. So I don't
> > know how people would want to word that or what it should say.
>
> LICENSE is effectively required and should be in the required section.
> SUMMARY/DESCRIPTION are also strongly encouraged else they get defaults
> which aren't particularly useful. I thought there were QA checks for
> those? Perhaps the QA tests are limited just to oe-core by default?
>
> I think saying they're required is fine to be honest. LICENSE should be
> moved to the required section.
>
> HOMEPAGE is also strongly recommended, again. Perhaps the section
> should be:
>
> """
> The following variables should be included in all recipes:
>
> LICENSE, DESCRIPTION, SUMMARY
>
> It is also strongly recommended to set:
>
> HOMEPAGE, BUGTRACKER
> """
>
> Would that be more acceptable to you?

  i'll post one more note on this and then let it go. as a test, i
tweaked the OE-Core "bc" recipe to see what was *truly* required for a
recipe in the openembedded-core layer, and here are the results which
differ slightly from what one reads here:

https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#recipe-metadata

  in the "bc" recipe, i wiped out most of the metadata and learned
that parsing does indeed require the LICENSE and LIC_FILES_CHKSUM
fields (that section does not mention that LIC_FILES_CHKSUM is not
required if LICENSE is "CLOSED", but that is mentioned in the
variables glossary).

  beyond that, i deleted all of SUMMARY, HOMEPAGE, DESCRIPTION and
SECTION, ran "bitbake -p bc", and got only two warnings:


WARNING: bc-1.08.2-r0 do_recipe_qa: QA Issue: Recipe bc in
/home/rpjday/oe/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb
does not contain a SUMMARY. Please add an entry. [missing-metadata]
WARNING: bc-1.08.2-r0 do_recipe_qa: QA Issue: Recipe bc in
/home/rpjday/oe/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb
does not contain a HOMEPAGE. Please add an entry. [missing-metadata]


which are, in fact, the two metadata variables examined in
do_recipe_qa().

  and given the various defaults for stuff like SUMMARY and
DESCRIPTION and so on, it seems that LICENSE and LIC_FILES_CHKSUM is
the only *truly* required metadata, and everything else is simply
strongly encouraged or will be quietly set to a default value as
defined in bitbake.conf.

rday

--8323329-578642578-1781695458=:1289890--

