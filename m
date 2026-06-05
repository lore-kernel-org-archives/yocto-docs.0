Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C4CCD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 16:32:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12083.1780677146721916432
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 09:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=SuKY60D4;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-ID:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jzn6OlbRhoNCKAhLZ/kZxFzxvtULU6hMvIFAh20CnGc=; b=SuKY60D4/TIaZ00aOZN5T6b40z
	LQzyUeGfhX9aIyIDkLoVWESwqJpvmIrpGX1/HPST7SOWM0sTr/gDiH5MvEs+tsqvESYmcl8qdkZAr
	W2aB1eX/6vUS0/l+gSacGa7W2/nN+qqzM9sz98UwXPmdhGW60Vs3ElnDNDaWd8Zbmt8InlXmtJDvJ
	crBBgTomiErVeLsVa17W9RMdUiJ/q477nbCH0CzXZRuHrCKaX7WQlKLQHUtugQZ4AXGVeNEWhpAz5
	mLEuf2LRAgSfVNOlS7/dLRbFzmMxZawNjrI+Qq8PQWGphKtqdudUwZA89s+q+i3FQnbK989wGVy6E
	k6UIumFw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53344 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVXT4-0000000E5rQ-31kt;
	Fri, 05 Jun 2026 12:32:24 -0400
Date: Fri, 5 Jun 2026 12:32:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: richard.purdie@linuxfoundation.org
cc: antonin.godard@bootlin.com, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "Required Variables" aren't really "required"
In-Reply-To: <4f5e74f5e90c8eac3eac7c4a590455735c649ab7.camel@linuxfoundation.org>
Message-ID: <b68c0573-dcba-8edc-6ea2-7e898fbf960d@crashcourse.ca>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>    <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>    <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca>   <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org>  
 <3bc0de42-2b65-212b-c8ac-39898b4fc0e4@crashcourse.ca>  <b5010b6b2373955c252760ef900d860b3480d85d.camel@linuxfoundation.org>  <e8e3de5e-8cd0-3a86-92a5-11bc0e943ecd@crashcourse.ca> <4f5e74f5e90c8eac3eac7c4a590455735c649ab7.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-210671031-1780677035=:2624715"
Content-ID: <8f36640c-2db3-bd4f-b51a-00b414a21bec@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 16:32:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9616

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-210671031-1780677035=:2624715
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <410d7e2b-ae0a-4e51-69f0-701e1a28edaa@crashcourse.ca>

On Fri, 5 Jun 2026, Richard Purdie via lists.yoctoproject.org wrote:

> On Fri, 2026-06-05 at 11:38 -0400, Robert P. J. Day wrote:
> > On Fri, 5 Jun 2026, Richard Purdie wrote:
> >
> > > On Fri, 2026-06-05 at 11:12 -0400, Robert P. J. Day wrote:
> > > > � i should point out that the same inconsistency about required
> > > > versus
> > > > suggested occurs here:
> > > >
> > > > https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status
> > > >
> > > > where it claims that the OE system "requires" patch upstream
> > > > status,
> > > > but follows that up with that each patch "should" provide
> > > > detailed
> > > > information. i deleted a few patch "Upstream-Status" lines and
> > > > parsing
> > > > worked just fine.
> > >
> > > I hinted at this but let me be more specific. Try a build ;-)
> > >
> > > OE-Core definitely requires Upstream-Status.
> >
> > � i did ... so non-OE-Core patches apparently have no such
> > requirement.
>
> and did you try it with an OE-Core recipe?

  yup, and i was a bit surprised at the result (although i'm sure this
will come as no surprise to you).

  with wrynose release, i picked a random oe-core recipe (util-linux),
and edited the associated ptest.patch file to delete the line:

  Upstream-Status: Pending

i was surprised that if i simply wanted to generate the environment or
parse the recipe:

  $ bitbake -e util-linux
  $ bitbake -p util-linux

that worked fine, so i guess neither of those operations checks the
patches.

  predictably, this command:

  $ bitbake -c do_patch util-linux

generated:

  ERROR: util-linux-2.41.3-r0 do_patch: QA Issue: Missing Upstream-Status in patch

so that works just fine.

  in short, the necessity for upstream status applies only to oe-core
patches. should the docs mention that distinction?

rday
--8323329-210671031-1780677035=:2624715--

