Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3C3C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 10:06:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.46196.1748858744393722903
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 03:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ER1hnKrF;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ek+m8wLqUeCsi7VyFPwcvevILC1Nx/aX5dqAC4+0h1g=; b=ER1hnKrFFw8qLazF0Q2S0a/e8G
	vb3+wCitRrhpEUYYr2qcfbAexPcaAji2K68P8pzYuhuMV5Tq1GJ1NtluuaOJgFVIOlvhojO1wT+g0
	6eBcptCjBe7wrS4OIj7jEUAxkQOWz2nwScDHCZw+la5Hls/K1suV7P8PZNMSZeA2C8ofKkKYRKvm2
	RxYhVeGat62MNCHXWFVr3FTr0OZ44H58Z9/RcEeVr+PXxwEWLFF1uNiDGsaqy31GlFWfljcAJgUhQ
	cbezZ93emZji/46X5wcgmGRC1qj30tfffBkwYruuupotIic6ItJYWI32ATpbi59F4yj29xv3Toki9
	Bk78L9jg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:47722 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uM233-0000000GloI-1IsG
	for docs@lists.yoctoproject.org;
	Mon, 02 Jun 2025 06:05:42 -0400
Date: Mon, 2 Jun 2025 06:05:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Any objection to discouraging the use of "PROVIDES +=" in reference
 manual?
Message-ID: <0ed60e64-5e7b-1d7e-4d9b-eb5e8ede5341@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-984382962-1748858742=:233613"
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
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 10:06:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6962

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-984382962-1748858742=:233613
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


Given the explanation of "PROVIDES" here:

https://docs.yoctoproject.org/ref-manual/variables.html#term-PROVIDES

I'd like to rewrite that to really discourage the use of the "+="
operator with that variable.

First, the example given:

  PROVIDES += "udev"

is not even correct as the current eudev recipe correctly uses only
"=".

In addition, I dislike this Note:

"A recipe’s own recipe name (PN) is always implicitly prepended to
PROVIDES, so while using “+=” in the above example may not be strictly
necessary it is recommended to avoid confusion."

That makes no sense -- to use an unnecessary language construct "to
avoid confusion." If that's true, then *all* uses of PROVIDES should
use that. One cannot encourage readers to use a particular syntax
if the recipes themselves don't use it.

P.S. There are about a couple dozen recipes in OE-Core that still use
"PROVIDES +="; I see no special cases that need that so another patch
could be to clean all that up.

Thoughts?

rday
--8323329-984382962-1748858742=:233613--

