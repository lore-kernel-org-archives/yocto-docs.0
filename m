Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61A3C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:45:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.7299.1748943917360060129
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 02:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bqg7zlH7;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XiEIUsEbYiNVzqqVT8IIEbP0/4QuwWZmseFfxCwrtMM=; b=bqg7zlH7v7NOoqdrjviRGxsw1k
	/ZsP8ivaxo2Qt96Iebp60Rwey17RtzPCITmvq5G0MVIafXjhNGpBkXCcAwXbNRtkcprfGdcCdVS2U
	lUGnaW1pXFujGKY0D+vJJLhCgL5I48fAmHNa/a6ZRNa6ARHDus9S3JIydws6x8UTasyQOhhhG1/Ge
	rSvxz1ZPDvzmGsVDijS/OhH3pJZ9U7TmrctrzqAoeomZDpCvoabkBxzY3I8CaYH4B+4VKHdDAvFHs
	q7dQSkhBr0Ttw4++0vcHB5EhMv7zmCyIglZ5T59opTKNxKccxr8T6s/UUoakUKHciY6/xwcwHA0pQ
	lAW2JiDw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:56854 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uMOCe-00000002lUl-3wMx
	for docs@lists.yoctoproject.org;
	Tue, 03 Jun 2025 05:45:12 -0400
Date: Tue, 3 Jun 2025 05:44:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: A thought or two about YP documentation versus glossary entries
Message-ID: <79b9774e-2ad4-1ff7-bc4e-4bf6ad2610d3@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 03 Jun 2025 09:45:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6985


  I was trying to come up with an intuitive design for how the YP and
BB manuals should work together to avoid duplication and couldn't seem
to make it work until I took a step back and realized that the way
variables are explained in the YP manual seems, well, backwards. For
this, I'll use the BB_NUMBER_THREADS variable I was talking about
before. (Leave the BB manual out of this for now, even though that
variable properly deserves to be explained there.)

  There are typically two places where a lot of concepts and variables
are explained:

  1) In one of the manuals in an appropriate section, and
  2) In the variables glossary.

But it seems that the way these two locations are being used is
backwards.

  For this variable, the one place where this is described in the Dev
Manual is here:

  https://docs.yoctoproject.org/dev-manual/speeding-up-build.html

but there is little explanation there; all you find is a link to the
variable glossary:

https://docs.yoctoproject.org/ref-manual/variables.html#term-BB_NUMBER_THREADS

where you get a much fuller explanation. This seems "backwards" to me
because I'm used to full explanations being in an appropriate section
of a manual (with much more context and examples and so on), while a
glossary entry is normally a one- or two-sentence brief explanation,
with a link to the fuller manual explanation. In other words, exactly
the opposite of what is happening here.

  In my ideal universe, glossary entries are short and punchy, and
point the reader at the full explanation, where you would normally
find a really thorough coverage, in the full context of how the
variable is used, with suggestions and references to related sections
of that manual or other manuals. and examples of its use and so on.
Here, as I said, it's exactly the opposite -- the only full
explanation is in the glossary, which only inspires documenters to
keep adding to the glossary entries rather than improving, in this
case, the Dev Manual.

  Finally(?), in the case of BB_NUMBER_THREADS, this is part of
BitBake and so should be explained *in detail* in that manual, along
with related BB_PRESSURE_* variables in a section entitled something
like "Speeding up the Build." That is, comprehensive coverage of those
related features in the BB manual in an actual section, again with
glossary entries being little more than links.

  This would eliminate a ton of duplication -- the BB manual would be
far more comprehensive and cover everything BB-related, and the YP
manuals could just point at all that stuff and end up being way
shorter. But I'm just throwing out ideas at this point.

rday

