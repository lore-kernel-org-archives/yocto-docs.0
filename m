Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD88CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 15:12:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10310.1780672330403137492
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 08:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=k1i5/J9B;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N14SCH+6SteVzTMzSgKi3hnbCrLw704ROYBtRSJE2io=; b=k1i5/J9BDZY6y/QwgKvPDTFjlb
	F7Kf3ySFZze3wvZK3jZMl91ZARfORb3V1y5DMFhkyp3Xcn68wgFH76CxnLuNpxWfLg8g/vSv6TMTH
	1wdNbRv3lUwgl0tVvIIxwcH13NQEABcK3rzjgpgl41xnXFFoW1T64hib/JFtYRDvl0WkwcTXRUXj0
	hEcWKWF/6vwKOVxquIfgFSVufSUtOsFmyxi7HHNMZmH5gCbx6LQKcO5IrMMv7+veV7OfKdpp7bPB8
	C3c4Q+UcFoz6FIAJ/QqkOzAP0yRYqUMgqFhplKMQxmOq5RMlbbdlrrQSa7lQs1CKzyAYccthQZLRK
	foRrmj7Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:35230 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVWDP-0000000DwsE-113Z;
	Fri, 05 Jun 2026 11:12:09 -0400
Date: Fri, 5 Jun 2026 11:12:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: antonin.godard@bootlin.com, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "Required Variables" aren't really "required"
In-Reply-To: <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org>
Message-ID: <3bc0de42-2b65-212b-c8ac-39898b4fc0e4@crashcourse.ca>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>  <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>  <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca> <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-750224835-1780672338=:2536197"
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
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 15:12:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9612

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-750224835-1780672338=:2536197
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

  i should point out that the same inconsistency about required versus
suggested occurs here:

https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status

where it claims that the OE system "requires" patch upstream status,
but follows that up with that each patch "should" provide detailed
information. i deleted a few patch "Upstream-Status" lines and parsing
worked just fine.

  i'll shut up about this now.

rday
--8323329-750224835-1780672338=:2536197--

