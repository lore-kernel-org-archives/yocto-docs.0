Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5D0CAC58E
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 00:41:21 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.3496.1757637674207869425
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 17:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=SWtqRuYD;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hpfM2YLA8bH0hIaaWTO4OB/HtWNgmRKlZtjEA+SXhjQ=; b=SWtqRuYDqAFmSPHkYNbiyf8TKR
	8/Iwq8hJBcTWbFMjgqhHqBUxl7Jwt0+XFgfq43JjUKgHFiDdn/FP8I+aRiG3fhovWA8fmSodq7bud
	44oYjHIAuzVpJoi1uwEyLND47WfikWB8ps8lNiuaMOHazp00GtEjTRLFcmS4EqzpPSsuek7xhn73V
	081FpCknQy3mSzQqzLeeyLe5tH4Rha6mFtFC4/28rVGNqnAiGUDIhyveEmQoAGYeD1T8ckfvjurfg
	a4BWToO/U8pj4+39GZr1+I+vowmBy4IkAINNTrL3wCee/mFCTbsVjin6YEpiHSXEpvAfGbnuuvfJe
	b2KtDDrg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:59662 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uwrqe-0000000G4sy-48Hc
	for docs@lists.yoctoproject.org;
	Thu, 11 Sep 2025 20:41:12 -0400
Date: Thu, 11 Sep 2025 20:41:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: what packages/python modules do i need to build docs?
Message-ID: <8c6111e2-44ee-e1c8-2d36-e0958d7701c6@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 00:41:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7498


  (not as dumb a question as you might think.)

i'm moving from ubuntu to debian trixie 13, and i'm documenting how to
build a dev system for some colleagues, and i want to make sure they
(and i) can "make html" at a bare minimum, so i'm looking at my
current ubuntu 25.04 setup to see what i installed to be able to build
yocto docs, and i see that i have both some sphinx-related packages
*and* ppi3 modules installed, and i'm wondering what is the actual
minimum i need to build the docs.

  what is the recommended S/W to install in debian 13 for this? i
prefer to keep things minimal.

rday

