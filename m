Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71382CF34B5
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 14:22:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8075.1763562138734117050
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 06:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=t+ye3XQB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SZUHM1zOVXrTiiwp+Vb7nTsoW9i4D67uvz/8nAVLz2M=; b=t+ye3XQBJsASShYLLOrGJZ4hSK
	DOZb/If3Pi1G7LNXWoh/x7U7Ma1P4FqYyuG7MftQ4KVvQKRzuI0zlM7qRO/8iQO5oG4R7z9kb64ND
	9Ctfs5oLtVz3HJ6DUwg8bwya47TaaxdmAAtEALoiWnn++c5qwXvGgDUfjWohOX+V1FssHCI7fE20H
	Xb9C9gUaVBW9fzR0F5JI/ZOr5HGVNZsZB8/x5/hpx1jRuZiUw78zrFOEhzl8pk2l+6cpvGPjAEAy/
	dv0vV3nx7mZx29kZ/1XYMGhB6thOnawetJ6TLBURUfZ5RJGr1bb17PHqUefaPdzGWXVV3vxMuU85S
	l/AeTQrQ==;
Received: from [147.129.179.166] (port=54274 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLj4W-00000003Icd-2U6v
	for docs@lists.yoctoproject.org;
	Wed, 19 Nov 2025 09:22:15 -0500
Date: Wed, 19 Nov 2025 09:22:50 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: issues with "bitbake-setup list" command in QS guide
Message-ID: <b14e403b-0c5c-2adb-e917-9a57860dc721@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 14:22:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8085


  i'm thinking about why i don't like the early part of the qs
guide, but in this section:

https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/#use-git-to-clone-bitbake-setup

the note about using "bitbake-setup list" to get an overview of the
settings does not end well if you're not in an initialized directory.
perhaps the command should be:

  bitbake-setup settings list

but there's a bigger problem with that section i'm trying to clarify
in my own mind before i post about it.

rday

