Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7E2C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 14:07:41 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.267.1751897252925537094
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 07:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=dD/ba7ib;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fZocjJEQ/cNZXpY5ZdbcozInHPTO7i5MABdXYDnQDrs=; b=dD/ba7ibt/0qrhIwRVAa9F4nKt
	uj6MBuFSsZobqIwMdwZSXirm9AFL0ktK2dSugN7Nh48S2NICnWU/ZxIwDp3+wItLw3eIrglwv0f/3
	DwYQxCDI25EBfmN717g8rQNBit3XcEfISg7l9dfRVzpz0dnuw4RyvuvMdglmfPF3utVpXXcA+hyJ5
	UA6BdsvWCMGBUCFev0xIa5WzQOt5ztcvecBg3mAJS8OLn3HqHEYUZHv7NEjQvi0oKaQnEBxWdh8kS
	0xojw0KluP3A3rbKbaaWDMXZ7Gy5TJ+DejEt96qydPaH9QyejBf/LCZM1Nwo1Lz59BaBEc1hJlTIu
	SWa5EkXg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:40064 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uYmVG-00000003Zfo-0tDS
	for docs@lists.yoctoproject.org;
	Mon, 07 Jul 2025 10:07:31 -0400
Date: Mon, 7 Jul 2025 10:07:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should bitbake manual explain "bitbake-getvar"?
Message-ID: <10a3c9a6-fc05-0c22-804e-0fcc7a9c350a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 07 Jul 2025 14:07:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7269


  i note that near the end of this section:

https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#modifying-existing-variables

the reader is advised to display the value of a variable with:

$ bitbake recipename -e | grep VARIABLENAME=\"

  but the same effect can obviously be done with "bitbake-getvar".
should the bitbake manual cover some of those extra utilities?

rday

