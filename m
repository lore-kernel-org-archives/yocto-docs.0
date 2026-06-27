Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE62C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 18:44:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60721.1782585881895422179
 for <docs@lists.yoctoproject.org>;
 Sat, 27 Jun 2026 11:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=T+jK8gIN;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=shV3LGwWpXBjohnZ7Q08Utki2St1RjenRw1snMGXxn0=; b=T+jK8gINFsgcOeBZm0h7r8azep
	8xCqwHoK9qLJ4Ajj1uI4oUCF6aLm47BMmDPvdMtNjfrJL3oSPgNJRt3Pi0arFr7yMCFUWwSo5AWs+
	Ot5+5GdEmdvv452iPzlFnx4nK4p8tt9HRa/uOLRVd1LBs6kwY+aWLVsbsP1AXg7duW4ht0UYuMvyV
	fFVgCFnTXalaVRpIBaTvQLWSp2XBoy48H+RMHrKMwKrwzJ7WO6VBXXkjgHNr5vtn4LNVvlSfD89WM
	ZIKVFSKZpf1L+dXmUIi8W9DHZPDytGAVVbsCF/rFZfR0OyQy8G6jO+0xgD/y8btgq4AXNEBLIOG//
	EkP+54YQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:38248 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wdY14-00000006MWV-25sy
	for docs@lists.yoctoproject.org;
	Sat, 27 Jun 2026 14:44:40 -0400
Date: Sat, 27 Jun 2026 14:44:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: does the YP wiki fall under docs mandate?
Message-ID: <ee01d287-ecef-6a4b-0740-7eb6d9745300@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 27 Jun 2026 18:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9918


  i ask since, depending on how one searches, it is entirely possible
to end up at the YP wiki and possibly this page:

  https://wiki.yoctoproject.org/wiki/TipsAndTricks

where -- let's face it -- there is a *lot* of wildly-outdated
information.

  should a lot of the wiki information even be available anymore?
maybe there's a summer job for an intern to go through it, compare it
to the official docs, cull a lot of it, migrate more and so on.

