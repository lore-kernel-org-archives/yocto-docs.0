Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6281CD98F6
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 07:14:19 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.11264.1697008451814279447
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 00:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HeKRgNsq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wfR98GiEGmaNZ6TgzmyvQCACuJvncQWk8e9rousZoI4=; b=HeKRgNsqgwq14CjUQZjmWYLPNw
	mZscl4dnXp8lQTyhS8oPFddivrYYXDYqCDlqvMz6yfZflRhEkClZBYe/EhM5p7dP62lJOJ3JnnIg2
	5D8PHXx+issY5BFmmkPVfGs/2qqtubX/mMY8M/utyo6vfeO5/NFe8hVIHY59D+S3y9ydytqkIwMoB
	V6up1HHtOZKtdtJXc8dJBDdJ3EEdBo7t0d8lUpDhjv/FXiSwfwdzZOO9armjc9Tm9EXzcL2RpKTf3
	Iv8LSms1+02yNAXg1Xog45SPd9ZhVo3dVgHsdFiSjBorzaA/DI1RQs1fGMRX5/SIngZYvFHzwHOyx
	4gBiFDdA==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:53414 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqTPy-006Xan-0D
	for docs@lists.yoctoproject.org;
	Wed, 11 Oct 2023 03:14:10 -0400
Date: Wed, 11 Oct 2023 03:14:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: BSP guide still conflates "repo" with "layer"
Message-ID: <67f75a6f-3f77-3ae5-56-25c011722bb9@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 07:14:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4336


  i've mentioned this before, but some of the YP docs still
mislabel a checkout as a "layer". case in point -- the reference to
"meta-ti" as a "layer" in the BSP guide. it's not, of course:

  https://git.yoctoproject.org/meta-ti/tree/

it's a git repo which consists of two layers, but the current BSP
guide still describes meta-ti as a "layer" in places. i'll ponder how
to fix this. are there any other checkouts with that structure? i
recall meta-intel used to do that, but now it's a proper layer.

rday

