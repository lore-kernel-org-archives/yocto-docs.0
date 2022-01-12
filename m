Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A60C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 09:42:44 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.21425.1641980562751196448
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 01:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:44476 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1n7a9R-003pK6-WB
	for docs@lists.yoctoproject.org; Wed, 12 Jan 2022 04:42:41 -0500
Date: Wed, 12 Jan 2022 04:42:38 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: was there any discussion about supporting comments on online doc
 pages?
Message-ID: <e6aa3a37-78a-2a2e-b0e4-d7eddab21524@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 09:42:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2387


  my apologies if this topic came up and i missed it ... a colleague
is pondering what to migrate to WRT existing documentation, and i
suggested taking a look at how brilliantly YP is doing it with sphinx;
in particular, she was enthused about the expandable/collapsible ToC
down the left side. the only thing she brought up was the need for
user-suppliable comments on online pages so readers could ask
questions or leave suggestions.

  i know sphinx supports online comments as mentioned here:

https://sphinx-comments.readthedocs.io/en/latest/

was there any discussion as to whether this was worth doing?

rday

