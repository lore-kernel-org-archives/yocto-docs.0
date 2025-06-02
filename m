Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA245C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 08:37:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.44756.1748853442052932805
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 01:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=H66cg8WJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZoHY/teHOTe7EIeDugPF7h8I+LcmXOQx1v9bR9GGuLY=; b=H66cg8WJdkkmfh2VNPSXQDt1ij
	Es2PoQZmAOxLWt153/74MojR6WZoD9jeRcthy8oTj8GD+GE8aPfkvAdQsH0F5LPfnUujZE19b3nbN
	IlRQWjqgv45TpdgrlerS2W6mwPOrTnqrgH15Q4SJy8meAaM/V5WOu7dzW303aM8jVntbBqu3CIGlJ
	mX+FDMzZrd1kNWJFyAGmap41O1NlAP7kARP9lKQ0TnVqYamUNO0hk4eOpsTNuOV8s9SElmsyRtQDs
	fPsnSSf+AGTWmMkl0zC09xZw/UcRWp+ak6oc10AjZaZ+5eDJXbBGzpbL56H/6WmVUMmsSm8ko1aEZ
	sulfYrmg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:56584 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uM0fW-0000000Ga5X-2nqT;
	Mon, 02 Jun 2025 04:37:20 -0400
Date: Mon, 2 Jun 2025 04:37:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: richard.purdie@linuxfoundation.org
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] I think BB_NUMBER_THREADS explanation in bitbake manual
 is "backwards"
In-Reply-To: <0f71b6fcdff6c9a7d4d56ba525ac116e552bb753.camel@linuxfoundation.org>
Message-ID: <12dfe18d-cfe3-eab9-701b-fbac4047a8a0@crashcourse.ca>
References: <c7121488-35ba-93c9-7734-d7e80165eba4@crashcourse.ca> <0f71b6fcdff6c9a7d4d56ba525ac116e552bb753.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-832501764-1748853440=:223007"
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 08:37:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6957

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-832501764-1748853440=:223007
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 2 Jun 2025, Richard Purdie via lists.yoctoproject.org wrote:

> On Mon, 2025-06-02 at 03:57 -0400, Robert P. J. Day via
> lists.yoctoproject.org wrote:
> >
> > If you read the early note about BB_NUMBER_THREADS here:
> >
> > https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-execution.html
> >
> > it advises the reader how to *maximize" execution parallelization by
> > cranking up that variable to match the number of processors. Except
> > that in the OE and poky layers, that's *already* maximized with the
> > use of (from bitbake.conf):
> >
> >   # Default to setting automatically based on cpu count
> >   BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> >
> > So that note is advising the reader to do what is already the
> > default.
> > What is missing is the rationale for *decreasing* the value of
> > BB_NUMBER_THREADS, to dial back the load on the build system, which
> > is
> > pretty much the only reason I ever use it.
> >
> > In short, I think that note would be more useful if it simply
> > explained the purpose of BB_NUMBER_THREADS, that it is already
> > maximized by default, and suggest why you might want to *decrease*
> > it.
> >
> > Thoughts?
>
> This bitbake manual has no insight into what default value OE gives it.

  Fair enough, but I still think that advising the reader to try to
maximize parallelism by increasing that variable should be accompanied
by a suggestion as to why the reader might want to conversely decrease
it; otherwise, I think that explanation is incomplete.

rday
--8323329-832501764-1748853440=:223007--

