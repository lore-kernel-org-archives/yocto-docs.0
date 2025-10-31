Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFE5CCF9FA
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:03:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.13785.1761912192620103401
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bra1sx4v;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=urrH3FFA0U/93eTFZ8wvC8LT+hQBgUNgR8ao4LGReB8=; b=bra1sx4v3y0MHn/wiYsHyd5dOW
	tfXSQcOYs33kt/+kMqScpT4Lq/h5X/fZra0spNRiLrrUpnsQGBc8TlIDwmTtlUlIGfEGBQLNLEFIF
	vwP8gwqzcr4V2te16u0tXOU/nef9IBCnETg4SqyCZObQahkX//TczCVKmfnwcTt4yd/RaVU18YhjV
	YvuG/8eeGgbk77AHvz25/fPX8fO4RDmulKM1HDVK27FG7FWGtYr2vsP5Z7UJgFcPMxYvRuHlKVkTc
	oBoySSgRPrgyo2RInnutGera/kpk8tSTcOr8JiMz1w4qG8d9D7aZ5GbBYfez4285Qhf+B32A5aNEW
	yez1iKkg==;
Received: from [147.129.179.166] (port=48944 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEnqV-00000005eK2-1D7v
	for docs@lists.yoctoproject.org;
	Fri, 31 Oct 2025 08:03:10 -0400
Date: Fri, 31 Oct 2025 08:06:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: some thoughts on "5.21 Examples" section in dev manual
Message-ID: <33648d35-774a-8c90-45fc-24b35b2cfab1@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:03:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7939


  i think this section:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#examples

could be improved in a few ways:

  first, if it's meant to demonstrate different types of recipe
builds, it should probably include cmake and any other build
mechanisms for completeness.

  next, the last two sections there:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#splitting-an-application-into-multiple-packages
https://docs.yoctoproject.org/dev-manual/new-recipe.html#packaging-externally-produced-binaries

seem wildly out of place -- the first of them more properly belongs in
a comprehensive section on how packaging works (a section which
doesn't really exist but definitely should). it just changes topic so
quickly, it seems confusing.

  and, ok, maybe that second section does belong there, but here's my
major gripe.

  i really loathe that "hello, world" section since, while it's a
cutesy example of "hello, world", it flies in the face of good YP
recipe design by suggesting to the reader that it's acceptable to
include actual source code in the directory next to the recipe file.

  i mention this since i was recently handed a legacy YP build
structure in which the *entire* code base was stuffed into the
"files/" directory that way. i mean, the entire code base, makefiles
and all. but after a couple seconds of sheer horror, i realized that
that is exactly the approach being demonstrated in that "hello, world"
example, so someone might have read that section and thought, "cool,
i'll put all the code right here." which is why i hate that section --
it's encouraging really poor recipe design.

  i would toss that example and, as a replacement, add a final recipe
building example using "externalsrc", which is far more useful and
would be presented as the "proper" way to refer to a local code base.

  thoughts?

rday

