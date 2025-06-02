Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BB4C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 14:28:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.51168.1748874522828109161
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 07:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=rD0R7MfG;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rakVyI58AeXkR7p1SYzIkCiQfVyWJheCKC3HvA2VJDo=; b=rD0R7MfGX8nKqHlJdOh5uWtfBG
	/8nsMWQA4R+SZ1pIzpfhSaC1rCbM2UVdzSXnsyF/LjmNuQdhnQv1W7X0Owg+A07vHSC7+9dt9GeKE
	MLo9f+4lcSZ/kJQVfF7gMqdtHTbnNAX+dFC64E+kElh55fM+ATY02si2TsHYOb+JrdFHHCUYECGAd
	kmNL38+mxpNJ+o5uQKF5cHoOeW2Zs+JfOVB/Q1JSAhTZ92Xe/47zuNsPutyYKImOYUGTGaetPCwpb
	qD0UXPxadKBYaa8bmy9hwS8Vwf9Fpjo4ptM+sUBi7D/NB7IjCyFzINtDcuJjxiWKg2GKM+pQCFYb/
	3zQukX2A==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:52362 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uM69X-0000000HNta-1jed
	for docs@lists.yoctoproject.org;
	Mon, 02 Jun 2025 10:28:40 -0400
Date: Mon, 2 Jun 2025 10:28:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: can YP variables glossary refer to BB manual *and* add extra info?
Message-ID: <1e850595-c5f5-8c90-4143-6a8ddbbddfc2@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 14:28:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6980


  (SIDE NOTE: if you're wondering why i am so newly active in wanting
to help with the docs again, i was recently part of the layoffs
bloodbath at Ford and therefore have some spare time on my hands while
deciding what i want to do next. ideally something involving Yocto
Project.)

  pursuant to richard's advice this morning about how to properly
document BB_NUMBER_THREADS in the BB manual, he correctly pointed out
that nothing in the BB manual should refer externally to anything from
OE-Core (or any other possible BitBake-based build system).

  to this end, i can see how the YP variables glossary:

https://docs.yoctoproject.org/ref-manual/variables.html#

for many variables simply links to the equivalent variable explanation
in the BB manual. however, AFAICT, when that happens, the YP entry
contributes *nothing* other than the link, suggesting that the
explanation in the BB manual should be entirely sufficient.

  but wouldn't it make sense to allow the YP entry (or, for that
matter, any other build system glossary entry) to both link to the BB
manual entry *and* add some build system-specific content as well? for
example, the YP glossary entry would first link to the BB entry to
describe the fundamentals for that variable, and then the YP glossary
entry could continue on to say something like:

  "The OE-Core layer defines a default value for BB_NUMBER_THREADS in
bitbake.conf thusly:

  # Default to setting automatically based on cpu count
  BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"

So the reader gets both a proper build system-independent explanation
for the variable, *after* which any build system can sneak in a little
extra content specific to that particular build system.

  AFAICT, I don't see a single YP glossary entry that does that, and
it seems that that would be a useful approach.

  Thoughts?

rday

