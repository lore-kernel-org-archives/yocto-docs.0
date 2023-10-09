Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174BBE95A8E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 05:33:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.54590.1696829600975436201
 for <docs@lists.yoctoproject.org>;
 Sun, 08 Oct 2023 22:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Q76c/I0p;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EtI+Dfrk88cCC5fMnkyD5h5QQfOAt3gqNsQDin8iJXQ=; b=Q76c/I0pSW/kCRNElahC2XtCno
	p87sIe06GM1SO83YrmAlRBAjIJCpdZ0acqCwuNn3rogoPRzMouvko4DxptmOGcmGeAsFMgWPEjCb3
	h9eK7VZLwJif6baTar4JJxzMz/26aOMozn7akI/lB8pd2B6G33mZAAVvf6ul5SaPy3mXhNNOGzBgq
	gBUBz7bg4QKtEQjK/yqMuPfe1gPmvp6IaEC37m7s1hxEzWguQliJGfTSKtbIOvHlI9ZdTUSIyk50r
	YalDvK/XWpqXop3dfv7uUlFQok3yJ2HDmfMMgIU3vChn4FfXsSZUjpac4Q6E+hne9altuStH036EC
	KqRfEXwQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:53320 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qpitK-0023oC-0z
	for docs@lists.yoctoproject.org;
	Mon, 09 Oct 2023 01:33:18 -0400
Date: Mon, 9 Oct 2023 01:33:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: does PACKAGE_EXCLUDE not handle .deb packages?
Message-ID: <929b18be-e9ac-ad9-b8b2-36f95834834a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 09 Oct 2023 05:33:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4332


  from
https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE:

"This variable is supported only when using the IPK and RPM packaging
backends. DEB is not supported."

  i just tried it with .deb packages and it *appears* to work.
thoughts?

rday

