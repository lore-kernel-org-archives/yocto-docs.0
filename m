Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7E7C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 09:23:39 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65000.1782984211307075971
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 02:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=XvdHEV5/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H2XUfnGMuvI1Ui4FPY4m2wg1Ur4sB/33/iw8A8TTE/k=; b=XvdHEV5/5Yg+xKAWvbZYGNA7IV
	KtAoMN5IhrXpe7neJrSLKpOBDiH4e9mFkwFim144xGjxV/z6IybuNuCPzrLkyeCXyfeNg7BRCorLj
	sZPZC9GbGCeLaADsaqq/gRDZ6pkGzuqRcUqa+nj658DPp0576InRz3C13I/TPBaOLhH4IbA3Je4eI
	u4dDA68wZ905EBbKD1aP5BvNxnShS2LJCzig7kGhpcyvXW6ol4nEl9zYVB0QMzcywAHOzcteuOIzY
	52PRAwVPfZ7B/io3FEzt22tPGkXEKN/v681ZdN9xAd4wbo25Sia6mz0kmPiXKjwqbwzXddDMIHD0o
	YJcBEq1Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37594 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wfDdn-00000003wY9-3Hzk
	for docs@lists.yoctoproject.org;
	Thu, 02 Jul 2026 05:23:29 -0400
Date: Thu, 2 Jul 2026 05:22:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: build error on docs master-next
Message-ID: <4974cf27-10e4-a4a8-cc97-f607e99d4a87@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 02 Jul 2026 09:23:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9997


/home/rpjday/oe/layers/yocto-docs/documentation/migration-guides/release-notes-6.1.rst:102:
WARNING: term not in glossary: 'USERMOD_PARAM' [ref.term]
/home/rpjday/oe/layers/yocto-docs/documentation/migration-guides/release-notes-6.1.rst:113:
WARNING: undefined label: 'ref-classes-extrauser' [ref.ref]


