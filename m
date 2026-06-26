Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3E5C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 20:13:19 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43057.1782504794930650373
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 13:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=er/F7DMT;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kj1an+kLO/UGWNF3GgPJTU9MolEuxbUs74bo/N94ano=; b=er/F7DMTHbQPSi8C+ESyaWBMf1
	ijiBack8SKpng45Tt/NVpHSh1HG7IVtiRUWLRs3XsDLAkqe75OHYhFSQGwSh28RbucP+7/ti0zM8L
	UE68WLRQriV6m/nN6TFpgQIuIZq4dFk96d0C/JPkpeRRTh1bxyb2sjxPjNMw4Hv9rZQPXS1WER6O0
	2pCUHkWaz4vEHty4sCuI3rvPnIBdSDN0pYtz9QM5NPgHSxoZpklio7a3tOq4f3baWpDn0Y9w+O6ey
	v9blz5RggzyT8H697W+l43uurRyRtrDQxGcupgRmE/2FepiW2/yKj1MjBvwO5/8kXj5VtO6ofo7ih
	zT00diAw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56358 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wdCvD-00000003rZH-0AsP
	for docs@lists.yoctoproject.org;
	Fri, 26 Jun 2026 16:13:13 -0400
Date: Fri, 26 Jun 2026 16:13:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: YP docs should use more sphinx admonitions
Message-ID: <dc561150-2037-1134-871a-d4ed84b28dd1@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 20:13:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9917


  while there are *tons* of "note" admonitions in the YP docs, sphinx
supports a fair number of other admonitions that i think should get
more use:

https://sphinx-book-theme.readthedocs.io/en/stable/reference/kitchen-sink/admonitions.html

rday

